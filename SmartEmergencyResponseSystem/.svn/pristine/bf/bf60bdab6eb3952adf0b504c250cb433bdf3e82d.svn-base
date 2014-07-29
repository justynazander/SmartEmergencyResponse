

figure;
ds = AC_Fleet.nOutUAVFleet ; 
for k = 0: AC_Fleet.nAC-1
    color =rand(3,1) ; 
    plot(simout.signals.values(:,1+ds*k) , simout.signals.values(:,2+ds*k), 'color', color, 'linewidth',3) ; hold on;

end


%figure; 
%plot(simout.time, simout.signals.values(:,10)*180/pi , 'r', 'linewidth',3) ; hold on;
%plot(simout.time, simout.signals.values(:,5)*180/pi , 'b', 'linewidth',3) ;