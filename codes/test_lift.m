%This function calculates the power, amperage, and milliamp-hour
%requirements when the number of passengers increases in our plane.
%
%Inputs: number of passengers (N), velocity (V)
%Outputs: Power, Amps, mAh

close all
clc

g = 9.81; %gravity constant

% Parameter Inputs (held constant now, but can be variables)
V = 11;     %m/s (minimum speed required to complete track in given time)
N = 20;     %maximum number of passengers to be evaluated

% Cargo Parameters
int = 1;
num_pass = (0:int:N);       
m_plane = 2;                %kg (assumed)
passenger_mass = .114;      %kg (4 oz)
suitcase_mass = .029;       %kg (1 oz)
length_passenger = .033;    %meters (1.25 inches)
length_baggage = .025;      %meters (1 inch)
width_passenger = length_passenger;

% Fuselage Mass Calculations
rho_carbon = 2000; %kg/m^3
df = width_passenger*4; %diameter of fuselage in meters (will be about 4 inches)
l = .5 + ((N/3)*(length_passenger + length_baggage)); % fuselage length starts at .5 meter long and extends with increasing number of passengers
Afuselage = pi()*df*l;  %surface area of fuselage
fuselage_thickness = .003; %thickness of fuselage shell in meters
fuselage_mass = Afuselage*fuselage_thickness; %kg

cargo = num_pass*(passenger_mass + suitcase_mass) + num_pass.*fuselage_mass;
m = m_plane + cargo;

% Plane Dimensions
b = 1.524;      %5 foot wingspan
c = 0.2286;     %9 inch chord
c_elv = 0.1524; % 6 inch elevator chord
b_elv = 0.5334; % 1.75 ft elevator span


% Aerodynamic Calculations
L = m*g;                            %Lift required
K = .38;                            %empirical constant
Aplanform = c*b;
Aplanform_tail = c_elv*b_elv;
tcratio_tail = .10;                 %tail thickness (NACA 0010)
AR = b^2/Aplanform;                 %aspect ratio
AR_tail = b_elv^2/Aplanform_tail;
tcratio = .0994;                    %thickness to cord ratio (Eppler 66)
R = 287.05;                         %gas constant for air
T = 278;                            %k from standard atmosphere calculator (Provo)
P = 83427;                          %air pressure from S.A. in Provo
rho = P/(R*T);                      %density of air in Provo
Lw = 0.7*L;                         % percent of wieght carried by wing
Lt = 0.3*L;                         % percent of weight carried by tail
sweep = 0;                          %straight wings
Z = 2*cos(sweep);
k = 1 + Z*tcratio + 100*((tcratio)^4); %form factor
k_tail = 1 + Z*tcratio + 100*((tcratio_tail)^4);
einv = .98*(1-2*(df/b)^2);          %inviscid span efficiency
einv_tail = .98*(1-2*(df/b_elv)^2);

Swet = 2*(1+.2*tcratio)*Aplanform+Afuselage;
Swet_tail = 2*(1+.2*tcratio_tail)*Aplanform_tail;
Sref = Aplanform;
Sref_tail = Aplanform_tail;

%Create Variable Vectors

for i = 1:4
    for j = 1:((N/int) + 1)
    
    
    qinf(j) = .5*rho*V^2; %dynamic pressure
    mu = 0.0000175938; %dynamic viscosity
    Re = rho*V*c/mu; %Reynolds
    Cf = .074/(Re^.2); %skin friction coefficient
    
   
    Cdp = k*Cf*Swet/Sref; %wing & body parasitic drag
    Cdp_tail = k_tail*Cf*Swet_tail/Sref_tail; %pd on tail
    %{
    e(j) = 1/(1/einv+K*Cdp(j)*pi()*AR); %oswald efficiency factor
    e_tail(j) = 1/(1/einv_tail+K*Cdp_tail(j)*pi()*AR_tail);
    %}
    Cl(j) = (Lw(j))/(.5*rho*V^2*Sref); %coefficient of lift needed
    Cl_tail(j) = (Lt(j))/(.5*rho*V^2*Sref_tail);
    %Cd(j) = Cdp(j) + Cl(j)^2/(pi()*AR*e(j)); % drag coefficient
    %Cd_tail(j) = Cdp_tail(j) + Cl_tail(j)^2/(pi()*AR_tail*e_tail(j));
    %{
    D(j) = Cdp(j)*qinf(j)*Sref + (Lw)^2/(qinf(j)*pi()*b^2*e(j))*1.1;
    D_tail(j) = Cdp_tail(j)*qinf(j)*Sref_tail + ...
                (Lt)^2/(qinf(j)*pi()*b_elv^2*e_tail(j));
    D_total(j) = (D(j) + D_tail(j))*1.1;
    ratio(j) = L/D_total(j);
    %}
    Cl_total(j) = L(j)/(.5*rho*V^2*Sref);               % total lift needed
    Power(j) = (Cdp+K*Cl_total(j)^2)*.5*rho*V^3*Sref;   %in watts
    volts(i,j) = (1/(i+11))*Power(j);                   %current required to supply equivalent power with different voltage-rated batteries (12-15 Volts)
    mAh(i,j) = 1000*(1/10)*volts(i,j);                  %mAh required to run at full throttle and last 6 minutes
    end
end

figure
subplot(2,1,1)
plot(num_pass,Power,'b')
xlabel("Number of Passengers")
ylabel("Power (Watts)")
title("Power Required vs Number of Passengers")

figure
subplot(1,2,1)
plot(num_pass,volts(1,:),'r')
hold on
plot(num_pass,volts(2,:),'b')
plot(num_pass,volts(3,:),'c')
plot(num_pass,volts(4,:),'k')
hold off
xlabel("Number of Passengers")
ylabel("Required Current (Amps)")
legend("12 Volts","13 Volts", "14 Volts","15 Volts")
title("Current Required vs Number of Passengers and Varying Voltages")

subplot(1,2,2)
plot(num_pass,mAh(1,:),'r')
hold on
plot(num_pass,mAh(2,:),'b')
plot(num_pass,mAh(3,:),'c')
plot(num_pass,mAh(4,:),'k')
hold off
xlabel("Number of Passengers")
ylabel("Battery Capacity (mAh)")
legend("12 Volts","13 Volts", "14 Volts","15 Volts")
title("Battery Capacity vs Number of Passengers and Varying Voltages")




