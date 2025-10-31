% use for converting decimal entries of a matrix 
% to their fractional equivalents

function f = Foo2(x,y)
    f = 1 - x.^2 - y.^2;
end

% coefficient matrix
p = [0, 1, 1, 1/2, 1/2, 0; 
     0, 0, 1/2, 1/2, 1, 1];

% triangulation matrix
t = [1, 1, 2, 4; 
     4, 2, 3, 5; 
     6, 4, 4, 6];
 
M = Mass_Assembler_2D(p,t);
b = Load_Assembler_2D(p,t,@Foo2);
Pf = M\b;

[I, J, V] = find(Pf); % extract nonzero entries from sparse matrix

fprintf('\nMass Matrix Entries (approx as rational):\n');
for k = 1:length(V)
    val = full(V(k));
    [n, d] = rat(val, 1e-6);
    fprintf('(%d,%d)\t%10.4f\t approx \t %d / %d\n', I(k), J(k), val, n, d);
end