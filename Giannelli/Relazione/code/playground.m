close all
n = 4;
k = 3;
points = ginput(n)
x_p = points(:,1);
y_p = points(:,2);
plot(x_p, y_p, 'ro')
hold on
plot(x_p, y_p, 'r')

knots = 0:1/(n+k-1):1;
%knots =[0 0.1 0.2 0.25 0.5 1 1 1]
x = spmak(knots, points.');
fnplt(x, [knots(k), knots(end-k+1)])
