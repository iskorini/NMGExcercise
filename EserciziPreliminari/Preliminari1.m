x = 0:0.0001:10;
y = sin(x);
esercizio1(y, x);
function plotFunction(y, x)
    plot(x, y);
    hold on;
    for i = 1:ceil(length(x)/100):length(x)
        plot(x(i), y(i), 'o');
        hold on;
    end
end
