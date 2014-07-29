function append(handle, property, fhandle)
%APPEND appends a function call to a callback property.  Usage similar to
%SET
    currentCallback = get(handle,property);
    set(handle,property,@(src,event)cellfun(@feval,{currentCallback,fhandle},repmat({src},[1,2]),repmat({event},[1,2])));

end

