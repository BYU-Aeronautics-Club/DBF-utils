%{ 
Script for estimating aircraft mass and center of gravity.

Authors: Judd Mehr, 

Date Started: 13 November 2019

Nomenclature:
- station = point at which an airfoil, chord, and twist are defined
- section = portion of wing between stations, where span, sweep, and
dihedral are defined.

Major Updates:
%}

clear; clc; close all;

%read in parameters if needed
% parameters
%read in densities
density
%read in aircraft configuration
configure
%read in component placement
component

[Total_Mass, CG] = getmass(rho,config,comp);

function [foilarea, foilcentroid] = getfoilarea(airfoil)

    coords = (load(strcat('../airfoils/',airfoil,'.dat'))); %note that files can't have headers.
    foil = polyshape(coords(:,1),coords(:,2));
    foilarea = area(foil);
    [cx,cy] = centroid(foil);
    foilcentroid = [cx;0.0;cy];
    
end

function [wingvolume, wingcg] = getwingvolume(chords,twists,spans,sweeps,dihedrals,symmetry,foils)

    sectionvolume = zeros(length(dihedrals),1);
    sectioncentroid = zeros(length(dihedrals),3);
    
    stationcentroids = zeros(length(chords),3); % need to save station centroid locations for inside loop
    area = zeros(length(chords),1); %need to save areas for loop
    
    %Do the first station
    [area(1), stationcentroids(1,:)] = getfoilarea(foils(1,:));
    stationcentroids(1,:) = stationcentroids(1,:)*chords(1);
    
    for i=2:length(chords) 
        %Read airfoil data and get area and centroid
        
        [area(i), stationcentroids(i,:)] = getfoilarea(foils(i,:));
        
        %Scale areas based on chord length
        area(i) = area(i)*chords(i);
        meanarea = (area(i-1) + area(i))/2;
        
        %adjust centroids based on chord length
        stationcentroids(i,:) = stationcentroids(i,:)*chords(i);
        
        %Create Rotation Matrix for rotating position of centroid as
        %needed.
        ct = cos(twists(i)); %cosine theta
        cph = cos(dihedrals(i-1)); %cosine phi
        cps = cos(sweeps(i-1)); %cosine psi
        st = sin(twists(i)); %sine theta
        sph = sin(dihedrals(i-1)); %sine phi
        sps = sin(sweeps(i-1)); %sine psi
  
        rotation = [ct*cps,             ct*sps,                -st; 
                   sph*st*cps-ct*sps,  sph*st*sps+cph*cps, sph*ct; 
                   cph*st*cps+sph*sps, cph*st*sps-sph*cps, cph*ct];

        %Move the section to where it needs to be.
        stationcentroids(i,:) = stationcentroids(i,:)+stationcentroids(i-1,:); %move to previous location
        sectionvector = rotation*[0; spans(i-1); 0]; %find where station needs to be placed by rotating section (note we only have span in the y-direction for length)
        stationcentroids(i,:) = stationcentroids(i,:) + sectionvector';
        
        sectioncentroid(i-1,:) = (stationcentroids(i-1,:)*area(i-1) + stationcentroids(i,:)*area(i))/(area(i-1) + area(i));
        
        %Get structural section (physical length of wing section)
        fullspan = spans(i-1)/cos(dihedrals(i-1));
        fullspan = fullspan/cos(sweeps(i-1));
        
        %total section volume
        sectionvolume(i-1) = meanarea*fullspan;
    end
    
    %if symmetric, multiply volume by 2
    if symmetry == true
        wingvolume = 2*sum(sectionvolume);
        cgy = sum(sectioncentroid(:,2).*sectionvolume)/sum(sectionvolume);
    else
        wingvolume = sum(sectionvolume);
    end
    
    %find the centroid of the wing
    cgx = sum(sectioncentroid(:,1).*sectionvolume)/sum(sectionvolume);
    
    cgz = sum(sectioncentroid(:,3).*sectionvolume)/sum(sectionvolume);
    
    cgy = 0; % If it's symmetric
    
    wingcg = [cgx;cgy;cgz];
    
end

function [totalmass, totalcg] = getmass(rho,config,comp)
    %Calculate Total Mass and CG
    cg = [];
    cgiter = 1;
    masses = [];
    massiter = 1;

    % -- Get Mass of Lifting Surfaces (wings/tails, etc)
    aerobits = fieldnames(config);
    numaerobits = numel(aerobits);

    for i=1:numaerobits
        chords = config.(aerobits{i}).chordlen;
        twists = config.(aerobits{i}).chordtwist;
        spans = config.(aerobits{i}).chordpos; % FIXME: Make this a difference
        spans = spans(2:length(spans)) - spans(1:length(spans)-1); % FIXING_ME: Making a difference
        foils = config.(aerobits{i}).airfoils;
        sweeps = config.(aerobits{i}).sectionsweep; % FIXME: convert to radians
        sweeps = sweeps.*pi./180;
        dihedrals = config.(aerobits{i}).sectiondih; % FIXME: convert to radians
        dihedrals = dihedrals.*pi./180;
        symmetry = config.(aerobits{i}).sym;
        [volume, cg(cgiter,:)] = getwingvolume(chords,twists,spans,sweeps,dihedrals,symmetry,foils);
        cgiter = cgiter + 1; %incremenet cg iterator
        material = config.(aerobits{i}).material;
        density = rho{find(strcmp(rho, material)),2};
        masses(massiter) = volume*density;
        massiter = massiter+1;
    end

    % -- Get Mass of components
%     compbits = fieldnames(comp);
%     numcompbits = numel(aerobits);
%     for i=1:numcompbits
%         disp(isfield(config.(compbits{i})))
%         if isfield(config.(compbits{i}))
%             if config.(compbits{i}).sym == true
%                 masses(massiter) = config.(compbits{i}).mass;
%                 massiter = massiter+1;
%                 masses(massiter) = config.(compbits{i}).mass;
%                 massiter = massiter+1;
%                 tempcg = config.(compbits{i}).cg;
%                 cg(cgiter) = tempcg;
%                 cgiter = cgiter + 1; %incremenet cg iterator
%                 tempcg(2) = -tempcg(2); %refelct y-comp of cg
%                 cg(cgiter) = tempcg;
%                 cgiter = cgiter + 1; %incremenet cg iterator
%             else
%                 totalmass = totalmass + config.(compbits{i}).mass;
%                 cg(cgiter) = config.(compbits{i}).cg;
%                 cgiter = cgiter + 1; %incremenet cg iterator
%             end
%         end
%     end

    totalmass = sum(masses);
    cgx = sum(cg(:,1).*masses')/totalmass;
    cgy = sum(cg(:,2).*masses')/totalmass;
    cgz = sum(cg(:,3).*masses')/totalmass;
    totalcg = [cgx;cgy;cgz];
    
end

