function [xEast, yNorth, zUp] = geodetic2enuFormula( ...
    lat, lon, h, lat0, lon0, h0, spheroid, inDegrees)
% Transform position from geodetic to local Cartesian (ENU)
%
%   The outputs are the same as in GEODETIC2ENU. The inputs are also the
%   same, except that the angleUnit string is replaced by logical scalar,
%   inDegrees, which is true when LAT, LON, LAT0 and LON0 are in degrees
%   and false when they are in radians.
%
%   See also GEODETIC2ENU, GEODETIC2NED, GEODETIC2AER

% Copyright 2012 The MathWorks, Inc.

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
