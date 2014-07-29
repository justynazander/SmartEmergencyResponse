function plot_SIL(varargin)
%% plot_SIL.m
% UAV_SIL sim plot and comparison tool
%
% Input file names of saved simulation results (simData structure) and this
% function will co-plot the results. If no file name is input, the file
% "simData.mat" will be used.
%
% University of Minnesota
% Aerospace Engineering and Mechanics
% Copyright 2011 Regents of the University of Minnesota.
% All rights reserved.
%
% SVN Info: $Id: plot_SIL.m 559 2011-09-01 19:44:55Z murch $

close all

% default case
if nargin < 1
    varargin = {'simData'};
end

% Check if input names are saved files
for i = 1:length(varargin)
    if ~exist([varargin{i} '.mat'],'file')
        error('File name %s not found!',[varargin{i} '.mat'])
    end
end

% Setup color order
clr = get(0,'DefaultAxesColorOrder');
clr = clr(1:length(varargin),:); % only keep as many colors as file names

% turn off nuiusance warnings
warning('off','MATLAB:legend:IgnoringExtraEntries')

% Loop over 
for i = 1:length(varargin)
    load(varargin{i}) % Load in sim data
    if ~exist('simData','var')
        warning('simData data structure not found in file %s.',varargin{i})
        continue
    end
    % Plot Elevator response
    figure(1), hold on, grid on
    plot(simData.time, simData.de, 'Color',clr(i,:), 'LineWidth',2);
    title('SIL Elevator Deflection')
    xlabel('time [s]'), ylabel('\delta_{elev} [deg]')
    legend(varargin)
    
    % Plot Aileron response
    figure(2), hold on, grid on
    plot(simData.time, simData.da_r, 'Color',clr(i,:), 'LineWidth',2);
    title('SIL Aileron Deflection')
    xlabel('time [s]'), ylabel('\delta_{ail} [deg]')
    legend(varargin)
    
    % Plot Rudder response
    figure(3), hold on, grid on
    plot(simData.time, simData.dr, 'Color',clr(i,:), 'LineWidth',2);
    title('SIL Rudder Deflection')
    xlabel('time [s]'), ylabel('\delta_{rud} [deg]')
    legend(varargin)
    
    % Plot Flap response
    figure(4), hold on, grid on
    plot(simData.time, simData.df_r, 'Color',clr(i,:), 'LineWidth',2);
    title('SIL Flap Deflection')
    xlabel('time [s]'), ylabel('\delta_{flap} [deg]')
    legend(varargin)
    
    % Plot V_s response
    figure(5), hold on, grid on
    plot(simData.time,simData.ias , 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL V_s Response')
    xlabel('time [s]'), ylabel('V_s [m/s]')
    legend(varargin)
    
    % Plot Angle of Attack response
    figure(6), hold on, grid on
    plot(simData.time, simData.aoa, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Angle of Attack Response')
    xlabel('time [s]'), ylabel('\alpha [deg]')
    legend(varargin)
    
    % Plot Sideslip response
    figure(7), hold on, grid on
    plot(simData.time,simData.aos, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Sideslip Response')
    xlabel('time [s]'), ylabel('\beta [deg]')
    legend(varargin)
    
    % Plot Bank Angle response
    % figure, hold on, grid on
    % plot(simData.time, simData.phi, 'Color',clr(i,:), 'LineWidth', 2);
    % title('SIL Bank Angle Response')
    % xlabel('time [s]'), ylabel('\phi [deg]')
    % legend(varargin)

    % Plot Bank Angle Commanded/Actual
    figure(8), hold on, grid on
    if i == 1,   plot(simData.time, simData.roll_ref, 'k', 'LineWidth', 2), end
    plot(simData.time, simData.phi, 'Color',clr(i,:),'LineWidth',2)
    title('SIL Bank Angle Comparison')
    xlabel('time [s]'), ylabel('\phi [deg]')
    legend([{'Commanded \phi'},varargin])
    
    % Plot Pitch Angle response
    % figure, hold on, grid on
    % plot(simData.theta.time, simData.theta, 'Color',clr(i,:), 'LineWidth', 2);
    % title('SIL Pitch Angle Response')
    % xlabel('time [s]'), ylabel('\theta [deg]')
    
    % Plot Pitch Angle Commanded/Actual
    figure(9), hold on, grid on
    if i == 1,   plot(simData.time, simData.pitch_ref, 'k', 'LineWidth', 2), end
    plot(simData.time, simData.the, 'Color',clr(i,:),'LineWidth',2)
    title('SIL Pitch Angle Comparison')
    xlabel('time [s]'), ylabel('\theta [deg]')
    legend([{'Commanded \theta'},varargin])
    
    % Plot Yaw Angle response
    figure(10), hold on, grid on
    plot(simData.time, simData.psi, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Heading Angle Response')
    xlabel('time [s]'), ylabel('\psi [deg]')
    legend(varargin)
    
    % Plot altitude response
    figure(11), hold on, grid on
    plot(simData.time, simData.h, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL altitude (above Ground Level) Response')
    xlabel('time [s]'), ylabel('alt [m]')
    legend(varargin)
    
    % Plot roll rate response
    figure(12), hold on, grid on
    plot(simData.time, simData.p, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Roll Rate Response')
    xlabel('time [s]'), ylabel('p [deg/s]')
    legend(varargin)
    
    % Plot pitch rate response
    figure(13), hold on, grid on
    plot(simData.time, simData.q, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Pitch Rate Response')
    xlabel('time [s]'), ylabel('q [deg/s]')
    legend(varargin)
    
    % Plot yaw rate response
    figure(14), hold on, grid on
    plot(simData.time, simData.r, 'Color',clr(i,:), 'LineWidth', 2);
    title('SIL Yaw Rate Response')
    xlabel('time [s]'), ylabel('r [deg/s]')
    legend(varargin)
    
    clear simData
end

% Turn warning back on
warning('on','MATLAB:legend:IgnoringExtraEntries')