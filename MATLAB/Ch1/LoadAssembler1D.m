function b = LoadAssembler1D(x,f)
% Function to build the load vector
%
% Parameters
% ----------
% x     : vector of node coordinates
% f     : function handle f(x)
%
% Returns
% -------
% b     : load vector

    n = length(x)-1;
    b = zeros(n+1,1);
    
    for i = 1:n
        h = x(i+1) - x(i);
        b(i) = b(i) + f(x(i))*h/2;
        b(i+1) = b(i+1) + f(x(i+1))*h/2;
    end
        
end