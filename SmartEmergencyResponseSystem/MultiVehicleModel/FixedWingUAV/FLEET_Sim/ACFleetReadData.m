

%% Reading Fleet Data via UDP

%%
thisDir = pwd; 
cd net/UDPReader ; 
ACfleetUDPManager = startUDPManager(9090); 
cd ../../ ; 

%%

dataUDP = getUDPDataArray (ACfleetUDPManager) ;
nEach = length(dataUDP)/AC_Fleet.nAC ; 
for k = 1: AC_Fleet.nAC
    dataAux = dataUDP ( 1+(k-1)*nEach : nEach*k) ; 
     ACFleetData{k}.X = dataAux(1);  % (m)
     ACFleetData{k}.Y = dataAux(2);  % (m)
     ACFleetData{k}.Z = dataAux(3);  % (m)
     ACFleetData{k}.h = dataAux(4);  % (m)
     ACFleetData{k}.psi = dataAux(5);  % (rad)
     fprintf('AC %d', k) ; ACFleetData{k} 
end

clear dataAux dataUDP nEach k ;


%%
pause(1) ; 
stopUDPManager(ACfleetUDPManager) ; 
clear ACfleetUDPManager

