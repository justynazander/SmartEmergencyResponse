function retval = randomPoint(theaterx,theatery)
    retval = rand(1,2).*[diff(theaterx),diff(theatery)]+[theaterx(1) theatery(1)];
    retval = fliplr(retval);
end