% Specify other gains here

if(strcmpi(AC.aircraft,'Ultrastick'))
    % Velocity Tracker
    kp_VT =  .15; 
    ki_VT = .04;
    % Altitude Tracker
    kp_AT=  .023; 
    ki_AT = 0.0010;
    % Heading Tracker
    kp_HT = 1.5;
else
    % Velocity Tracker
    kp_VT =  0.091;
    ki_VT = 0.02;
    % Altitude Tracker
    kp_AT=  0.021;
    ki_AT = 0.0017;
    % Heading Tracker
    kp_HT = 1.2;
end

% Low pass filter for altitude and velocity with pole at 2 rad/sec
LP_filter=[0 0.0392;1 -.9608];

