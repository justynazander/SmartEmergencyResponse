classdef (ConstructOnLoad) DataMessage < event.EventData
    properties (Access = public)
        message
    end
    
    methods (Access = public)
        function obj = DataMessage(inMessage)
            obj.message = inMessage;
        end
    end
end

