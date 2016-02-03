function [w,xi]=IntegrationPoints(ncoord,nodes,n)
%====================== No. integration points =============================
%
%   Defines the number of integration points and weights to be used for
%   each element type
%

xi=zeros(ncoord,n);
w=zeros(n,1);
%2D
if ncoord==2
    %Triangular elements
    if nodes==3 || nodes==6
        if n==1
            aux=1./3;
            xi=[aux;aux];
            w(1)=.5;
        elseif n==3
            aux=1./6;
            w=[aux;aux;aux];
            xi=[0.6,0.2,.2;
                0.2,0.6,.2];
        elseif n==4
            aux=1./3;
            xi=[aux,0.6,.2,.2;
                aux,0.2,.6,.2];
            aux=25./96.;
            w=[-27./96.;aux;aux;aux];
        end
    %Rectangular elements
    elseif nodes==4 || nodes==8 
        if n==1
            aux=1./3;
            xi=[0;0];
            w(1)=4;
        elseif n==4
            w=[1;1;1;1];
            aux=-.5773502692;
            xi=[aux,-aux,aux,-aux;
                aux,aux,-aux,-aux];
        elseif n==9
            w1D=[0.555555555,0.888888888,0.555555555];
            for j1=1:3
                for i1=1:3
                    a=3*(j1-1)+i1;
                    w(a)=w1D(i1)*w1D(j1);
                end
            end
            aux=-.7745966692;
            xi=[aux,0,-aux,aux,0,-aux,aux,0,-aux;
                aux,aux,aux,0,0,0,-aux,-aux,-aux];
        end
    end
elseif ncoord==3
    %3D not implemented yet
end
end



