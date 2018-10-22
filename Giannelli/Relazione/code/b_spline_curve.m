clear; close all;
k = 4;
x_p = [35 19 15 10 5 2 3 12 19 30 ...
    35 19 15];
y_p = [6 8 8 9 9 8 5 5 5 5 ...
                6 8 8];
m = (length(x_p)-k)-1;
knots = -k/m:1/m:(k+m)/(m);
plot(x_p, y_p, 'o-', 'linewidth', 2); hold on;
curve = spmak(knots, [x_p; y_p]);
fnplt(fnbrk(curve, [knots(k), knots(end-k+1)]));
for i = 1:k-1
    plot(x_p(i), y_p(i), 'ro-', 'markersize', 8, 'MarkerFaceColor','r');
end
for i = 0:k
    disp("Continuita': "+i);
    der = fnder(curve, i);
    disp(fnval(der, knots(k))+" "+fnval(der, knots(end-k+1)));
end

