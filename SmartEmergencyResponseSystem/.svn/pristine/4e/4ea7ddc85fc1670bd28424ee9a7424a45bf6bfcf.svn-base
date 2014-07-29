function [ waypoint ] = getWaypoints5D(  )
%GETWAYPOINTS Summary of this function goes here
%   Detailed explanation goes here

region.nx = 10;
region.ny = 5;

Dx = 1000; 
Dy = 500;

region.x0 = 0;
region.y0 = 0;

region.dx = Dx/(region.nx-1);
region.dy = Dy/(region.ny-1);


nPoints = 10;
nAC = 2; 
waypointsListARDrone = zeros(5,nPoints,nAC);


waypointsListARDrone(:,1,1) = [20;10;2;pi/2; 5] ; 
waypointsListARDrone(:,2,1) = [20;50;3;pi/2; 5] ; 
waypointsListARDrone(:,3,1) = [10;50;2;0; 5] ; 
waypointsListARDrone(:,4,1) = [0;0;0;0; 5] ; 

waypointsListARDrone(:,1,2) = [-20;10;2;pi/2; 5] ; 
waypointsListARDrone(:,2,2) = [-20;50;3;pi/2; 5] ; 
waypointsListARDrone(:,3,2) = [-10;50;2;0; 5] ; 
waypointsListARDrone(:,4,2) = [0;0;0;0; 5] ; 

waypoint = waypointsListARDrone ; 

end

