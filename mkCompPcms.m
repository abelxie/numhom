% make compose of pcms
% locus are columns of trajectories of branches
function cpcm = mkCompPcms(locus)
    sz = size(locus);
    cpcm = cell(1,sz(1)-1);
    for il = 2:sz(1);
        cpcm{il-1} = mkpcm(locus(il-1,:),locus(il,:),...
            2*abs(locus(il,:)-locus(il-1,:)));
    end
end