load('problem.mat');
answer = linprog(f,A,b,Aeq,beq,lb,ub);

colormap = [0 1 1;
            1 0 1;
            1 1 0;
            0 0 1;
            0 1 0;
            1 0 0];

numNodes = size(distanceTable,1)
iter = 0;
for ii = reshape(1:intcon,numNodes^2,intcon/numNodes^2)
    iter = iter + 1;
    transitGraph = answer(ii);
    for jj = 1:numel(ii)
        [r,c] = ind2sub([numNodes,numNodes],jj);
        currentValue = answer(jj+min(ii)-1);
        if currentValue > .1
            line(locations([r,c],2),locations([r,c],1),'color',(1-currentValue*colormap(iter,:)));
        end
    end
end