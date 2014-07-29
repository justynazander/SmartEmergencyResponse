classdef MyDroneManager < VehicleManager
    %% Class to keep track of all the QuadCopters
    
    methods
        function obj = MyDroneManager
            obj.vehicleTypeName = 'My-drone';
        end
        
        function newMyDrone = addVehicle(obj,locationIn)
            newMyDrone = MyDrone(obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newMyDrone);
        end
    end
    
end

