function [projectRoot, hadToOpen] = set_up_SimulinkProject()
%set_up_project  Configure the environment for this project
%
%   Set up the environment for the current project. This function is set to
%   Run at Startup.

%   Copyright 2014 The MathWorks, Inc.

% Use Simulink Project API to get the current project:

% projectRoot = pwd; 

hadToOpen = false;
try
    project = simulinkproject;
catch
    project = slproject.loadProject('SERSfromGit.prj');
    hadToOpen = true;
end

projectRoot = project.RootFolder;
% Set the location of slprj to be the "work" folder of the current project:
myCacheFolder = fullfile(projectRoot, 'work');
if ~exist(myCacheFolder, 'dir')
    mkdir(myCacheFolder)
end
Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
    'CodeGenFolder', myCacheFolder);

addpath(genpath([pwd '\SmartEmergencyResponseSystem']));

% Set the path for this project:
% folders = project_paths();
% for jj=1:numel(folders)
%     addpath( fullfile(projectRoot, folders{jj}) );
% end
end
