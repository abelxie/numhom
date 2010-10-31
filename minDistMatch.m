% minDistMatch(pattern,vector)
% assume pattern correspond to features 1:N
% the output is a feature such that
% vector(k) has feature(k)
function matchedFeature = minDistMatch(pattern, vector)
    N = length(vector);
    notUsedFeature = ones(1,N);
    matchedFeature = 1:N;
    for iv = 1:N
        minDis = inf;
        for ip =1:N
            if notUsedFeature(ip)
                d = abs(pattern(ip)-vector(iv));
                if d<minDis
                    minDis = d;
                    matchedFeature(iv) = ip;
                end
            end
        end
    end
end