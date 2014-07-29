%% Sender

u = EventDispatcher('127.0.0.1',45678);
location = [0,0];
garbageToggle = false;

while true
    location = location + randn(1,2);   % Brownian motion
    if garbageToggle
        u.dispatch(['0,' num2str(10000*rand) ',,,']);
    else
        timestamp = datevec(now);
        mess = ['1,',...
                sprintf('%02d',timestamp(4)),sprintf('%02d',timestamp(5)),sprintf('%f',timestamp(6)),',',...
                num2str(exp(randn)),',',...
                num2str(location(1)),',',...
                num2str(location(2))];
        u.dispatch(mess);
    end
    garbageToggle = xor(garbageToggle,garbageToggle>randn+1);
    pause(.1)
end



%% Receiver

v = GPSConnection('127.0.0.1',45678);
h = line('xdata',[],'ydata',[]);
l = addlistener(v,'datagramReceived',@(src,event)feval(feval(@(x,i)x{i},...
    {@(src,event)disp(src.lastData),...
    @(src,event)set(h,'xdata',[get(h,'xdata'),src.lastData.latitude],...
    'ydata',[get(h,'ydata'),src.lastData.longitude])},src.lastData.validity+1),src,event));
