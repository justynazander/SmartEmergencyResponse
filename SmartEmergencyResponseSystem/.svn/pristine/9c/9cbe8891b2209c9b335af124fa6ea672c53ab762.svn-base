%% model_check.m
% UAV_SIL Model Verification
%
% This script runs "plot_and_save.m", which plots the pitch and roll angle
% doublet response using the current simulation model and controller. These
% results are compared to a stored simulation run of the same inputs using
% the baseline controller. Users can use this script to evaluate and
% compare the performance of their controller or model relative to a flight
% tested baseline.
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: model_check.m 337 2011-04-15 15:20:27Z murch $

% Execute this line of code in the command window to publish the pdf report
% publish('model_check.m',struct('format','pdf','showCode',false,'outputDir','Verification'));


%% Current Model and Controller Results
% This section shows the current simulation results.
simulate_and_save

%% Current Model and Controller Compared to Checkcase Data
% Here the current model results (green) are compared to the checkcase data
% (blue).
addpath .\Verification
plot_SIL('simDataBaseline','simData')
rmpath .\Verification