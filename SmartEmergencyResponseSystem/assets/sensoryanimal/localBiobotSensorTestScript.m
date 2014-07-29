%% Sender

u = EventDispatcher('127.0.0.1',45678);
value = 0;
garbageToggle = false;

while true
    value = value + randn;   % Brownian motion
    if garbageToggle
        mess = ['CO,' num2str(10000*rand) ',,,']; % Shouldn't parse
    else
        timestamp = datevec(now);
        mess = ['CO,',...
                sprintf('%02d',timestamp(4)),sprintf('%02d',timestamp(5)),sprintf('%f',timestamp(6)),',',...
                num2str(randi(4096)-1)];
    end
    u.dispatch(mess);
    garbageToggle = xor(garbageToggle,garbageToggle>randn+.8);
    pause(.1)
end



%% Receiver

v = SensorConnection('127.0.0.1',45678);
h = line('xdata',[],'ydata',[]);
l = addlistener(v,'datagramReceived',@(src,event)set(h,'xdata',1:numel(get(h,'xdata'))+1,'ydata',[get(h,'ydata'),src.lastData.value]));
