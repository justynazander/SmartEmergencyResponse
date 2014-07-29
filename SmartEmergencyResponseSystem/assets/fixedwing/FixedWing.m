classdef FixedWing < Vehicle
    %% Class representing a fixed-wing recon drone
    properties
        fixedRoute  % The fixed wings will just fly a loop given in the 
                    % file FWroute.mat.  Instead of re-reading that file,
                    % its contents are cached here.
    end
    
    properties (Constant)
        speed = .004
    end
    
    methods
        function obj = FixedWing(IDIn,LocationIn)
            obj = obj@Vehicle(IDIn,LocationIn);
            obj.route = zeros(0,2);     % Set dimensionality of route
            
            temp = load('FWroute.mat');
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