function M = Mass_Assembler_1D_sr(x)
% Function to build the global mass matrix
% Using Simpson's rule
%
% Parameters
% ----------
% x     : vector of node coordinates
%
% Returns
% -------
% M     : global mass matrix
   
    n = length(x)-1; % number of subintervals
    M = zeros(n+1,n+1); % allocate mass matrix
    
    for i = 1:n % loop over subintervals
        h = x(i+1) - x(i); % interval length

        % same values apply

        M(i,i)       = M(i,i)       + h / 3;
        M(i,i+1)     = M(i,i+1)     + h / 6;
        M(i+1,i)     = M(i+1,i)     + h / 6;
        M(i+1,i+1)   = M(i+1,i+1)   + h / 3;
    end  
end