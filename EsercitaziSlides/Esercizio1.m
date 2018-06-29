a = 0; b = 1; n = 4;
precision = 0.0001;
u = a:precision:b;
x = zeros(1, length(a:precision:b));
y = zeros(1, length(a:precision:b));
[x_p, y_p] = ginput(n+1);
for i = 1:length(u)
    [x(i), y(i)] = de_casteljau(n, x_p, y_p, u(i));
end
plot(x_p, y_p, '-O');
hold on;
plot(x, y, 'linewidth',3);
hold on;
function [x,y] = de_casteljau(n, x_p, y_p, u)
    Q_x = x_p;
    Q_y = y_p;
    for k = 0:n
        for i = 1:n-k
            Q_x(i) = (1-u)*Q_x(i)+u*Q_x(i+1);
            Q_y(i) = (1-u)*Q_y(i)+u*Q_y(i+1);
        end
    end
    x = Q_x(1);
    y = Q_y(1);
end