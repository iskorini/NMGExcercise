u = 0:0.0001:1;
x = sin(u);
y = tan(u);
plotParametricFunctionR2(y, x)
function plotParametricFunctionR2(y, x)
    plot(x, y);
    hold on;
    for i = 1:ceil(length(x)/16):length(x)
        plot(x(i), y(i), 'o');
        hold on;
    end
end
