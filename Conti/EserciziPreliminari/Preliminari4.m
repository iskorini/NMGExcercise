clear;
a = 20;
b = 140;
u = a:0.0001:b;
r_u = (u-a)./(b-a);
n = 4;
for i = 0:1:n 
    plot(u, bernstein_pol(n,i,r_u), 'linewidth',2);
    hold on;
end
function y = bernstein_pol(n, i, u)
    y = nchoosek(n,i).*u.^(i).*((1-u).^(n-i));
end