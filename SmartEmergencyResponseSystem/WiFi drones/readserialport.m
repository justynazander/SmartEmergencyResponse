function [ ] = readserialport( comport , googleearthfile)
% Specify the port parameters for serial communication
s = serial(comport);
set(s,'DataBits',8);
set(s,'StopBits',1);
set(s,'BaudRate',9600);
set(s,'Parity','none');
fopen(s);

% The program will terminate if the no data is received at the port after
% timeout
i=1;
while(true)
   a = fgets(s); 
   disp(a);
   C = textscan(a, '%f %f', 'delimiter', ',', 'MultipleDelimsAsOne', 1);
   latitude(i)=cell2mat(C(1,1));
   longitude(i)=cell2mat(C(1,2));
   googleearthplot(i, googleearthfile, latitude,longitude);
   i=i+1;
end
fclose(s);

end

