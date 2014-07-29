function simulate_and_save(savename,simtime)
%% simulate_and_save.m
% UAV Software-in-the-Loop simulate_and_save function
%
% This function runs the SIL sim and saves the results to a file with the
% given name. If no file name is given, "simData" is used. A simulation
% time can also be input; the default is 45 seconds.
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: simulate_and_save.m 638 2011-09-30 20:27:53Z murch $

if nargin < 1
    savename = 'simData'; % file name for sim data
end

if nargin < 2
    simtime = 20; % sec, simulation time
end

% Run simulation
sim('UAV_SIL', [0 simtime])

% Save the simulation data in the simData data structure.
simData.time= tout;
simData.de= elevator;
simData.da_r= r_aileron;
simData.da_l= l_aileron;
simData.dr=rudder;
simData.df_r= r_flap;
simData.df_l= l_flap;
simData.ias= V_s; 
simData.h = alt; 
simData.phi=phi;
simData.the = theta;
simData.psi = psi(:); % semicolon necessary to force variable usage instead of function call
simData.pitch_ref=theta_cmd;
simData.roll_ref= phi_cmd;
simData.p=p;
simData.q=q; % Pitch rate
simData.r=r ;
simData.aoa = alpha(:); % semicolon necessary to force variable usage instead of function call
simData.aos = beta(:); % semicolon necessary to force variable usage instead of function call
simData.ax=Ax ;
simData.ay=Ay ;
simData.az=Az ;

% save data
save(savename,'simData');
