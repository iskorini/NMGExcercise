close all; clear;
k = 3;
knots = [zeros(1,k), 1/4, 2/4, 3/4, ones(1, k)];
t = aveknt(knots, k);
P = [1 1; 4 6; 8 5; 15 5; 16 2; 20 4];
plot(P(:,1), P(:,2), 'r.', 'markersize', 30); hold on;
hold on
A = spcol(knots, k, t);
coefs = A\P;
plot(coefs(:,1), coefs(:,2), 'b--o');
x = spmak(knots, coefs.');
fnplt(x, 'k');
t1 = uniform_param(0, 1, size(t,2));
A = spcol(knots, k, t1);
coefs1 = A\P;
plot(coefs1(:,1), coefs1(:,2), 'k--o');
x = spmak(knots, coefs1.');
fnplt(x);
function [t] = uniform_param(a, b, n)
    t = a:(b-a)/(n-1):b;
end