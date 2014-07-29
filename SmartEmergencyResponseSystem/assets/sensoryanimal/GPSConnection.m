classdef GPSConnection < handle
    %% GPS Connection for a biobot
    %  Latest GPS data received is stored in lastData.
    %  Latest GPS data received that has the valid flag set to true is
    %  stored in lastValidData.
    %
    %  Also provides events datagramReceived that fires when any GPS data
    %  is received as well as validDatagramReceived that fires when any
    %  *valid* GPS data is received.
    
    properties (Access = private)
        dataListener
    end
    
    properties (GetAccess = public)
        lastData
        lastValidData
    end
    
    methods
        function obj = GPSConnection(varargin)
            obj.dataListener = EventListener(varargin{:},@obj.processGPSString);
        end
        
        function processGPSString(obj,raw)
            processedData = GPSConnection.parseGPSString(raw);
            if isempty(processedData)
                return;
            end
            
            obj.lastData = processedData;
            if obj.lastData.validity
                obj.lastValidData = obj.lastData;
                notify(obj,'validDatagramReceived');
            end
            notify(obj,'datagramReceived');
        end
        
        function delete(obj)
            delete(obj.dataListener);
        end
    end
    
    methods (Static)
        function retval = parseGPSString(raw)
            expression = ['(?<validity>\d),', ...
                          '(?<timestamp>[+-]?\d*\.?\d*),'...
                          '(?<quality>[+-]?\d*\.?\d*),'...
                          '(?<latitude>[+-]?\d*\.?\d*),'...
                          '(?<longitude>[+-]?\d*\.?\d*)'];
            results = regexp(raw,expression,'names','once');
            if ~isempty(results)
                retval.validity = (results.validity == '1');
                retval.timestamp = GPSConnection.unpackTimestamp(results.timestamp);
                retval.quality = str2double(results.quality);
                retval.latitude = str2double(results.latitude);
                retval.longitude = str2double(results.longitude);
            else
                retval = [];
            end
        end
        
        function retval = unpackTimestamp(raw)
            % If a GPS string gets sent on one day and received on another
            % day, this may have problems.  Latencies should be low enough
            % that this isn't a problem (but it's important to be aware of)
            retval = today + datenum(0,0,0,str2double(raw(1:2)),str2double(raw(3:4)),str2double(raw(5:end)));
        end
    end
    
    events
        datagramReceived
        validDatagramReceived
    end    
end

