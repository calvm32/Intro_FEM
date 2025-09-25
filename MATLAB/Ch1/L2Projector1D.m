function L2Projector1D()

    function y = eqn1(x)
        %y = 1;
        %y=x.^3 .* (x - 1) .* (1 - 2*x);
        y = atan((x - 0.5) / 0.1);
        %y = atan((x - 0.5) / 0.01);   
    end

    n = 100; % number of subintervals
    h = 1/n; % mesh size
    x = 0:h:1; % mesh
    M = MassAssembler1D(x); % assemble mass
    b = LoadAssembler1D(x,@eqn1); % assemble load
    Pf = M\b; % solve linear system
    plot(x,Pf) % plot L^2 projection
    
end