% ******************************************************************************
% Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
% ******************************************************************************
%  
% How to run SERS in a loop mode. 
% *******************************
% 
% 
% Open 4 MATLAB sessions (matlab.exe -hgVersion 2). 
% In each of the MATLAB sessions: 
% - Command window: addpath(genpath(pwd))
%   
% MATLAB session 1: 
% Command window: y = QuadrotorOptimizationReceiptAdaptor('127.0.0.1',10020,10030)
%  
% MATLAB session 2 (32 bit):
% Command window: GE = GeManager
% If you have no 32 bit MATLAB version, neglect this step. The Simulink to Google Earth
% interface is not going to run, though. 
%% MATLAB session 3:
% Command window: 
% startHere
%  
% MATLAB session 4: 
% Go to: [pwd '\requests'] 
% Command window: fakeShAir

%% Initial set-up of project paths and such
[projectRoot, hadToOpen] = set_up_SimulinkProject;

%% SmartEmergencyResponseSystem

%% Initiate user specified workflow
if not(hadToOpen)   % only initiate workflows if project was already open
    newDemoMission    = 'Demonstrate the mission knematics and dynamics';
    newDemoMissionK   = 'Demonstrate the mission kinematics';
    newRunMission     = 'Run and setup the mission yourself';
    
        workflow = questdlg( 'Please choose the mode of the rescue mission.','Mission workflow',...
        newDemoMission, newDemoMissionK, newRunMission, newDemoMissionK);
    
    switch workflow
        case newDemoMission
            clear newDemoMission newDemoMissionK newRunMission workflow
            demoMission
        case newDemoMissionK
            clear newDemoMission newDemoMissionK newRunMission workflow
            demoMissionKinematics
        case newRunMission
            clear newDemoMission newDemoMissionK newRunMission workflow
            runMission
    end
end