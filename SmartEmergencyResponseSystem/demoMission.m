function demoMission
%========================== Set up mission ================================     
    %imData = imread('SFHiRes.png');
    imData = imread('Copy_of_SFHiRes.png');
    [nodes, graph, deployment] = loadNodeDataFromMapFile('SanFrancisco.map');
    theaterXlim = [-122.459450, -122.381392];
    theaterYlim = [37.773665, 37.811574];

    GV = GroundVehicleManager(nodes);
    QC = QuadCopterManager;
    KU = KukaManager; 
    BB = BiobotManager;
    AT = AtlasManager;
    FW = FixedWingManager;
    
    RM = RequestManager;
    DM = DeploymentManager; 
    
%============================ Set up initial fleets =======================
    BB.addVehicle([37.795, -122.44]);
    %GV.addVehicle(380);
    GV.addVehicle(720);
   
    %GV.addVehicle(nodes.getNearestNode(37.802, -122.453));  
    GV.addVehicle(nodes.getNearestNode(37.802, -122.456)); % fire department location, node 29
        
    %disp(GVv.location);
    
    DM.setDeploymentNode(380);
    DM.setDeploymentNode(720);
    
    %GVv = GV.addVehicle(30);
    
    KU.addVehicle(nodes.nodeLocations(380,:));
    AT.addVehicle(nodes.nodeLocations(720,:));
    QC.addVehicle([37.79, -122.4]);
    QC.addVehicle([37.80, -122.45]);
    FW.addVehicle([37.805556, -122.459424]);

%====================== Send Data to Google Earth =========================

    GeCommunicator(GV,...
                   QC,...
                   BB,...
                   AT,...
                   KU);
    
%====================== Set up optimization and simulation ================
    quadcopterOptimizer = QuadrotorOptimizationDispatchAdaptor('127.0.0.1',...
                                                               10030,...
                                                               10020,...
                                                               RM,...
                                                               QC,...
                                                               GV);

    tic;
    simMission = Simulator(GV,QC,RM,BB,KU,AT,FW,0.1);
    geMission = DSim(GV,QC,BB,KU,AT,FW);
    
    
    freq = 5.5;
    t = timer('Name','Reoptimization Timer',...
              'Period',freq,...
              'ExecutionMode','FixedRate',...
              'TimerFcn',@(~,~)optimizeRoutes(freq));
    
    GeTimer = timer('Name','Google Earth Update Timer',...
               'Period',10,...
               'ExecutionMode','FixedRate',...
               'TimerFcn',@(~,~)updateWaypoints());
          
%============================ Set up listeners ============================
    MIT = shAirConnection('',9527);
    lis1 = addlistener(MIT,'validDatagramReceived',@newRequest);
    MITBounce = EventDispatcher('192.168.2.211',9527);
    lis2 = addlistener(MIT,'validDatagramReceived',@(src,~)bounce(src,[],MITBounce));
    
    addlistener(MIT,'validDatagramReceived',@wander);
    addlistener(RM,'requestAdded',@notifyArm);
    addlistener(BB.getVehicles,'gasLeakDetected',@requestArm);

    %addlistener(MIT,'validDatagramReceived',@wanderFire);
%============================= Set up interface ===========================
    mainMap = missionMap(imData,...
                         nodes,...
                         RM,GV,QC,KU,BB,AT,FW,deployment,...
                         graph,...
                         theaterXlim,theaterYlim);
    append(mainMap,'CloseRequestFcn',@cleanup);
    %set(mainMap,'KeyPressFcn',@freeze);
    
%================================== GO ====================================
    simMission.start;
    start(t);
    pause(2);
    start(GeTimer);
%========================== Callbacks and subfunctions ====================
    function newRequest(src,~)
        itemMap = {'Sterile Band';...
                   'Stabilizer';...
                   'Thrombolytics';...
                   'Carbamazepine';...
                   'Oral Airway';...
                   'Endotracheal Tube';...
                   'Thermal Camera';...
                   'Thermal Blanket';...
                   'Defibrillator';...
                   'Sensory Animal';...
                   'Robotic Arm';...
                   'Robot ATLAS'};
        isPickup = (src.lastValidData.pickupDropoff==2);
        itemRequested = ItemFactory.makeItem(itemMap{src.lastValidData.itemID});
        if src.lastValidData.quantity*itemRequested.weight <=QuadCopter.capacity
            RM.addRequest([src.lastValidData.latitude, src.lastValidData.longitude],...
                          itemRequested,...
                          'MIT shAir',...
                          src.lastValidData.priority,...
                          now,...
                          now,...
                          src.lastValidData.quantity,...
                          ~isPickup,...
                          isPickup);
        end
    end

    function wander(~,~)
        for biobot = BB.getVehicles
            if size(biobot.getRoute,1) < 2
                if size(biobot.getRoute,1) >=1
                    currentNode = nodes.getNearestNode(biobot.getRoute(1,1),biobot.getRoute(1,2));
                    disp('------')
                    disp(currentNode);
                    disp(biobot.getRoute(1,1));
                else
                    currentNode = nodes.getNearestNode(biobot.location(1),biobot.location(2));
                end
                route = routeToNearestRequest(biobot,ItemFactory.makeItem('Sensory Animal'));
                if ~isempty(route)
                    biobot.setRoute([biobot.getRoute; route]);
                else
                    nodePath = graph.getShortestPath(currentNode,randi(graph.numNodes));
                    biobot.setRoute([biobot.getRoute; nodes.nodeLocations(nodePath(:),:)]);
                end
            end
            if rand < 0.1
                RM.addRequest(biobot.location,...
                              ItemFactory.makeItem('Robotic Arm'),...
                              'Biobot',...
                              5,...
                              now,...
                              now,...
                              1,...
                              true,...
                              false);
            end
        end
    end

    %JZA
    function wanderFire(~,~)
        for gv = GV.getVehicles
            if size(gv.getRoute,1) < 2
                if size(gv.getRoute,1) >=1
                    currentNode = nodes.getNearestNode(gv.getRoute(1,1),gv.getRoute(1,2));
                    disp('------gv-------')
                    disp(currentNode);
                    disp(gv.getRoute(1,1));
                else
                    currentNode = nodes.getNearestNode(gv.location(1),gv.location(2));
                end
                route = routeToNearestRequest(gv,ItemFactory.makeItem('Sensory Animal'));
                if ~isempty(route)
                    biobot.setRoute([biobot.getRoute; route]);
                else
                    nodePath = graph.getShortestPath(currentNode,randi(graph.numNodes));
                    gv.setRoute([gv.getRoute; nodes.nodeLocations(nodePath(:),:)]);
                end
            end
        end
    end

    function requestArm(src,~)
        RM.addRequest(src.location,...
                      ItemFactory.makeItem('Robotic Arm'),...
                      'Biobot',...
                      1,...
                      now,...
                      now,...
                      1,...
                      true,...
                      false);
    end

    function notifyArm(~,event)
        if strcmp(event.ID.item.name,'Robotic Arm')
            if ~isempty(KU.getVehicles)
                KU.getVehicles.send([datestr(now),...
                                    ': New destination: ',...
                                    num2str(event.ID.location(1)),',',...
                                    num2str(event.ID.location(2))]);
            end
        end
    end
    function updateWaypoints()
        geMission.setWaypoints();
    end
    function optimizeRoutes(frequency)
        % Quadcopters
        quadcopterOptimizer.optimize(frequency-0.5);
        % ATLAS
        for atlas = AT.getVehicles
            if size(atlas.getRoute,1)<2  % ATLAS is done with its route
                route = routeToNearestRequest(atlas,ItemFactory.makeItem('Robot ATLAS'));
                if ~isempty(route)
                    atlas.setRoute([route; atlas.currentTarget.location]);
                else
                    atlas.setRoute([routeToNearestGroundVehicle(atlas); atlas.currentTarget.location]);
                end
            end
        end
        % KUKA
        for kuka = KU.getVehicles
            if size(kuka.getRoute,1)<2
                route = routeToNearestRequest(kuka,ItemFactory.makeItem('Robotic Arm'));
                if ~isempty(route)
                    kuka.setRoute([route; kuka.currentTarget.location]);
                else
                    kuka.setRoute([routeToNearestGroundVehicle(kuka); kuka.currentTarget.location]);
                end
            end
        end
        %JZA
         for gvehicle = GV.getVehicles
            if size(gvehicle.getRoute,1)<2
                if gvehicle.location == nodes.getNearestNode(37.802, -122.458) % if the car is still in the fire department 
                route = routeToFixedLocation(gvehicle, [720]);
                if ~isempty(route)
                    gvehicle.setRoute([route; gvehicle.currentTarget.location]);
                else
                    gvehicle.setRoute([routeToFixedLocation(gvehicle, [380]); gvehicle.currentTarget.location]);
                end
                end
            end
        end
    end

% JZA
 function route = routeToFixedLocation(vehicle, fixedTargetNode)
        fixedTargetNode = [380, 720]; 
        pause(2)
        currentNode = nodes.getNearestNode(vehicle.location);
        targetNode = [];
        vehicle.currentTarget = [];
        shortestDistance = Inf;
        targetNodes = GV.getVehicles.nearestNode;
        targetNodesMask = false(1,numel(targetNodes));
        for ii = 1:numel(targetNodes)
            targetNodesMask(ii) = any(strcmp(targetNodes(ii).fixedTargetNode));
        end
        for groundVehicle = GV.getVehicles;
            destinationNode = nodes.getNearestNode(groundVehicle.location);
            distance = graph.getDistance(currentNode,destinationNode);
            if distance<shortestDistance
                vehicle.currentTarget = groundVehicle;
                shortestDistance = distance;
                targetNode = destinationNode;
            end
        end
        if isempty(targetNode)  % This shouldn't happen unless there aren't any ground vehicles in the fire department.
            route = [];
        else
            route = nodes.nodeLocations(graph.getShortestPath(currentNode,targetNode),:);
        end
    end

    function route = routeToNearestRequest(vehicle, items)
        requests = RM.getRequests;
        requestMask = false(1,numel(requests));
        for ii = 1:numel(requests)
            requestMask(ii) = any(strcmp(requests(ii).item.name,{items.name}));
        end
        requests = requests(requestMask);
        
        currentNode = nodes.getNearestNode(vehicle.location);
        targetNode = [];
        vehicle.currentTarget = [];
        shortestDistance = Inf;
        for request = requests
            destinationNode = nodes.getNearestNode(request.location);
            distance = graph.getDistance(currentNode,destinationNode);
            if distance<shortestDistance
                vehicle.currentTarget = request;
                shortestDistance = distance;
                targetNode = destinationNode;
            end
        end
        if isempty(targetNode)
            route = [];
        else
            route = nodes.nodeLocations(graph.getShortestPath(currentNode,targetNode),:);        
        end
    end

    function route = routeToNearestGroundVehicle(vehicle)
        currentNode = nodes.getNearestNode(vehicle.location);
        targetNode = [];
        vehicle.currentTarget = [];
        shortestDistance = Inf;
        for groundVehicle = GV.getVehicles;
            destinationNode = nodes.getNearestNode(groundVehicle.location);
            distance = graph.getDistance(currentNode,destinationNode);
            if distance<shortestDistance
                vehicle.currentTarget = groundVehicle;
                shortestDistance = distance;
                targetNode = destinationNode;
            end
        end
        if isempty(targetNode)  % This shouldn't happen unless there aren't any ground vehicles.
            route = [];
        else
            route = nodes.nodeLocations(graph.getShortestPath(currentNode,targetNode),:);
        end
    end

%     function freeze(~,~)
%         stop(t);
%         simMission.stop;
%         delete(lis);
%     end




    function bounce(src,~,conn)
        dat = src.lastValidData;
        msg = sprintf('%f8 %f8 %d %d %d %d',dat.latitude,dat.longitude,dat.pickupDropoff,dat.itemID,dat.quantity,dat.priority);
        conn.dispatch(msg);
    end

    function cleanup(src,~)
        simMission.stop;
        stop(t);
        delete(t);
        delete(MIT);
        delete(MITBounce);
        delete(lis1);
        delete(lis2);
        delete(simMission);
        delete(quadcopterOptimizer);
        delete(GV);
        delete(QC);
        delete(FW);
        delete(BB);
        delete(AT);
        delete(KU);
        delete(RM);
        if isvalid(src)
            delete(src);
        end
    end
end

