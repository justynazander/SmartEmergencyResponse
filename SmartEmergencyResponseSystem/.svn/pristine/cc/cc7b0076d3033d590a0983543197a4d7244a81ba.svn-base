function [AC] = FASER_config()
% function [AC] = FASER_config()
%
%
% FASER configuration file. Sets aircraft parameters.
% Called from: UAV_config.m
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: FASER_config.m 765 2012-01-25 20:14:05Z murch $


AC.aircraft = 'FASER';

%% Inertia, Mass and CG location
% Inertia data taken from NASA FASER_SIM_NOAH faser_massprop.m

% Gross aircraft mass [kg] (including relevant hardware)
AC.Mass  = 7.411; % AMM 10/29/11

% CG location [x y z], [m]
AC.Geometry.rCG = [0.315 0 0.072]; 

% Gross moments of inertia [Jx Jy Jz Jxz] [kg*m^2]
% AC.Inertia.Ixx = 0.672485702; 
% AC.Inertia.Iyy = 0.889416574; 
% AC.Inertia.Izz = 1.57817209;  
AC.Inertia.Ixx = 0.8568; % 10/29/11
AC.Inertia.Iyy = 1.0095; % 10/29/11
AC.Inertia.Izz = 1.7005; % 10/29/11
AC.Inertia.Ixz = -0.759258051/4; % reduced to match flight data AMM 9/14/11
AC.Inertia.Matrix = [AC.Inertia.Ixx  0               -AC.Inertia.Ixz;...
    0         AC.Inertia.Iyy  0;...
    -AC.Inertia.Ixz 0               AC.Inertia.Izz];


%% Aircraft Geometric Parameters
% Aerodynamic force application point (usually the aerodynamic center)[x y z]
AC.Geometry.AeroCenter = [0.32 0 0.072]; % approximate AMM 10/29/11

% Geometry data from NASA FASER_SIM_NOAH faser_deq.m
% Mean aerodynamic chord [m]
AC.Geometry.c = 0.433578; % 0.4279 m (calculated MAC)
% Wing span [m]
AC.Geometry.b = 1.917192; % 1.92 m aft max
% Wing area [m^2]
AC.Geometry.S = 0.769237171; %.7732 from measurements

%% Aero coefficients
AC.Aero = load('FASER_Aero');
AC.Aero.use_FASER_aero = 1;
AC.Aero.AsymmetryOn = 0; % set to 1 to turn on asymmetric aero model.

%% PROPULSION
%Propulsion force application point (usually propeller hub) [x y z]

AC.Geometry.rProp = [-0.075 0 0]; % [m] Propeller in front of reference point

% Thrust alignment orientation, radians
AC.Prop.Angles = [0 0 0]/180*pi;


% Using an APC 12 x 6E propeller, EFlite Power 25 motor
% Coefficient of thrust polynomial model 
% AEM wind tunnel test data Jan 2011
AC.Prop.CT = [-0.4314 1.08 -0.896 0.1089 0.0604 ];

% Coefficient of power polynomial model 
% AEM wind tunnel test data Jan 2011
AC.Prop.CP = [0.5054 -0.5304 0.0412 0.01664 0.0223];

% Motor polynomial model. Input throttle, output power in watts
% EFlite Power 25, AEM wind tunnel test data Jan 2011
% Castle Creations ICE Lite 50 used to collect motor data
% Multiplied by 6 to get peak power of 1440 watts.
AC.Prop.Power = [174.46 70.135 -4.39]*6;

% Electric motor and propeller combine moment of inertia
AC.Prop.Jmp = 0.00041935;  % [kg*m^2] estimated, AMM 9/12/11

% Propeller diameter (m) (14x9.5 prop on FASER)
AC.Prop.Radius = 0.1778;

AC.Prop.ThrottleOutputLimit.Upper = 1900;
AC.Prop.ThrottleOutputLimit.Lower = 0;
AC.Prop.OmegaSaturation.Upper = 15000*pi/30;
AC.Prop.OmegaSaturation.Lower = 1;

%% Configure Actuators and Initial Conditions

d2r = pi/180;                         % Degrees to Radians conversion

%Elevator
AC.Actuator.elevator.BW = 8;    % [Hz]
AC.Actuator.elevator.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.elevator.PosLim = 25*d2r;  % [rad]
AC.Actuator.elevator.NegLim = -25*d2r; %[rad]

%Ailerons
AC.Actuator.l_aileron.BW = 8;    % [Hz]
AC.Actuator.l_aileron.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.l_aileron.PosLim = 25*d2r;  % [rad]
AC.Actuator.l_aileron.NegLim = -25*d2r; %[rad]

AC.Actuator.r_aileron.BW = 8;    % [Hz]
AC.Actuator.r_aileron.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.r_aileron.PosLim = 25*d2r;  % [rad]
AC.Actuator.r_aileron.NegLim = -25*d2r; %[rad]

%Rudder
AC.Actuator.rudder.BW = 8;    % [Hz]
AC.Actuator.rudder.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.rudder.PosLim = 25*d2r;  % [rad]
AC.Actuator.rudder.NegLim = -25*d2r; %[rad]

%Flaps
AC.Actuator.l_flap.BW = 8;    % [Hz]
AC.Actuator.l_flap.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.l_flap.PosLim = 25*d2r;  % [rad]
AC.Actuator.l_flap.NegLim = -25*d2r; %[rad]

AC.Actuator.r_flap.BW = 8;    % [Hz]
AC.Actuator.r_flap.RateLim = 150*d2r;   % [rad/s]
AC.Actuator.r_flap.PosLim = 25*d2r;  % [rad]
AC.Actuator.r_flap.NegLim = -25*d2r; %[rad]

%Throttle
AC.Actuator.throttle.PosLim = 1;  % [nd]
AC.Actuator.throttle.NegLim = 0; %[nd]

%% Configure Sensor Noise Parameters
AC.Sensors.NoiseOn = 1;
AC.Sensors.IMU.p_noise = 0.000001; % rad/s
AC.Sensors.IMU.q_noise = 0.000001; % rad/s
AC.Sensors.IMU.r_noise = 0.000001; % rad/s
AC.Sensors.IMU.hx_noise =150;   % nT 
AC.Sensors.IMU.hy_noise =150;   % nT
AC.Sensors.IMU.hz_noise =80000; % nT
AC.Sensors.IMU.ax_noise =0.0008; % m/s^2
AC.Sensors.IMU.ay_noise =0.004;  % m/s^2
AC.Sensors.IMU.az_noise =0.004;  % m/s^2
AC.Sensors.AirData.ias_noise = 0.001; % m/s
AC.Sensors.AirData.h_noise = 0.02; % m
% Alpha/beta noise levels need to be verified with flight data
AC.Sensors.AirData.alpha_noise = 0.0000002; % rad
AC.Sensors.AirData.beta_noise = 0.0000002; % rad
AC.Sensors.AirData.Pd_noise = 0.00000015; % Kpa, AMS 5812
AC.Sensors.AirData.Ps_noise = 0.0000008; % Kpa, AMS 5812

%% Configure Sensor Bias Parameters
AC.Sensors.IMU.p_bias = 0; % rad/s
AC.Sensors.IMU.q_bias = 0; % rad/s
AC.Sensors.IMU.r_bias = 0; % rad/s
AC.Sensors.IMU.hx_bias = 0;   % nT 
AC.Sensors.IMU.hy_bias = 0;   % nT
AC.Sensors.IMU.hz_bias = 0; % nT
AC.Sensors.IMU.ax_bias = 0; % m/s^2
AC.Sensors.IMU.ay_bias = 0;  % m/s^2
AC.Sensors.IMU.az_bias = 0;  % m/s^2
AC.Sensors.AirData.ias_bias = 0; % m/s
AC.Sensors.AirData.h_bias = 0; % m
AC.Sensors.AirData.alpha_bias = 0; % rad
AC.Sensors.AirData.beta_bias = 0; % rad
AC.Sensors.AirData.Pd_bias = 0; % Kpa, AMS 5812
AC.Sensors.AirData.Ps_bias = 0; % Kpa, AMS 5812

%% Configure Sensor Scale Factor Parameters
AC.Sensors.IMU.p_scf = 1; % rad/s
AC.Sensors.IMU.q_scf = 1; % rad/s
AC.Sensors.IMU.r_scf = 1; % rad/s
AC.Sensors.IMU.hx_scf = 1;   % nT 
AC.Sensors.IMU.hy_scf = 1;   % nT
AC.Sensors.IMU.hz_scf = 1; % nT
AC.Sensors.IMU.ax_scf = 1; % m/s^2
AC.Sensors.IMU.ay_scf = 1;  % m/s^2
AC.Sensors.IMU.az_scf = 1;  % m/s^2
AC.Sensors.AirData.ias_scf = 1; % m/s
AC.Sensors.AirData.h_scf = 1; % m
AC.Sensors.AirData.alpha_scf = 1; % rad
AC.Sensors.AirData.beta_scf = 1; % rad
AC.Sensors.AirData.Pd_scf = 1; % Kpa, AMS 5812
AC.Sensors.AirData.Ps_scf = 1; % Kpa, AMS 5812