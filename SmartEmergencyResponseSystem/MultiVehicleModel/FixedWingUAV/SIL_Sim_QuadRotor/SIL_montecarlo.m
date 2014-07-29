%% SIL Simulation Monte Carlo Setup
%  The commands in this script will set conditions for the SIL simulation
%  for a range of environmental conditions and model uncertainties, run and
%  save the simulation data, and compare the results.
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: SIL_montecarlo.m 337 2011-04-15 15:20:27Z murch $

%% Vary Sensor Noise and Turbulence 
% Noise off, Turbulence off
AC.Sensors.NoiseOn = 0;
Env.Winds.TurbulenceOn = 0;

% Run Simulation
simulate_and_save('simDataNois0Turb0')

% Noise on, Turbulence off (default)
AC.Sensors.NoiseOn = 1;
Env.Winds.TurbulenceOn = 0;

% Run Simulation
simulate_and_save('simDataNois1Turb0')

% Noise off, Turbulence on
AC.Sensors.NoiseOn = 0;
Env.Winds.TurbulenceOn = 1;

% Run Simulation
simulate_and_save('simDataNois0Turb1')

% Noise on, Turbulence on
AC.Sensors.NoiseOn = 1;
Env.Winds.TurbulenceOn = 1;

% Run Simulation
simulate_and_save('simDataNois1Turb1')

% Return to default, Noise off, Turbulence off
AC.Sensors.NoiseOn = 0;
Env.Winds.TurbulenceOn = 0;

% Compare results
plot_SIL('simDataNois0Turb0','simDataNois1Turb1','simDataNois0Turb1','simDataNois1Turb1')
%% Model Uncertainty: Vary Pitch Rate Damping
% Store baseline value
Cmq = AC.Aero.Cm.q;

% Increase 50%
AC.Aero.Cm.q = Cmq*1.5;

% Run Simulation
simulate_and_save('simDataNois0Turb0Cmpos')

% Decrease 50%
AC.Aero.Cm.q = Cmq*.5;

% Run Simulation
simulate_and_save('simDataNois0Turb0Cmneg')

% Baseline
AC.Aero.Cm.q = Cmq;

% Compare results
plot_SIL('simDataNois0Turb0','simDataNois0Turb0Cmpos','simDataNois0Turb0Cmneg')

%% Model Uncertainty: Vary Roll Damping
% Store baseline value
Clp = AC.Aero.Cl.p;

% Increase 25%
AC.Aero.Cl.p = Clp*1.25;

% Run Simulation
simulate_and_save('simDataNois0Turb0Clpos')

% Decrease 25%
AC.Aero.Cl.p = Clp*.75;

% Run Simulation
simulate_and_save('simDataNois0Turb0Clneg')

% Baseline
AC.Aero.Cl.p = Clp;

% Compare results
plot_SIL('simDataNois0Turb0','simDataNois0Turb0Clpos','simDataNois0Turb0Clneg')

%% Model Uncertainty: Vary Yaw Damping
% Store baseline value
Cnr = AC.Aero.Cn.r;

% Increase 25%
AC.Aero.Cn.r = Cnr*1.25;

% Run Simulation
simulate_and_save('simDataNois0Turb0Cnpos')

% Decrease 25%
AC.Aero.Cn.r = Cnr*.75;

% Run Simulation
simulate_and_save('simDataNois0Turb0Cnneg')

% Baseline
AC.Aero.Cn.r = Cnr;

% Compare results
plot_SIL('simDataNois0Turb0','simDataNois0Turb0Cnpos','simDataNois0Turb0Cnneg')