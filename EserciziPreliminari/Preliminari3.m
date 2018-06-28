u = 0:0.0001:1;
x = sin(u);
y = tan(u);
z = u;
plotParametricFunctionR3(y, x,z )
function plotParametricFunctionR3(y, x, z)
    plot3(x, y, z);
    hold on;
    for i = 1:ceil(length(x)/16):length(x)
        plot3(x(i), y(i),z(i), 'o');
        hold on;
    end
end