

%% Reading Fleet Data via UDP

%%

addpath UDPReader; 
thisDir = pwd;
cd UDPReader ;
RCfleetUDPManager = startUDPManager(9030);
cd ../;

%%
pause(1) ;
RCFleetData = getDataFleet(RCfleetUDPManager) 


%%
pause(1) ;
stopUDPManager(RCfleetUDPManager) ;
clear RCfleetUDPManager

