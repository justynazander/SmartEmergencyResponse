

%% =============

udpManager = startUDPManager(9090); 


%%
pause(1) ; 

dataUDP = getUDPDataArray (udpManager) 


%%
pause(1) ; 

stopUDPManager(udpManager) ; 
clear udpManager ; 



