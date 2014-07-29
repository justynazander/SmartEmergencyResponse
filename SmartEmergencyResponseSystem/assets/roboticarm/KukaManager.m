classdef KukaManager < ConnectedVehicleManager
    %KUKAMANAGER Summary of this class goes here
    %   Detailed explanation goes here
    
    methods
        function obj = KukaManager()
            obj.vehicleTypeName = 'Kuka';
        end
        
        function newKuka = addVehicle(obj,locationIn)
            newKuka = Kuka(obj.getPort,obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newKuka);
        end
    end
    
end

