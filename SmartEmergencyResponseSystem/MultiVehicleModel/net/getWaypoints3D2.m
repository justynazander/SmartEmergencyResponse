function [ waypoint ] = getWaypoints3D2(  )
%GETWAYPOINTS Summary of this function goes here
%   Detailed explanation goes here


nPoints = 100;
nAC = 2; 
waypoint = zeros(3,nPoints,nAC);

LAT0= 37.779861111;
LON0=-122.470919444;
H0 =0;

E = wgs84Ellipsoid; 

[lat,lon,alt]=ned2geodetic(1000, 0, -100, LAT0, LON0, H0 , E, 'degrees');

waypoint(:,1,1) = [37.803266666669998,-1.223724527781100e+02,100]';

[lat,lon,alt]=ned2geodetic(1000, 500, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,2,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(0, 500, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,3,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(0, 0, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,4,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,5,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,6,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,7,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,8,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,9,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(-200, 80, -100, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,10,1) = [lat,lon,alt]';

for k=11:nPoints
    waypoint(:,k,1) = [lat,lon,alt]';
end

%waypoint(1,:,1) = -waypoint(1,:,1) ;
waypoint(:,:,2) = waypoint(:,:,1)  ;


end

