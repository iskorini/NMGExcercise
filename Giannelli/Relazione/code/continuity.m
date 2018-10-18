close all; clear;
d = 5;
knots = [zeros(1,d),ones(1,d)];
basis = spmak(knots, eye(d));
x = 0:0.01:1;
y = spval(basis, x);
figure('name', 'c-1');
ctrPts = [-1 0 -1 2 3
            3 4 6 1 2];
curve = spmak(knots, ctrPts);
t = 0:0.01:1;
x = spval(curve, t);
plot(x(1,:), x(2,:), 'b', 'Linewidth', 1)
hold on
plot(ctrPts(1,:), ctrPts(2,:), 'bo--')
str = num2str([0:4]');
str = strcat('c', str);
shift = [0.1 0.1];
text(ctrPts(1,:)+shift(1), ctrPts(2,:)+shift(2), str, 'Color', 'blue')
% % C-1
ctrPts2 = [2 5 4 6 1
            2 4 3 0 3];
curve2 = spmak(knots, ctrPts2);
t = 0:0.01:1;
x2 = spval(curve2, t);
plot(x2(1,:), x2(2,:), 'r', 'Linewidth', 1)
text(ctrPts(1,:)+shift(1), ctrPts(2,:)+shift(2), str, 'Color', 'blue')
hold on
plot(ctrPts2(1,:), ctrPts2(2,:), 'ro--')
text(ctrPts2(1,:)+shift(1), ctrPts2(2,:)+shift(2), str, 'Color', 'red')
% % C0
figure('name', 'c0');
plot(ctrPts(1,:), ctrPts(2,:), 'bo--'); hold on;
plot(x(1,:), x(2,:), 'b', 'Linewidth', 1)
ctrPts3 = [3 5 2 4 7
            2 4 2 3 3];
curve3 = spmak(knots, ctrPts3);
x3 = spval(curve3, t);
plot(x3(1,:), x3(2,:), 'g', 'Linewidth', 1)
plot(ctrPts3(1,:), ctrPts3(2,:), 'go--')
text(ctrPts3(1,:)+shift(1), ctrPts3(2,:)+shift(2), str, 'Color', 'green')
text(ctrPts(1,:)+shift(1), ctrPts(2,:)+shift(2), str, 'Color', 'blue')
%C1
figure('name', 'c1');
ctrPts4 = [1 5 4 6 7
            2 4 3 0 3];
plot(ctrPts(1,:), ctrPts(2,:), 'bo--'); hold on;
plot(x(1,:), x(2,:), 'b', 'Linewidth', 1)
ctrPts4(:,1) = ctrPts(:,5);
ctrPts4(:,2) = -ctrPts(:,4) + 2*ctrPts(:,5);
curve4 = spmak(knots, ctrPts4);
x4 = spval(curve4, t);
plot(x4(1,:), x4(2,:), 'r', 'Linewidth', 1)
hold on
plot(ctrPts4(1,:), ctrPts4(2,:), 'ro--')
text(ctrPts4(1,:)+shift(1), ctrPts4(2,:)+shift(2), str, 'Color', 'r')
text(ctrPts(1,:)+shift(1), ctrPts(2,:)+shift(2), str, 'Color', 'blue')
%G1
figure('name', 'g1');
ctrPts4 = [1 3 4 2 7
            2 4 3 0 3];
w = 2;
ctrPts4(:,1) = ctrPts(:,5);
ctrPts4(:,2) = ctrPts(:,5) + w*(ctrPts(:,5)-ctrPts(:,4));
curve4 = spmak(knots, ctrPts4);
x4 = spval(curve4, t);
plot(x4(1,:), x4(2,:), 'c', 'Linewidth', 1); hold on;
plot(x(1,:), x(2,:), 'b', 'Linewidth', 1);
plot(ctrPts4(1,:), ctrPts4(2,:), 'cd--');
text(ctrPts4(1,:)+shift(1), ctrPts4(2,:)+shift(2), str, 'Color', 'c');
plot(ctrPts(1,:), ctrPts(2,:), 'bo--'); 
text(ctrPts(1,:)+shift(1), ctrPts(2,:)+shift(2), str, 'Color', 'blue');
