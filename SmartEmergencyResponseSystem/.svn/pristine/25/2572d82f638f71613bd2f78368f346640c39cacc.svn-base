classdef Request < handle
    %REQUEST 
    
    properties
        sender          % Who submitted the request?
        priority        % Priority 1-high to 10-low
        dueTime         % When does the vehicle need to arrive?
        deliverAfter    % ?
        quantity        % How many items requested?
    end
    
    properties (SetObservable)
        location        % Where is the requested location?
        item            % What service is being requested?
        isDelivery      % Is it a delivery request?
        isPickup        % Is it a pick-up request?        
    end
    
    properties (Access = private)
        locationListener
        itemListener
        deliveryListener
        pickupListener
    end
    
    properties (SetAccess = private)
        ID
    end
    
    methods
        function obj = Request(IDIn,...
                               locationIn,...
                               itemIn,...
                               senderIn,...
                               priorityIn,...
                               dueTimeIn,...
                               deliverAfterIn,...
                               quantityIn,...
                               isDeliveryIn,...
                               isPickupIn)
            obj.ID = IDIn;
            obj.location = locationIn;
            obj.item = itemIn;
            obj.sender = senderIn;
            obj.priority = priorityIn;
            obj.dueTime = dueTimeIn;
            obj.deliverAfter = deliverAfterIn;
            obj.quantity = quantityIn;
            obj.isDelivery = isDeliveryIn;
            obj.isPickup = isPickupIn;
            
            obj.locationListener = event.proplistener(obj,findprop(obj,'location'),'PostSet',@(~,~)notify(obj,'locationChanged'));
            obj.itemListener = event.proplistener(obj,findprop(obj,'item'),'PostSet',@(~,~)notify(obj,'itemChanged'));
            obj.deliveryListener = event.proplistener(obj,findprop(obj,'isDelivery'),'PostSet',@(~,~)notify(obj,'deliveryPickupChanged'));
            obj.pickupListener = event.proplistener(obj,findprop(obj,'isPickup'),'PostSet',@(~,~)notify(obj,'deliveryPickupChanged'));
        end
        
        function delete(obj)
            notify(obj,'beingDeleted');
        end
    end
    
    events
        itemChanged
        locationChanged
        deliveryPickupChanged
        beingDeleted
    end
end

