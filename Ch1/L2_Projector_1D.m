function L2_Projector_1D()
% Function to compute the L2 projection of a polynomial
%
% Returns
% -------
% Pf    : L2 projection

    function y = eqn1(x)
        y = 1 - x.^2;
        %y = x.^3 .* (x - 1) .* (1 - 2*x);
        %y = atan((x - 0.5) / 0.1);
        %y = atan((x - 0.5) / 0.01);   
    end
    
    n = 10; % number of subintervals
    h = 1/n; % mesh size
    x = 0:h:1; % mesh
    M = Mass_Assembler_1D(x); % assemble mass
    b = Load_Assembler_1D(x,@eqn1); % assemble load
    Pf = M\b; % solve linear system

    plot(x, Pf, 'b-'); % plot L^2 projection
    title(['N = ', num2str(n)])
    
end