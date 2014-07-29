

%% Reading Fleet Data via UDP

%%

addpath UDPReader; 
thisDir = pwd;
cd UDPReader ;
GVfleetUDPManager = startUDPManager(9050);
cd ../;

%%
pause(1) ;
GVFleetData = getDataFleet(GVfleetUDPManager) 


%%
pause(1) ;
stopUDPManager(GVfleetUDPManager) ;
clear GVfleetUDPManager

