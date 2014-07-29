classdef ConnectedVehicleManager < VehicleManager
    %CONNECTEDVEHICLEMANAGER 
    
    properties (Access = protected)
        basePort = 0;   % Beginning of port range to assign
    end
    
    methods (Access = protected)
        function retval = getPort(obj)
            ports = zeros(1,numel(obj.vehicles));
            for ii = 1:numel(obj.vehicles)
                if isvalid(obj.vehicles(ii))
                    % Shift port range to 0-based
                    ports(ii) = obj.vehicles(ii).port - obj.basePort;
                end
            end
            retval = find(sort(ports)-(1:numel(ports)),1,'first');
            
            if isempty(retval)
                if isempty(ports)
                    retval = 0;
                else
                    retval = max(ports(:))+1;
                end
            end
            
            % Shift port range back to basePort-based
            retval = retval + obj.basePort;
        end
    end
    
end

