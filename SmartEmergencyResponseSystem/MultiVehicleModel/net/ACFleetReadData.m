

%% Reading Fleet Data via UDP

%%

addpath UDPReader; 
thisDir = pwd;
cd UDPReader ;
ACfleetUDPManager = startUDPManager(9090);
cd ../;

%%
pause(1) ;
ACFleetData = getDataFleet(ACfleetUDPManager) 


%%
pause(1) ;
stopUDPManager(ACfleetUDPManager) ;
clear ACfleetUDPManager

