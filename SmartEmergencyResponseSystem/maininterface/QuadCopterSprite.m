classdef QuadCopterSprite < VehicleSprite
    % Image representing a quadcopter
    
    properties
        drone
    end
    
    methods
        function obj = QuadCopterSprite(axesIn, quadcopterIn)
            [imageData, ~, alphaData] = imread('quad.png');
            alphaData = uint8(255*(alphaData>50));
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, quadcopterIn);
            obj.setScale(.05);
            set(obj.imageData,'ButtonDownFcn',@obj.clickHandler);
            %obj.drone = quadcopterIn;
            
            addlistener(quadcopterIn,'deactivated',@(~,~)obj.disappear);
            addlistener(quadcopterIn,'activated',@(~,~)obj.appear);
            
        end
        
        function disappear(obj)
            obj.visible = 'off';
        end
        
        function appear(obj)
            obj.visible = 'on';
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
                   MainWiFi;
            end
        end
                               
        function enableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',@(~,~)obj.drag);
            set(getParentFigure(obj.transform),'WindowButtonUpFcn',@(~,~)obj.disableDragging);
        end
        
        function drag(obj)
            currentPoint = get(get(obj.transform,'parent'),'CurrentPoint');
            % Remember that x/y corresponds to lon/lat, not lat/lon.
            obj.drone.location = currentPoint([3,1]);
        end
        
        function disableDragging(obj)
            set(getParentFigure(obj.transform),'WindowButtonMotionFcn',[]);
        end
       
        
     end
        
end

