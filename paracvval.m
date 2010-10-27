function [val,jacob] = paracvval(ppcv,X)
    pp = ppcv{1};
    assert(all(pp.form=='paracv'), 'You must specify a paracv object.');

    f  = ppcv{2};
    fjacob = ppcv{3};

    N = length(X);
    val = zeros(1,N);
    jacob = zeros(1,N);
    
    for iX = 1:N
        t = X(iX);
        if t==1
            ind = length(pp.breaks);
        else
            ind = find(t<pp.breaks,1);
        end
        if isempty(ind) || ind==1
            val(iX) = NaN;
            jacob(iX) = NaN;
        else 
            ind = ind-1;
            val(iX) = f{ind}(t);
            jacob(iX) = fjacob{ind}(t);
        end
    end
end