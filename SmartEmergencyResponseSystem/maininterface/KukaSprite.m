classdef KukaSprite < VehicleSprite
    %KUKASPRITE Summary of this class goes here
    %   Detailed explanation goes here
    properties
        headingListener
        kuka
    end
    
    methods
        function obj = KukaSprite(axesIn, KukaIn)
            %[imageData, ~, alphaData] = imread('KUKA.png');
            [imageData, ~, ~] = imread('kuka_ex.png');
            alphaData = uint8(sum(imageData,3) < 750)*255;
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, KukaIn);
            %obj.setScale(.05);
            obj.headingListener = addlistener(KukaIn,'heading','PostSet',@obj.setRotation);
            
            set(obj.imageData,'ButtonDownFcn',@obj.clickHandler);
            obj.kuka = KukaIn;
        end
    end
    
    methods (Access = private)
        function setRotation(src,~)
            obj.setAngle(src.heading*pi/180);
        end
 
        function clickHandler(obj,~,~)
            if strcmp(get(getParentFigure(obj.transform),'SelectionType'),'normal')
                obj.enableDragging;
            end
        end
        
        function enableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',@(~,~)obj.drag);
            set(getParentFigure(obj.transform),'WindowButtonUpFcn',@(~,~)obj.disableDragging);
        end
        
        function drag(obj)
            currentPoint = get(get(obj.transform,'parent'),'CurrentPoint');
            % Remember that x/y corresponds to lon/lat, not lat/lon.
            obj.kuka.location = currentPoint([3,1]);
        end
        
        function disableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',[]);
        end
    end    
end

