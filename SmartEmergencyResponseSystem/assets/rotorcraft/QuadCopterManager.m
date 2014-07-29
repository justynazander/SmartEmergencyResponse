classdef QuadCopterManager < VehicleManager
    %% Class to keep track of all the QuadCopters
    
    methods
        function obj = QuadCopterManager
            obj.vehicleTypeName = 'Quadcopter';
        end
        
        function newChopper = addVehicle(obj,locationIn)
            newChopper = QuadCopter(obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newChopper);
        end
    end
    
end

