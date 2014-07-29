classdef ConnectedVehicle < Vehicle
    %VEHICLEWITHCONNECTION A vehicle with an open network connection
    
    properties
        port 
    end
    
    methods
        function obj = ConnectedVehicle(portIn,IDIn,locationIn)
            obj@Vehicle(IDIn,locationIn);
            obj.port = portIn;
        end
    end
    
end

