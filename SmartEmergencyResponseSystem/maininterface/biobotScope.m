function biobotScope(biobotIn)
%BIOBOTSCOPE Scope to see incoming sensor data from the biobot
    scopeFig = figure('Name','Streaming Data','NumberTitle','off');
    scopeAxes = axes('parent',scopeFig);
    dataLine = animatedline('parent',scopeAxes,'MaximumNumPoints',360);
    
    dataListener = addlistener(biobotIn.sensors,'datagramReceived',@addPoints);
    starttime = now;
    set(scopeFig,'CloseRequestFcn',@terminate);
    
    function addPoints(src,~)
        dataLine.addpoints(src.lastData.timestamp-starttime,src.lastData.value);
        set(scopeFig,'Name',sprintf('Streaming Data: %s',src.lastData.name));
    end

    function terminate(src,~)
        delete(dataListener);
        delete(src);
    end
end

