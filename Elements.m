function [n,w,xi,N,dNdxi]=Elements(ncoord,nelnodes)
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = NumIntPoint(ncoord,nelnodes);
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions and weight of integration points
%
[W,xi]=IntegrationPoints(ncoord,nelnodes,n)


%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=ShapeFunctions(xi,n,ncoord,nodes);

%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       dNdxi(i1*2-1,1) = -0.25*(1.-xi(i1,2));
       dNdxi(i1*2,1) = -0.25*(1.-xi(i1,1));
       dNdxi(i1*2-1,2) = 0.25*(1.-xi(i1,2));
       dNdxi(i1*2,2) = -0.25*(1.+xi(i1,1));
       dNdxi(i1*2-1,3) = 0.25*(1.+xi(i1,2));
       dNdxi(i1*2,3) = 0.25*(1.+xi(i1,1));
       dNdxi(i1*2-1,4) = -0.25*(1.+xi(i1,2));
       dNdxi(i1*2,4) = 0.25*(1.-xi(i1,1));
end
end
%
