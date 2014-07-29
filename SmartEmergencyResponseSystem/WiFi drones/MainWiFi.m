% This Main file is to read GPS data in real time and to plot the data on google earth
% clc
% clear all
% close all

% To add the google earth tool box, add this line
% Download the google earth toolbox from http://publicwiki.deltares.nl/display/OET/OpenEarth
%TODO
%run('E:\matlab\checkout\OET\matlab\oetsettings.m');

input=menu('Read GPS data from','Serial Port','Text File');
googleearthfile = [pwd '\WiFi drones\SFtrial.kml'];

%% GPS data should be in the following format -----------> latitude,longitude

switch(input)
    case 1 
        % Specify the serial port from where data will be available
        comport = 'COM20';
        readserialport(comport, googleearthfile);
    case 2
        textfile = [pwd '\WiFi drones\SFlatlon.txt'];
        readtextfile(textfile, googleearthfile);
end

% In the google earth make the following changes to visulaize the data in
% real time
% 1. In google garth and select Network Link from the Add menu at the top.
% 2. Put the path of the .kml file stored on your laptop in the box next to link.
% 3. Click on the refresh button, and specify the refresh rate.
% 4. Click on OK button.