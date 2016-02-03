function [N]=ShapeFunctions(xi,n,ncoord,nodes)

%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=zeros(nodes,1);
for i1=1:n
       N(i1,1) = 0.25*(1.-xi(i1,1))*(1.-xi(i1,2));
       N(i1,2) = 0.25*(1.+xi(i1,1))*(1.-xi(i1,2));
       N(i1,3) = 0.25*(1.+xi(i1,1))*(1.+xi(i1,2));
       N(i1,4) = 0.25*(1.-xi(i1,1))*(1.+xi(i1,2));
end

end
%
