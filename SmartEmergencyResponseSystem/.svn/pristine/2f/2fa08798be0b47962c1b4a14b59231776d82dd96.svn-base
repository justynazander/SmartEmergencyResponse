classdef VehicleTypeSelector
    %VEHICLETYPESELECTOR Drop-down for selecting a vehicle type
    
    properties (Access = private)
        vehicleManagerTable     % Cell vector of vehicle managers
        dropDown                % The actual UI control
    end
    
    properties (Dependent, SetAccess = private)
        selectedVehicleManager
    end
    
    methods
        function obj = VehicleTypeSelector(vehicleManagers,...
                                           parent, ...
                                           position)
            obj.vehicleManagerTable = vehicleManagers;
            obj.dropDown = uicontrol('Parent',parent,...
                                     'Units','normalized',...
                                     'BackgroundColor',[1 1 1],...
                                     'Position',position,...
                                     'String','Vehicle List',...
                                     'Style','popupmenu',...
                                     'Value',1);
            obj.populateList
        end
        
        function retval = get.selectedVehicleManager(obj)
            retval = obj.vehicleManagerTable{get(obj.dropDown,'Value')};
        end
    end
    
    methods (Access = private)
        function populateList(obj)
            nameList = cell(numel(obj.vehicleManagerTable),1);
            for ii = 1:numel(obj.vehicleManagerTable)
                nameList{ii} = obj.vehicleManagerTable{ii}.vehicleTypeName;
            end
            set(obj.dropDown,'String',nameList);
        end
    end   
end

