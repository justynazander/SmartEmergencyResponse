[nodes, graph, deployment] = loadNodeDataFromMapFile('SanFrancisco.map');
numCars = 2;
numDeploys = 2;

gvmgr = GroundVehicleManager;

for jj = 1:1

scatter(nodes.nodeLocations(:,2),nodes.nodeLocations(:,1))
hold on

for ii = 1:numCars
    nodeNum = randi(graph.numNodes);
    cars(ii) = gvmgr.addVehicle(nodeNum,nodes);
end

carLocations = [cars.nearestNode];
plot(nodes.nodeLocations(carLocations,2),nodes.nodeLocations(carLocations,1),'r*')

deployment.unsetDeploymentNode(1:graph.numNodes);
deployment.setDeploymentNode(randi(graph.numNodes,numDeploys,1))
plot(nodes.nodeLocations(deployment.getDeploymentNodes,2),nodes.nodeLocations(deployment.getDeploymentNodes,1),'g*')

p=PathPlanner;
tic;
p=p.planRoutes(graph,deployment,gvmgr.getVehicles);
toc
for ii = 1:numel(p.optimalRoutes)
    plot(nodes.nodeLocations(p.optimalRoutes{ii},2),...
            nodes.nodeLocations(p.optimalRoutes{ii},1),'k')
end

hold off

pause(.5)

for ii = 1:numCars
    gvmgr.removeVehicle(cars(ii).ID);
end


end