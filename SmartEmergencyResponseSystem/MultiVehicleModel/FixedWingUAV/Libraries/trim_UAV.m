function [TrimCondition,OperatingPoint]=trim_UAV(TrimCondition,AC,savefile,verbose)
%[TrimCondition,OperatingPoint]=trim_UAV(TrimCondition,AC,savefile,verbose)
%
% Trims the UAV simulation to target conditions using ..\NL_Sim\UAV_NL.mdl.
% This function can be called from any of the three sim directories.
% However, this function will use your workspace variables. Requires 
% Simulink Control Design.
%
% Set the trim target as shown below.
%
% Inputs:
%     TrimCondition - Initial aircraft state, with a structure called
%     "target", which has some subset of the following fields:
%     V_s          - True airspeed (m/s)
%     alpha        - Angle of attack (rad)
%     beta         - Sideslip (rad), defaults to zero
%     gamma        - Flight path angle (rad), defaults to zero
%     phi          - roll angle (rad)
%     theta        - pitch angle (rad)
%     psi          - Heading angle (0-360)
%     phidot       - d/dt(phi) (rad/sec), defaults to zero
%     thetadot     - d/dt(theta) (rad/sec), defaults to zero
%     psidot       - d/dt(psi) (rad/sec), defaults to zero
%     p            - Angular velocity (rad/sec)
%     q            - Angular velocity (rad/sec)
%     r            - Angular velocity (rad/sec)
%     h            - Altitude above ground level (AGL) (m)
%     elevator     - elevator control input, rad. 
%     aileron      - combined aileron control input, rad. (da_r - da_l)/2
%     l_aileron    - left aileron control input, rad
%     r_aileron    - right aileron control input, rad
%     rudder       - rudder control input, rad. 
%     throttle     - throttle control input, nd. 
%     flap         - flap control input, rad. Defaults to fixed at zero.
%
%     AC       - Aircraft configuration structure, from UAV_config.m
%     savefile - boolean flag to save trim condition; default "true"
%     verbose  - boolean flag to suppress output; default "true"
%
% Outputs:
%   TrimCondition  - values of state and control surfaces at trim.
%   OperatingPoint - Simulink OperatingPoint object to use with
%   linearization
%
% Unspecified variables are free, or defaulted to the values shown above.
% To force a defaulted variable to be free define it with an empty matrix.
% For example, by default beta=0  but "target.beta=[];" will allow beta
% to be free in searching for a trim condition.
%
% Examples:
% TrimCondition.target = struct('V_s',17,'gamma',0); % straight and level
% TrimCondition.target = struct('V_s',17,'gamma',5/180*pi); % level climb
% TrimCondition.target = struct('V_s',17,'gamma',0,...
%                     'psidot',20/180*pi); % level turn
% TrimCondition.target = struct('V_s',17,'gamma',5/180*pi,...
%                     'psidot',20/180*pi); % climbing turn
% TrimCondition.target = struct('V_s',17,'gamma',0,...
%                      'beta',5/180*pi); % level steady heading sideslip
%
% Based in part on the trimgtm.m script by David Cox, NASA LaRC 
% (David.E.Cox@.nasa.gov)
%
% University of Minnesota 
% Aerospace Engineering and Mechanics 
% Copyright 2011 Regents of the University of Minnesota. 
% All rights reserved.
%
% SVN Info: $Id: trim_UAV.m 684 2011-11-09 21:06:52Z murch $

if nargin < 4
    verbose = 1;
end
if nargin < 3
    savefile = 1;
end
% Name of the MAT-files that will be generated
trimmatfile = 'UAV_trimcondition';

%% Pull out target structure
target = TrimCondition.target;

%% Invalid target checking. This section can be expanded greatly.
if isfield(target,'alpha')&&isfield(target,'theta')&&isfield(target,'gamma'),
    error('Lacking free variable, cannot specify target in alpha, theta and gamma');
end
if isfield(target,'alpha')&&isfield(target,'V_s')&&isfield(target,'gamma'),
    error('Lacking free variable, cannot specify target in alpha, V_s and gamma');
end
if isfield(target,'aileron')&&isfield(target,'l_aileron')||isfield(target,'aileron')&&isfield(target,'r_aileron')
    error('Cannot specify a target for l/r_aileron AND combined aileron input');
end

%% Error checking for unknown fields
knownfields={'V_s','alpha','beta','gamma',...
    'phi','theta','psi',...
    'phidot','thetadot','psidot',...
    'p','q','r','h',...
    'elevator','l_aileron','r_aileron','aileron','rudder','throttle','l_flap','r_flap'};
saywhat=setdiff(fieldnames(target),knownfields);
if ~isempty(saywhat),
    for i=1:length(saywhat),fprintf(1,'Unknown field in target: %s\n',saywhat{i});end
    error('Unknown fields');
end

%% Set defaults if not specified
if ~isfield(target,'beta'),    target.beta=0; end
if ~isfield(target,'gamma'),   target.gamma=0; end
if ~isfield(target,'l_flap'),  target.l_flap=0; end
if ~isfield(target,'r_flap'),  target.r_flap=0; end

% If either of the individual ailerons are set, set combined aileron input
% to zero. Otherwise, use combined aileron input
if isfield(target,'l_aileron') || isfield(target,'r_aileron')
    target.aileron=0; 
else
    target.l_aileron=0;
    target.r_aileron=0;
end

%% Remove fields assocated with empty targets (overrides defaults);
fn=fieldnames(target);
for i=1:length(fn)
    if isempty(target.(fn{i}))
        target=rmfield(target,fn{i});
    end
end

%% Load model into memory
isLoaded = bdIsLoaded('UAV_NL'); % check to see if model is loaded or open
if ~isLoaded
    load_system('../NL_Sim/UAV_NL.mdl') % load model into system memory without opening diagram
end
%% SET OPERATING POINT SPECIFICATIONS
% Note: beware of overconstraining the states of the model. "findop" often
% fails (even if at a trim point!!) if the model is overconstrained.
%
op_spec = operspec('UAV_NL');
%% STATE SPECIFICATIONS
% phi, theta, psi -- Euler angles
% op_spec.States(1).StateName   = '[phi theta psi]';
op_spec.States(1).Known       = [0 ; 0; 1];
op_spec.States(1).x           = TrimCondition.AttitudeIni;
op_spec.States(1).steadystate = [1; 1; 1];

% p, q, r -- Angular rates
% op_spec.States(2).StateName   = '[p q r]';
op_spec.States(2).Known       = [0; 0; 0];
op_spec.States(2).x           = TrimCondition.RatesIni;
op_spec.States(2).steadystate = [1; 1; 1];

% u, v, w -- Body velocities
% op_spec.States(3).StateName   = '[u v w]';
op_spec.States(3).Known       = [0; 0; 0];
op_spec.States(3).x           = TrimCondition.VelocitiesIni;
op_spec.States(3).steadystate = [1; 1; 1];
op_spec.States(3).min         = [0 -inf -inf];

% Xe, Ye, Ze -- Inertial position
%op_spec.States(4).StateName   = '[Xe Ye Ze]';
op_spec.States(4).Known       = [0; 0; 1];
op_spec.States(4).x           = TrimCondition.InertialIni;
op_spec.States(4).steadystate = [0; 0; 0];
op_spec.States(4).max         = [inf inf 0];

% omega  -- Engine Speed
%op_spec.States(5).StateName = 'omega_engine';
op_spec.States(5).Known       = 0;
op_spec.States(5).x           = TrimCondition.EngineSpeedIni;
op_spec.States(5).steadystate = 1;

%% OUTPUT SPECIFICATIONS
% accelerations not included at this point
if isfield(target,'V_s')
    op_spec.Outputs(1).Known = 1;
    op_spec.Outputs(1).y = target.V_s;
end

if isfield(target,'beta')
    op_spec.Outputs(2).Known = 1;
    op_spec.Outputs(2).y = target.beta;
    if target.beta ~=0
        op_spec.States(1).Known(1) = 0; % Free phi state
    end
end

if isfield(target,'alpha')
    op_spec.Outputs(3).Known = 1;
    op_spec.Outputs(3).y = target.alpha;
end

if isfield(target,'h')
    op_spec.Outputs(4).Known = 1;
    op_spec.Outputs(4).y = target.h;
    op_spec.States(4).Known(3) = 0; %Free Ze to prevent overconstraining
end

if isfield(target,'phi')
    op_spec.Outputs(5).Known = 1;
    op_spec.Outputs(5).y = target.phi;
    op_spec.States(1).Known(1) = 0; % Free phi state to prevent overconstraining
    op_spec.States(1).SteadyState(3) = 0; % Free psidot to prevent conflicting constraints
end

if isfield(target,'theta')
    op_spec.Outputs(6).Known = 1;
    op_spec.Outputs(6).y = target.theta;
end

if isfield(target,'psi')
    op_spec.Outputs(7).Known = 1;
    op_spec.Outputs(7).y = target.psi;
end

if isfield(target,'p')
    op_spec.Outputs(8).Known = 1;
    op_spec.Outputs(8).y = target.p;
    op_spec.States(1).SteadyState(1) = 0; % Free phidot to prevent conflicting constraints
end

if isfield(target,'q')
    op_spec.Outputs(9).Known = 1;
    op_spec.Outputs(9).y = target.q;
    op_spec.States(1).SteadyState(2) = 0; % Free thetadot to prevent conflicting constraints
end

if isfield(target,'r')
    op_spec.Outputs(10).Known = 1;
    op_spec.Outputs(10).y = target.r;
    op_spec.States(1).SteadyState(3) = 0; % Free psidot to prevent conflicting constraints
end

if isfield(target,'gamma')
    op_spec.Outputs(11).Known = 1;
    op_spec.Outputs(11).y = target.gamma;
end

if isfield(target,'phidot')||isfield(target,'thetadot')||isfield(target,'psidot')
    op_spec=addoutputspec(op_spec,'UAV_NL/Nonlinear UAV Model/6DoF EOM/Calculate DCM & Euler Angles/phidot thetadot psidot',1); % add output spec if eulerdot targets are used
    if isfield(target,'phidot')
        op_spec.Outputs(15).Known(1) = 1;
        op_spec.Outputs(15).y(1) = target.phidot;
        if target.phidot ~= 0
            op_spec.States(1).steadystate(1) = 0; % Free phidot
        end
    end
    if isfield(target,'thetadot')
        op_spec.Outputs(15).Known(2) = 1;
        op_spec.Outputs(15).y(2) = target.thetadot;
        if target.thetadot ~= 0
            op_spec.States(1).steadystate(2) = 0; % Free thetadot
        end
    end
    if isfield(target,'psidot')
        op_spec.Outputs(15).Known(3) = 1;
        op_spec.Outputs(15).y(3) = target.psidot;
        if target.psidot ~= 0
            op_spec.States(1).steadystate(3) = 0; % Free psidot
        end
    end
end

%% INPUT SPECIFICATIONS
% Loop over all of the root level inport blocks and find the control
% surface inputs by name. Assign values, limits, and "known" status. Warn
% on unrecognized inport block names.
%
for i=1:length(op_spec.Inputs)
    inputname = strrep(op_spec.Inputs(i).Block,'UAV_NL/','');
    try
        if isfield(target,inputname) % if a target, set as known and use target value
            op_spec.inputs(i).known = 1;
            op_spec.inputs(i).u = target.(inputname);
        else % if not a target, set as unknown and use initial guess
            op_spec.inputs(i).known = 0;
            op_spec.inputs(i).u = TrimCondition.Inputs.(inputname);
        end
        try
            op_spec.inputs(i).max = AC.Actuator.(inputname).PosLim;
            op_spec.inputs(i).min = AC.Actuator.(inputname).NegLim;
        catch
            op_spec.inputs(i).max = 0.4363; % 25deg default
            op_spec.inputs(i).min = -0.4363; % 25deg default
        end
    catch
        warning(['Inport "' inputname '" not recognized. No input specifications will be set.'])
    end
end

%% FIND OPERATING POINT (TRIM)
if verbose
    opt1 = optimset('MaxFunEvals',1e+04);
    opt = linoptions('OptimizationOptions',opt1);  clear opt1
else
    opt1 = optimset('MaxFunEvals',1e+04,'Display','notify'); % suppress outputs
    opt = linoptions('OptimizationOptions',opt1,'DisplayReport','off');  clear opt1
end

[op_point,op_report] = findop('UAV_NL',op_spec,opt);

%% SET NONLINEAR SIMULATION TO TRIM CONDITION
% Pull initial state for trim solution and initialize the nonlinear model
% to that state.
TrimCondition.AttitudeIni    = op_point.States(1).x;
TrimCondition.RatesIni       = op_point.States(2).x;
TrimCondition.VelocitiesIni  = op_point.States(3).x;
TrimCondition.InertialIni    = op_point.States(4).x;
TrimCondition.EngineSpeedIni = op_point.States(5).x;
TrimCondition.AccelsIni = [op_report.Outputs(12).y;...
                            op_report.Outputs(13).y;...
                            op_report.Outputs(14).y];
TrimCondition.WindAxesIni = [op_report.Outputs(1).y;...
                              op_report.Outputs(3).y;...
                              op_report.Outputs(2).y];                        
                        
% Pull input values for trim solution and set input commands accordingly.
for i=1:length(op_spec.Inputs)
    inputname = strrep(op_spec.Inputs(i).Block,'UAV_NL/','');
    TrimCondition.Inputs.(inputname) = op_point.Inputs(i).u;
end

% Handle combined aileron input option
if isfield(target,'aileron')
    if target.aileron ~= 0 % if aileron is targted to a non-zero condition, use that value
        TrimCondition.Inputs.l_aileron = -TrimCondition.Inputs.aileron;
        TrimCondition.Inputs.r_aileron = TrimCondition.Inputs.aileron;
    end
else
    TrimCondition.Inputs.l_aileron = -TrimCondition.Inputs.aileron;
    TrimCondition.Inputs.r_aileron = TrimCondition.Inputs.aileron; 
end

% return as-trimmed target structure
TrimCondition.target = target;

%% SAVE TO .MAT FILE
OperatingPoint.op_point  = op_point;
OperatingPoint.op_report = op_report;
OperatingPoint.op_spec   = op_spec;

if savefile
    % Save variables to MAT file
    save(['../Libraries/' trimmatfile],'TrimCondition','OperatingPoint');
    % Output a message to the screen
    fprintf('\n Trim conditions saved as:\t %s.mat\n',trimmatfile);
end

%% Cleanup
if ~isLoaded
    bdclose UAV_NL % clear model from system memory if we had to load it
end