a = 0; b = 1; n = 4;
precision = 0.0001;
u = a:precision:b;
x = 1+u+u.^2;
y = u.^3;
plot(x, y);
hold on;