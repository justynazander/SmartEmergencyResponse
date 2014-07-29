function [x, y, z] = enu2ecefFormula( ...
    xEast, yNorth, zUp, lat0, lon0, h0, spheroid, inDegrees)
% Transform position from local Cartesian (ENU) to geocentric (ECEF)
%
%   The outputs are the same as in ENU2ECEF. The inputs are also the same,
%   except that the angleUnit string is replaced by logical scalar,
%   inDegrees, which is true when LAT0 and LON0 are in degrees and false
%   when they are in radians.
%
%   See also ENU2ECEF, NED2ECEF, ENU2GEODETIC, NED2GEODETIC

% Copyright 2012 The MathWorks, Inc.

if inDegrees
    % Origin of local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0);
    
    % Offset vector from local system origin, rotated from ENU to ECEF.
    [dx, dy, dz] = enu2ecefvFormula( ...
        xEast, yNorth, zUp, lat0, lon0, @sind, @cosd);
else
    % Origin of local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0, 'radian');

    % Offset vector from local system origin, rotated from ENU to ECEF.
    [dx, dy, dz] = enu2ecefvFormula( ...
        xEast, yNorth, zUp, lat0, lon0, @sin, @cos);
end

% Origin + offset from origin equals position in ECEF.
x = x0 + dx;
y = y0 + dy;
z = z0 + dz;
