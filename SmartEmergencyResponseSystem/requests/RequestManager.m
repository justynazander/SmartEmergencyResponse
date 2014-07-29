classdef RequestManager < handle
    %% Class to keep track of requests
    
    properties (Access = private)
        requests    % Vector of Request objects
    end
    
    methods
        function addRequest(obj,locationIn,...
                                itemIn,...
                                senderIn,...
                                priorityIn,...
                                dueTimeIn,...
                                deliverAfterIn,...
                                quantityIn,...
                                isDeliveryIn,...
                                isPickupIn)
            newRequest = Request(RequestManager.getID,...
                                 locationIn,   itemIn,...
                                 senderIn,     priorityIn,...
                                 dueTimeIn,    deliverAfterIn,...
                                 quantityIn,...
                                 isDeliveryIn, isPickupIn);            
            obj.requests = [obj.requests newRequest];
            notify(obj,'requestAdded',EventWithID(newRequest));
        end        
        
        function retval = getRequests(obj)
            if isempty(obj.requests)
                retval = [];
            else
                retval = obj.requests(isvalid(obj.requests));
            end
        end
        
        function removeRequest(obj, ID)
            delete(obj.requests(ID));
            obj.requests = obj.requests(isvalid(obj.requests));
            notify(obj,'requestRemoved',EventWithID(ID));
        end
        
        function removeRequestByID(obj,ID)
            if ~isempty(obj.requests)
                idx = find([obj.requests.ID]==ID);
                obj.removeRequest(idx); %#ok
            end
        end
        
        function reset(obj)
            for i = 1:numel(obj.requests)
                obj.removeRequest(i);
            end
            obj.requests = [];
        end   
    end
    
    methods (Static)
        % Request IDs need to be unique not just at a particular time
        % slice, but over all time.  The reason for this is that
        % optimization is going to happen concurrently with simulation and
        % as the optimization progresses (in real-time), requests may
        % appear and disapper.  This ID gives us a consistent way of
        % referring to a request at both the beginning and the end of the
        % optimization.
        function retval = getID
            persistent nextID
            if isempty(nextID)
                nextID = 0;
            end
            
            nextID = nextID + 1;
            retval = nextID;
        end
    end
    
    events
        requestAdded
        requestRemoved
    end    
end

