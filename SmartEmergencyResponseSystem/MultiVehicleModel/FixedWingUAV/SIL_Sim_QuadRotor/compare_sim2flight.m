%% compare_sim2flight.m
%
% This script will compare flight data to SIL simulation data. Change the
% flight data file and simulation data file in the section below titled
% "User Input".
%
% University of Minnesota
% Aerospace Engineering and Mechanics
% Copyright 2011 Regents of the University of Minnesota.
% All rights reserved.
%
% SVN Info: $Id: compare_sim2flight.m 743 2011-12-09 19:19:12Z murch $

%% Clean up
% clear
close all;
clc
g = 9.81;
r2d = 180/pi;



%% User Input: Set flight data and sim data names here

% Flight Data
% all or part of the flight data file name, including the relative path
% flight_name = '../../FlightData/Control_Laws/loki_flight50';
% flight_name = '../../FlightData/System_Development/thor_flight23';
% flight_name = '../../FlightData/Control_Laws/thor_flight26';
% flight_name = '../../FlightData/System_Development/thor_flight22';
% flight_name = '../../FlightData/System_Development/faser_flight02';
% flight_name = '../../FlightData/System_ID/thor_flight25';
% flight_name = '../../FlightData/Control_Laws/thor_flight02'; % group 1 controller
flight_name = '../../FlightData/Navigation/faser_flight04_baseline_NAVREPAIRED';

% Simulation Data, exact name and relative path
sim_name = 'simData_faser_flight04';




%% Find and load flight data file
flightfile = dir([flight_name '*.mat']);
if isempty(flightfile)
    error('Flight data file "%s" not found',flight_name)
elseif length(flightfile) > 1
    error('%d flight data files with "%s" found.',length(flightfile),flight_name)
else
    tmp = strfind(flight_name,'/');
    load([flight_name(1:tmp(end)) flightfile.name])
end

% compute_aoaaos
%correct_faser_alphabeta; % needed for faser 


%% Load simulation data
load(sim_name)

%% Find doublet sequences in flight data, in air only (altitude above 20m)
dstart = find(diff(flight_data.mode == 2 & flight_data.ias>5) == 1);
dstop  = find(diff(flight_data.mode == 2 & flight_data.ias>5) == -1);

%% Setup color order for plotting
clr = get(0,'DefaultAxesColorOrder');
if length(dstart) > length(clr)
    clr = [clr;clr;clr];    % pad with extras if needed
end


%% Plot sim data

% theta bias to account for trim differences
theta_bias = 5-simData.pitch_ref(1);

time_bias = 0.06; % sec
%% Angular Rates
figure(1)
subplot(3,1,1)
plot(simData.time + time_bias,simData.p,'k','Linewidth',2)
subplot(3,1,2)
plot(simData.time + time_bias,simData.q,'k','Linewidth',2)
subplot(3,1,3)
plot(simData.time + time_bias,simData.r,'k','Linewidth',2)

%% Tracking Performance
figure(2)
subplot(2,1,1)
plot(simData.time + time_bias,simData.phi,'k','Linewidth',2)
subplot(2,1,2)
plot(simData.time + time_bias,simData.the+theta_bias,'k','Linewidth',2)

%% Pitch Axis
figure(3)
subplot(3,1,1)
plot(simData.time + time_bias,simData.the+theta_bias,'k','Linewidth',2)
subplot(3,1,2)
plot(simData.time + time_bias,simData.q,'k','Linewidth',2)
subplot(3,1,3)
plot(simData.time,simData.de,'k','Linewidth',2)
%% Roll Axis
figure(4)
subplot(3,1,1)
plot(simData.time + time_bias,simData.phi,'k','Linewidth',2)
subplot(3,1,2)
plot(simData.time + time_bias,simData.p,'k','Linewidth',2)
subplot(3,1,3)
plot(simData.time,simData.da_r,'k','Linewidth',2)
%% Yaw Axis
figure(5)
subplot(3,1,1)
plot(simData.time + time_bias,simData.psi-simData.psi(1),'k','Linewidth',2)
subplot(3,1,2)
plot(simData.time + time_bias,simData.r,'k','Linewidth',2)
subplot(3,1,3)
plot(simData.time,simData.dr,'k','Linewidth',2)
%% Airspeed & Altitude
figure(6)
subplot(2,1,1)
plot(simData.time + time_bias,simData.ias,'k','Linewidth',2)
subplot(2,1,2)
plot(simData.time + time_bias,simData.h-simData.h(1),'k','Linewidth',2)

%% Angle of Attack and Sideslip
if isfield(flight_data,'aoa')
    figure(7)
    subplot(2,1,1)
    plot(simData.time + time_bias,simData.aoa,'k','Linewidth',2)
    subplot(2,1,2)
    plot(simData.time + time_bias,simData.aos,'k','Linewidth',2)
end

%% Accels
if isfield(simData,'ax')
figure(8)
subplot(3,1,1)
plot(simData.time + time_bias,simData.ax/g,'k','Linewidth',2)
subplot(3,1,2)
plot(simData.time + time_bias,simData.ay/g,'k','Linewidth',2)
subplot(3,1,3)
plot(simData.time + time_bias,simData.az/g,'k','Linewidth',2)
end


%% Plotting loop for flight data
for i = 1:length(dstart)
    ind = dstart(i):dstop(i);
    delta_time = flight_data.time(ind)-flight_data.time(ind(1));
    %% Angular Rates
    figure(1)
    set(gcf,'Name','Angular Rates')
    
    subplot(3,1,1)
    grid on; hold on;
    plot(delta_time,flight_data.p(ind)*r2d,'Color',clr(i,:))    
    ylabel('p [deg/s]');
    title({flightfile.name,'Roll Rate'},'Interpreter','none');
    
    subplot(3,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.q(ind)*r2d,'Color',clr(i,:))
    ylabel('q [deg/s]');
    title('Pitch Rate');
    
    subplot(3,1,3)
    grid on; hold on;
    plot(delta_time,flight_data.r(ind)*r2d,...
        'Color',clr(i,:));
    xlabel('time [s]'); ylabel('r [deg/s]');
    title('Yaw Rate');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Tracking Performance
    figure(2)
    set(gcf,'Name','Tracking Performance')
    
    subplot(2,1,1)
    if i == 1
        grid on; hold on;
        plot(delta_time,flight_data.roll_ref(ind)*r2d,'r--','Linewidth',2)
    end
    plot(delta_time,flight_data.phi(ind)*r2d,'Color',clr(i,:))
    ylabel('\phi [deg]');
    title({flightfile.name,'Roll Angle'},'Interpreter','none');
    
    subplot(2,1,2)
    % Hack to handle erroneous pitch ref data
    if i == 1
        grid on; hold on;
        if flight_data.pitch_ref(ind(end))*r2d > 7
            plot(delta_time,flight_data.pitch_ref(ind)*r2d-5,'r--','Linewidth',2)
        else
            plot(delta_time,flight_data.pitch_ref(ind)*r2d,'r--','Linewidth',2)
        end
    end
    plot(delta_time,flight_data.the_nav(ind)*r2d,'Color',clr(i,:))
    xlabel('Time [s]'); ylabel('\theta [deg]');
    title('Pitch Angle');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Pitch Axis
    figure(3)
    set(gcf,'Name','Pitch Axis')
    
    subplot(3,1,1)
    % Hack to handle erroneous pitch ref data
    if i == 1
        grid on; hold on;
        if flight_data.pitch_ref(dstop(i))*r2d > 7
            plot(delta_time,flight_data.pitch_ref(ind)*r2d-5,'r--','Linewidth',2)
        else
            plot(delta_time,flight_data.pitch_ref(ind)*r2d,'r--','Linewidth',2)
        end
    end
    plot(delta_time,flight_data.the(ind)*r2d,'Color',clr(i,:))
    ylabel('\theta [deg]');
    title({flightfile.name,'Pitch Angle'},'Interpreter','none');
    
    subplot(3,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.q(ind)*r2d,'Color',clr(i,:))
    ylabel('q [deg/s]');
    title('Pitch Rate');
    
    subplot(3,1,3)
    grid on; hold on;
    plot(delta_time,flight_data.de(ind)*r2d,'Color',clr(i,:))
    xlabel('time [s]'); ylabel('\delta_e [deg]');
    title('Elevator Command');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Roll Axis
    figure(4)
    set(gcf,'Name','Roll Axis')
    
    subplot(3,1,1)
    if i == 1
        grid on; hold on;
        plot(delta_time,flight_data.roll_ref(ind)*r2d,'r--','Linewidth',2)
    end
    plot(delta_time,flight_data.phi(ind)*r2d,'Color',clr(i,:))
    ylabel('\phi [deg]');
    title({flightfile.name,'Roll Angle'},'Interpreter','none');
    
    subplot(3,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.p(ind)*r2d,'Color',clr(i,:))
    ylabel('q [deg/s]');
    title('Roll Rate');
    
    subplot(3,1,3)
    grid on; hold on;
    plot(delta_time,flight_data.da_r(ind)*r2d,'Color',clr(i,:))
    xlabel('Time [s]'); ylabel('\delta_a [deg]');
    title('Aileron Command');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Yaw axis
    figure(5)
    set(gcf,'Name','Yaw Axis')
    
    subplot(3,1,1)
    grid on; hold on;
    plot(delta_time,(flight_data.psi(ind)-flight_data.psi(ind(1)))*r2d,'Color',clr(i,:))
    ylabel('\Delta\psi [deg]');
    title({flightfile.name,'Heading Angle'},'Interpreter','none');
    
    subplot(3,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.r(ind)*r2d,'Color',clr(i,:))
    ylabel('q [deg/s]');
    title('Yaw Rate');
    
    subplot(3,1,3)
    grid on; hold on;
    plot(delta_time,flight_data.dr(ind)*r2d,'Color',clr(i,:))
    xlabel('Time [s]'); ylabel('\delta_r [deg]');
    title('Rudder Command');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Airspeed & Altitude
    figure(6)
    set(gcf,'Name','Airspeed & Altitude')
    subplot(2,1,1)
    grid on; hold on;
    plot(delta_time,flight_data.ias(ind),'Color',clr(i,:))
    ylabel('IAS [m/s]');
    title({flightfile.name,'Airspeed'},'Interpreter','none');
    
    subplot(2,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.h(ind)-flight_data.h(ind(1)),'Color',clr(i,:))
    xlabel('Time [s]'); ylabel('\Delta h [m]');
    title('Delta Altitude');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    
    %% Angle of Attack and Sideslip
    if isfield(flight_data,'l_alpha')
        figure(7)
        set(gcf,'Name','Angle of Attack & Sideslip')
        subplot(2,1,1)
        grid on; hold on;
        plot(delta_time,flight_data.l_alpha(ind)*r2d,'Color',clr(i,:))        
%         plot(delta_time,-l_alpha_gndcor(ind)*r2d+5,'k')
        plot(delta_time,flight_data.r_alpha(ind)*r2d,'Color',min(clr(i,:)+.5,1))
        ylabel('\alpha [deg]');
        title({flightfile.name,'Angle of Attack'},'Interpreter','none');
        
        subplot(2,1,2)
        grid on; hold on;
        plot(delta_time,flight_data.l_beta(ind)*r2d,'Color',clr(i,:))
        plot(delta_time,flight_data.r_beta(ind)*r2d,'Color',min(clr(i,:)+.5,1))
        xlabel('Time [s]'); ylabel('\beta [deg]');
        title('Sideslip Angle');
        
        set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)        
    elseif isfield(flight_data,'aoa')
        figure(7)
        set(gcf,'Name','Angle of Attack & Sideslip')
        subplot(2,1,1)
        grid on; hold on;
        plot(delta_time,flight_data.aoa(ind)*r2d,'Color',clr(i,:))
        ylabel('\alpha [deg]');
        title({flightfile.name,'Angle of Attack'},'Interpreter','none');
        
        subplot(2,1,2)
        grid on; hold on;
        plot(delta_time,flight_data.aos(ind)*r2d,'Color',clr(i,:))
        xlabel('Time [s]'); ylabel('\beta [deg]');
        title('Sideslip Angle');
        
        set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)
    end
    
    %% Accels
    figure(8)
    set(gcf,'Name','Accels')
    
    subplot(3,1,1)
    grid on; hold on;
    plot(delta_time,flight_data.ax(ind)/g,'Color',clr(i,:))
    ylabel('Ax [g]');
    title({flightfile.name,'X Accel'},'Interpreter','none');
    
    subplot(3,1,2)
    grid on; hold on;
    plot(delta_time,flight_data.ay(ind)/g,'Color',clr(i,:))
    ylabel('Ay [g]');
    title('Y Accel');
    
    subplot(3,1,3)
    grid on; hold on;
    plot(delta_time,flight_data.az(ind)/g,'Color',clr(i,:))
    xlabel('Time [s]'); ylabel('Az [g]');
    title('Z Accel');
    
    set(get(gcf,'Children'),'Xlim',[0 20],'Fontsize',12)    
end
