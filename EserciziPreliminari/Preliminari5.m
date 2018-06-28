clear;
a = 0; b = 1;
n = 9;
step = n+1;
u = a:0.0001:b;
%---------------
%SET OF FUNCTIONS
x = u;
y = u.^3 - 3.*u.^4;
%---------------
x_bez = zeros(1, length(u));
y_bez = zeros(1, length(u));
x_p = x(round(linspace(1,length(u),step)));
y_p = y(round(linspace(1,length(u),step)));
for i = 0:1:n
    x_bez = x_bez + ( bernstein_pol(n,i,(u-a)./(b-a)) .* x_p(i+1) );
    y_bez = y_bez + ( bernstein_pol(n,i,(u-a)./(b-a)) .* y_p(i+1) );
end
%---------------
%PLOT
%PLOT ORIGINAL FUNCTION
plot(x, y, 'linewidth', 2);
hold on;
%PLOT POLYGON
plot(x_p, y_p, '-O');
hold on;
%PLOT BEZIER CURVE
plot(x_bez, y_bez, 'linewidth',1);
hold on;
%END PLOT
%---------------

%---------------
%BERNSTEIN POL IN [0,1]
function y = bernstein_pol(n, i, u)
    y = nchoosek(n,i).*u.^(i).*((1-u).^(n-i));
end
%---------------