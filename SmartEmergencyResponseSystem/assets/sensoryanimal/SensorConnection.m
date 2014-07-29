classdef SensorConnection < handle
    %% Sensor Connection for a biobot
    %  Latest Sensor data received is stored in lastData.
    %
    %  Also provides event datagramReceived that fires when any sensor data
    %  is received.
    
    properties (Access = private)
        dataListener
    end
    
    properties (GetAccess = public)
        lastData = struct('name',{},'timestamp',{},'value',{})
    end
    
    methods
        function obj = SensorConnection(varargin)
            obj.dataListener = EventListener(varargin{:},@obj.processSensorString);
        end
        
        function processSensorString(obj,raw)
            processedData = SensorConnection.parseSensorString(raw);
            if isempty(processedData)
                % This means there was likely some data corruption
                % in-transit.
                return;
            end
            
            obj.lastData = processedData;
            notify(obj,'datagramReceived');
        end
        
        function delete(obj)
            delete(obj.dataListener);
        end
    end
    
    methods (Static)
        function retval = parseSensorString(raw)
            expression = ['(?<name>\w+),', ...
                          '(?<timestamp>[+-]?\d*\.?\d*),'...
                          '(?<value>[+-]?\d*\.?\d*)'];
            results = regexp(raw,expression,'names','once');
            
            if ~isempty(results)
                retval.name = results.name;
                retval.timestamp = SensorConnection.unpackTimestamp(results.timestamp);
                retval.value = str2double(results.value);
            else
                retval = [];
            end
        end
        
        function retval = unpackTimestamp(raw)
            % If a sensor string gets sent on one day and received on 
            % another day, this may have problems.  Latencies should be low
            % enough that this isn't a problem (but it's important to be 
            % aware of)
            retval = datenum('1970','yyyy')+str2double(raw)/8.64e4;
        end
    end
    
    events
        datagramReceived
    end    
end

