

tmp = Kuka;
dloc = EventDispatcher('127.0.0.1',2345);
loc = [37.8,-122.4];
head = 45.8;

figure;
hold on;

for i = 1:100
    tmploc = tmp.location;
    plot(tmploc(1),tmploc(2),'*');    
    
    dloc.dispatch(sprintf('kuka1,%f,%f,%f',loc(1),loc(2),head));
    loc = loc + .0005*randn(1,2);
    head = head + .1*rand;
    pause(.1)

end

delete(tmp);
clear

%% Testing regexp for Kuka
raw = 'kuka1,-3.4369,5.1239709,45.23453462';
expression = '(?<id>\w*),(?<X>[+-]?\d*\.?\d*),(?<Y>[+-]?\d*\.?\d*),(?<heading>[+-]?\d*\.?\d*)';
tmp = regexp(raw,expression,'names','once')