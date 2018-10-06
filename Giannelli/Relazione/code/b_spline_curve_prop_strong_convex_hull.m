clear; close all;
k = 3;
knots = [0 0 0 1 1 2 3 4 4 5 5 5];
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
x_p = [0.065668202764977;0.286866359447005;0.429723502304147;0.630184331797235;0.798387096774194;0.450460829493088;0.273041474654378;0.268433179723502;0.167050691244240];
y_p = [0.500000000000000;0.220116618075802;0.511661807580175;0.237609329446064;0.829446064139942;0.954810495626822;0.779883381924198;0.552478134110787;0.558309037900875];
[x_p, y_p] = ginput(length(knots)-k);
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(x_p, y_p, 'o-', 'linewidth', 2, 'markersize', 10); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end
plot(curve_x, curve_y,'linewidth', 3); hold on;
for i = 1:length(x_p)-k+1
next = i+k-1;
plot([x_p(i) x_p(next)], [y_p(i) y_p(next)], '--', 'linewidth', 3); hold on;
end