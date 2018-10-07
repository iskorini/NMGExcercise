clear; close all;
k = 4;
%knots = augknt([0 1 2 3 4 5], k); 
%knots = [0 0 0 0 1 1 1 3 3 3 3];
knots = [-0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4];
%tau = 00:0.001:1;
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
%x_p = [1 2 3 5 6 2 3];
%y_p = [2 5 1 4 7 9 3];
%x_p = [10 11 12 16 12 10 8 4 8 9 ...
  %  10 11 12 16 12];
%y_p = [5 7 11 13 15 13 15 13 11 7 ... 
 %   5 7 11 13 15];
x_p = [35 19 15 10 5 2 3 12 19 30 ...
    35 19 15 10 5];
y_p = [6 8 8 9 9 8 5 5 5 5 ...
    6 8 8 9 9];

curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);

plot(x_p, y_p, 'o-', 'linewidth', 2); hold on;
for i = 1:k+1
    plot(x_p(i), y_p(i), 'ro-', 'markersize', 8, 'MarkerFaceColor','r');
end

for i = 1:length(x_p) %or y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end

plot(curve_x, curve_y, 'linewidth', 3); hold on;
