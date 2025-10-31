function L2_Projector_2D()
% Function to compute the L2 projection of a 2D function
%
% Returns
% -------
% Pf    : L2 projection

    xv = [0 1 1 0.5 0.5 0];
    yv = [0 0 0.5 0.5 1 1];

    % polygon
    gd = [2; 6; xv'; yv'];  % 2 = polygon, 6 = number of vertices
    ns = (char('P1'))';
    sf = 'P1';
    g = decsg(gd,sf,ns);

    % solution
    [p,e,t] = initmesh(g, 'hmax', 0.1); 
    M = Mass_Assembler_2D(p,t);
    b = Load_Assembler_2D(p,t,@Foo2);
    Pf = M\b;

    % plot
    trisurf(t(1:3,:)', p(1,:), p(2,:), Pf, 'EdgeColor', 'none');
    view(3);
    axis equal;
    colorbar;

end

function f = Foo2(x,y)
    f = 1 - x.^2 - y.^2;
end