clear; close all;
k = 4;
knots = [0 0 0 0 1 1 2 2 3 3 4 4 4 5 5 5 5];
tau = knots(k):0.001:knots(end-k+1);
c = spcol(knots, k, tau);
%[x_p, y_p] = ginput(length(knots)-k);
x_p = [0.0679723502304148;0.0933179723502304;0.127880184331797;0.208525345622120;0.323732718894009;0.564285714285714;0.674884792626728;0.831566820276498;0.988248847926267;0.913594470046083;0.929723502304148;0.892857142857143;0.768433179723502];
y_p = [0.106413994169096;0.465014577259475;0.602040816326531;0.642857142857143;0.660349854227405;0.792419825072886;0.806997084548105;0.815743440233236;0.567930029154519;0.293002915451895;0.132653061224490;0.0451895043731778;0.0364431486880465];
curve_x = zeros(size(c,1),1);
curve_y = zeros(size(c,1),1);
plot(x_p, y_p, 'o-', 'linewidth', 2, 'markersize', 10); hold on;
for i = 1:length(x_p) %o y_p
    curve_x = curve_x + (x_p(i) * c(:, i));
    curve_y = curve_y + (y_p(i) * c(:, i));
end
plot(curve_x, curve_y, 'linewidth', 4); hold on;
for times = 1:2
    r = 9;
    for i = r-k+1:r
        x_p(i) = x_p(i)+0.1;
        y_p(i) = y_p(i)+0.1;
    end
    curve_x = zeros(size(c,1),1);
    curve_y = zeros(size(c,1),1);
    plot(x_p(r-k:r+1), y_p(r-k:r+1), 'd-', 'linewidth', 2, 'markersize', 10); hold on;
    for i = 1:length(x_p) %o y_p
        curve_x = curve_x + (x_p(i) * c(:, i));
        curve_y = curve_y + (y_p(i) * c(:, i));
    end
    plot(curve_x, curve_y, 'linewidth', 4); hold on;
end