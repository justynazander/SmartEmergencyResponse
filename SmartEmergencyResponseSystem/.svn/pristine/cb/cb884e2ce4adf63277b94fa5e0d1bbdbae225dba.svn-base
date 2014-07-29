classdef Biobot < ConnectedVehicle
    %% It's a dog.  With sensors.
    %  Still need to clarify whether data from multiple sensors is getting 
    %  sent to the same port
    properties (SetAccess = private)
        % Configurable properties to be agreed on with NCSU
        %GPSipAddress = '172.28.208.200'
        GPSipAddress = '127.0.0.1'
        GPSportNumber = 10001
        
        %sensoripAddress = '172.28.208.200'
        sensoripAddress = '127.0.0.1'
        sensorPortNumber = 10003
        
        % Other properties
        GPS
        sensors
        GPSListener
        sensorListener
        recentSensorData
    end
    
    properties (Constant)
        speed = .001;
    end
    
    properties
        currentTarget
    end
    
    methods
        function obj = Biobot(portIn,IDIn,LocationIn)
            obj = obj@ConnectedVehicle(portIn,IDIn,LocationIn);
            %obj.GPS = GPSConnection(obj.GPSipAddress,obj.GPSportNumber);
            obj.sensors = SensorConnection(obj.sensoripAddress,obj.sensorPortNumber);
            %obj.GPSListener = event.listener(obj.GPS,'validDatagramReceived',@obj.unpackDatagram);
            obj.sensorListener = event.listener(obj.sensors,'datagramReceived',@obj.handleSensorData);
        end
        
        function delete(obj)
            %delete(obj.datagramListener);
            %delete(obj.GPS);
            delete(obj.sensors);
            delete(obj.sensorListener);
        end
    end
    
    methods (Access = private)
        function unpackDatagram(obj,~,~)
            obj.location = [obj.GPS.lastValidData.latitude obj.GPS.lastValidData.longitude];
        end
        
        function handleSensorData(obj,src,~)
            if isempty(obj.recentSensorData)
                obj.recentSensorData = repmat([src.lastData.timestamp,src.lastData.value],120,1);
            else
                obj.recentSensorData = [obj.recentSensorData(2:end,:);src.lastData.timestamp,src.lastData.value];
            end
            if obj.recentSensorData(end,2) - mean(obj.recentSensorData(1:end-1,2)) > 3*std(obj.recentSensorData(1:end-1,2)) && obj.recentSensorData(end-1,2) - mean(obj.recentSensorData(1:end-1,2)) < 3*std(obj.recentSensorData(1:end-1,2))
                notify(obj,'gasLeakDetected');
            end
        end
    end
    
    events
        gasLeakDetected
    end
end

