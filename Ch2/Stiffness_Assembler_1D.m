function [A] = Stiffness_Assembler_1D(x, p, q, kappa)
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

    n = length(x) - 1;
    A = zeros(n+1, n+1); % initialize stiffness matrix
    
    for i = 1:n
        h = x(i+1) - x(i);
        xmid = (x(i+1) + x(i))/2;

        % midpt values
        pmid = p(xmid);
        qmid = q(xmid);

        % NOTE: local stiffness is pmid/h * [1, -1; -1, 1];
        %       local mass qmid*h/6 * [2, 1; 1, 2];
        
        A(i,i)       = A(i,i)       + pmid/h + 2*qmid*h/6;
        A(i,i+1)     = A(i,i+1)     - pmid/h + qmid*h/6;
        A(i+1,i)     = A(i+1,i)     - pmid/h + qmid*h/6;
        A(i+1,i+1)   = A(i+1,i+1)   + pmid/h + 2*qmid*h/6;
    end
    
    % Add Robin terms
    A(1,1) = A(1,1) + kappa(1);
    A(end,end) = A(end,end) + kappa(2);
    
end