% lambda (function) from t to index of pieces of paracv;
function T = paracvT(ppcv)
pp = ppcv{1};
assert(all(pp.form=='paracv'), 'You must specify a paracv object.');
    function ind = TT(t)
        if t==1
            ind = length(pp.breaks);
        else
            ind = find(t<pp.breaks,1);
        end
        if isempty(ind) || ind==1
            ind = NaN;
        else
            ind = ind-1;
        end
    end
    T = @(t) TT(t);
end