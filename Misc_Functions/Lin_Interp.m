% Linear interpolant of f(x) = 1-x^2-y^2 on a given mesh

% extract x and y
x = p(1,:); 
y = p(2,:);

% calculate f(x) = 1-x^2-y^2
pif = 1 - x.^2 - y.^2;
vertices = [x; y]';

% plot 3d surface
trisurf(t', vertices(:,1), vertices(:,2), pif); 

title('3D Surface Plot of pif');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
colorbar;