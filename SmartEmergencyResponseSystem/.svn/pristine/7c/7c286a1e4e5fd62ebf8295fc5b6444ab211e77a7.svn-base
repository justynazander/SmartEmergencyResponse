%% Loading fleet waypoints via UDP

waypoints= getWaypoints3D() ; % See format of the vector 
nAC = size(waypoints, 3) ;
for k=1:nAC
    waypointUAV = waypoints(:,:, k) ; 
    sendWaypointsUDP( waypointUAV, k )
    %pause(0.02) ;
end
clear waypoints waypointUAV nAC k


