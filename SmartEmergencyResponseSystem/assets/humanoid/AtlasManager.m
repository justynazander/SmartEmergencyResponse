classdef AtlasManager < ConnectedVehicleManager
    %ATLASMANAGER Summary of this class goes here    
    methods
        function obj = AtlasManager
            obj.vehicleTypeName = 'Atlas';
        end
        
        function newAtlas = addVehicle(obj,locationIn)
            newAtlas = Atlas(obj.getPort,obj.getID,locationIn);
            obj.addVehicle@VehicleManager(newAtlas);
        end
    end
    
end

