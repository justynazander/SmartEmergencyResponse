%d = EventDispatcher('127.0.0.1',10003);
e = EventDispatcher('127.0.0.1',10003);

loc = [37.8,-122.4];
value = 100;
starttime = 1392615090;
while true
    %d.dispatch(sprintf('1,123456,%f7,%f7,%f7',10*rand,loc(1),loc(2)));
    str = sprintf('LPG,%f7,%d',starttime,round(value))
    e.dispatch(str);
    %loc = loc + .0005*randn(1,2);
    value = value + randn;
    starttime = starttime+1;
    pause(.1)
end