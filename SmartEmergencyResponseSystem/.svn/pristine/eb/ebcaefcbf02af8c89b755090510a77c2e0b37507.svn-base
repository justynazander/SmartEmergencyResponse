function [uEast, vNorth, wUp] ...
    = ecef2enuvFormula(u, v, w, lat0, lon0, sinfun, cosfun)
% Rotate Cartesian 3-vector from ECEF to ENU
%
%   The outputs are the same as in ECEF2ENUV. The inputs are also the same,
%   except that angleUnit string is replaced by a function handles to sine
%   and cosine functions. These are either @sind and @cosd (for origin
%   latitude/longitude in degrees) or @sin and @cos (for origin
%   latitude/longitude in radians).
%
%   See also ECEF2ENUV, ECEF2NEDV, ecef2enuFormula, geodetic2enuFormula

% Copyright 2012 The MathWorks, Inc.

cosPhi = cosfun(lat0);
sinPhi = sinfun(lat0);
cosLambda = cosfun(lon0);
sinLambda = sinfun(lon0);

t     =  cosLambda .* u + sinLambda .* v;
uEast = -sinLambda .* u + cosLambda .* v;

wUp    =  cosPhi .* t + sinPhi .* w;
vNorth = -sinPhi .* t + cosPhi .* w;
