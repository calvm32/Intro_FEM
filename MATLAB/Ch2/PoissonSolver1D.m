function PoissonSolver1D()
% Function to evaluate a solution to the Poisson equation using FEM

    function y = Conductivity(x) % heat conductivity times area
        y = 0.1*(5 - 0.6*x); 
    end

    function y = Source(x) % heat source
        y = 0.03*(x-6)^4; 
    end


    h = 0.1; % mesh size
    x = 2:h:8; % mesh
    kappa = [1.e+6 0];
    g = [-1 0];
    A = StiffnessAssembler1D(x, @Conductivity, kappa);
    b = SourceAssembler1D(x, @Source, kappa, g);
    u = A\b;
    plot(x,u)

end