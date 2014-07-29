classdef BiobotSprite < VehicleSprite
    %BIOBOTSPRITE Class depicting a dog.
    properties
        baseBiobot
    end

    methods
        function obj = BiobotSprite(axesIn,biobotIn)
            [imageData, ~, alphaData] = imread('dogsCircle.png');
            %[imageData, ~, ~] = imread('angry_dog.png');
            %alphaData = uint8(sum(imageData,3) < 750)*255;
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, biobotIn);
            
            obj.baseBiobot = biobotIn;
            obj.setScale(.05);
            set(obj.imageData,'ButtonDownFcn',@obj.clickHandler);
        end
        
        function clickHandler(obj,src,~)
            if strcmp(get(getParentFigure(src),'SelectionType'),'open')
                biobotScope(obj.baseBiobot);
            end
        end
    end
    
end

