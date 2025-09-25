function [A] = StiffnessAssembler1D(x, a, kappa)
% Function to assemble the stiffness matrix for 1D FEM
%
% Parameters
% ----------
% x         : vector of node coordinates [x_0, x_1, ..., x_N]
% a         : function handle for coefficient a(x)
% kappa     : constants in the model problem
%
% Returns
% -------
% A         : global stiffness matrix

    n = length(x) - 1;         % number of subintervals
    A = zeros(n+1, n+1);       % initialize stiffness matrix
    
    for i = 1:n
        h = x(i+1) - x(i);
        xmid = (x(i+1) + x(i))/2;
        amid = a(xmid);        % coefficient at midpoint
        
        A(i,i)       = A(i,i)       + amid/h;
        A(i,i+1)     = A(i,i+1)     - amid/h;
        A(i+1,i)     = A(i+1,i)     - amid/h;
        A(i+1,i+1)   = A(i+1,i+1)   + amid/h;
    end
    
    % Add Robin terms
    A(1,1) = A(1,1) + kappa(1);
    A(end,end) = A(end,end) + kappa(2);
    
end