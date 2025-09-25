function [b] = SourceAssembler1D(x, f, kappa, g)
% Function to assemble the source vector for 1D FEM
%
% Parameters
% ----------
% x         : vector of node coordinates [x_0, x_1, ..., x_N]
% f         : function handle f(x)
% kappa     : constants in the model problem
% g         : end value in the model problem
%
% Returns
% -------
% b         : global source vector

    b = LoadAssembler1D(x, f);   % from Chapter 1
    b(1)   = b(1)   + kappa(1)*g(1);
    b(end) = b(end) + kappa(2)*g(2);

end