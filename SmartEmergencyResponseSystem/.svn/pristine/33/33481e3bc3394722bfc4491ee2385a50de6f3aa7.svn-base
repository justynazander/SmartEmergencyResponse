function [ waypoint ] = getWaypoints3DGV(  )
%GETWAYPOINTS Summary of this function goes here
%   Detailed explanation goes here



nPoints = 100;
nAC = 2; 
waypoint = zeros(3,nPoints,nAC);

 %SFFDLocation = [  37.80140000000;  -122.45571100000; 0] ; 

LAT0= 37.80140000000;
LON0=-122.45571100000;
H0 =0;

E = wgs84Ellipsoid; 

[lat,lon,alt]=ned2geodetic(200, 0, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,1,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(200, 200, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,2,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(0, 200, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,3,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,4,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,5,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,6,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,7,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,8,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,9,1) = [lat,lon,alt]';

[lat,lon,alt]=ned2geodetic(50, 50, 0, LAT0, LON0, H0 , E, 'degrees');
waypoint(:,10,1) = [lat,lon,0]';

%waypoint(1,:,1) = -waypoint(1,:,1) ;

for k = 11:nPoints
    waypoint(:,k,1) = [lat,lon,0]';

end


waypoint(:,:,2) = waypoint(:,:,1)  ;


end

