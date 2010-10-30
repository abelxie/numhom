%SEL: Assume f has vector output [v1,v2,v3,...,vn] = f(x)
%     SEL(f,k) is a mapping x -> vk

%But it seems impossible to implement this feature in MATLAB
function rf = SEL(f,n)
    rf = @(x) [,tmp]=f(x)
end
