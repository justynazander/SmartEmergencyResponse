initloc = [-122.4,37.8];
value = uint16(18);

isNearLeak = false;

%dloc = EventDispatcher('127.0.0.1',10001);
dsen = EventDispatcher('127.0.0.1',10003);

while(true)   
    %dloc.dispatch(sprintf('1,123456,%f7,%f7,%f7',10*rand,initloc(1),initloc(2)));
    dsen.dispatch(sprintf('PG,%f9,%d',(now-datenum('1970','yyyy'))*8.64e4,value));
    %initloc = initloc + .0005*randn(1,2);
    if isNearLeak  % Being near a leak is modeled by a simple Markov process
        value = .4*value + .6*37 + .3*randn;
        isNearLeak = rand < .9;
    else
        value = .9*value + .1*18 + .3*randn;
        isNearLeak = rand < .001;
    end
    pause(.1)
end

%delete(dloc)
delete(dsen)