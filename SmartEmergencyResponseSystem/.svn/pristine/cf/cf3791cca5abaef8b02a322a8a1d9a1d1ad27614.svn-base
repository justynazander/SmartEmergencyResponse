
%% Plots of vehicle trajectories
%  

close all;
clc; 

figAC = figure ; 
figAC2 = figure ; 
dataFixedWingUAV
%plot()
dimData= 4; 
nAC = size(dataFixedWingUAV.signals.values,2)/dimData ; 
for k=1:nAC
    color = rand(1,3) ; 
    figure(figAC) ; 
    plot(dataFixedWingUAV.signals.values(:,2+(k-1)*dimData) , dataFixedWingUAV.signals.values(:,1+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
    figure(figAC2) ; 
    plot(dataFixedWingUAV.time, dataFixedWingUAV.signals.values(:,3+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
end

figure(figAC)
ylabel('North (m)', 'fontsize', 16) ; 
xlabel('East (m)', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;

clear nAC k color;

dataRotocraft = dataRotorcraft; 
dimData = 4;
nAR = size(dataRotocraft.signals.values,2)/dimData ; 
figAR1 = figure ; 
figAR2 = figure ; 
%figAR3 = figure ; 

for k=1:nAR
    color = rand(1,3) ; 
    figure(figAR1) ; 
    plot(dataRotocraft.signals.values(:,2+(k-1)*dimData) , dataRotocraft.signals.values(:,1+(k-1)*dimData),'*', 'color', color, 'linewidth',3 ) ; hold on; 
    figure(figAR2) ; 
    plot(dataRotocraft.time , dataRotocraft.signals.values(:,1+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
    plot(dataRotocraft.time , dataRotocraft.signals.values(:,2+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
    
    %figure(figAR3) ; 
    %plot(dataRotocraft.time , dataRotocraft.signals.values(:,3+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
    
end

figure(figAR1) ; 
ylabel('North (m)', 'fontsize', 16) ; 
xlabel('East (m)', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;


figure(figAR2) ; 
xlabel('time (sec)', 'fontsize', 16) ; 
ylabel('East/North (m)', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;

%{
figure(figAR3) ; 
xlabel('time (sec)', 'fontsize', 16) ; 
ylabel(' h (m)', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;
%}

clear nAR k color dimData;



