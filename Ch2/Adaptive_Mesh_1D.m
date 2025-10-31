function [eta, refined_mesh] = Adaptive_Mesh_1D(x, f, tol)
% Function to create a mesh using FEM adaptive stepping
% for -u''=f
%
% Parameters
% ----------
% x     : vector of node coordinates
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
        a_val = f(x(i));
        b_val = f(x(i+1));
        
        eta(i) = h*sqrt(t);
        
        if eta(i) > tol
            refined_mesh(end+1) = (x(i+1) + x(i))/2;
        end
    end
    
    refined_mesh = sort(refined_mesh);
end