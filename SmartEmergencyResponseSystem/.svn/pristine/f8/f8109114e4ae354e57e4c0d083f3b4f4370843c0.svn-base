function [ waypoint ] = getWaypoints5D(  )
%GETWAYPOINTS Summary of this function goes here
%   Detailed explanation goes here




nPoints = 100;
nAC = 2; 
waypointsListARDrone = zeros(5,nPoints,nAC);

LAT0= 37.779861111;
LON0=-122.470919444;
H0 =0;

E = wgs84Ellipsoid; 

[lat,lon,alt]=ned2geodetic(100, 0, -20, LAT0, LON0, H0 , E, 'degrees');
waypointsListARDrone(:,1,1) = [lat;lon;alt;0;5];

[lat,lon,alt]=ned2geodetic(100, 50, -20, LAT0, LON0, H0 , E, 'degrees');
waypointsListARDrone(:,2,1) = [lat;lon;alt;0;5];


[lat,lon,alt]=ned2geodetic(0, 50, -20, LAT0, LON0, H0 , E, 'degrees');
waypointsListARDrone(:,3,1) = [lat;lon;alt;0;5];

[lat,lon,alt]=ned2geodetic(0, 0, 0, LAT0, LON0, H0 , E, 'degrees');
waypointsListARDrone(:,4,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,5,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,6,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,7,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,8,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,9,1) = [lat;lon;alt;0;5];

waypointsListARDrone(:,10,1) = [lat;lon;alt;0;5];


for k =11:nPoints
    waypointsListARDrone(:,k,1) = [lat;lon;alt;0;5]; 
end


waypointsListARDrone(:,:,2) = waypointsListARDrone(:,:,1) ; 
waypoint = waypointsListARDrone ; 




end

