
%function [xEast, yNorth, zUp] = geodetic2enuFormula( ...
%    lat, lon, h, lat0, lon0, h0, spheroid, inDegrees)

lat=0;
lon=0;
h=0;
lat0=0;
lon0=0;
h0=0;
spheroid ; 

inDegrees = (nargin < 8 || map.geodesy.isDegree(angleUnit));
%[yEast, xNorth, zUp] = geodetic2enuFormula2( ...
%    lat, lon, h, lat0, lon0, h0, spheroid, inDegrees);
%zDown = -zUp;

if inDegrees
    % Cartesian offset vector from local origin to (LAT, LON, H).
    [dx, dy, dz] = spheroid.ecefOffset(lat0, lon0, h0, lat, lon, h);
    
    % Offset vector from local system origin, rotated from ECEF to ENU.
    [xEast, yNorth, zUp] = ecef2enuvFormula(dx, dy, dz, lat0, lon0, @sind, @cosd);
else
    % Cartesian offset vector from local origin to (LAT, LON, H).
    [dx, dy, dz] = spheroid.ecefOffset(lat0, lon0, h0, lat, lon, h, 'radian');
    
    % Offset vector from local system origin, rotated from ECEF to ENU.
    [xEast, yNorth, zUp] = ecef2enuvFormula(dx, dy, dz, lat0, lon0, @sin, @cos);
end

yEast = xEast;
xNorth = yNorth; 
zDown = -zUp;
