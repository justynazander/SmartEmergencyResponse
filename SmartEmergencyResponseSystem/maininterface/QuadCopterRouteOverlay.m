classdef QuadCopterRouteOverlay < handle
    %% Visual representation of quadcopter routes
    
    properties (Access = private)
        quadcopterManager   % Instance of QuadCopterManager

        parentAxes          % Axes object containing this object
        lines               % Vector of handles to lines for each vehicle
        colorIndices        % Vector of integers counting the number of lines of each color

        routeUpdater        % Listener for route updates
        vehicleAddUpdater   % Updates for new vehicles
        vehicleRemoveUpdater % Updates for vehicles getting removed
        
        showingAllRoutes = false % boolean, needed in case vehicles are added after showRoutes is called
    end
    
    methods
        function obj = QuadCopterRouteOverlay(parentAxesIn,...
                                              quadcopterManagerIn,...
                                              showingAllRoutesIn)
            obj.parentAxes = parentAxesIn;
            obj.quadcopterManager = quadcopterManagerIn;
            obj.showingAllRoutes = showingAllRoutesIn;
            obj.colorIndices  = zeros(size(get(obj.parentAxes,'colororder'),1),1);
            
            for thisQuadcopter = obj.quadcopterManager.getVehicles
                obj.makeLine(thisQuadcopter.ID);
                obj.updateRoute(thisQuadcopter);                
            end
            
            if ~isempty(obj.quadcopterManager.getVehicles)
                obj.routeUpdater = addlistener(obj.quadcopterManager.getVehicles,...
                                               'routeChanged',...
                                               @(src,~)obj.updateRoute(src));
            end
            obj.vehicleAddUpdater = addlistener(obj.quadcopterManager,...
                                                'vehicleAdded',...
                                                @obj.newVehicleHandler);
            obj.vehicleRemoveUpdater = addlistener(obj.quadcopterManager,...
                                                   'vehicleRemoved',...
                                                   @obj.deleteVehicleHandler);
        end
        
        function delete(obj)
            delete(obj.routeUpdater);
            delete(obj.vehicleAddUpdater);
            delete(obj.vehicleRemoveUpdater);
        end
        
        function showRoutes(obj)
            set(obj.lines,'visible','on');
            obj.showingAllRoutes = true;
        end
        
        function unshowRoutes(obj)
            set(obj.lines,'visible','off');
            obj.showingAllRoutes = false;
        end
    end
    
    methods (Access = private)
        function newVehicleHandler(obj,~,event)
            % event.ID is the vehicle that was created
            obj.makeLine(event.ID.ID);
            obj.updateRoute(event.ID);
            if obj.showingAllRoutes
                set(obj.lines(event.ID.ID),'visible','on');
            end
            addlistener(event.ID,'routeChanged',@(src,~)obj.updateRoute(src));
        end
        
        function deleteVehicleHandler(obj,~,event)
            obj.removeLine(event.ID);
            % When the vehicle gets deleted, the listener automatically gets
            % cleaned up?
        end
        
        function makeLine(obj, vehicleIndex)
            [~,index] = min(obj.colorIndices);  % Get the least-frequently used color
            colormap = get(obj.parentAxes,'colororder');
            if obj.showingAllRoutes
                show = 'on';
            else
                show = 'off';
            end
            obj.lines(vehicleIndex) = line('parent',obj.parentAxes,...
                                           'xdata',[],'ydata',[],...
                                           'color', colormap(index,:),...
                                           'linewidth',3,...
                                           'linestyle','--',...
                                           'visible',show);
            obj.colorIndices(index) = obj.colorIndices(index) + 1;
        end
        
        function removeLine(obj, vehicleIndex)
            color = get(obj.lines(vehicleIndex),'color');
            colormap = get(obj.parentAxes,'colororder');
            for ii = 1:numel(obj.colorIndices)
                if isequal(color,colormap(ii,:))
                    obj.colorIndices(ii) = obj.colorIndices(ii) - 1;
                    break;
                end
            end
            
            delete(obj.lines(vehicleIndex));
        end
        
        function updateRoute(obj, vehicle)
            route = vehicle.getRoute;
            set(obj.lines(vehicle.ID),'xdata',route(:,2),...
                                      'ydata',route(:,1));
        end
    end
end