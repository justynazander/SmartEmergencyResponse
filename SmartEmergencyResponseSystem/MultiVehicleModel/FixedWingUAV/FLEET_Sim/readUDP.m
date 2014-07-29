

 
%echoudp('on',4012)
 u = udp('localhost',9090);
 fopen(u)
 %fwrite(u,65:74)
 A = fread(u, 10);
 fclose(u)
 delete(u)
 %echoudp('off')