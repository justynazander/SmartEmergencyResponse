function pathVertices = eulerianPath(A,v)
    initialPathVertices = v;
    edgeMatrix = A;
    while any(edgeMatrix(v,:))
        nextVertex = find(edgeMatrix(v,:),1);
        edgeMatrix(v,nextVertex) = 0;
        v = nextVertex;
        initialPathVertices = [initialPathVertices; v];
    end
    pathVertices = initialPathVertices;
    
    for ii = 1:numel(initialPathVertices)
        subcircuit = [];
        v = initialPathVertices(ii);
        while any(edgeMatrix(v,:))
            nextVertex = find(edgeMatrix(v,:),1);
            edgeMatrix(v,nextVertex) = 0;
            v = nextVertex;
            subcircuit = [subcircuit; v];
        end
        pathVertices = [pathVertices(1:ii); subcircuit; pathVertices(ii+1:end)];
    end
end

