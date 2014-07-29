classdef DeploymentTruckSprite < VehicleSprite
    % Image representing a deployment truck
    
    methods
        function obj = DeploymentTruckSprite(axesIn,carIn)
            [imageData, ~, alphaData] = imread('AutonomousVehicle.png');
            
            alphaData = uint8(255*(alphaData>50));
            
            obj = obj@VehicleSprite(axesIn, imageData, alphaData, carIn);
            obj.setScale(.07);
            
            %alphaData = repmat(alphaData, [1 1 3]);
            
        end
    end
end

