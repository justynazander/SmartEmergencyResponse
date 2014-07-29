classdef BiobotManager < ConnectedVehicleManager
    %BIOBOTMANAGER     
    methods
        function obj = BiobotManager
            obj.vehicleTypeName = 'Biobot';
            obj.basePort = 4000;
        end
        
        function newBiobot = addVehicle(obj,locationIn)
            newBiobot = Biobot(obj.getPort,obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newBiobot);
        end
    end
    
end

