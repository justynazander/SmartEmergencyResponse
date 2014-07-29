classdef GroundTransportationGraph < handle
    %% Representation of routes traversable by ground vehicles
    properties (SetAccess = private)
        G = sparse(zeros(0,0))      % Sparse adjacency matrix representing lengths of arcs
        allPairsShortestPaths       % Dense, same size as G
    end
    
    properties (Dependent, SetAccess = private)
        numNodes
        numArcs
    end
    
    methods
        function addArcs(obj, varargin)
            if nargin == 3  % obj, endpoints, weight
                newArcs = varargin{1};
                newWeights = varargin{2};
                if size(newArcs,2) ~= 2
                    warning('Arc matrix must have two columns')
                    return
                end
                if size(newArcs,1) ~= size(newWeights,1)
                    warning('Arc matrix and weights must have the same number of rows')
                    return
                end
                newSize = max([size(obj.G,1), max(max(newArcs))]);
                addedArcs = sparse(newArcs(:,1),newArcs(:,2),newWeights,newSize,newSize);
            elseif nargin == 4  % obj, tails, heads, weight
                newArcsTail = varargin{1};
                newArcsHead = varargin{2};
                newWeights = varargin{3};
                if numel(newArcsTail) ~= numel(newArcsHead) || numel(newArcsHead) ~= numel(newWeights)
                    warnings('Arc vectors and weight vectors must have same length')
                    return
                end
                newSize = max([size(obj.G,1), max(newArcsTail), max(newArcsHead)]);
                addedArcs = sparse(newArcsTail,newArcsHead,newWeights,newSize,newSize);
            end
            obj.G(newSize,newSize) = 0; % Resize G
            obj.G = obj.G + addedArcs + addedArcs';
        end
        
        function retval = getDistance(obj, node1, node2)
            if isempty(obj.allPairsShortestPaths)
                obj.allPairsShortestPaths = graphallshortestpaths(obj.G,'Directed','false');
            end
            retval = obj.allPairsShortestPaths(node1,node2);
        end
        
        function retval = getShortestPath(obj, node1, node2)
            [~, retval, ~] = graphshortestpath(obj.G, node1, node2);
        end
        
        function retval = getEdgeList(obj)
            [heads,tails] = find(obj.G);
            retval = [heads, tails];
        end
    end
    
    methods 
        function retval = get.numNodes(obj)
            retval = size(obj.G,1);
        end
        
        function retval = get.numArcs(obj)
            retval = nnz(obj.G);
        end
    end
end

