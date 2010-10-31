function v = takePoints(f,fj,ds)
    t = 0;
    v = [];
    while t<1
    dt = ds/norm(fj(t));
    v = [v,f(t)];
    t = t+dt;
    end
    if t>=1
        v = [v,f(1)];
    end
end