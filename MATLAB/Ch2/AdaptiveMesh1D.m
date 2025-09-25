function [eta, refined_mesh] = AdaptiveMesh1D(x, f, tol)
% Function to create a mesh using FEM adaptive stepping
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
    eta = zeros(1, n);         % element residuals
    refined_mesh = x;          % copy mesh
    
    for i = 1:n
        h = x(i+1) - x(i);
        a_val = f(x(i));
        b_val = f(x(i+1));
        
        % Trapezoidal integration of f^2 over the element
        t = (a_val^2 + b_val^2) * h / 2;
        eta(i) = h*sqrt(t);
        
        % Refine if above tolerance
        if eta(i) > tol
            refined_mesh(end+1) = (x(i+1) + x(i))/2;
        end
    end
    
    refined_mesh = sort(refined_mesh);
end