% ----- Densities ----- %
%{
Note: This is just a struct.
Put things in this file of the form:
rho.
'material_name', density; %kg/m^3 (comments)
%}


rho = {
% Volumetric Densities
    'none', 0.0; %(nothing)
    'wood_pine', 675.0; %kg/m^3
    'wood_balsa', 170.0; 
    'pinkfoam', 0.786; %Owens C insulation foam
    'PLA', 1240.0; 
    'ABS', 1040.0; 
    'aluminum', 2700.0; 
    'cf_pp_45w_2mm', 1500.0; %carbon fiber, pre-preg, 45x45 weave, 2mm thick
    'kevlar49', 1450.0; %Aramid Kevlar 49
    
% Geometric Densities
    'cf_pp_0.012inch', 0.4572; %kg/m^2
    'cf_pp_0.024inch', 0.9144; 
    'cf_pp_0.024inch', 1.8288;
    'cf_sheet_5mm', 0.626;
    'cf_sheet_1.5mm', 2.25;
    'cf_sheet_3mm', 4.97;
    'foam_board', 0.302; %Dollar Tree
    'plywood_0.25inch', 0.9144;
    'depron_sheet_3mm', 0.012;
    'depron_sheet_6mm', 0.0099;
    'kevlar_twill_weave_epoxy', 0.4051; %with epoxy
    'kevlar_twill_weave', 0.1796; %without epoxy
    
 % Linear Densities   
    'cf_rod_0.25inch', 0.03175; %kg/m
    'cf_tube_0.375inch' 0.0597; % 0.0625" thick roll
    'cf_tube_0.5inch', 0.149;   %0.125" thick roll
    'cf_tube_0.75inch', 0.253;  %0.125" thick roll
    'cf_tube_1inch', 0.355;     %0.125" thick roll
    };
