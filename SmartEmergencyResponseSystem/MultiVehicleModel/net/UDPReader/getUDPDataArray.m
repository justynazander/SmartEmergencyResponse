function [ dataDouble ] = getUDPDataArray( udpManager )
%GETUDPDATAARRAY return array of doubles read by the udp server/manager
%   Detailed explanation goes here

dataBytes = udpManager.getByteArray ; 
dataIn = flipdim(dataBytes, 1) ;
dataDouble = typecast( typecast(dataIn, 'uint8'), 'double'  ) ;
dataDouble = flipdim(dataDouble, 1) ;


end

