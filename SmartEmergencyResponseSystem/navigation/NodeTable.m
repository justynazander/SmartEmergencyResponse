classdef NodeTable < handle
    properties (SetAccess = private)
        nodeLocations = zeros(0,2)  % nx2 matrix of lat/lon values of nodes
        nodeWeights = ones(0,1)     % nx1 matrix of node weights
        nodePop = ones(0,1)         % nx1 matrix of node pops (populations?)
    end
    
    methods
        function retval = getNearestNode(obj, varargin)
            if nargin <= 2
                lat = varargin{1}(1);
                lon = varargin{1}(2);
            else
                lat = varargin{1};
                lon = varargin{2};
            end
            deltaLat = obj.nodeLocations(:,1) - lat;
            deltaLon = obj.nodeLocations(:,2) - lon;
            [~,retval] = min(deltaLat.^2+deltaLon.^2);
        end
        
        function addNodes(obj, varargin)
            if nargin == 4  % obj, locations, weights, pop
                newNodes = varargin{1};
                if size(newNodes,2) ~= 2
                    warning('Node matrix must have two columns')
                    return
                end
                obj.nodeLocations = [obj.nodeLocations; newNodes];
                obj.nodeWeights = [obj.nodeWeights; varargin{2}(:)];
                obj.nodePop = [obj.nodePop; varargin{3}(:)];
            elseif nargin == 5  % obj, lats, lons, weights, pop
                newNodesLat = varargin{1};
                newNodesLon = varargin{2};
                if numel(newNodesLat) ~= numel(newNodesLon)
                    warning('Node vectors must have the same length')
                    return
                end
                obj.nodeLocations = [obj.nodeLocations; newNodesLat(:) newNodesLon(:)];
                obj.nodeWeights = [obj.nodeWeights; varargin{3}(:)];
                obj.nodePop = [obj.nodePop; varargin{4}(:)];                
            end
        end
    end
end  