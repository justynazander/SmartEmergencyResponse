function [u, v, w] ...
    = enu2ecefvFormula(uEast, vNorth, wUp, lat0, lon0, sinfun, cosfun)
% Rotate Cartesian 3-vector from ENU to ECEF
%
%   The outputs are the same as in ENU2ECEFV. The inputs are also the same,
%   except that angleUnit string is replaced by a function handles to sine
%   and cosine functions. These are either @sind and @cosd (for origin
%   latitude/longitude in degrees) or @sin and @cos (for origin
%   latitude/longitude in radians).
%
%   See also ENU2ECEFV, NED2ECEFV

% Copyright 2012 The MathWorks, Inc.

cosPhi = cosfun(lat0);
sinPhi = sinfun(lat0);
cosLambda = cosfun(lon0);
sinLambda = sinfun(lon0);

t = cosPhi .* wUp - sinPhi .* vNorth;
w = sinPhi .* wUp + cosPhi .* vNorth;

u = cosLambda .* t - sinLambda .* uEast;
v = sinLambda .* t + cosLambda .* uEast;
