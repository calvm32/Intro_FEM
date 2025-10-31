function Poisson_Solver_1D()
% Function to evaluate a solution to the Poisson equation using FEM

    function y = Conductivity(x) % heat conductivity times area
        y = 0.1*(5 - 0.6*x); 
    end

    function y = heat_Source(x) % heat source
        y = 0.03*(x-6)^4; 
    end

    function y = Source_1(x) % arbitrary source
        y = exp(-100*(x-0.5).^2); 
    end

    function y = Source_2(x) % arbitrary source
        y = x; 
    end
    
    % functions
    
    p = @(x) 1 + 0*x;
    q = @(x) 1 + 0*x;
    f = @(x) Source_2(x);
    
    % constants
    kappa_a = 0;
    kappa_b = 0;
    
    alpha_a = 0;
    beta_a = 0;
    
    alpha_b = 1;
    beta_b = 2;
    
    % ----
    
    kappa = [kappa_a,kappa_b];
    alpha = [alpha_a, alpha_b];
    beta = [beta_a, beta_b];

    n = 2; % number of intervals
    h = 1/n; % mesh size
    x = 0:h:1; % mesh

    % % refinement
    % tol = 0.5;
    % max_iter = 50;
    % 
    % for iter = 1:max_iter
    %     A = Stiffness_Assembler_1D(x, p, q, kappa);
    %     b = Source_Assembler_1D(x, f, kappa, alpha, beta);
    % 
    %     uh = A \ b;
    % 
    %     [eta, refined_mesh] = Refined_Mesh_1D(x, uh, f, tol);
    % 
    %     if norm(eta) < tol
    %         break
    %     end
    % 
    %     x = refined_mesh;
    % 
    % end
    % x = refined_mesh;

    A = Stiffness_Assembler_1D(x, p, q, kappa);
    b = Source_Assembler_1D(x, f, kappa, alpha, beta);

    disp(A)
    disp(b)

    u = A\b;

    plot(x, u)
    title(['N = ', num2str(n)])

end