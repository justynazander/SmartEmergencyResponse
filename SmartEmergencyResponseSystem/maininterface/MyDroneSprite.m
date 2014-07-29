classdef MyDroneSprite < VehicleSprite
    %MYDRONESPRITE 
    
    methods
        function obj = MyDroneSprite(axesIn,myDroneIn)
            [imageData, ~, alphaData] = imread('droneCircle.png');
            alphaData = uint8(255*(alphaData>50));
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, myDroneIn);
                        
            obj.setScale(.05);
        end
    end
    
end

