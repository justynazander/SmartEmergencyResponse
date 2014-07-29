function [ waypoint ] = getWaypoints3D(  )
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
waypoint = zeros(3,nPoints,nAC);

waypoint(:,1,1) = [-200; 80 ; -100] ; 

waypoint(:,2,1) = [-400; 100; -100] ; 

waypoint(:,3,1) = [-600; 100; -100] ; 

waypoint(:,4,1) = [-800; 300; -100] ; 

waypoint(:,5,1) = [-1200; 180; -100] ; 

waypoint(:,6,1) = [-1200; -180 ; -100] ; 

waypoint(:,7,1) = [-800; -300; -100] ; 

waypoint(:,8,1) = [-600; -100; -100] ; 

waypoint(:,9,1) = [-400; -100; -100] ; 

waypoint(:,10,1) = [-200; -80; -100] ; 

%waypoint(1,:,1) = -waypoint(1,:,1) ;

waypoint(:,:,2) = waypoint(:,:,1)  ;
waypoint(1:2,:,2) = -waypoint(1:2,:,2) ; 

end

