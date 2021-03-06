clear; close all;
k = 4;
knots = augknt([0 1 2 3 4 5], k, 2);
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
x_p = [0.06;0.09;0.12;0.20;0.32;0.56;0.67;0.83;0.98;0.91;0.92;0.89];
y_p = [0.10;0.46;0.60;0.64;0.66;0.79;0.80;0.81;0.56;0.29;0.13;0.045];
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(x_p, y_p, 'o-', 'linewidth', 2, 'markersize', 10); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end
plot(curve_x, curve_y, 'linewidth', 4); hold on;
x_p2 = x_p; y_p2 = y_p; move = 7;
x_p2(move) = x_p2(move)+0.2;
y_p2(move) = y_p2(move)+0.2;
curve_x2 = zeros(size(c,1),1);
curve_y2 = zeros(size(c,1),1);
plot(x_p2(move-1:move+1), y_p2(move-1:move+1), 'o-', 'linewidth', 2, 'markersize', 10); hold on;
for i = 1:length(x_p) %o y_p
    curve_x2 = curve_x2 + (x_p2(i) * c(:, i));
    curve_y2 = curve_y2 + (y_p2(i) * c(:, i));
end
plot(curve_x2, curve_y2, 'linewidth', 4); hold on;
figure(2);
plot(tau, curve_x, tau, curve_x2, 'linewidth', 2); hold on;
line([knots(move) knots(move)], [0 1.2], 'linewidth' , 2);
line([knots(move+k) knots(move+k)], [0 1.2], 'linewidth' , 2);
figure(3);
plot(tau, curve_y, tau, curve_y2, 'linewidth', 2); hold on;
line([knots(move) knots(move)], [0 1.2], 'linewidth' , 2);
line([knots(move+k) knots(move+k)], [0 1.2], 'linewidth' , 2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = 8; 
x_p3 = x_p; y_p3 = y_p;
x_p3(1:r-k) = x_p3(1:r-k)+0.1; y_p3(1:r-k) = y_p3(1:r-k)-0.1;
x_p3(r+1:end) = x_p3(r+1:end)+0.1; y_p3(r+1:end) = y_p3(r+1:end)-0.1;
curve_x2 = zeros(size(c,1),1);
curve_y2 = zeros(size(c,1),1);
for i = 1:length(x_p)
    curve_x2 = curve_x2 + (x_p3(i) * c(:, i));
    curve_y2 = curve_y2 + (y_p3(i) * c(:, i));
end
figure(4);
plot(x_p, y_p, 'o-', 'linewidth', 2, 'markersize', 10); hold on;
plot(x_p3, y_p3, 'o-', 'linewidth', 2, 'markersize', 10)
plot(curve_x, curve_y, 'linewidth', 4);
plot(curve_x2, curve_y2, 'linewidth', 4);
figure(5);
plot(tau, curve_y, tau, curve_y2, 'linewidth', 2); hold on;
line([knots(r) knots(r)], [-1 1], 'linewidth' , 2);
line([knots(r+2) knots(r+2)], [-1 1], 'linewidth' , 2);
figure(6);
plot(tau, curve_x, tau, curve_x2, 'linewidth', 2); hold on;
line([knots(r) knots(r)], [-0.2 1.2], 'linewidth' , 2);
line([knots(r+2) knots(r+2)], [-0.2 1.2], 'linewidth' , 2);