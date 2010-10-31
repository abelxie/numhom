% Use the arc length as parameter
function Vt = paracvArcLength(mypp,ds)
    t = 0;
    Vt = t;
    J0 = comp0(@abs,curry1(@paracvJ,mypp));
    while t<1
        dt = ds./J0(t);
        t = t+dt;
        Vt = [Vt,t];
    end
    Vt(end)=1;
end