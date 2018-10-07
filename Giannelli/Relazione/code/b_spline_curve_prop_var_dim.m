clear; close all;
k = 4;
knots = [0 0 0 0 1 1 2 3 4 4 5 5 5 5];
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
[x_p, y_p] = ginput(length(knots)-k);
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(x_p, y_p, 'o-', 'linewidth', 2, 'markersize', 10); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end
plot(curve_x, curve_y,'linewidth', 3); hold on;
[x, y] = ginput(2);
plot(x, y, '-', 'linewidth', 3);