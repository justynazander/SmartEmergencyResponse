function [azimuthAngle, elevationAngle, slantRange] ...
    = enu2aerFormula(xEast, yNorth, zUp, atan2fun)
% Transform local Cartesian (ENU convention) to spherical (AER convention)
%
%   The outputs are the same as in ENU2AER. The inputs are also the same,
%   except that angleUnit string is replaced by a function handle to a four
%   quandrant arctangent function, atan2fun, which is either @atan2d (for
%   output angles in degrees) or @atan2 (for output angles in radians).
%
%   See also ECEF2AER, ENU2AER, GEODETIC2AER, NED2AER

% Copyright 2012 The MathWorks, Inc.

deg360 = 2*atan2fun(0,-1);
r = hypot(xEast,yNorth);
slantRange = hypot(r,zUp);
elevationAngle = atan2fun(zUp,r);
azimuthAngle = mod(atan2fun(xEast,yNorth),deg360);
