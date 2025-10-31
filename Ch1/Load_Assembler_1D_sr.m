function b = Load_Assembler_1D_sr(x,f)
% Function to build the load vector
% using Simpson's rule
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
        a = x(i);
        c = x(i+1);

        h = c - a; % length
        xm = (a + c)/2; % midpoint

        % local basis functions on [a, b]
        phi_1 = @(xx) (c - xx)/h;
        phi_2 = @(xx) (xx - a)/h;

        % Simpson's rule for each load component
        b(i) = b(i) + (h/6) * ( ...
            f(a)*phi_1(a) + 4*f(xm)*phi_1(xm) + f(c)*phi_1(c) );

        b(i+1) = b(i+1) + (h/6) * ( ...
            f(a)*phi_2(a) + 4*f(xm)*phi_2(xm) + f(c)*phi_2(c) );
    end
        
end