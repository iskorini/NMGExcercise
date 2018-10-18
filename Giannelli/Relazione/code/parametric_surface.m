clear;
u = linspace(0, 10, 100);
v = linspace(0, 10, 100);
[uu, vv] = meshgrid(u, v);
x = (2 + cos(vv)).*cos(uu);
y = (2 + cos(vv)).*sin(uu);
z = sin(vv);
surf(x, y,z); axis equal;