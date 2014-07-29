%% =======================================================================
%  Characteristices of the ARDrone



RCFleet.ARDrone.a1 = 2; 

RCFleet.ARDrone.a2 = 1.2; 
RCFleet.ARDrone.a3 = 2;

% Saturations
RCFleet.ARDrone.MAX_ANGLE_REF = 1; 
RCFleet.ARDrone.MIN_ANGLE_REF = -1; 

RCFleet.ARDrone.MAX_YAW_RATE_REF = 1; 
RCFleet.ARDrone.MIN_YAW_RATE_REF = -1; 

% 
RCFleet.ARDrone.MAX_VERTICAL_SPEED = 1; 
RCFleet.ARDrone.MIN_VERTICAL_SPEED = -1; 

%% Initial local conditions
%  All vehicles in a line whose origin is the initial geodetic coordinats.
%  Vehicles separated by 10 (m). All vehicles heading to the North
N0 = 0; 
dN = 10; 
for k = 1: RCFleet.nRC
    RCFleet.IC.Pos_Heading(:,k) = [N0;0;0;0]; 
    N0 = N0+dN ;
end

RCFleet.nOutUAVFleet = ones(1,RCFleet.nRC)*5 ;



