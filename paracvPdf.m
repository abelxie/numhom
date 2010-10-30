% generate parameter points by pdf = abs(paracvJacob)
% N pieces and M points in total
function Vt = paracvPdf(mypp,N,M)
    pdf = comp0(@abs,curry1(@paracvJacob,mypp));
    tmp = linspace(0,1,N+1);
    tmp = tmp(1:end-1) + 1./(2*N);
    p0  = exp(pdf(tmp));
    p0  = ceil(p0./sum(p0) * M);
    dt  = 1/N;
    Vt  = [];
    for ib = 1:N
        foo = linspace((ib-1)*dt,ib*dt,p0(ib));
        Vt  = [Vt,foo(1:end-1)];
    end
    Vt(end)=1;
end