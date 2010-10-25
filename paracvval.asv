function [val,jacob] = paracvval(pp,X)
    assert(pp.form == 'paracv','You must specify a paracv object.');
    N = length(X);
    val = zeros(1,N);
    jacob = zeros(1,N);
    
    for iX = 1:N
        t = X(iX);
        if t==1
            ind = N;
        else
            ind = find(t>=pp.breaks & t<pp.breaks,1);
        end
        if isempty(ind)
            val(iX) = NaN;
            jacob(iX) = NaN;
        else 
            val(iX) = pp.f{ind}(t);
            jacob(iX) = pp.fjacob{ind}(t);
        end
    end
end