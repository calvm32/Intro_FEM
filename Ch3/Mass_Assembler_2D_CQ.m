function M = Mass_Assembler_2D_CQ(p,t)
% Function to assemble the mass matrix for 2D FEM
% Using corner quadrature
%
% Parameters
% ----------
% p         : nodes
% t         : triangles
%
% Returns
% -------
% M         : global mass matrix

    np = size(p,2);
    nt = size(t,2);
    M = sparse(np,np);

    for K = 1:nt
        loc2glb = t(1:3,K); % local-to-global map
        x = p(1,loc2glb);
        y = p(2,loc2glb);
        area = polyarea(x,y); % triangle area
        MK = [1 0 0;
              0 1 0;
              0 0 1]/3*area; % element mass matrix w/ corner quadrature
        M(loc2glb,loc2glb) = M(loc2glb,loc2glb) ...
        + MK; % add element masses to M
    end

end