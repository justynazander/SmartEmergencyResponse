
%% Plots of vehicle trajectories
%  

close all;
%clc; 

figGV = figure ; 

%plot()
dimData= 4; 
nAC = size(dataGVInertial.signals.values,2)/dimData ; 
figHeading = figure ;
for k=1:nAC
    color = rand(1,3) ; 
    figure(figGV) ; 
    plot(dataGVInertial.signals.values(:,2+(k-1)*dimData) , dataGVInertial.signals.values(:,1+(k-1)*dimData), 'color', color, 'linewidth',3 ) ; hold on; 
    
    figure(figHeading)
    plot(dataGVInertial.time, dataGVInertial.signals.values(:,4+(k-1)*dimData), 'color', color, 'linewidth',3); hold on; 
end
figure(figGV) ; 
ylabel('North (m)', 'fontsize', 16) ; 
xlabel('East (m)', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;
axis('equal')


figure(figHeading) ; 
ylabel('heading (rad)', 'fontsize', 16) ; 
xlabel('time', 'fontsize', 16) ;
set(gca, 'fontsize', 16) ;


clear nAC k color;





