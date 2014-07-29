function [ ] = readtextfile( textfile, googleearthfile )
fileID = fopen(textfile);
C = textscan(fileID, '%f %f', 'delimiter', ',', 'MultipleDelimsAsOne', 1);
fclose(fileID);
latitude=cell2mat(C(1,1));
longitude=cell2mat(C(1,2));

i=1;

%% To observe all the data points in one run 
googleearthplot(i,googleearthfile, latitude,longitude);

%%% To observe each latitude and longitude data with some pause 
% 
% for i =2:length(latitude)
%     googleearthplot(i, googleearthfile, latitude(1:i),longitude(1:i));
%     pause(2);
% end

end

