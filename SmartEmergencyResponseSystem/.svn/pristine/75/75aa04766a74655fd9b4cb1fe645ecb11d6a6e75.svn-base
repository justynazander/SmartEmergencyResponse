load('problem.mat');

numSols = 1;
exitflag = 0;
lines = [];
while exitflag ~= 1
    options = optimoptions('intlinprog','display','iter',...
                                        'Heuristics','round',...
                                        'MaxNumFeasPoints',numSols);
    [x,~,exitflag,~]=intlinprog(f,1:intcon,A,b,Aeq,beq,lb,ub,options);
    
    for ii = 1:numel(lines)
        delete(lines(ii));
    end
    lines = [];
    
    for q=1:numQuadcopters
        nodePath = eulerianPath(reshape(x((q-1)*numNodes^2+(1:numNodes^2)),numNodes,numNodes),numRequests+q);
        route = locations(nodePath,:);
        lines = [lines,line('xdata',route(:,2),'ydata',route(:,1),'color',.7*rand(1,3))];
    end
    
    drawnow
    
    numSols = numSols + 1;
end