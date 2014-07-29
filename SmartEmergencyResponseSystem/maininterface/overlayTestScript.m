%%
h = axes('position',[0 0 1 1],...
         'xtick',[],'ytick',[],...
         'xlim',[-122.459870,-122.377473],...
         'ylim',[37.773545,37.811837],...
         'xlimmode','manual',...
         'ylimmode','manual');
     
[nodes, graph, deployment] = loadNodeDataFromMapFile('SanFrancisco.map');

imData = imread('SF12.JPG');
m = image('CData',imData,...
          'parent',h,...
          'ydata',linspace(37.811837,37.773545,size(imData,1)),...
          'xdata',linspace(-122.459870,-122.377473,size(imData,2)));

%%
ov = TransitGraphNodeOverlay(h, nodes, deployment);

ov.showNodes
ov.showDeployments

ov.enableDeploymentSelection


pause(10)

ov.disableDeploymentSelection

ov.unshowDeployments
pause(1)
ov.showDeployments
pause(1)
ov.unshowNodes
pause(1)
ov.unshowDeployments
pause(1)

ov.showNodes
ov.showDeployments

%%

gvmgr = GroundVehicleManager
ov2 = TransitGraphArcOverlay(h,nodes,graph,gvmgr)

routes = load('routes.mat');
for ii=1:50
    cars(ii) = gvmgr.addVehicle(routes.vehicleRoutes{ii}(1),nodes);
    cars(ii).setRoute(routes.vehicleRoutes{ii});
end

ov2.showArcs
pause(2)
ov2.unshowArcs