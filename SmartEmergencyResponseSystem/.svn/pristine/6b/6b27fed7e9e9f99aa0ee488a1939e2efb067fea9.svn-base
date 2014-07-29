%% ======================== Lateral Control =============================%%

%%                         YAW DAMPER
k_YD=0.065;

a_YD=-2.0;
K_YD=zpk(0,a_YD,k_YD);   % Washout filter
K_YDz = c2d(K_YD,AC.FC.control.Ts);
[YDz_num,YDz_den]=tfdata(K_YDz,'v'); % obtain discrete T.F. coefficients
%%                         ROLL TRACKER
if(strcmpi(AC.aircraft,'Ultrastick'))
    kp_RT= -.64; 
    ki_RT= -.2;
    kp_RD=  -0.07; % Roll damper
else
    kp_RT=-0.52;
    ki_RT=-0.20;
    kp_RD= -0.07;
end
%% ====================== Longitudinal Control ==========================%%

%%                         THETA TRACKER
if(strcmpi(AC.aircraft,'Ultrastick'))
    kp_PT=-.9;    
    ki_PT=-.3;
    kp_PD=-.08; % Pitch damper
else
    kp_PT=-.84;    
    ki_PT=-.23;
    kp_PD=-.08;
end

