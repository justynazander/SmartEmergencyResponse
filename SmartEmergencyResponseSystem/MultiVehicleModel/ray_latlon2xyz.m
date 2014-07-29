function [x,y,z] = ray_latlon2xyz(lat,lon,alt,ref_lat,ref_lon,ref_alt,projection)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function ray_latlon2xyz
%
% This function takes latitude and longitude coordinates and converts them
% into a NED (North [positve x], East [positive y], Down [positive z])
% cartesian coordinate system, for either a flat earth or a spherical earth. 
% In this tranformation, x, y, and z are in kilometers.
%
% Usage: [x,y,z]=ray_latlon2xyz(lat,lon,alt,ref_lat,ref_lon,ref_alt,projection)
%
% Inputs:
%   lat:            Input latitude coordinate
%   lon:           Input longitude coordinate
%   alt:            Input altitude (in kilometers)
%   ref_lat:      Reference latitude where x will be equal to 0
%   ref_lon:     Reference longitude where y will be equal to 0
%   ref_alt:      Reference altitude where z will be equal to 0
%   projection: Desired projection type.  Valid options are 'flat' for a
%                   flat-earth projection, or 'spherical' for a
%                   spherical-earth projection.
%
% Outputs:
%   x:          X coordinate of input
%   y:          Y coordinate of input
%   z:          Z coordinate of input
%
% Author:
% Matt Gardine
% February 2009
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if strcmp(projection,'spherical')
    % Convert lat, lon, height in WGS84 to ECEF X,Y,Z
    %lat and long given in decimal degrees.
    lat = lat/180*pi; %converting to radians
    lon = lon/180*pi; %converting to radians
    ref_lat = ref_lat/180*pi;
    ref_lon = ref_lon/180*pi;
    a = 6378137.0; % earth semimajor axis in meters 
    f = 1/298.257223563; % reciprocal flattening 
    e2 = 2*f -f^2; % eccentricity squared 
 
    chi = sqrt(1-e2*(sin(lat)).^2); 
    X = (a./chi +alt).*cos(lat).*cos(lon); 
    Y = (a./chi +alt).*cos(lat).*sin(lon); 
    Z = (a*(1-e2)./chi + alt).*sin(lat);
  
    % Convert reference lat, lon, altitude to ECEF X,Y,Z
    ref_chi = sqrt(1-e2*(sin(ref_lat)).^2); 
    Xr = (a./ref_chi +ref_alt).*cos(ref_lat).*cos(ref_lon); 
    Yr = (a./ref_chi +ref_alt).*cos(ref_lat).*sin(ref_lon); 
    Zr = (a*(1-e2)./ref_chi + ref_alt).*sin(ref_lat);
  
    % convert ECEF coordinates to local east, north, up (x,y,z) 
    phiP = atan2(Zr,sqrt(Xr^2 + Yr^2)); 
    lambda = atan2(Yr,Xr); 
 
    x1 = -sin(lambda).*(X-Xr) + cos(lambda).*(Y-Yr); 
    y1 = -sin(phiP).*cos(lambda).*(X-Xr) - sin(phiP).*sin(lambda).*(Y-Yr) + cos(phiP).*(Z-Zr); 
    z1 = cos(phiP).*cos(lambda).*(X-Xr) + cos(phiP).*sin(lambda).*(Y-Yr) + sin(phiP).*(Z-Zr);
  
    enu = [x1; y1; z1];
    % Rotation matrix to convert from ENU to NED coordinates
    rotation = [0 1 0; 1 0 0; 0 0 -1];
  
    ned = rotation*enu;
    x = ned(1);
    y = ned(2);
    z = ned(3);
  
elseif strcmp(projection,'flat')
    R = 6367;
    %convert to radians
    lat = lat*pi/180;
    lon = lon*pi/180;
    ref_lat = ref_lat*pi/180;
    ref_lon = ref_lon*pi/180;

    enu(1) = (lon-ref_lon)*cos(ref_lat)*R;
    enu(2) = (lat-ref_lat)*R;
    enu(3) = alt;

    rotation = [0 1 0; 1 0 0; 0 0 -1];
    ned = enu*rotation;

    x = ned(1);
    y = ned(2);
    z = ned(3);
end