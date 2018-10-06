clear;
[u, v] = meshgrid(0:0.1:10, 0:0.1:11);
x = u;
y = v+exp(2*v);
z = exp(-u).*2.*v+sin(8.*v);
surf(x, y,z); colorbar;
