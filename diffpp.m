function re = diffpp(pp)
% differential of piecewise polynomial
    re = pp;
    re.order=pp.order-1;
    re.coefs=pp.coefs(:,1:(end-1)) * diag((pp.order-1):(-1):1);
end