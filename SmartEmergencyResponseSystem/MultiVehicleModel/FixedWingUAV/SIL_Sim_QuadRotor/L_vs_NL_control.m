% Compares Linear vs Nonlinear models for lateral controller

% setup;
load linmodel17;
addpath ../Lin_Sim

%% Declare gains here
waypoint_gains;

%%
AC.Sensors.NoiseOn = 0;
Env.Winds.TurbulenceOn =0;

run_time = 20; %simulation time in seconds

phi_mag = 8; % step size for phi doublet (degrees)
phi_pulse = 20; % phi doublet pulse time (seconds)

V_mag = 0;      %m/s 
V_pulse = 4;    %sec

h_mag = 0;      %m
h_pulse = 60;   %sec


sim('UAV_Lin',run_time);
sim('UAV_SIL',run_time);

%% Plot results

scrsz=get(0,'screensize');
figwidth=scrsz(3)/1.5;
figheight=scrsz(4)/1.2;

Fig1=figure();
set(Fig1,'Position',[figwidth/2 50 figwidth figheight]);

subplot 331
plot(time_L,phi_L+TrimCondition.AttitudeIni(1)*180/pi,'r',time,phi,'b--')
title('Roll angle, phi');ylabel('phi (deg)');grid on;

subplot 332
plot(time_L,theta_L+TrimCondition.AttitudeIni(2)*180/pi,'r',time,theta,'b--')
title('Pitch angle, theta');ylabel('theta (deg)');grid on;

subplot 333
plot(time_L,psi_L,'r',time,psi-90,'b--')
title('Heading angle, psi');ylabel('psi (deg)');grid on;

subplot 334
plot(time_L,p_L,'r',time,p,'b--')
title('Roll rate, p');ylabel('p (deg)');grid on;

subplot 335
plot(time_L,q_L,'r',time,q,'b--')
title('Pitch rate, q');ylabel('q (deg)');grid on;

subplot 336
plot(time_L,r_L,'r',time,r,'b--')
title('Yaw rate, r');ylabel('r (deg/s)');grid on;

subplot 337
plot(time_L,V_L+TrimCondition.WindAxesIni(1),'r',time,V_s,'b--')
title('Velocity');xlabel('time (sec)');ylabel('V (m/s)');grid on;

subplot 338
plot(time_L,h_L+OperatingPoint.op_report.Outputs(4).y,'r',time,alt,'b--')
title('Altitude');xlabel('time (sec)');ylabel('h (m)');grid on;

subplot 339
plot(time_L,alpha_L+TrimCondition.WindAxesIni(2)*180/pi,'r',time,alpha,'b--')
title('Alpha');xlabel('time (sec)');ylabel('alpha (deg)');legend('Linear','NonLinear');grid on;
