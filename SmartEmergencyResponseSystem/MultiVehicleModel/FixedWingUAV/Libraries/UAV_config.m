function [AC,Env] = UAV_config(aircraft,savefile)
% function [AC,Env] = UAV_config(aircraft,savefile)
%
% Defines aircraft parameters. Input desired aircraft and savefile boolean.
% Sets Env data structure.
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: UAV_config.m 314 2011-04-05 16:53:30Z murch $

if nargin < 2
    savefile = 1;
end

switch lower(aircraft)
    case 'ultrastick'
        AC = Ultrastick_config;
    case 'faser'
        AC = FASER_config;
end

% Name of mat-file
cfgmatfile = 'UAV_modelconfig';

%% Environmental Parameters
%%% Dryden Wind Turbulence Model (+q +r)
Env.Winds.TurbulenceOn=0;
Env.Winds.TurbWindSpeed = 2; % these params determine the turbulence level for 1000 ft and below
Env.Winds.TurbWindDir = 0;

%%% Wind Gust Model
Env.Winds.GustOn=0;
% Gust Start time (sec)
Env.Winds.GustStartTime = 0;
% Gust Length [dx dy dz] (m)
Env.Winds.GustLength = [1 1 1];
% Gust amplitude [ug vg wg] (m/s)
Env.Winds.GustAmplitude = [1 1 1];

%%% Horizontal Wind Model
Env.Winds.SteadyWindOn=0;
Env.Winds.WindSpeed = 0;
Env.Winds.WindDir = 0;

% Date
Env.DecimalYear = decyear(now);
Env.Date = datestr(now);

% Ground Altitude-for advanced simulation, import terrain data lookup here
Env.GroundAlt = 0;


%% Save workspace variables to MAT file
if savefile
    save(['../Libraries/' cfgmatfile],'AC','Env');
    
    % Output a message to the screen
    fprintf(strcat('\n Aircraft configuration saved as:\t', strcat(cfgmatfile),'.mat'));
    fprintf('\n');
end