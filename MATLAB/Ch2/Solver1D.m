% mesh options:
%x = [0, 1/6, 1/2, 1];
%x = [0, 1/2, 1];
x = [0, 1/3, 2/3, 1];

a = @(x) 1 + 1*x;   % constant coefficient a(x) = 1
f = @(x) 0;         % constant source term f(x) = 1

kappa_0 = 0;
kappa_L = 0;
g_0 = 0;
g_L = 1;

kappa = [kappa_0,kappa_L];
g = [g_0, g_L];

A = StiffnessAssembler1D(x, a, kappa);
b = SourceAssembler1D(x, f, kappa, g);

u = A \ b;

% Adaptive refinement
refined = false; % if user wants adaptive refinement
tol = 0.1;

disp('Stiffness matrix A:')
disp(A)
disp('Source vector b:')
disp(b)
disp('Solution u:')
disp(u)

if refined ~= false
    [eta, refined_mesh] = AdaptiveMesh1D(x, f, tol);
    disp('Residuals eta:')
    disp(eta)
    disp('Refined mesh:')
    disp(refined_mesh)
end

plot(x, u, '-o')    % Plot the solution u(x) against the mesh points x
xlabel('x')         % Label for the x-axis
ylabel('u(x)')      % Label for the y-axis (solution)
title('Solution of the PDE')  % Title of the plot
grid on             % Optional: add grid for better readability