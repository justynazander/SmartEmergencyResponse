function [  ] = googleearthplot( times,googleearthfile, latitude, longitude)
  
   % save the latitude and longitude in .kml file
   kmlwrite(googleearthfile,latitude,longitude);
   % In the first run open google earth 
   if(times==1)
       winopen(googleearthfile);
   else
   end
end

