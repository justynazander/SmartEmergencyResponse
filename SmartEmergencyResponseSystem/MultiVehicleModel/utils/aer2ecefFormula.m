function [x, y, z] = aer2ecefFormula( ...
    az, elev, slantRange, lat0, lon0, h0, spheroid, inDegrees)
% Transform position from local spherical (AER) to geocentric (ECEF)
%
%   The outputs are the same as in AER2ECEF. The inputs are also the same,
%   except that the angleUnit string is replaced by logical scalar,
%   inDegrees, which is true when AZ, ELEV, LAT0 and LON0 are in degrees
%   and false when they are in radians.
%
%   See also AER2ECEF, AER2GEODETIC

% Copyright 2012 The MathWorks, Inc.

if inDegrees
    % Sine and cosine function handles, for input in degrees.
    sinfun = @sind;
    cosfun = @cosd;
    
    % Origin of the local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0);
else
    % Sine and cosine function handles, for input in radians.
    sinfun = @sin;
    cosfun = @cos;
    
    % Origin of the local system in geocentric coordinates.
    [x0, y0, z0] = spheroid.geodetic2ecef(lat0, lon0, h0, 'radian');
end

% Transform local spherical AER to Cartesian ENU.
[xEast, yNorth, zUp] = aer2enuFormula( ...
        az, elev, slantRange, sinfun, cosfun);

% Offset vector from local system origin, rotated from ENU to ECEF.
[dx, dy, dz] = enu2ecefvFormula( ...
    xEast, yNorth, zUp, lat0, lon0, sinfun, cosfun);

% Origin + offset from origin equals position in ECEF.
x = x0 + dx;
y = y0 + dy;
z = z0 + dz;
