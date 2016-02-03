function [n]=NumIntPoint(ncoord,nodes)
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

if ncoord==2
    if nodes==3
        n=1;
    elseif nodes==4
        n=4;
    elseif nodes==6
        n=3;
    elseif nodes==8
        n=9;
    else error('Wrong number of nodes per element')
    end
elseif ncoord==3
    if nodes==4
        n=1;
    elseif nodes==10
        n=4;
    elseif nodes==8
        n=8;
    elseif nodes==20
        n=27;
    else error('Wrong number of nodes per element')
    end
end



