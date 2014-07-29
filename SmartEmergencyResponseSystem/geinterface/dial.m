classdef dial < hgsetget
    % Create dial-type user interface control.
    %
    % H = DIAL('PropertyName1',value1,'PropertyName2',value2,...) creates a
    % dial-type user interface control in the current figure window and
    % returns a handle to it. 
    %
    % Execute GET(H) to see a list of DIAL object properties and their
    % current values. Some of the more important properties are explained
    % below.
    %
    % Execute SET(H,'PropertyName1',value1,'PropertyName2',value2,...) to
    % set the specifed properties to new values.
    %
    % GET(H,'VALUE') returns the value of the dial.
    %
    % The mapping of dial orientation to output value is controlled by
    % three user-settable properties:
    %    (1) REFORIENTATION: an arbitrary, reference orientation of the
    %    dial (orientation expressed in radians counter-clockwise from
    %    positive x-axis); 
    %    (2) REFVAL: the dial value when its orientation is REFORIENTATION;
    %    (3) VALRANGEPERROTATION: The change in value for a full, clockwise
    %    rotation of the dial. If this value is small, it may take many
    %    revolutions of the dial to go from MIN to MAX, making fine
    %    adjustments possible.
    %
    % (Note that the ORIENTATION property is calculated from these three
    % properties; ORIENTATION can be obtained with GET(), but it is not
    % directly user-settable).
    %
    % Set the DRAWTICKS property to 0 to suppress drawing of tick marks and
    % labels. If DRAWTICKS is 1, the lengths of the TICKVALS property (a
    % vector) and of TICKSTRS (a cell array of strings) must be equal.
    %
    % The POINTERSTYLE property can be either 'line' or 'circle' (a
    % 'circle'-style pointer is more suitable when no ticks are drawn).
    %
    % Dial motion behaviour is controlled by four user-settable
    % properties: 
    %   (1) DOSNAP: Dial "snaps" to tick values.
    %   (2) MIN: Minimum dial value; dial comes to "hard stop".
    %   (3) MAX: Maximum dial value; dial comes to "hard stop".
    %   (4) DOWRAP: Instead of a "hard stop" at the Min and Max values, the
    %   dial "wraps around" from maximum value back to minimum value and
    %   vice versa.
    %
    % The CALLBACK property can be either a function handle or a string to
    % be evaluated by eval.m. The callback is executed when the dial is
    % moved with the mouse. If the doSnap property is set to 1, then the
    % callback is only evaluated after the dial movement is complete and
    % the dial pointer has "snapped" onto a tick value.
    %
    % Handles to existing dial objects can be found with the
    % "dial.find_dial" method (similar to Matlab's findobj.m).
    %
    % Note: dial makes use of object-oriented tools introduced in R2008a;
    % it will not work in earlier versions of Matlab.
    %   
    % Examples:
    %    Example 1:
    %       h = dial('refVal',1,...
    %              'refOrientation',5*pi/4,...
    %                'valRangePerRotation',5,...
    %                'tickVals',[1 2 3 4],...
    %                'tickStrs',{'one' 'two' 'three' 'four'},...
    %                 'Min',1,'Max',4,...
    %                'doSnap',1)
    %
    %    Example 2:
    %       h = dial('refVal',0,...
    %                'refOrientation',pi/2,...
    %                'valRangePerRotation',5,...
    %                'Value',0,...
    %                'Min',-10,'Max',10,...
    %                'pointerStyle','circle',...
    %                'drawTicks',0)
    %
    %    Other examples in dial_demo.m.
    %
    % SEE ALSO: dial_demo, dial.find_dial
    
    % Developed in Matlab 7.6.0.324 (R2008a) on GLNX86.
    % Kevin Bartlett (kpb@uvic.ca), 2008-06-20
    %----------------------------------------------------------------------
    
    % The order in which properties are defined is used to cause the dial
    % object's properties to be set in the correct sequence; don't move
    % them around unnecessarily.
    properties (Hidden,SetAccess = private,Constant = true)
        
        xlims = [-1 1];
        ylims = [-1 1];

        % Names of properties that can be viewed but not set by the user:
        unsettableProps = {'dialFaceHndl' 'titleHndl' ...
            'circlePointerHndl' 'linePointerHndl' 'Parent' ...
            'Type' 'tickHndls' 'tickLabelHndls' 'orientation'};        
        
    end
    
    properties (Hidden,SetAccess = private)
       
        zoomStatus = 'off';
        panStatus = 'off';
        prevPoint = [NaN NaN];

        % Default values of user-settable properties (will be populated by
        % constructor function):
        defaultUserProps = [];
        
        % List of user-settable properties (will be populated by
        % constructor function): 
        userPropNames = {};
        
    end
    
    properties (SetAccess = private)
        dialAxes = [];
        tickPlateAxes = [];
        panelAxes = [];
        mouseAxes = [];

        dialFaceHndl = [];
        panelHndl = [];
        circlePointerHndl = [];
        linePointerHndl = [];
        titleHndl = [];
        tickHndls = [];
        tickLabelHndls = [];
        Parent = [];
        Type = 'dial';
        orientation = [];        
    end 

    properties

        Tag = '';
        UserData = [];

        % Default CallBack is to display the dial's value.
        CallBack = 'disp(dialObj.Value)';

        % Position of parent axes and panel (normalised units):
        Position = [0.1 0.1 0.36 0.48];

        % Position of dial within panel. horizontalAlignment only has any
        % effect if dial panel is wider than it is tall; verticalAlignment
        % only if dial panel is taller than it is wide.
        horizontalAlignment = 'centre';
        verticalAlignment = 'centre';

        % Title string and position.
        titleStr = '';
        titlePos = 'bottom';

        % Dial radius. A value of 1 would fill the whole panel.
        dialRadius = 0.6;

        % Radius of tick marks. Should be slightly larger than dialRadius.
        tickRadius = 0.64;

        % Radius of invisible circle around which tick labels are arranged.
        % Should be slightly larger than dialRadius or slightly larger than
        % tickRadius if ticks are being drawn.
        tickLabelRadius = 0.67;

        % Should ticks be drawn? When setting the drawTicks property, "set"
        % makes use of the tick and ticklabel handles, so this property
        % must be defined after the other tick properties that create the
        % handles by calling the drawticks method.
        drawTicks = true;

        % Dial pointer style can be 'line' or 'circle' ('circle' is more
        % appropriate when there are no ticks for the pointer to point to).
        pointerStyle = 'line';
        
        % Length of line-style dial pointer is controlled by
        % linePtrStartRadius. Line-style pointer runs inward from outer
        % edge of dial face towards centre of dial. Line stops at a
        % distance from the centre of the dial given by linePtrStartRadius,
        % expressed as  a fraction of the radius of the dial (a
        % linePtrStartRadius of 1 would result in a pointer of zero
        % length).
        linePtrStartRadius = 0.4;
        
        % The size of the circle-style dial pointer is controlled by
        % circlePtrRadius. A value of 1 would result in a circle-style dial
        % pointer as big as the dial itself.
        circlePtrRadius = 0.16;
        
        % The placement of the circle-style dial pointer is specified using
        % the distance of the circle's centre from the dial centre. The
        % distance is expressed as a fraction of the dial radius (a value
        % of 1 would result in the dial pointer being centred on the outer
        % edge of the dial).
        circlePtrCentreRadius = 0.6;

        % valRangePerRotation gives the range of output data corresponding
        % to a single full turn of the dial. Positive denotes a positive
        % rotation sense when dial rotated clockwise. A small
        % valRangePerRotation means you will have to turn the dial a long
        % way (perhaps many turns) to get a given change in output value.
        valRangePerRotation = 12;

        % The reference value/dial-orientation pair controls the mapping of
        % dial orientation to output value.
        refVal = 0;
        refOrientation = 255*pi/180;

        % Does dial "wrap around" when it reaches the minimum or maximum
        % dial value (e.g., does it go from 360 degrees to 0 degrees and
        % vice versa?), or does it continue to increase/decrease?
        doWrap = false;

        % Minimum numeric value pointed to by dial (can be -Inf).
        Min = 0;

        % Maximum numeric value pointed to by dial (can be +Inf).
        Max = 11; % (Other bands' amplifiers only go up to 10)

        Value = 3;

        % Tick values and associated strings (can be empty).
        tickVals = 0:11;
        %tickStrs = cellstr(num2str(tickVals(:)));
        tickStrs = {'0' '1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11'};

        % Does dial "snap" to tick values?
        doSnap = false;

        % ...Was going to put in audible "click" when the dial snaps to a tick
        % value, but found that under unix, even the shortest sound played by
        % Matlab's sound.m program takes about 2 seconds to run. This is too
        % slow, and don't want to implement a Windows-only feature, so for now,
        % no audible clicks.
        %audibleSnap = false;
        %audibleSnapSource = 'click.wav';

    end % properties

    methods

        %------------------------------------------------------------------
        % Constructor: Create a dial object. Will avoid code duplication by
        % calling the "set" method for all user-settable properties wherever
        % possible so it won't be necessary to implement those properties
        % in the constructor.
        function dialObj = dial(varargin)
            
            % Assemble list of user-settable properties and their default
            % values before any changes are made.
            propList = properties(dialObj);
            userPropNames = setdiff(propList,dialObj.unsettableProps);
            dialObj.userPropNames = userPropNames;
            defaultUserProps = [];

            for iProp = 1:length(userPropNames)
                thisPropName = userPropNames{iProp};
                defaultUserProps.(thisPropName) = dialObj.(thisPropName);
            end % for

            dialObj.defaultUserProps = defaultUserProps;

            % Handle input arguments.
            
            % ...Input arguments should be property/value pairs, so there
            % should be an even number of input argument.
            if rem(nargin,2)~=0
                error([mfilename '.m--Input arguments to dial should be parameter/value pairs.']);
            end % if

            % ...Convert user-specified parameter/value pairs into
            % structured variable to avoid tedious indexing.
            inputStruct = [];

            for iArg = 1:2:length(varargin)
                
                thisArgName = varargin{iArg};
                
                % Convert possibly partial, possibly case-incorrect string
                % into a recognised property name.
                [thisPropName,status] = str2propname(dialObj,thisArgName);

                if status == 2
                    error(['Unrecognised property ''' thisArgName ''' for dial object.']);
                elseif status == 1
                    error(['Ambiguous line property: ''' thisArgName '''.'])
                end % if
                
                thisArgVal = varargin{iArg+1};
                inputStruct.(thisPropName) = thisArgVal;
                
            end % for
                        
            dialObj.Parent = gcf;
            
            % Set up zoom object for figure.
            zoomHndl = zoom(gcf);
            
            % ...Disallow zooming in all the dial's axes. a
            % ButtonDownFilter for the zoom object will cause a callback to
            % invoked instead of zooming when a dial is clicked.
            set(zoomHndl,'ButtonDownFilter',@dial.zoomfilter);

            % ...Do the same for panning.
            panHndl = pan(gcf);
            set(panHndl,'ButtonDownFilter',@dial.zoomfilter);

            % Create axes for drawing panel on which dial will sit.
            xlims = dialObj.xlims;
            ylims = dialObj.ylims;

            panelAxes = axes;
            set(panelAxes,'units','norm');            
            set(panelAxes,'position',dialObj.Position);
            set(panelAxes,'xlim',xlims,'ylim',ylims);
            set(panelAxes,'visible','off');
            dialObj.panelAxes = panelAxes;
            
            % Give the panel axes a tag identifying it as a part of a dial
            % object; this tag (unlike that of dialAxes) is not intended to
            % be changed by either the program or the user. Also put the
            % handle of dial object in the panel axes' appdata. This will
            % allow the find_dial function to find this dial object.
            set(panelAxes,'Tag','dialObjectPanelAxes');
            setappdata(panelAxes,'dialHandle',dialObj);

            % Create panel.
            panelColour = [0.6 0.6 0.6];
            panelEdgeColour = [1 1 1];
            panelCornersX = [xlims(1) xlims(2) xlims(2) xlims(1) xlims(1)];
            panelCornersY = [ylims(2) ylims(2) ylims(1) ylims(1) ylims(2)];
            panelHndl = patch(panelCornersX,panelCornersY,panelColour);
            set(panelHndl,'EdgeColor',panelEdgeColour);
            dialObj.panelHndl = panelHndl;

            dialObj.titleHndl = text(0,1,' ',...
                'HorizontalAlignment','center',...
                'VerticalAlignment','top');

            % Determine position of dial axes using default
            % horizontal/vertical alignment of dial within panel (if
            % non-default verticalAlignment or horizontalAlignment has been
            % specified, the change will occur below).
            dialAxPos = get_dial_ax_pos(dialObj);

            % Create axes for drawing dial "plate" (panel bearing ticks).
            tickPlateAxes = axes;
            set(tickPlateAxes,'visible','off');
            set(tickPlateAxes,'units','pixels');
            set(tickPlateAxes,'position',dialAxPos);
            set(tickPlateAxes,'units','norm');
            set(tickPlateAxes,'xlim',xlims,'ylim',ylims);
            dialObj.tickPlateAxes = tickPlateAxes;

            % Create axes for containing dial itself.
            %dialAxes = axes('Tag','dialAxes');
            dialAxes = axes;
            set(dialAxes,'visible','off');
            set(dialAxes,'units','pixels');
            set(dialAxes,'position',dialAxPos);
            set(dialAxes,'units','norm');
            set(dialAxes,'cameraViewAngleMode','manual');
            set(dialAxes,'xlim',xlims,'ylim',ylims);
            dialObj.dialAxes = dialAxes;

            % Create dial. Default colours, etc., can be over-ridden using
            % handle graphics outside this program.
            dialColour = [.5 .5 .5];
            pointerColour = [.7 .7 .7];

            t = linspace(0,2*pi,100);
            x = dialObj.dialRadius * cos(t);
            y = dialObj.dialRadius * sin(t);
            dialFaceHndl = patch(x,y,dialColour);
            dialObj.dialFaceHndl = dialFaceHndl;

            % Create the dial pointer. Both a "line"-style and a
            % "circle"-style pointer will be created, but one will be set
            % to be invisible, depending on the value of
            % dialObj.pointerStyle.
            dialObj.circlePointerHndl = patch(NaN,NaN,pointerColour);
            
            dialObj.linePointerHndl = line(NaN,NaN,...
                'color',pointerColour,...
                'lineWidth',4);

            % Create axes for accepting mouse input.
            %mouseAxes = axes('Tag','mouseAxes');
            mouseAxes = axes;
            set(mouseAxes,'visible','off');
            set(mouseAxes,'color','none');
            set(mouseAxes,'units','pixels');
            set(mouseAxes,'position',dialAxPos);
            set(mouseAxes,'xlim',xlims,'ylim',ylims);
            set(mouseAxes,'XLimMode','manual');
            set(mouseAxes,'YLimMode','manual');
            set(mouseAxes,'units','norm');
            dialObj.mouseAxes = mouseAxes;

            % Set the buttonDownFcn of all draggable components.
            draggableComponents = [dialObj.dialFaceHndl dialObj.circlePointerHndl dialObj.linePointerHndl];
            set(draggableComponents,'ButtonDownFcn',@(src,event)click_cb(dialObj,src,event));

            allDialAxes = [dialAxes tickPlateAxes panelAxes mouseAxes];
            setAllowAxesZoom(zoomHndl,allDialAxes,false);
                        
            % Set all the user-settable properties. Some of these
            % properties will have been specified by the user; others will
            % be the defaults.
            if isempty(inputStruct)
                inputArgNames = {};
            else
                inputArgNames = fieldnames(inputStruct);
            end % if            

            % ...Assemble structure of properties to pass to SET().
            setPropsStruct = [];

            for iProp = 1:length(userPropNames)

                thisPropName = userPropNames{iProp};

                % Over-ride default with user-specified value, if it
                % exists.
                if isfield(inputStruct,thisPropName)
                    setPropsStruct.(thisPropName) = inputStruct.(thisPropName);
                else
                    setPropsStruct.(thisPropName) = dialObj.(thisPropName);
                end % if

            end % for

            % ...Override some of the defaults, depending on what other
            % properties have been specified. This will make it more likely
            % that the user will see a sensible dial object.

            % ...If dial called with no input arguments, just stick with
            % defaults.
            if ~isempty(inputArgNames)

                if setPropsStruct.drawTicks == 1

                    if ~ismember('tickVals',inputArgNames) && ~ismember('tickStrs',inputArgNames)
                        % Neither tick values nor tick strings specified by
                        % user.
                        if isfinite(setPropsStruct.Min) && isfinite(setPropsStruct.Max)
                            numTicks = 12;
                            setPropsStruct.tickVals = linspace(setPropsStruct.Min,setPropsStruct.Max,numTicks);
                        else
                            possibleTickVals = [setPropsStruct.Min setPropsStruct.Max setPropsStruct.refVal 0];
                            findIndex = find(isfinite(possibleTickVals),1,'first');
                            setPropsStruct.tickVals = possibleTickVals(findIndex);
                        end % if

                        setPropsStruct.tickStrs = cellstr(num2str(setPropsStruct.tickVals(:)));

                    elseif ismember('tickVals',inputArgNames) && ~ismember('tickStrs',inputArgNames)
                        % Tick values specified, but not tick strings.
                        setPropsStruct.tickStrs = cellstr(num2str(setPropsStruct.tickVals(:)));

                    elseif ~ismember('tickVals',inputArgNames) && ismember('tickStrs',inputArgNames)
                        % Tick strings specified, but not tick values.
                        if isfinite(setPropsStruct.Min) && isfinite(setPropsStruct.Max)
                            numTicks = length(setPropsStruct.tickStrs);
                            setPropsStruct.tickVals = linspace(setPropsStruct.Min,setPropsStruct.Max,numTicks);
                        else
                            error('Please specify tick values to associate with the specified tick strings.');
                        end % if

                    end % if

                end % if                
                
                if ~ismember('refVal',inputArgNames)
                    if setPropsStruct.drawTicks == 1
                        setPropsStruct.refVal = min(setPropsStruct.tickVals);
                    else
                        possibleRefVals = [setPropsStruct.Min setPropsStruct.Max setPropsStruct.Value 0];
                        findIndex = find(isfinite(possibleRefVals),1,'first');
                        setPropsStruct.refVal = possibleRefVals(findIndex);
                    end % if
                end % if

                if ~ismember('Value',inputArgNames)
                    if setPropsStruct.drawTicks == 1
                        setPropsStruct.Value = min(setPropsStruct.tickVals);
                    else
                        possibleValues = [setPropsStruct.Min setPropsStruct.Max setPropsStruct.refVal 0];
                        findIndex = find(isfinite(possibleValues),1,'first');
                        setPropsStruct.Value = possibleValues(findIndex);
                    end % if
                end % if

                if ~ismember('valRangePerRotation',inputArgNames)
                    % If valRangePerRotation not specified by user, use
                    % some amount slightly larger than range from Min to
                    % Max.
                    setPropsStruct.valRangePerRotation = 1.1*(setPropsStruct.Max - setPropsStruct.Min);
                    
                    if setPropsStruct.drawTicks == 1
                        % Drawing ticks, so may be able to use number of
                        % ticks to choose a nicer rotation scale.
                        if length(setPropsStruct.tickVals) > 1
                            tickJump = median(diff(setPropsStruct.tickVals));
                            setPropsStruct.valRangePerRotation = 2*tickJump + (setPropsStruct.Max - setPropsStruct.Min);
                        end % if
                        
                    end % if 
                    
                end % if valRangePerRotation
                
            end % if
            
            % ...Will call "set" only once with a list of all user-settable
            % properties, rather than calling once for each property. This
            % will result in the drawticks method only being called once
            % rather than multiple times, preventing flickering of the
            % display and improving speed.
            
            % ...Assemble the list of properties.
            setArgs = {};

            for iProp = 1:length(userPropNames)
                thisPropName = userPropNames{iProp};
                setArgs{end+1} = thisPropName;
                setArgs{end+1} = setPropsStruct.(thisPropName);
            end % for
                        
            % ...Call "set" with the list of properties.
            set(dialObj,setArgs{:});
            
        end % dial Constructor

        %-------------------------------------------------------------------------
        % Callback for clicking on the draggable components of the dial.
        function click_cb(dialObj,src,event)

            % Disable any zoom until dial movement is done.
            zoomHndl = zoom(dialObj.Parent);
            
            if strcmp(get(zoomHndl,'Enable'),'on')
                dialObj.zoomStatus = 'on';
                set(zoomHndl,'Enable','off');
            else
                dialObj.zoomStatus = 'off';
            end % if

            % Do the same for panning.
            panHndl = pan(dialObj.Parent);
            
            if strcmp(get(panHndl,'Enable'),'on')
                dialObj.panStatus = 'on';
                set(panHndl,'Enable','off');
            else
                dialObj.panStatus = 'off';
            end % if
            
            set(dialObj.Parent,'WindowButtonMotionFcn','dial.drag_cb');
            set(dialObj.Parent,'WindowButtonUpFcn','dial.drag_end_cb');

            currPoint = get(dialObj.mouseAxes,'currentpoint');
            currPoint = [currPoint(1,1) currPoint(1,2)];
            currPoint = currPoint./(sqrt(currPoint(1)^2 + currPoint(2)^2)); % normalised
            dialObj.prevPoint = currPoint;

            % The dial object mimics a Matlab uicontrol object, but there
            % are some differences. dial has to rely on the figure window's
            % WindowButtonMotionFcn and WindowButtonUpFcn properties
            % (rather than properties of the dial object itself) to control
            % the dragging of the dial. As a result, any callback to the
            % dial will see the figure handle rather than the dial handle
            % when the gcbo function is called. As a workaround, create the
            % gcdo.m program. This will return the current dial object,
            % which is set in the following line:
            setappdata(0,'currentDialObject',dialObj);

        end % click_cb

                %-------------------------------------------------------------------------
        % Over-ride get method.
        function [varargout] = get(dialObj,varargin)

            % Allow "get(h)" syntax:
            if nargin == 1
                getdisp(dialObj);
                return;
            end % if

            % Allow "get(h,propertyName)" syntax.
            if nargin > 2
                error('Too many input arguments.');
            end % if

            if length(dialObj) ~= 1
                error('Vector of handles not permitted for get(dialHndls,''propertyName'')');
            end % if

            argName = varargin{1};

            % Convert possibly partial, possibly case-incorrect string
            % into a recognised property name.
            [thisPropName,status] = str2propname(dialObj,argName);

            if status == 2
                error(['Unrecognised property ''' argName ''' for dial object.']);
            elseif status == 1
                error(['Ambiguous line property: ''' argName '''.'])
            end % if

            varargout{1} = dialObj.(thisPropName);

        end % get fcn

        %-------------------------------------------------------------------------
        % Over-ride set method.
        function set(hndls,varargin)
            
            if nargin == 1
                % Allow "set(h)" syntax:
                setdisp(hndls);
                return;
            elseif nargin == 2
                
                % Allow "set(h,PropertyName)" syntax:
                if length(hndls) ~= 1
                    error('Handle must be a scalar when using set to retrieve information');
                end % if
                
                h = hndls(1);
                propName = varargin{1};
                [goodPropName,status] = str2propname(h,propName);

                if status == 2
                    error(['Unrecognised property ''' propName ''' for dial object.']);
                elseif status == 1
                    error(['Ambiguous line property: ''' propName '''.'])
                else
                    propName = goodPropName;

                    [allowableVals,defaultVal] = dial.get_allowable_vals(propName);

                    if isempty(allowableVals)
                        disp(['A dial object''s "' propName '" property does not have a fixed set of property values.']);
                    elseif allowableVals{1} == Inf
                        disp(['A dial object''s "' propName '" property does not have a fixed set of property values.']);
                    else
                        dial.disp_property_values(propName);
                    end % if
                                         
                end % if

                return;

            else

                % Allow "set(h,prop1,val1,prop2,val2,...)" syntax (odd number of
                % input arguments).
                if rem(nargin,2)~=1
                    error('dial "set" must be called with syntax "set(h,prop1,val1,prop2,val2,...)".');
                end % if

            end % if

            % Convert parameter/value pairs into structured variable to
            % avoid tedious indexing. Test that parameter names match a
            % dial property before adding to structured variable.
            inputStruct = [];

            for iArg = 1:2:length(varargin)

                thisArgName = varargin{iArg};

                % Convert possibly partial, possibly case-incorrect string
                % into a recognised property name.
                [thisPropName,status] = str2propname(hndls(1),thisArgName);
                
                if status == 2
                    warning(['Unrecognised property ''' thisArgName ''' for dial object. Ignoring.']);
                elseif status == 1
                    warning(['Ambiguous line property: ''' thisArgName '''. Ignoring.'])
                else
                    thisArgVal = varargin{iArg+1};
                    inputStruct.(thisPropName) = thisArgVal;
                end % if

            end % for

            inputPropList = fieldnames(inputStruct);            
            
            % Remove properties from the input list if they do not pass an
            % initial test for correct variable type.
            removeProps = {};
            
            for iProp = 1:length(inputPropList)
                
                thisPropName = inputPropList{iProp};
                thisProp = inputStruct.(thisPropName);                
                isGoodPropType = dial.test_prop_type(thisPropName,thisProp);     
                
                if isGoodPropType == false                    
                    removeProps{end+1} = thisPropName;
                    inputStruct = rmfield(inputStruct,thisPropName);
                    warning(['Dial object property ''' thisPropName ''' is of wrong data type. Ignoring.']);
                end % if
                
            end % for

            inputPropList = setdiff(inputPropList,removeProps);

            % Sort the specified parameters to the same order as they were
            % defined in the "properties" section. This will ensure they
            % are set in the right order (don't want to set Value to
            % something outside [dialMin dialMax] interval, for example, so
            % want to set Value after any change to dialMin or dialMax).
            sortTemplate = properties('dial');            
            inputPropList = sortTemplate(ismember(sortTemplate,inputPropList));
            
            % "Setting" a parameter has two steps: first, the named field
            % of the dialObj structured variable is changed to reflect the
            % new value. Second, where necessary, the effects of the change
            % are "flushed through" to the graphics objects of which the
            % dial object is composed. For example, changing the 'Tag'
            % property is simply a matter of changing the contents of the
            % dialObj.Tag field. Changing the 'Position' property, on the
            % other hand, requires changing the dialObj.Position field and
            % also actually changing the positions of the mouseAxes,
            % panelAxes, tickPlateAxes and dialAxes axes objects.

            % ...Step one: change the fields of the object's structured
            % variable. Test for good values before each change.
            for iHndl = 1:length(hndls)

                for iProp = 1:length(inputPropList)

                    thisPropName = inputPropList{iProp};
                    thisProp = inputStruct.(thisPropName);

                    % Boolean isGoodProp says whether property is good or
                    % not. The Boolean isInvalidValue says whether generic
                    % "invalid value" warning message should be used
                    % (alternative is a custom warnStr for the bad
                    % property)
                    isGoodProp = true;
                    isInvalidValue = false;
                    
                    if ismember(lower(thisPropName),lower(dial.unsettableProps))
                        error(['The dial object property ''' thisPropName ''' is not user-settable.']);

                    elseif strcmpi(thisPropName,'position')

                        isGoodProp = length(thisProp)==4;

                        if ~isGoodProp
                           isInvalidValue = true;
                        end % if

                    elseif strcmpi(thisPropName,'CallBack')
                        
                        isGoodProp = ischar(thisProp) || ...
                            isa(thisProp,'function_handle');
                        
                        if ~isGoodProp
                           isInvalidValue = true;
                        end % if                        

                    elseif strcmpi(thisPropName,'tickVals')

                            % Test to see that length of tickVals matches length of
                            % tickStrs.
                            if isfield(inputStruct,'tickStrs')
                                numTicks = length(inputStruct.tickStrs);
                            else
                                numTicks = length(hndls(iHndl).tickStrs);
                            end % if

                            if numTicks ~= length(thisProp)
                                isGoodProp = false;
                            end % if

                            if isGoodProp == false
                                warnStr = ['Failed to set ''' thisPropName ''' property: Length of tickVals must match length of tickStrs.'];
                            end % if
                                                
                    elseif strcmpi(thisPropName,'tickStrs')
                        
                            % Test to see that length of tickStrs matches
                            % length of tickVals.
                            if isfield(inputStruct,'tickVals')
                                numTicks = length(inputStruct.tickVals);
                            else
                                numTicks = length(hndls(iHndl).tickVals);
                            end % if

                            if numTicks ~= length(thisProp)
                                isGoodProp = false;
                                warnStr = ['Failed to set ''' thisPropName ''' property: Length of tickVals must match length of tickStrs.'];
                            end % if

                    elseif strcmpi(thisPropName,'Value')
                        
                            % Test to see that Value lies between minimum
                            % and maximum values.
                            isGoodProp = test_val_minmax(hndls(iHndl),inputStruct);
                            
                            if isGoodProp == false
                                warnStr = ['Failed to set ''' thisPropName ''' property: Value must lie between Min and Max.'];
                            end % if

                    elseif strcmpi(thisPropName,'horizontalAlignment')

                        if strmatch(lower(thisProp),'left')
                            thisProp = 'left';
                        elseif strmatch(lower(thisProp),'right')
                            thisProp = 'right';
                        elseif strmatch(lower(thisProp),'centre')
                            thisProp = 'centre';
                            % Be nice to Americans:
                        elseif strmatch(lower(thisProp),'center')
                            thisProp = 'centre';
                        else
                            isGoodProp = false;
                        end % if

                        if isGoodProp == false                            
                            warnStr = '''horizontalAlignment'' property must be ''left'', ''right'' or ''centre''.';
                        end % if

                    elseif strcmpi(thisPropName,'verticalAlignment')

                        if strmatch(lower(thisProp),'bottom')
                            thisProp = 'bottom';
                        elseif strmatch(lower(thisProp),'top')
                            thisProp = 'top';
                        elseif strmatch(lower(thisProp),'centre')
                            thisProp = 'centre';
                            % Be nice to Americans:
                        elseif strmatch(lower(thisProp),'center')
                            thisProp = 'centre';
                        else
                            isGoodProp = false;
                        end % if

                        if isGoodProp == false
                            warnStr = '''verticalAlignment'' property must be ''top'', ''bottom'' or ''centre''.';
                        end % if

                    elseif strcmpi(thisPropName,'titlePos')

                        if strmatch(lower(thisProp),'bottom')
                            thisProp = 'bottom';
                        elseif strmatch(lower(thisProp),'top')
                            thisProp = 'top';
                        else
                            isGoodProp = false;
                        end % if

                        if isGoodProp == false
                            warnStr = '''titlePos'' property must be ''top'' or ''bottom''.';
                        end % if

                    elseif strcmpi(thisPropName,'pointerStyle')
                        
                        if strmatch(lower(thisProp),'line')
                            thisProp = 'line';
                        elseif strmatch(lower(thisProp),'circle')
                            thisProp = 'circle';
                        else
                            isGoodProp = false;
                        end % if

                        if isGoodProp == false
                            warnStr = '''pointerStyle'' property must be ''line'' or ''circle''.';
                        end % if

                    elseif strcmpi(thisPropName,'Min')

                        if isfield(inputStruct,'Max')
                            maxDialVal = inputStruct.Max;
                        else
                            maxDialVal = hndls(iHndl).Max;
                        end % if
                        
                        if thisProp >= maxDialVal
                            isGoodProp = false;
                            warnStr = ['Failed to set ''' thisPropName ''' property: Min must be less than Max.'];
                        else
                            % Test to see that Value lies between minimum and
                            % maximum values.
                            isGoodProp = test_val_minmax(hndls(iHndl),inputStruct);

                            if isGoodProp == false
                                warnStr = ['Failed to set ''' thisPropName ''' property: Value must lie between Min and Max.'];
                            end % if

                        end % if

                    elseif strcmpi(thisPropName,'Max')

                        if isfield(inputStruct,'Min')
                            minDialVal = inputStruct.Min;
                        else
                            minDialVal = hndls(iHndl).Min;
                        end % if
                        
                        if thisProp <= minDialVal
                            isGoodProp = false;
                            warnStr = ['Failed to set ''' thisPropName ''' property: Min must be less than Max.'];
                        else
                            % Test to see that Value lies between minimum and
                            % maximum values.
                            isGoodProp = test_val_minmax(hndls(iHndl),inputStruct);

                            if isGoodProp == false
                                warnStr = ['Failed to set ''' thisPropName ''' property: Value must lie between Min and Max.'];
                            end % if

                        end % if
                        
                    elseif strcmpi(thisPropName,'linePtrStartRadius')
                        isGoodProp = thisProp >= 0;

                        if ~isGoodProp
                            isInvalidValue = true;
                        end % if

                    elseif strcmpi(thisPropName,'circlePtrRadius')

                        isGoodProp = thisProp >= 0;

                        if ~isGoodProp
                            isInvalidValue = true;
                        end % if

                    elseif strcmpi(thisPropName,'circlePtrCentreRadius')
                        isGoodProp = thisProp >= 0;

                        if ~isGoodProp
                            isInvalidValue = true;
                        end % if

                    elseif strcmpi(thisPropName,'valRangePerRotation')
                        % Some test here?
                    elseif strcmpi(thisPropName,'refVal')
                        % Some test here?
                    elseif strcmpi(thisPropName,'refOrientation')
                        % Some test here?
                    elseif strcmpi(thisPropName,'dialRadius')
                        % Some test here?
                    elseif strcmpi(thisPropName,'tickRadius')
                        % Some test here?
                    elseif strcmpi(thisPropName,'tickLabelRadius')
                        % Some test here?                                                
                    end % if
            
                    % Set the field of the dial object if the value passed is
                    % good.
                    if isGoodProp == true
                        hndls(iHndl).(thisPropName) = thisProp;
                    elseif isInvalidValue == true
                        % Issue generic "invalid value" warning.
                        warning(['Failed to set ''' thisPropName ''' property: Invalid value.']);                            
                    else
                        % Issue custom warning for this property.
                        warning(warnStr);
                    end % if

                end % for iProp

            end % for iHndl

            % ...Step two: flush any changes through the graphics objects
            % of which the dial object is composed.

            for iHndl = 1:length(hndls)

                % Only want to call drawticks and set_orientation methods
                % once per dial. 
                drawTicksCalled = false;
                setOrientationCalled = false;

                thisHndl = hndls(iHndl);

                for iProp = 1:length(inputPropList)

                    thisPropName = inputPropList{iProp};
                    thisProp = thisHndl.(thisPropName);

                    if strcmpi(thisPropName,'position')

                        set(thisHndl.panelAxes,'position',thisProp);
                        dialAxPos = get_dial_ax_pos(thisHndl);

                        set(thisHndl.mouseAxes,'units','pixels');
                        set(thisHndl.mouseAxes,'position',dialAxPos);
                        set(thisHndl.mouseAxes,'units','norm');

                        set(thisHndl.dialAxes,'units','pixels');
                        set(thisHndl.dialAxes,'position',dialAxPos);
                        set(thisHndl.dialAxes,'units','norm');

                        set(thisHndl.tickPlateAxes,'units','pixels');
                        set(thisHndl.tickPlateAxes,'position',dialAxPos);
                        set(thisHndl.tickPlateAxes,'units','norm');

                    elseif strcmpi(thisPropName,'tickVals')
                        
                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'tickStrs')
                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'Tag')

                        % Set the tag property of the dial axes to this
                        % string as well and give the dial object handle to
                        % the axes' appdata. This will allow the find_dial
                        % function to find the dial.
                        set(thisHndl.dialAxes,'Tag',thisProp);
                        setappdata(thisHndl.dialAxes,'dialHandle',thisHndl);
                        
                    elseif strcmpi(thisPropName,'Value')
                        
                        if setOrientationCalled == false
                            set_orientation(thisHndl);
                            setOrientationCalled = true;
                        end % if
                        
                    elseif ismember(thisPropName,{'horizontalAlignment' 'verticalAlignment'})
                        
                        % Changing vertical or horizontal alignment of dial
                        % within panel. Panel does not change position, but
                        % other axes do.
                        dialAxPos = get_dial_ax_pos(thisHndl);

                        set(thisHndl.mouseAxes,'units','pixels');
                        set(thisHndl.mouseAxes,'position',dialAxPos);
                        set(thisHndl.mouseAxes,'units','norm');

                        set(thisHndl.dialAxes,'units','pixels');
                        set(thisHndl.dialAxes,'position',dialAxPos);
                        set(thisHndl.dialAxes,'units','norm');

                        set(thisHndl.tickPlateAxes,'units','pixels');
                        set(thisHndl.tickPlateAxes,'position',dialAxPos);
                        set(thisHndl.tickPlateAxes,'units','norm');
                        
                    elseif strcmpi(thisPropName,'titleStr') | strcmpi(thisPropName,'titlePos')

                        % Title string and alignment interact, so will set both
                        % here.
                        if strcmpi(thisHndl.titlePos,'bottom')
                            titleValign = 'bottom';
                            titleY = -1;
                            titleStr = thisHndl.titleStr;
                        else

                            % Titles at top look crammed up against edge of panel. Add a newline
                            % before the actual title string to fix this problem.
                            titleValign = 'top';
                            titleY = 1;
                            titleStr = sprintf('\n%s',thisHndl.titleStr);
                        end % if                        
                        
                        set(thisHndl.titleHndl,...
                            'string',titleStr,...
                            'position',[0 titleY 0],...
                            'VerticalAlignment',titleValign);

                    elseif strcmpi(thisPropName,'dialRadius')

                        t = linspace(0,2*pi,100);
                        x = thisHndl.dialRadius * cos(t);
                        y = thisHndl.dialRadius * sin(t);
                        set(thisHndl.dialFaceHndl,'xdata',x,'ydata',y);
                        
                        % Need to redraw pointer to match new dial radius.
                        draw_circle_pointer(thisHndl);
                        draw_line_pointer(thisHndl);

                    elseif strcmpi(thisPropName,'tickRadius')

                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'drawTicks')

                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                        if thisProp == true
                            set([thisHndl.tickHndls,thisHndl.tickLabelHndls],'visible','on');
                        else
                            set([thisHndl.tickHndls,thisHndl.tickLabelHndls],'visible','off');
                        end % if

                    elseif strcmpi(thisPropName,'tickLabelRadius')

                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if
                        
                    elseif strcmpi(thisPropName,'pointerStyle')

                        if strcmpi(thisHndl.pointerStyle,'circle')
                            set(thisHndl.circlePointerHndl,'visible','on');
                            set(thisHndl.linePointerHndl,'visible','off');
                        else
                            set(thisHndl.circlePointerHndl,'visible','off');
                            set(thisHndl.linePointerHndl,'visible','on');
                        end % if

                    elseif strcmpi(thisPropName,'valRangePerRotation')

                        if setOrientationCalled == false
                            set_orientation(thisHndl);
                            setOrientationCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'refVal')

                        if setOrientationCalled == false
                            set_orientation(thisHndl);
                            setOrientationCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'refOrientation')

                        if setOrientationCalled == false
                            set_orientation(thisHndl);
                            setOrientationCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'Min')

                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'Max')

                        if drawTicksCalled == false && thisHndl.drawTicks == true
                            drawticks(thisHndl);
                            drawTicksCalled = true;
                        end % if

                    elseif strcmpi(thisPropName,'doWrap')
                        % No action required.

                    elseif strcmpi(thisPropName,'doSnap')
                        % No action required.

                    elseif strcmpi(thisPropName,'linePtrStartRadius')
                        draw_line_pointer(thisHndl);
                    elseif strcmpi(thisPropName,'circlePtrRadius')
                        draw_circle_pointer(thisHndl);
                    elseif strcmpi(thisPropName,'circlePtrCentreRadius')
                        draw_circle_pointer(thisHndl);                        
                    end % if

                end % for

            end % for
            
        end % set fcn

        %-------------------------------------------------------------------------
        % Method for drawing line-style pointer.
        function draw_line_pointer(dialObj)
            
            % Line runs inwards from outer edge of dial to a distance from
            % the centre of the dial given by linePtrStartRadius.
            % linePtrStartRadius is given as a fraction of the radius of
            % the dial (a linePtrStartRadius of 1 would result in a pointer
            % of zero length).
            x = [dialObj.linePtrStartRadius*dialObj.dialRadius dialObj.dialRadius];
            y = [0 0];
            
            set(dialObj.linePointerHndl,'xdata',x,'ydata',y);            

        end % draw_line_pointer function

        %-------------------------------------------------------------------------
        % Method for drawing circle-style pointer.
        function draw_circle_pointer(dialObj)            
            ptrPosRadius = dialObj.circlePtrCentreRadius * dialObj.dialRadius;
            ptrPos = [ptrPosRadius*cos(0) ptrPosRadius*sin(0)];
            t = linspace(0,2*pi,100);
            x = ptrPos(1) + dialObj.circlePtrRadius * cos(t);
            y = ptrPos(2) + dialObj.circlePtrRadius * sin(t);
            set(dialObj.circlePointerHndl,'xdata',x,'ydata',y);            
        end % draw_circle_pointer function        
        
        %-------------------------------------------------------------------------
        % Over-ride delete method.
        function delete(obj)

            if ishandle(obj.dialAxes)
                delete(obj.dialAxes);
            end % if

            if ishandle(obj.tickPlateAxes)
                delete(obj.tickPlateAxes);
            end % if

            if ishandle(obj.panelAxes)
                delete(obj.panelAxes);
            end % if

            if ishandle(obj.mouseAxes)
                delete(obj.mouseAxes);
            end % if

        end % fcn

        %-------------------------------------------------------------------------
        % Over-ride setdisp method.
        function setdisp(obj)
 
            propList = properties('dial');
            
            for iProp = 1:length(propList)                
                thisPropName = propList{iProp};
                dial.disp_property_values(thisPropName);                
            end % for
                        
        end % fcn

        %-------------------------------------------------------------------------
        % Method to set orientation of dial.
        function [] = set_orientation(dialObj)

            % Rotate the camera view to put dial at correct value.
            refVal = dialObj.refVal;
            refOrientation = dialObj.refOrientation;
            valRangePerRotation = dialObj.valRangePerRotation;
            dialValue = dialObj.Value;
            dialOrientation = dialObj.val2orientation(refVal,refOrientation,valRangePerRotation,dialValue);
            dialObj.orientation = dialOrientation;
            cameraUpVectorOrientation = pi/2 - dialOrientation;
            set(dialObj.dialAxes,'CameraUpVector',[cos(cameraUpVectorOrientation) sin(cameraUpVectorOrientation) 0]);

        end % set_orientation fcn
        
        %-------------------------------------------------------------------------
        % Method to draw ticks and their labels.
        %function [tickHndls,tickLabelHndls] = drawticks(dialObj)
        function [] = drawticks(dialObj)

            if length(dialObj.tickStrs) ~= length(dialObj.tickVals)
                error('tickStrs and tickVals properties must have same length.');
            end % if

            numTicks = length(dialObj.tickVals);
            axes(dialObj.tickPlateAxes);

            % Delete existing ticks and labels.
            delete(dialObj.tickHndls);
            delete(dialObj.tickLabelHndls);

            % Put ticks on plate.
            tickVals = dialObj.tickVals;
            tickStrs = dialObj.tickStrs;
            refVal = dialObj.refVal;
            refOrientation = dialObj.refOrientation;
            valRangePerRotation = dialObj.valRangePerRotation;

            tickLabelHndls = NaN * ones(numTicks,1);
            tickHndls = NaN * ones(numTicks,1);

            for iTick = 1:numTicks

                tickOrientation = dialObj.val2orientation(refVal,refOrientation,valRangePerRotation,tickVals(iTick));
                tickLabelX = dialObj.tickLabelRadius * cos(tickOrientation);
                tickLabelY = dialObj.tickLabelRadius * sin(tickOrientation);
                tickX = dialObj.tickRadius * cos(tickOrientation);
                tickY = dialObj.tickRadius * sin(tickOrientation);

                % Create ticks.
                tickHndls(iTick) = line([0 tickX],[0 tickY],'color','k');

                % Create tick labels.

                % Adjust horizontal and vertical alignment of tick text depending on
                % where each tick is on the circle.

                % Express tick orienation as positive angle.
                if tickOrientation < 0
                    tickOrientation = (2*pi + tickOrientation);
                end % if

                % First set horizontal and vertical alignment by simply determining
                % which quadrant the tick is in.
                if tickOrientation >= 0 & tickOrientation <= pi
                    tickValign = 'bottom';
                else
                    tickValign = 'top';
                end % if

                if tickOrientation >= pi/2 & tickOrientation <= 3*pi/2
                    tickHalign = 'right';
                else
                    tickHalign = 'left';
                end % if

                % Now override the quadrant-based horizontal and vertical
                % alignment if the tick is close enough to the edge of a
                % quadrant. If tick is within 15 degrees of 0, pi/2, pi or
                % 3*pi/2, then will use 'center'/'middle' alignment rather
                % than 'top'/'bottom' or 'left'/'right' alignment.
                tickOrientationTolerance = 15*pi/180; % radians

                if any(abs(tickOrientation - [0 pi 2*pi]) < tickOrientationTolerance)
                    tickValign = 'middle';
                end % if

                if any(abs(tickOrientation - [pi/2 3*pi/2]) < tickOrientationTolerance)
                    tickHalign = 'center';
                end % if

                tickLabelHndls(iTick) = text(tickLabelX,tickLabelY,tickStrs{iTick},...
                    'HorizontalAlignment',tickHalign,...
                    'VerticalAlignment',tickValign);

            end % for

            dialObj.tickHndls = tickHndls;
            dialObj.tickLabelHndls = tickLabelHndls;

            % Restack axes to put tick panel below dial.
            axes(dialObj.panelAxes);
            axes(dialObj.tickPlateAxes);
            axes(dialObj.dialAxes);
            axes(dialObj.mouseAxes);

        end % fcn

        %-------------------------------------------------------------------------
        % Method to determine position of dial, plate and mouse axes.
        % Position returned in units of pixels.
        function dialAxPos = get_dial_ax_pos(dialObj)

            % ...Size of panel determines size of dial axes.
            set(dialObj.panelAxes,'units','pixels');
            panelPosPixels = get(dialObj.panelAxes,'position');
            set(dialObj.panelAxes,'units','norm');

            dialAxSize = min(panelPosPixels(3),panelPosPixels(4));
            dialAxPos = [NaN NaN NaN NaN];

            % ...Dial axes are square.
            dialAxPos(3) = dialAxSize;
            dialAxPos(4) = dialAxSize;

            if panelPosPixels(3) == panelPosPixels(4)
                % The panel is square. Put the dial in the centre.
                dialAxPos(1) = panelPosPixels(1);
                dialAxPos(2) = panelPosPixels(2);

            elseif panelPosPixels(3) > panelPosPixels(4)
                % The panel is wider than it is tall. The dial can be placed on the
                % left, the right or the centre of the panel.
                dialAxPos(2) = panelPosPixels(2);

                if strcmp(dialObj.horizontalAlignment,'centre')
                    dialAxPos(1) = (panelPosPixels(1)+panelPosPixels(3)/2) - dialAxSize/2;
                elseif strncmpi(dialObj.horizontalAlignment,'r',1)
                    dialAxPos(1) = (panelPosPixels(1)+panelPosPixels(3)) - dialAxSize;
                elseif strncmpi(dialObj.horizontalAlignment,'l',1)
                    dialAxPos(1) = panelPosPixels(1);
                else
                    dialAxPos(1) = (panelPosPixels(1)+panelPosPixels(3)/2) - dialAxSize/2;
                    dialObj.horizontalAlignment = 'centre';
                    warning('Invalid horizontal alignment string; using ''centre''.');
                end % if

            else
                % The panel is taller than it is wide. The dial can be placed on the
                % top, the bottom or the centre of the panel.
                dialAxPos(1) = panelPosPixels(1);

                if strncmpi(dialObj.verticalAlignment,'c',1)
                    dialAxPos(2) = (panelPosPixels(2)+panelPosPixels(4)/2) - dialAxSize/2;
                elseif strncmpi(dialObj.verticalAlignment,'t',1)
                    dialAxPos(2) = (panelPosPixels(2)+panelPosPixels(4)) - dialAxSize;
                elseif strncmpi(dialObj.verticalAlignment,'b',1)
                    dialAxPos(2) = panelPosPixels(2);
                else
                    dialAxPos(2) = (panelPosPixels(2)+panelPosPixels(4)/2) - dialAxSize/2;
                    dialObj.verticalAlignment = 'centre';
                    warning(['Invalid vertical alignment string; using ''centre''.']);
                end % if

            end % if

        end % get_dial_ax_pos function
              
        %-------------------------------------------------------------------------
        % Method to test for good combination of properties 'Value',
        % 'Min' and 'Max'.
        function isGoodProp = test_val_minmax(dialObj,inputStruct)
            
            if isfield(inputStruct,'Value')
                Value = inputStruct.Value;
            else
                Value = dialObj.Value;
            end % if

            if isfield(inputStruct,'Min')
                minDialVal = inputStruct.Min;
            else
                minDialVal = dialObj.Min;
            end % if

            if isfield(inputStruct,'Max')
                maxDialVal = inputStruct.Max;
            else
                maxDialVal = dialObj.Max;
            end % if

            isGoodProp = true;
            
            if Value < minDialVal
                isGoodProp = false;
            end % if

            if Value > maxDialVal
                isGoodProp = false;
            end % if

        end % test_val_minmax function
                        
        %-------------------------------------------------------------------------
        % Method to convert a possibly partial, possibly case-incorrect
        % string into a valid property name. 
        %
        % Returns the valid property name (empty string if not found) and a
        % status variable that is:
        %   0: match found;
        %   1: more than one match found (ambiguous partial string);
        %   2: no match found
        function [propName,status] = str2propname(dialObj,str)
                        
            %matchIndex = strmatch(lower(str),lower(dialObj.userPropNames));
            propNames = properties(dialObj);
            matchIndex = strmatch(lower(str),lower(propNames));

            if isempty(matchIndex)
                propName = '';
                status = 2;
            elseif length(matchIndex) > 1
                propName = '';
                status = 1;
            else
                % Now have case-correct property name:
                %propName = dialObj.userPropNames{matchIndex};
                propName = propNames{matchIndex};                
                status = 0;
            end % if
            
        end % str2propname function
        
    end % methods

    methods (Static = true)
        % Static methods don't take the object as an input argument.
        % Callbacks for dragging the dial and for ending dragging are in
        % here because they are actually callbacks for figure window
        % events, rather than for dial objects.

        %-------------------------------------------------------------------------
        % Callback for dragging the dial.
        function drag_cb()

            dialObj = getappdata(0,'currentDialObject');

            postMovePoint = get(dialObj.mouseAxes,'currentpoint');
            postMovePoint = [postMovePoint(1,1) postMovePoint(1,2)];
            
            if ~all(postMovePoint==0)
                postMovePoint = postMovePoint./(sqrt(postMovePoint(1)^2 + postMovePoint(2)^2)); % normalised
            end % if
            
            postMoveAngle = atan2(postMovePoint(2),postMovePoint(1));

            % Express current orienation as positive angle.
            if postMoveAngle < 0
                postMoveAngle = (2*pi + postMoveAngle);
            end % if

            % Find the value of the dial after the requested movement. This is more
            % complicated than it sounds, since there may be more than one dial
            % rotation between the minimum and maximum dial values (i.e., there is
            % not necessarily a one-to-one mapping between dial orientation and
            % dial value).
            preMoveValue = dialObj.Value;
            prevPoint = dialObj.prevPoint;
            preMoveAngle = atan2(prevPoint(2),prevPoint(1));

            % Express previous orienation as positive angle.
            if preMoveAngle < 0
                preMoveAngle = (2*pi + preMoveAngle);
            end % if

            angleDiff = postMoveAngle - preMoveAngle;

            % Detect zero crossings.
            if angleDiff < -pi
                angleDiff = angleDiff + 2*pi;
            elseif angleDiff > pi
                angleDiff = angleDiff - 2*pi;
            end % if

            valDiff = -dialObj.valRangePerRotation * angleDiff/(2*pi);
            postMoveValue = preMoveValue + valDiff;

            % If the post-movement value, resulting from the mouse drag, is
            % less than the minimum allowed value, then need to modify it.
            % This may mean pegging the value to the minimum allowed value,
            % so the dial appears to come up against a hard stop.
            % Alternatively, if "wrapping" behaviour has been chosen, then
            % the dial will be free to continue to rotate, but its value
            % will "wrap around" to its maximum value. Similarly if the
            % post-movement value is greater than the maximum allowed
            % value.
            minDialVal = dialObj.Min;
            maxDialVal = dialObj.Max;

            if postMoveValue <= minDialVal

                if dialObj.doWrap == false
                    postMoveValue = minDialVal;
                else
                    overShotBy = minDialVal - postMoveValue;
                    postMoveValue = maxDialVal - overShotBy;
                end % if

            elseif postMoveValue >= maxDialVal

                if dialObj.doWrap == false
                    postMoveValue = maxDialVal;
                else
                    overShotBy = postMoveValue - maxDialVal;
                    postMoveValue = minDialVal + overShotBy;
                end % if

            end % if

            % Calculate the post-move dial orientation from the new (possibly
            % modified) post-move value.
            %dialOrientation = dialObj.val2orientation(dialObj.refVal,dialObj.refOrientation,dialObj.valRangePerRotation,postMoveValue);

            % Rotate the dial axes to the new orientation.
            %cameraUpVectorOrientation = pi/2 - dialOrientation;
            %set(dialObj.dialAxes,'CameraUpVector',[cos(cameraUpVectorOrientation) sin(cameraUpVectorOrientation) 0]);
            
            % Move the dial to the new (possibly modified) post-move value.
            dialObj.Value = postMoveValue;
            set_orientation(dialObj);

            prevPoint = postMovePoint;
            dialObj.prevPoint = prevPoint;

            % Perform the specified callback for a dial move. If "snapping"
            % behaviour has been specified, hold off on performing the
            % action until the dial move is complete.
            if dialObj.doSnap == false

                callBack = dialObj.CallBack;
                
                if ~isempty(callBack)
                    if ischar(callBack)
                        eval(callBack);
                    elseif isa(callBack,'function_handle')
                       feval(callBack);
                    else
                        error([mfilename '.m--Callback must be either a string or function handle.']);
                    end
                end % if

            end % if

        end % drag_cb

        %-------------------------------------------------------------------------
        % Callback for ending the dragging the dial.
        function drag_end_cb()

            dialObj = dial.gcdo;

            set(dialObj.Parent,'WindowButtonUpFcn','');
            set(dialObj.Parent,'WindowButtonMotionFcn','');

            % If "snapping" behaviour has been specified, the post-move
            % value can only be one of the tick values. Find the closest
            % tick value to snap to.
            if dialObj.doSnap == true

                if ~isempty(dialObj.tickVals)

                    [dummy,minIndex] = min(abs(dialObj.Value - dialObj.tickVals));
                    postMoveValue = dialObj.tickVals(minIndex);

                    dialObj.Value = postMoveValue;
                    set_orientation(dialObj);

                end % if non-empty tick values                
                
                callBack = dialObj.CallBack;
                
                if ~isempty(callBack)
                    if ischar(callBack)
                        eval(callBack);
                    elseif isa(callBack,'function_handle')
                       feval(callBack);
                    else
                        error([mfilename '.m--Callback must be either a string or function handle.']);
                    end
                end % if

            end % if snapping

            % Unset the current dial object (must be done after last call
            % to callback function).
            setappdata(0,'currentDialObject',[]);

            % Re-enable zooming if it was on at start of dial movement.
            if strcmp(dialObj.zoomStatus,'on');
                zoomHndl = zoom(dialObj.Parent);            
                set(zoomHndl,'Enable','on');
            end % if
            
            % Ditto for panning.
            if strcmp(dialObj.panStatus,'on');
                panHndl = pan(dialObj.Parent);            
                set(panHndl,'Enable','on');
            end % if
                        
        end % drag_end_cb
        
        %------------------------------------------------------------------
        % Function to disallow zooming of dial object axes.
        % N.B., have to use this method, rather than setAllowAxesZoom,
        % because setAllowAxesZoom prevents the dial axes from receiving
        % ANY mouse input while zoom is enabled for the figure. zoomfilter
        % will allow the dial to receive zoom input but then interpret it
        % as something else.
        function [flag] = zoomfilter(obj,event_obj)
            % If true returned, then zooming does NOT occur.

            % Determine whether the object clicked on is a child of a dial
            % axes.
            isChild = false;

            % Determine type of object clicked.
            typeStr = get(obj,'type');

            % A figure cannot be a child of a dial object.
            if ~strcmp(typeStr,'figure')
                
                % Object may be an axis, text, line, patch, etc. Determine
                % if it is a child of any dial object.

                % ...Find all dials in this figure.
                figNum = gpf(obj);
                dialHndls = dial.find_dial(figNum);

                for iDial = 1:length(dialHndls)

                    if ismember(obj,findobj(dialHndls{iDial}.dialAxes))
                        isChild = true;
                        break;
                    end % if

                    if ismember(obj,findobj(dialHndls{iDial}.tickPlateAxes))
                        isChild = true;
                        break;
                    end % if

                    if ismember(obj,findobj(dialHndls{iDial}.panelAxes))
                        isChild = true;
                        break;
                    end % if

                    if ismember(obj,findobj(dialHndls{iDial}.mouseAxes))
                        isChild = true;
                        break;
                    end % if

                end % for

            end % if

            % If clicked object is a child of a dial object, return "true",
            % so that zooming does not occur.
            if isChild == true
                flag = true;
            else
                flag = false;
            end % if

        end %  zoomfilter

        %-------------------------------------------------------------------------
        % Method to test if specified property is of correct type (numeric,
        % cell, string, etc.).
        function isGoodPropType = test_prop_type(propName,propVal)

            isGoodPropType = true;

            strVarNames = {'Tag' 'horizontalAlignment' ...
                'verticalAlignment' 'titleStr' 'titlePos' 'pointerStyle'};

            numericVarNames = {'Position' 'dialRadius' 'tickRadius' ...
                'tickLabelRadius' 'valRangePerRotation' 'refVal' ...
                'refOrientation' 'Min' 'Max' 'Value' ...
                'tickVals' 'linePtrStartRadius' 'circlePtrRadius' ...
                'circlePtrCentreRadius'};
            
            logicalVarNames = {'drawTicks' 'doWrap' 'doSnap'};

            cellVarNames = {'tickStrs'};

            if ismember(propName,strVarNames)
                if ~ischar(propVal)
                    isGoodPropType = false;
                end % if

            elseif ismember(propName,numericVarNames)
                if ~isnumeric(propVal)
                    isGoodPropType = false;
                end % if

            elseif ismember(propName,logicalVarNames)

                if length(propVal) ~= 1
                    isGoodPropType = false;
                elseif ~(islogical(propVal) || (propVal==0) || (propVal==1) )
                    % Allow ordinary zeroes and ones.
                    isGoodPropType = false;
                end % if

            elseif ismember(propName,cellVarNames)
                if ~iscell(propVal)
                    isGoodPropType = false;
                end % if

            end % if

        end % test_prop_type function

        %-------------------------------------------------------------------------
        function [dialOrientation] = val2orientation(refVal,refOrientation,valRangePerRotation,dialValue)

            % val2orientation.m--Calculates the orientation of the dial
            % corresponding to a given value. Also used for calculating
            % tick placement.
            %
            % Orientation is in radians counter-clockwise from positive
            % x-axis.
            %
            % Syntax: dialOrientation = val2orientation(refVal,refOrientation,valRangePerRotation,dialValue)
            %
            % e.g.,   dialOrientation = val2orientation(0,pi,10,4)

            %-------------------------------------------------------------------------

            rotationsFromRef = -(dialValue - refVal)/valRangePerRotation;
            dialOrientation = refOrientation + rotationsFromRef*(2*pi);

        end % val2orientation function

        %-------------------------------------------------------------------------
        function [currentDialObject] = gcdo()
            % Gets the current dial object (works like gcbo, but for dial
            % objects instead of Matlab uicontrol objects).
            %
            % Dial objects are flagged as current by the dial-class
            % click_cb method. A dial object only remains current while the
            % dial is being dragged.
            %
            % Returns empty variable if no dial object has been flagged as
            % current.
            %
            % Syntax: currentDialObject = dial.gcdo
            %--------------------------------------------------------------
            currentDialObject = getappdata(0,'currentDialObject');
        end % gcdo function

        %-------------------------------------------------------------------------
        function [dialHndls] = find_dial(varargin)
            %
            % find_dial.m--Find the dial object with the specified tag.
            %
            % Returns cell array of dial handles.
            %
            % FIND_DIAL with no input arguments finds all existing dial
            % objects. 
            %
            % FIND_DIAL(TAGSTR) looks for dials with the specified tag
            % string. 
            %
            % FIND_DIAL(GCF,... limits the search to the current figure.
            %
            % FIND_DIAL(...'-1') expects to find only a single dial object,
            % so returns dialHndls as a single handle, rather than a cell
            % array. An error is thrown if more than one dial object found.
            %
            % Works like Matlab's findobj.m except:
            %   (a) findobj. will not find user-defined objects like dials; and
            %   (b) whereas findobj.m can search for object properties like 'position',
            %       'FaceColor', etc., find_dial.m only searches for the 'Tag'
            %       property.
            %
            % Syntax: dialHndls = dial.find_dial(<<parentObj>,tagStr>)
            %
            % e.g.,   h1 = dial('Tag','first','Position',[0.1 0.1 0.3 0.3]);
            %         h2 = dial('Tag','second','Position',[0.6 0.1 0.3 0.3]);
            %
            % e.g.,   dial.find_dial
            % e.g.,   dial.find_dial(gcf)
            % e.g.,   dial.find_dial(gcf,'first')
            % e.g.,   dial.find_dial('second','-1')
            % e.g.,   dial.find_dial(gcf,'second','-1')

            %-------------------------------------------------------------------------

            % Handle input arguments.            
            parentObj = 0; 
            tagSupplied = false;
            isSingleDial = false;
            
            if nargin>3
                error([mfilename '.m--Incorrect number of input arguments.']);
            end % if
            
            if nargin > 0
                
                args = varargin;
                
                % If the first argument is a handle, take it to be the
                % parent object for the search.
                if ishandle(args{1})
                    parentObj = args{1};
                    args(1) = [];
                end % if
                
                if ~isempty(args)

                    % If the last argument is the string '-1', then only one
                    % dial handle should be returned.
                    if ischar(args{end})
                        if strcmp(args{end},'-1')
                            isSingleDial = true;
                            args(end) = [];
                        end % if
                    end % if

                end % if
                
                if ~isempty(args)
                    tagStr = args{end};
                    tagSupplied = true;
                end % if
                                
            end % if

            if tagSupplied
                if ~ischar(tagStr)
                    error([mfilename '.m--tagStr must be a string.']);
                end % if
            end % if
            
            % The search for the dial objects is actually a search for a component of
            % the dial objects (findobj won't find the dial objects themselves). Will
            % search for either a panelAxes (permanent tag) or a dialAxes
            % (user-settable tag) object, depending on whether a tag string to search
            % for has been specified or not.
            if tagSupplied == false

                % No tag string specified. Search for all dial objects.

                % ...All dial objects contain a panel axes with a permanent tag string.
                foundAxes = findobj(parentObj,'Tag','dialObjectPanelAxes');

            else
                % Tag string specified. Search for dial objects with the specified tag.

                % ...All dial objects contain a dialAxes with the same tag string as
                % the dial itself.
                foundAxes = findobj(parentObj,'Tag',tagStr,'type','axes');

            end % if

            % For each axes, get the handle of the associated dial object (stored in
            % appdata by the dial "set" method).
            dialHndls = {};

            for iAx = 1:length(foundAxes)

                thisHndl = getappdata(foundAxes(iAx),'dialHandle');

                % If this axis does not belong to a dial object (user could conceivably
                % have given a non-dial axes the same tag as the dial), then it will
                % almost certainly not have a dial handle in its appdata, so ignore it.
                if ~isempty(thisHndl)
                    dialHndls{end+1} = thisHndl;
                end % if
                
            end % for

            if isSingleDial

                if length(dialHndls) > 1
                    error([mfilename '.m--More than one dial object found.']);
                elseif length(dialHndls) == 0
                    dialHndls = [];
                else
                    dialHndls = dialHndls{1};
                end % if

            end % if

        end % find_dial function
                                     
        %-------------------------------------------------------------------------
        function [allowableVals,defaultVal] = get_allowable_vals(propName)
            % Gets the allowable values for the specified property. 
            %
            % Returns empty allowableVals cell variable when property is
            % not user-settable; returns +Inf when there is no fixed set of
            % property values for the specified property.
            %
            % Returns defaultVal, the default value, for properties with a
            % fixed set of values. If a property has no fixed set of
            % values, defaultVal is returned as empty.
            %
            % Syntax: [allowableVals,defaultVal] = get_allowable_vals(propName)
            %--------------------------------------------------------------
            
            unsettableProps = {'dialFaceHndl' 'circlePointerHndl' ...
                'linePointerHndl' 'titleHndl' 'tickHndls' 'tickLabelHndls' ...
                'Parent' 'Type' 'orientation'};
            
            noFixedSetProps = {...
                'Tag' ...
                'UserData' ...
                'CallBack' ...
                'Position' ...
                'titleStr' ...
                'titlePos' ...
                'dialRadius' ...
                'tickRadius' ...
                'tickLabelRadius' ...
                'linePtrStartRadius' ...
                'circlePtrRadius' ...
                'circlePtrCentreRadius' ...
                'valRangePerRotation' ...
                'refVal' ...
                'refOrientation' ...
                'Min' ...
                'Max' ...
                'Value' ...
                'tickVals' ...
                'tickStrs'};
            
            if ismember(propName,unsettableProps)
                allowableVals = {};
                defaultVal = {};
            elseif ismember(propName,noFixedSetProps)
                allowableVals = {+Inf};
                defaultVal = {};            
            elseif strcmp(propName,'horizontalAlignment')
                allowableVals = {'left' 'centre' 'right'};
                defaultVal = 'centre';
            elseif strcmp(propName,'verticalAlignment')
                allowableVals = {'top' 'centre' 'bottom' };
                defaultVal = 'centre';
            elseif strcmp(propName,'drawTicks')
                allowableVals = {0 1};                
                defaultVal = 1;
            elseif strcmp(propName,'pointerStyle')
                allowableVals = {'line' 'circle'};
                defaultVal = 'line';                
            elseif strcmp(propName,'doWrap')
                allowableVals = {0 1};
                defaultVal = 0;
            elseif strcmp(propName,'doSnap')
                allowableVals = {0 1};
                defaultVal = 0;
            end % if
    
        end % get_allowable_vals function
        
        %-------------------------------------------------------------------------
        function [] = disp_property_values(propName)
            % Displays the specified property name with its possible and
            % default values (if they exist).
            %
            % Syntax: disp_property_values(propName)
            %--------------------------------------------------------------

            [allowableVals,defaultVal] = dial.get_allowable_vals(propName);

            if isempty(allowableVals)
                str = propName;
            elseif allowableVals{1} == Inf
                str = propName;
            else

                str = [propName ': [ '];

                for iVal = 1:length(allowableVals)

                    thisVal = allowableVals{iVal};

                    if isequal(thisVal,defaultVal)
                        str = [str '{'];
                    end % if

                    if isnumeric(thisVal) || islogical(thisVal)
                        valStr = num2str(thisVal);
                    else
                        valStr = thisVal;
                    end % if
                        
                    str = [str valStr];

                    if isequal(thisVal,defaultVal)
                        str = [str '}'];
                    end % if

                    if iVal == length(allowableVals)
                        str = [str ' ]'];
                    else
                        str = [str ' | '];
                    end % if

                end % for

            end % if

            disp(str);

        end % disp_property_values function

        %-------------------------------------------------------------------------
        function [parentFig] = gpf(h)
            %
            % gpf.m--Gets the parent figure of the object with handle h.
            %
            % Syntax: parentFig = gpf(h)
            %
            % e.g.,   figure; panelHndl = uipanel;
            %         pushHndl = uicontrol('style','push','string','Button',...
            %                              'parent',panelHndl);
            %         get(pushHndl,'parent') % parent is the panel, not the figure
            %         parentFig = gpf(pushHndl)

            %-------------------------------------------------------------------------

            if isempty(h)
                parentFig = [];
                return;
            end % if

            if ~ishandle(h)
                error([mfilename '.m--Input argument is a non-handle object.']);
            end % if

            if h == 0
                error([mfilename '.m--Input argument is the root workspace.']);
            end % if

            handleType = get(h,'type');

            if strcmp(handleType,'figure')
                error([mfilename '.m--Figures have no parent figure.']);
            end % if

            currHndl = h;

            while 1

                currParent = get(currHndl,'parent');

                % This should never happen, but avoid any chance of an infinite loop by
                % testing.
                if isempty(currParent)
                    error([mfilename '.m--Unknown error.']);
                end % if

                currParentType = get(currParent,'type');

                if strcmp(currParentType,'figure')
                    parentFig = currParent;
                    break;
                end % if

                currHndl = currParent;

            end % while

        end % gpf function

    end % Static methods

end % classdef
