I=imread('deployTruck.png');
ax=axes('xlim',[-100,100],'ylim',[-200,200]);
s=sprite(ax,I);

for i=1:50
    s.moveTo(i,i);
    pause(.05)
end

for i=1:50
    s.translate(0,-2);
    pause(.05)
end

for i=0:.1:6.3
    s.setAngle(i);
    pause(.05)
end

for i=0:.1:6.3
    s.rotate(.1);
    pause(.05)
end
    