%% setupFleet.m
% UAV Fleet setup for nonlinear simulation
%
%
% University of Minnesota
% Aerospace Engineering and Mechanics
% Copyright 2011 Regents of the University of Minnesota.
% All rights reserved.
%
% Modified by David Escobar Sanabria, The MathWorks, Inc





%% Add Libraries and controllers folder to MATLAB path
addpath ../Libraries ;
addpath ../Controllers ; 


%% Load airframe configuration and trim condition
% To change these, use the functions "UAV_config.m" and "trim_UAV.m"
load UAV_modelconfig
load UAV_trimcondition


AC.TrimCondition = TrimCondition; 
clear TrimCondition; 
AC.OperatingPoint = OperatingPoint ; 
clear OperatingPoint; 

AC.FC.IntegerTimeDelay = 2; 

AC.FC.control.Ts = 0.02; % controller sample time (sec)
baseline_gains;  % controller lays on top of the baseline controller        
AC.FC.control.pitch_gains = [kp_PT, ki_PT, kp_PD];
AC.FC.control.roll_gains = [kp_RT, ki_RT, kp_RD];
AC.FC.control.yaw_damper_num = [YDz_num]; % discrete transfer function yaw damper coefficients
AC.FC.control.yaw_damper_den = [YDz_den];
AC.FC.control.a_YD = a_YD;  
AC.FC.control.k_YD = k_YD ; 
AC.FC.control.K_YD = K_YD ; 
AC.FC.control.K_YDz = K_YDz ; 

clear kp_PT ki_PT kp_PD kp_RT ki_RT kp_RD YDz_num YDz_den a_YD k_YD K_YD K_YDz; 


%%
heading_gains;  % Specify altitude and velocity gains
AC.FC.control.phi_sat = 45;   % phi cotnroller output saturation
AC.FC.control.theta_sat = 20; % altitude controller output saturation

AC.FC.control.LP_filter = LP_filter; 
AC.FC.control.ki_AT = ki_AT; 
AC.FC.control.ki_VT = ki_VT; 
AC.FC.control.kp_AT = kp_AT;
AC.FC.control.kp_VT = kp_VT; 
AC.FC.control.kp_HT = kp_HT; 
clear LP_filter ki_AT ki_VT kp_AT kp_VT kp_HT ; 


%% Setting up fleet of UAVs

FWFleet.AC = AC;
clear AC;

% Number of aircraft
%FWFleet.nFW= 2; 


%AC_Fleet.IC.Pos_Heading = [0; 0; -100; 0 ]; 

FWFleet.nOutUAVFleet = ones(1,FWFleet.nFW)*5 ;
%AC_Fleet.nOutUAVFleet = 4*AC_Fleet.nAC;


clear k;






