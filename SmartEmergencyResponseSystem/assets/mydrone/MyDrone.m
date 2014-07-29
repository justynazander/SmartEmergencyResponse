classdef MyDrone < Vehicle
    %% Class representing my drone
    properties
        fixedRoute  % MyDrone will just fly a loop given in the 
                    % file MDroute.mat.  Instead of re-reading that file,
                    % its contents are cached here.
    end
    
    properties (Constant)
        speed = .002
    end
    
    methods
        function obj = MyDrone(IDIn,LocationIn)
            obj = obj@Vehicle(IDIn,LocationIn);
            obj.route = zeros(0,2);     % Set dimensionality of route
            
            temp = load('MDroute.mat');
            obj.fixedRoute = temp.routeData;
            obj.waypointReached;
        end
        
        function waypointReached(obj)
            waypointReached@Vehicle(obj);
            if size(obj.route,1)<2
                obj.route = [obj.route; obj.fixedRoute];
            end
        end
    end
    
end