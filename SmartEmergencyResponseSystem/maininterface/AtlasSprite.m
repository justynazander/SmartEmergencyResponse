classdef AtlasSprite < VehicleSprite
    %ATLASSPRITE Summary of this class goes here
    properties
        atlas
    end
    methods
        function obj = AtlasSprite(axesIn, AtlasIn)
            [imageData, ~, ~] = imread('atlas.jpg');
            alphaData = uint8(sum(imageData,3) < 750)*255;
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, AtlasIn);
            set(obj.imageData,'ButtonDownFcn',@obj.clickHandler);
                          
            obj.atlas = AtlasIn;
            obj.setScale(1.1);
        end
    end
    
     methods (Access = private)   
        function setRotation(src,~)
            obj.setAngle(src.heading*pi/180);
        end
        
        function clickHandler(obj,~,~)
            switch get(getParentFigure(obj.transform),'SelectionType')
                case 'normal'
                    obj.enableDragging
                case 'open'
                   GUI;
            end
        end
      
                               
        function enableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',@(~,~)obj.drag);
            set(getParentFigure(obj.transform),'WindowButtonUpFcn',@(~,~)obj.disableDragging);
        end
        
        function drag(obj)
            currentPoint = get(get(obj.transform,'parent'),'CurrentPoint');
            % Remember that x/y corresponds to lon/lat, not lat/lon.
            obj.atlas.location = currentPoint([3,1]);
        end
        
        function disableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',[]);
        end
        
     end
    
   
end

