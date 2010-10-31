% one step curve interation
function vj = paracvOne(ppcv,t)
pp = ppcv{1};
assert(all(pp.form=='paracv'), 'You must specify a paracv object.');

if t==1
    ind = length(pp.breaks);
else
    ind = find(t<pp.breaks,1);
end
if isempty(ind) || ind==1
    vj=[NaN,NaN];
else
    ind = ind-1;
    vj=[ppcv{2}{ind}(t),ppcv{3}{ind}(t)];
end

end