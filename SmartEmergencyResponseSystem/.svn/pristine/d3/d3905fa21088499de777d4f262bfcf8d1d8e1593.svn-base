classdef VehicleManager < handle
    %% Class to keep track of vehicles
    properties (Access = protected)
        vehicles    % vector of actual vehicles
    end
    
    properties (SetAccess = protected)
        vehicleTypeName
    end
    
    methods
        function addVehicle(obj,newVehicle)
            obj.vehicles = [obj.vehicles newVehicle];
            notify(obj,'vehicleAdded',EventWithID(newVehicle));
        end        
        
        function retval = getVehicles(obj)
            retval = obj.vehicles;
        end
        
        function removeVehicle(obj, ID)
            delete(obj.vehicles(ID));
            notify(obj,'vehicleRemoved',EventWithID(ID));
        end
        
        function reset(obj)
            for i=1:numel(obj.vehicles)
                obj.removeVehicle(i);
            end
            obj.vehicles = [];
        end
    end
    
    methods (Access = protected)
        function retval = getID(obj)
            IDs = zeros(1,numel(obj.vehicles));
            for ii = 1:numel(obj.vehicles)
                if isvalid(obj.vehicles(ii))
                    IDs(ii) = obj.vehicles(ii).ID;
                end
            end
            retval = find(sort(IDs)-(1:numel(IDs)),1,'first');
            
            if isempty(retval)
                if isempty(IDs)
                    retval = 1;
                else
                    retval = max(IDs(:))+1;
                end
            end
        end
    end
    
    events
        vehicleAdded
        vehicleRemoved
    end
end