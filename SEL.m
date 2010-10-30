%SEL: Assume f has vector output [v1,v2,v3,...,vn] = f(x)
%     SEL(f,n,k) is a mapping x -> vk

%But it seems impossible to implement this feature in MATLAB
function rf = SEL(f,n,k)
    rf = @(x) f(x) * [zeros(k-1,1);1;zeros(n-k,1)];
end
