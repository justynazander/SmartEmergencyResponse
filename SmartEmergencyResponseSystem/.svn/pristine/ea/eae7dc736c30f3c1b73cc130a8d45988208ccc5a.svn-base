classdef Kuka < ConnectedVehicle
    %% Haptics Device, few details available at this time
    properties (Access = private)
        % Configurable properties to be agreed on with Bluhaptics
        
        %GPSipAddress = '172.28.208.200'
        ConnectionipAddress = '127.0.0.1';
        ConnectionPortNumber = 8088;
        
        sendingIPAddress = '192.168.1.228';
        sendingPort = 9555;
        
        % Other properties
        connection
        connectionOutgoing
        datagramListener
    end
    
    properties (SetAccess = private, SetObservable)
        heading
    end
    
    properties
        currentTarget
    end
    
    properties (Constant)
        speed = .002;
    end
    
    methods
        function obj = Kuka(portIn,IDIn,LocationIn)
            obj = obj@ConnectedVehicle(portIn,IDIn,LocationIn); % Random Id and location for the vehicle
            obj.connection = KukaConnection(obj.ConnectionipAddress,obj.ConnectionPortNumber);
            obj.connectionOutgoing = udp(obj.sendingIPAddress,obj.sendingPort);
            fopen(obj.connectionOutgoing);
            obj.datagramListener = event.listener(obj.connection,'datagramReceived',@obj.unpackDatagram);
        end
        
        function delete(obj)
            delete(obj.datagramListener);
            delete(obj.connection);
            fclose(obj.connectionOutgoing);
            delete(obj.connectionOutgoing);
        end
        
        function send(obj,str)
            fprintf(obj.connectionOutgoing,str);
        end
    end
    
    methods (Access = private)
        function unpackDatagram(obj,~,~)
            obj.location = [-122.3982409146,37.7859309913]+.001*[obj.connection.lastData.longitude obj.connection.lastData.latitude];
            obj.heading = obj.connection.lastData.heading*180/pi;
        end
    end
end

