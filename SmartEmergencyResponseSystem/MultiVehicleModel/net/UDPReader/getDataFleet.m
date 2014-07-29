function [ ACFleetData ] = getDataFleet( ACfleetUDPManager )
%GETDATAFLEET Summary of this function goes here
%   Detailed explanation goes here

dataUDP = getUDPDataArray (ACfleetUDPManager) ;
ACFleetData = {} ; 
nEach = 4; 
if (length(dataUDP)>0)       
    nAC = length(dataUDP)/nEach ;
    
    for k = 1: nAC
        dataAux = dataUDP ( 1+(k-1)*nEach : nEach*k) ;
        ACFleetData{k}.lat = dataAux(1);  % (deg)
        ACFleetData{k}.lon = dataAux(2);  % (deg)
        ACFleetData{k}.alt = dataAux(3);  % (deg)
        ACFleetData{k}.psi = dataAux(4);  % (deg)
        
        %fprintf('AC %d', k) ; ACFleetData{k}
    end
else
    disp('No data available')
    
end





end

