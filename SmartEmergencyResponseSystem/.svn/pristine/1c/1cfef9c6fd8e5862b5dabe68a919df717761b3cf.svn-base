function [xEast, yNorth, zUp] = ecef2enuFormula( ...
    x, y, z, lat0, lon0, h0, spheroid, inDegrees)
% Transform position from geocentric (ECEF) to local Cartesian (ENU)
%
%   The outputs are the same as in ECEF2ENU. The inputs are also the
%   same, except that the angleUnit string is replaced by logical scalar,
%   inDegrees, which is true when LAT0 and LON0 are in degrees and false
%   when they are in radians.
%
%   See also ECEF2ENU, ECEF2NED, ECEF2AER

% Copyright 2012 The MathWorks, Inc.

if inDegrees
    % Origin of the local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0);
    
    % Offset vector from local system origin, rotated from ECEF to ENU.
    [xEast, yNorth, zUp] = ecef2enuvFormula( ...
        x - x0, y - y0, z - z0, lat0, lon0, @sind, @cosd);
else
    % Origin of the local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0, 'radian');
    
    % Offset vector from local system origin, rotated from ECEF to ENU.
    [xEast, yNorth, zUp] = ecef2enuvFormula( ...
        x - x0, y - y0, z - z0, lat0, lon0, @sin, @cos);
end
