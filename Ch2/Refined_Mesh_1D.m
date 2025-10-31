function [eta, refined_mesh] = Refined_Mesh_1D(x, uh, f, tol)
% Function to create a mesh using fixed-rate refinement
% for -u''+u=f
%
% Parameters
% ----------
% x     : vector of node coordinates
% uh    : finite element approximation
% f     : function handle f(x)
% tol   : tolerance for refinement
%
% Returns
% -------
% eta           : element residuals
% refined_mesh  : refined mesh after adaptation

    n = length(x) - 1;
    eta = zeros(1, n);
    refined_mesh = x;
    
    for i = 1:n
        h = x(i+1) - x(i);
        a_val = f(x(i)) - uh(i);
        b_val = f(x(i+1)) - uh(i+1);
        
        eta(i) = h*sqrt(t);
    end

    % fixed-rate refinement
    for i = 1:n
        if eta(i) > tol * max(eta)
            refined_mesh(end+1) = (x(i+1) + x(i))/2;
        end
    end
    
    refined_mesh = sort(refined_mesh);
end