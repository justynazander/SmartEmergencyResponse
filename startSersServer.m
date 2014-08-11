% ******************************************************************************
% Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
% ******************************************************************************


function z = startSersServer()

addpath(genpath([pwd '\SmartEmergencyResponseSystem']));
disp('Starting the SERS server for optimization ');
y = QuadrotorOptimizationReceiptAdaptor('127.0.0.1',10020,10030); 
z = 'Congratulations! You successfully started the SERS server application.';


