function [longmod,spmod,latmod,linmodel]=linearize_UAV(OperatingPoint,use_uvw,verbose)
% [longmod,spmod,latmod,linmodel]=linearize_UAV(OperatingPoint,verbose)
%
% Linearizes the UAV model about a given operating point using
% ../NL_Sim/UAV_NL.mdl. This function can be called from any of the three
% sim directories. However, this function will use your workspace
% variables. Requires the Control System Toolbox and Simulink Control
% Design.
%
% Inputs:
%   OperatingPoint - Operating point object of a trim condition
%   use_uvw        - boolean flag to use u,v,w as linear model outputs 
%                     instead of V, alpha, beta; defaults to "false"
%   verbose        - boolean flag to suppress output; default "true"
%
% Outputs:
%   longmod  - longitudinal linear model
%   spmod    - short period approximation
%   latmod   - lateral directional linear model
%   linmodel - full linear model
%
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: linearize_UAV.m 648 2011-10-07 17:14:56Z murch $

% verbose output on by default
switch nargin 
    case 1
        verbose = 1;
        use_uvw = 0;
    case 2
        verbose = 1;
end

%% Load model into memory
isLoaded = bdIsLoaded('UAV_NL'); % check to see if model is loaded or open
if ~isLoaded
    load_system('../NL_Sim/UAV_NL.mdl') % load model into system memory without opening diagram
end

%% LINEARIZE
linmodel = linearize('UAV_NL',OperatingPoint.op_point);

% Create Full 13-state Linear Model
%set(linmodel, 'InputName', {'\delta_t';'\delta_e'; '\delta_r' ;'\delta_aL';'\delta_aR';'\delta_fL';'\delta_fR';'\delta_a'});
if use_uvw
    set(linmodel, 'OutputName',{'u'; 'v'; 'w'; 'h'; 'phi'; 'theta';'psi';'p';'q';'r';'gamma';'ax';'ay';'az'});
    linmodel.c(1:3,7:9) = eye(3);
else
    set(linmodel, 'OutputName',{'V'; 'beta'; 'alpha'; 'h'; 'phi'; 'theta';'psi';'p';'q';'r';'gamma';'ax';'ay';'az'});    
end
set(linmodel, 'StateName', {'phi';'theta';'psi';'p';'q';'r';'u';'v';'w';'Xe';'Ye';'Ze';'omega'})

%% GENERATE LONGITUDINAL LINEAR MODEL
% Longitudinal dynamics
% States: u(7)  w(9)  q(5) theta(2) Ze(12) omega(13)
% Inputs: elevator(1) throttle(4)
% Outputs: Vs(1) alpha(3) q(9) theta(6) h (4) ax(12) az(14)

% Generate State-space matrices for Longitudinal Model
% Indices for desired state, outputs, and inputs
Xlon = [7 9 5 2 12 13];
Ylon = [1 3 9 6 4 12 14];
Ilon = [2 1];
longmod = modred(linmodel(Ylon,Ilon),setdiff(1:13,Xlon),'Truncate');
longmod = xperm(longmod,[3 4 2 1 5 6]); % reorder state

if verbose
    fprintf('\n  Longitudinal Model\n------------------------\n');    
    longmod
    fprintf('\n\nLongitudinal Poles:');
    damp(longmod)
end

%% GENERATE SHORT PERIOD LINEAR MODEL
% Short period dynamics
% States:   w(9)  q(5) 
% Inputs: elevator(1) 
% Outputs:  alpha(3) q(9) az(14)

% Generate State-space matrices for Longitudinal Model
% Indices for desired state, outputs, and inputs
Xlon = [9 5];
Ylon = [3 9 14];
Ilon = [2];
spmod = modred(linmodel(Ylon,Ilon),setdiff(1:13,Xlon),'Truncate');

if verbose
    fprintf('\n  Short Period Model\n------------------------\n');    
    spmod
    fprintf('\n\nShort Period Poles:');
    damp(spmod)
end

%% GENERATE LATERAL-DIRECTIONAL LINEAR MODEL
% Lateral-directional dynamics
% States: v(8) p(4) r(6) phi(1) psi(3)
% Inputs: aileron(2) rudder(3)
% Outputs: beta(2) p(8) r(10) phi(5) psi(7)

% Generate State-space matrices for lateral-directional Model
% Indices for desired state, outputs, and inputs
Xlat = [8 4 6 1 3];
Ylat = [2 8 10 5 7];
Ilat = [8 3];
latmod = modred(linmodel(Ylat,Ilat),setdiff(1:13,Xlat),'Truncate');
latmod = xperm(latmod,[5 3 4 1 2]); % reorder state

if verbose
    fprintf('\n\n  Lateral-Directional Model\n-----------------------------\n');    
    latmod    
    fprintf('\n\nLateral-Directional Poles:');
    damp(latmod)   
end

%% Cleanup
if ~isLoaded
    bdclose UAV_NL % clear model from system memory if we had to load it
end