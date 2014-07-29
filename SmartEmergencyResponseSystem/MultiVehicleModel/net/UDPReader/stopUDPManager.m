function [ output_args ] = stopUDPManager( udpManager )
%STOPUDPMANAGER Summary of this function goes here
%   Detailed explanation goes here
udpManager.stop ; 
udpManager.closeConnection ; 


end

