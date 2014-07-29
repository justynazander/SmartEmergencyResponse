function [  ] = sendWaypointsUDP( waypointList, uavID, IPAddress, port )
%SETWAYPOINTS Summary of this function goes here
%   Detailed explanation goes here

%% Header for sync. 
header = uint8([170 170 171]) ; 

%% ID of UAV
uavID_  = uint16(uavID); 
uavIDBytes = typecast( uavID_, 'uint8'); 

%% Function 
fcn = 1 ; 
fcn  = uint16(fcn); 
fcnBytes = typecast( fcn, 'uint8'); 

%% Processing waypoints

nWPs= size(waypointList, 2) ;
dimWP = size(waypointList,1) ;
waypointUAV = waypointList ; 
waypointVector = reshape(waypointUAV,1, dimWP*nWPs) ; 
%waypoints2  = reshape(waypointVector, p,q,r) ;
waypointVectorBytes = typecast(waypointVector, 'uint8') ; 

wpLength = length(waypointVectorBytes) ; 

%% Packing data fields into frame
dataBytes = [header uavIDBytes fcnBytes waypointVectorBytes ];

%waypointVector2 = typecast(uint8(waypointVectorBytes), 'double') ; 
%waypoints2  = reshape(waypointVector, p,q,r) ;

%% Computing checksum
cksum = uint16(sum(dataBytes)) ; 
cksumBytes = typecast( cksum, 'uint8'); 
dataBytes = [dataBytes cksumBytes] ; 
%dataLength = length(dataBytes) ; 

%% Writting UDP packet 
bytes = 500; 

udpHandle = udp(IPAddress,port);

fopen(udpHandle) ;

nS =floor( size(dataBytes,2)/bytes ) ;
res = mod(size(dataBytes,2), bytes)  ; 


for k =1:nS
    dataTemp = dataBytes( 1+bytes*(k-1):bytes*k ); 
    size(dataTemp) ;
    fwrite(udpHandle,dataTemp);
end

if size(dataBytes) < bytes 
k = 0; 
end

if res>0
    dataTemp = dataBytes( 1+bytes*(k):bytes*(k)+res  ) ; 
    size(dataTemp) ;
    fwrite(udpHandle,dataTemp);
end

%fwrite(udpHandle,dataBytes);
fclose(udpHandle) ; 
delete(udpHandle) ;


end

