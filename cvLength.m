% length of curve by linear approximation
function s = cvLength(X)
    s = sum(abs(diff(X)));
end