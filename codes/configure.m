% ----- Aircraft Configuration ----- %
%{
This is basically the info from the aero team about wing and tail sizing
and placement.
%}

conversion = 1000; % millimeters in a meter

config.wing.globalpos = [0.0;0.0;0.0]./conversion; %global position of root leading edge of wing (always [0;0;0])
config.wing.airfoils = ['clarky';'clarky';'clarky']; %array of wing section airfoils (these are in the form 'airfoilname')
config.wing.chordlen = [225.0;225.0;175.0]./conversion; %array of wing chord lengths
config.wing.chordpos = [0.0;375.0;750.0]./conversion; %array of wing chord positions along span (x-direction)
config.wing.chordtwist = [0.0;0.0;-3.0]; %array of wing chord twists
config.wing.sectionsweep = [0.0;1.909]; %FIXME: Check these values. %array of wing section sweeps
config.wing.sectiondih = [0.0;5.0]; %array of wing section dihedrals
config.wing.sym = true; %symmetric definition
config.wing.material = 'pinkfoam';

config.hstab.globalpos = [580.0;0.0;0.0]./conversion; %global position of root leading edge of hstab
config.hstab.airfoils = ['naca0009';'naca0009']; %array of hstab section airfoils (these are in the form 'airfoilname')
config.hstab.chordlen = [130.0;100.0]./conversion; %array of hstab chord lengths
config.hstab.chordpos = [0.0;270.0]./conversion; %array of hstab chord positions along span (x-direction)
config.hstab.chordtwist = [0.0;0.0]; %array of hstab chord twists
config.hstab.sectionsweep = [0;30]; %array of wing section sweeps (currently in degrees)
config.hstab.sectiondih = [4.76]; %array of wing section dihedrals
config.hstab.sym = true; %symmetric definition
config.hstab.material = 'pinkfoam';

config.vstab.globalpos = [580.0;0.0;0.0]./conversion; %global position of root leading edge of vstab
config.vstab.airfoils = ['naca0009';'naca0009']; %array of vstab section airfoils (these are in the form 'airfoilname')
config.vstab.chordlen = [160.0;90.0]./conversion; %array of vstab chord lengths
config.vstab.chordpos = [0.0;140.0]./conversion; %array of vstab chord positions along span (x-direction)
config.vstab.chordtwist = [0.0;0.0]; %array of vstab chord twists
config.vstab.sectionsweep = [20.56]; %array of wing section sweeps (currently in degrees)
config.vstab.sectiondih = [0.0]; %array of wing section dihedrals
config.vstab.sym = false; %symmetric definition
config.vstab.material = 'pinkfoam';

% FIXME: Questions
% Where do we find the section sweep in XFLR5 for the wing?