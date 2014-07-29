theaterlonlim = [-122.459450, -122.381392];
theaterlatlim = [37.773665, 37.811574];

polygonVerts = [37.805559,    -122.459423788;
                37.809569,    -122.41009365;
                37.78885754,  -122.387446868;
                37.774181753, -122.3859266;
                37.773665,    -122.459450];
            
conn = udp('127.0.0.1',9527);
fopen(conn);

while true
    lat = theaterlatlim(1)+rand*diff(theaterlatlim);
    lon = theaterlonlim(1)+rand*diff(theaterlonlim);
    while ~inpolygon(lat,lon,polygonVerts(:,1),polygonVerts(:,2))
        lat = theaterlatlim(1)+rand*diff(theaterlatlim);
        lon = theaterlonlim(1)+rand*diff(theaterlonlim);
    end
    quadOrGround = rand < 2*9/(2*9+3);  % Make it twice as likely to generate a quadcopter request than an ATLAS/biobot/Kuka request
    if quadOrGround  %quad
        item = randi(9);
    else
        item = 9+randi(3);
    end
    msg = sprintf('%f8 %f8 %d %d %d %d',lat,lon,randi(2),item,randi(2),randi(10))
    fprintf(conn,msg);
    pause(10+randn)
end
