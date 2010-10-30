% Use the arc length as parameter
function Vt = paracvArcLength(mypp,ds)
    t = 0;
    Vt = t;
    while t<1
        dt = ds./abs(paracvJacob(mypp,t));
        t = t+dt;
        Vt = [Vt,t];
    end
    Vt(end)=1;
end