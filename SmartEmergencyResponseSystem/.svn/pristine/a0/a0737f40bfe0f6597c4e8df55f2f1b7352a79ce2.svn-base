classdef shAirConnection < handle
    %% Class to handle the reception of requests from MIT's shAir network
    properties (Access = private)
        dataListener
    end
    
    properties (GetAccess = public)
        lastData
        lastValidData
    end
    
    methods
        function obj = shAirConnection(varargin)
            obj.dataListener = EventListener(varargin{:},@obj.processShAirString);
        end
        
        function processShAirString(obj,raw)
            processedData = shAirConnection.parseShAirString(raw);
            obj.lastData = processedData;
            
            if ~isempty(processedData)
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
        function retval = parseShAirString(raw)
            expression = ['(?<latitude>[+-]?\d*\.?\d*)\s*', ...
                          '(?<longitude>[+-]?\d*\.?\d*)\s*',...
                          '(?<pickupdropoff>[+-]?\d*\.?\d*)\s*'...
                          '(?<itemID>[+-]?\d*\.?\d*)\s*'...
                          '(?<quantity>[+-]?\d*\.?\d*)\s*'...
                          '(?<priority>[+-]?\d*\.?\d*)'];
            results = regexp(raw,expression,'names','once');
            if ~isempty(results)
                retval.latitude = str2double(results.latitude);
                retval.longitude = str2double(results.longitude);
                retval.pickupDropoff = str2double(results.pickupdropoff);
                retval.itemID = str2double(results.itemID);
                retval.quantity = str2double(results.quantity);
                retval.priority = str2double(results.priority);
            else
                retval = [];
            end
        end
    end
    
    events
        datagramReceived
        validDatagramReceived
    end    
end

