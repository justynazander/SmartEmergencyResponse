function [xEast, yNorth, zUp] = aer2enuFormula( ...
    azimuthAngle, elevationAngle, slantRange, sinfun, cosfun)
% Transform local spherical (AER convention) to Cartesian (ENU convention)
%
%   The outputs are the same as in AER2ENU. The inputs are also the same,
%   except that angleUnit is replaced by handles to a sine function and a
%   cosine function, sinfun and cosfun. They are @sind and @cosd (for input
%   azimuth and elevation in degrees) or @sin and @cos (for input azimuth
%   and elevation in radians).
%
%   See also AER2ENU, AER2NED, aer2ecefFormula

% Copyright 2012 The MathWorks, Inc.

zUp = slantRange .* sinfun(elevationAngle);
r   = slantRange .* cosfun(elevationAngle);
xEast  = r .* sinfun(azimuthAngle);
yNorth = r .* cosfun(azimuthAngle);
