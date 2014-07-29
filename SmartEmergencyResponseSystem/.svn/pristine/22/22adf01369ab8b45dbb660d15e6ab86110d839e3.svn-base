classdef FixedWingSprite < VehicleSprite
    %FIXEDWINGSPRITE 
    
    methods
        function obj = FixedWingSprite(axesIn,fixedWingIn)
            [imageData, ~, alphaData] = imread('fw3.png');
            alphaData = uint8(255*(alphaData>50));
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, fixedWingIn);
            
            obj.setScale(.1);
        end
    end
    
end

