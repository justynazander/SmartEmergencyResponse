classdef VehicleSprite < Sprite
    %VEHICLESPRITE Mobile graphical representation of a vehicle
    
    properties (Access = private)
        locationListener
        deletionListener
    end
    
    methods
        function obj = VehicleSprite(axesIn, imageData, alphaData, vehicle)
            obj = obj@Sprite(axesIn, imageData, alphaData);
            
            % location is lat/lon, but move requires x/y
            obj.moveTo(vehicle.location([2,1]));
            
            obj.locationListener = event.listener(vehicle,'locationChanged',@obj.motionCallback);
            obj.deletionListener = event.listener(vehicle,'beingDeleted',@(~,~)delete(obj));        
        end
        
        function delete(obj)
            delete(obj.locationListener);
            delete(obj.deletionListener);
        end
    end
    
    methods (Access = private)
        function motionCallback(obj,src,~)
            % src.location is lat/lon, but moveTo wants x/y
            obj.moveTo(fliplr(src.location));
        end
    end    
end

