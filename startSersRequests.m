% ******************************************************************************
% Copyright (c) 2014, The MathWorks, Inc. All rights reserved.
% ******************************************************************************


function y = startSersRequests()

addpath(genpath([pwd '\SmartEmergencyResponseSystem']));
disp('Starting the SERS requests ');
fakeShAir
y = 'Congratulations! You successfully started the SERS requests application.';


