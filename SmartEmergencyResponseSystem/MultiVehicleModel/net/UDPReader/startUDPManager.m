function [ udpManager ] = startUDPManager( port )
%STARTUDPMANAGER Initializes udp communication manager
%   
%pwd
javaaddpath 'UDPReader.jar'
udpManager = netaux.UDPServer(port);
udpManager.start ; 

end

