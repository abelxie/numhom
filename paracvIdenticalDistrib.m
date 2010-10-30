function Vt = paracvIdenticalDistrib(ppcv,N)
% return IdenticalDistrib over all the continuous segments
% NOTE: r(t) now is not continuous, because the result of this function is
% not continuous, see the following:
% tt = paracvIdenticalDistrib(mypp,10);
% t  = linspace(0,1,length(tt));
% plot(t,tt); Which shows the change of velocity
    pp = ppcv{1};
    assert(all(pp.form == 'paracv'),'paracvIdenticalDistrib Need a paracv obj.')
    pieces = length(pp.breaks) - 1;
    Vt = zeros(1,N*pieces-pieces+1);
    idx = 1:(N-1);
    for ib = 1:pieces
        foo = linspace(pp.breaks(ib),pp.breaks(ib+1),N);
        Vt(idx) = foo(1:end-1);
        idx = idx + (N-1);
    end
    Vt(end) = foo(end);
end