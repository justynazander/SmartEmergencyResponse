%% Loading fleet waypoints via UDP

%addpath UDPWriter ;
addpath net/UDPWriter ;
waypoints= getWaypoints5D2() ; % See format of the vector 
nAC = size(waypoints, 3) ;
%IPAddress = '172.28.211.53' ;
IPAddress = '127.0.0.1' ;
for k=1:nAC
    waypointUAV = waypoints(:,:, k) ; 
    sendWaypointsUDP( waypointUAV, k , IPAddress, 9020)
    %pause(0.02) ;
end
clear waypoints waypointUAV nAC k


