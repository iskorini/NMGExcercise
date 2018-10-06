clear;
k = 4;
knots = [0 0 0 0 1 1 2 3 4 5 5 5 5];
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
[x_p, y_p] = ginput(length(knots)-k);
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(x_p, y_p, 'o-', 'linewidth', 2); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end
plot(curve_x, curve_y, 'linewidth', 4); hold on;
%trasformazione affine sulla curva
theta = pi;
A = [cos(theta) -sin(theta) ; sin(theta) cos(theta)];
new_curve = A*[curve_x curve_y]'+1;
plot(new_curve(1,:), new_curve(2,:), 'linewidth', 4);
%trasformazione affine
%sposto i PDC
new_points = A*[x_p y_p]'+1;
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(new_points(1,:), new_points(2,:), 'o-', 'linewidth', 2); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (new_points(1,i) * c(:, i));
    curve_y = curve_y + (new_points(2,i) * c(:, i));
end
plot(curve_x, curve_y, 'linewidth', 4); hold on;

