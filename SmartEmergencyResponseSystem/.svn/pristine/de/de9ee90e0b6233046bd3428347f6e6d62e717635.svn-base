function busnames2excel(savename)
% function busnames2excel(savename)
%
% Takes input/output bus signal names from UAV_NL.mdl and stores them in a
% Excel file. The default name for this file is 'UAV_sim_ICD.xlsx'.
%
% Output signal names are taken from the "States" and "EnvData" bus
% selectors. Input signal names are taken from the "Control Inputs" bus
% creator.
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: busnames2excel.m 284 2011-03-03 15:07:19Z murch $

% default file name
if nargin < 1
    savename = 'UAV_sim_ICD.xlsx';
end

States = busnames2cell('UAV_NL/States');
EnvData = busnames2cell('UAV_NL/EnvData');
ControlInputs = busnames2cell('UAV_NL/Control Inputs');

% write to an Excel 2007 file
xlswrite(savename,[{'Output Signals: States Bus'}; States; {'';'Output Signals: EnvData Bus'}; EnvData; {'';'Input Signals: Control Inputs Bus'}; ControlInputs])

function Out = busnames2cell(blockname)

% Handle bus creator and bus selector blocks
if strcmp(get_param(blockname,'BlockType'),'BusCreator')
    names = get_param(blockname,'InputSignalNames');
else
    names=get_param(blockname,'InputSignals');
end
% Build signal list as a cell array, limited to 4 levels. If more are
% needed, simply add additional for loops here
Out={};
for i=[1:length(names)];
    if ~iscell(names{i}),
      Out{end+1,1}=names{i};
    else
        level1=names{i}{2};
        for j=[1:length(level1)],
            if ~iscell(level1{j}),
                Out{end+1,1}=sprintf(',%s.%s',names{i}{1},level1{j});
            else
                level2=level1{j}{2};
                for k=[1:length(level2)],
                    if ~iscell(level2{k}),
                        Out{end+1,1}=sprintf(',%s.%s.%s',names{i}{1},level1{j}{1},level2{k});
                    else
                        level3=level2{k}{2};
                        for l=[1:length(level3)],
                            if ~iscell(level3{l}),
                                Out{end+1,1}=sprintf(',%s.%s.%s.%s',names{i}{1},level1{j}{1},level2{k}{1},level3{l});
                            else
                                level4=level3{l}{2};
                                for m=[1:length(level4)],
                                    if ~iscell(level4{m}),
                                      Out{end+1,1}=sprintf(',%s.%s.%s.%s.%s',names{i}{1},level1{j}{1},level2{k}{1},level3{l}{1},level4{m});
                                    else    
                                      error('Recursion limit reached, input bus should be <= 4-levels deep or modify busnames2excel.m');
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
Out = strrep(Out,',',''); % drop commas in the signal names
