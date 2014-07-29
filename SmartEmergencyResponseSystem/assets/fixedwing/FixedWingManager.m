classdef FixedWingManager < VehicleManager
    %% Class to keep track of all the QuadCopters
    
    methods
        function obj = FixedWingManager
            obj.vehicleTypeName = 'Fixed-wing';
        end
        
        function newFixedWing = addVehicle(obj,locationIn)
            newFixedWing = FixedWing(obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newFixedWing);
        end
    end
    
end

