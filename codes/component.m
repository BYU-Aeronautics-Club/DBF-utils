% ----- Components ----- %
%{
Note: This is just a struct.
Put things in this file of the form:
comp.item.mass = mass; %kg (comments)
comp.item.cg = position; %2/span (comments)
comp.item.sym = bool; %(true or false)

We assume the following:
- positions are [x;y;z] where x is in the direction heading behind the
aircraft, y is out the right wing, and z is up.
- the global origin [0;0;0] is at the leading edge at the root
of the main wing.
- positions are normalized by the aircraft half span, so an aileron servo will
be somewhere around position [0.1; 0.75; 0] 
- we assume symmetry for items tagged as such
%}

%props
comp.prop.mass = 0.0; %kg
comp.prop.cg = [0.0; 0.5; 0.0]; %1/span
comp.prop.sym = true; %two props

%motors
comp.motor.mass = 0.250; %kg - average mass of motors found on Amazon
comp.motor.cg = [0.02; 0.5; 0.0]; 
comp.motor.sym = true; %two motors for two props

%battery
comp.battery.mass = 0.350; %kg - rough estimate based on a few different batteries
comp.battery.cg = [-0.08; 0.0; -0.04]; 
comp.battery.sym = false; %one battery

%esc
comp.esc.mass = 0.025; %kg - 30A ESC found on Amazon
comp.esc.cg = [-0.1; 0.0; -0.04]; %1/span
comp.prop.sym = false; %one ESC component

%flap servos
comp.flap_servo.mass = 0.012; %kg - blue servos
comp.flap_servo.cg = [0.1; 0.4; 0.0]; 
comp.flap_servo.sym = true; %two flap servos

%aileron servos
comp.aileron_servo.mass = 0.012; %kg - blue servo
comp.aileron_servo.cg = [0.1; 0.75; 0]; %2/span
comp.aileron_servo.sym = true; %two aileron servos

%rudder servo
comp.rudder_servo.mass = 0.012; %kg
comp.rudder_servo.cg = [0.75; 0.01; 0.05];
comp.rudder_servo.sym = false; %one rudder servo

%elevator servo
comp.elevator_servo.mass = 0.012; %kg
comp.elevator_servo.cg = [0.75; -0.01; 0.0];
comp.elevator_servo.sym = false; %one elevator servo

%people/luggage
comp.people_luggage.mass = 4.5; %kg (about 10 pounds, accounting for 30 people)
comp.people_luggage.cg = [0.0; 0.0; -0.10];
comp.people_luggage.sym = false;

%banners and such
comp.banner.mass = 0.050; %kg
comp.banner.cg = [0.0; 0.0; -0.15];
comp.banner.sym = false;

%fuselage stuff
comp.fuselage_people.mass = 0.050; %kg
comp.fuselage_people.cg = comp.people_luggage.cg; %fuselage location is at same point as people and luggage
comp.fuselage_people.sym = false;

comp.fuselage_banner.mass = 0.020; 
comp.fuselage_banner.cg = comp.banner.cg; %this fuselage will be in same location as the banner(s)
comp.fuselage_banner.sym = false; %assuming only one central banner for now

%boom stuff
comp.boom.mass = 0.050;
comp.boom.cg = [0.5; 0.0; -0.01];
comp.boom.sym = false;


%misc components
