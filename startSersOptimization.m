% ******************************************************************************
% Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
% ******************************************************************************
% startSers() is used to build the MATLAB app
% ******************************************************************************
% Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
% ******************************************************************************
%  
%% How to run SERS in a loop mode. 
% *******************************
% 
% 
%% Open 3 MATLAB sessions (matlab.exe -hgVersion 2). 
% In each of the MATLAB sessions run MATLAB apps, respectively: 
% SERS server
% SERS optimization
% SERS requests
% 
% Explanations:
% SERS server:  This is also the last cell in navigation/dispatchAdaptorTestScript.  The command sets up this instance of MATLAB as an optimization server.
% SERS optimization: This collects the requests der SERS requests, ships the associated optimization problem to SERS server, and animates the results.  The fixed wing flies a fixed loop, the quadcopters serve the requests according to the results of the optimization (unless it’s a request for an ATLAS, Kuka, Valve, or Sensory Animal.  Then, the appropriate vehicle serves the request), the dog wanders randomly (when it’s not servicing a request) and will periodically generate a request for a Kuka. If there is a spike in the gas sensor data from the dog, it will generate a Kuka request where it is (double-clicking on the dog brings up a graph of the streaming gas data).
% SERS requests: This will continuously generate random requests somewhere in San Francisco. 
% *******************************
%
%% MATLAB 4th session. Please use MATLAB 32 bit:
% Command window: GE = GeManager
% If you have no 32 bit MATLAB version, neglect this step. The Simulink to Google Earth
% interface is running only in MATLAB 32 bit. 


function y = startSersOptimization()

startHere 
disp('Starting the SERS system ');
y = 'Congratulations! You successfully started the SERS application.';


