clear; close all;
k_u = 3; k_v = 3;
b_x = [1 2 3; 1 2 3; 1 2 3];
b_y = [1 1 1; 2 2 2; 3 3 3];
b_z = [2 1 2; 2 2 2; 0 1 1];
plot3(b_x, b_y, b_z, 'bo--', 'linewidth', 2); hold on;
plot3(b_x', b_y', b_z', 'b--', 'linewidth', 2);
knots_u = [zeros(1, k_u), ones(1, k_u)];
knots_v = [zeros(1, k_v), ones(1, k_v)];
tab = 0:0.05:1;
B_u = spcol(knots_u, k_u, tab);
B_v = spcol(knots_v, k_v, tab);
X_x = B_u*b_x*B_v.';
X_y = B_u*b_y*B_v.';
X_z = B_u*b_z*B_v.';
surf(X_x, X_y, X_z, 'FaceAlpha', 0.8); shading flat;
s.EdgeColor = 'none';
hold on;
plot3(X_x(1, 1), X_y(1,1), X_z(1,1), 'k.', 'MarkerSize', 20);
plot3(X_x(end, end), X_y(end, end), X_z(end, end), 'k.', 'MarkerSize', 20);
plot3(X_x(end, 1), X_y(end,1), X_z(end,1), 'k.', 'MarkerSize', 20);
plot3(X_x(1, end), X_y(1,end), X_z(1,end), 'k.', 'MarkerSize', 20);

%transformation

% theta = pi/2;
% A = [cos(theta) -sin(theta) 0 ; sin(theta) cos(theta) 0; 0 0 1];
% new_points = A*[b_x ;b_y; b_z]'+1;
% X_x2 = B_u*(new_points(1:3, 1:3)')'*B_v.';
% X_y2 = B_u*(new_points(1:3, 4:6)')'*B_v.';
% X_z2 = B_u*(new_points(1:3, 7:9)')'*B_v.';
% surf(X_x2, X_y2, X_z2, 'FaceAlpha', 0.8); shading flat;
% s.EdgeColor = 'none';
% hold on;
% 


%border curves
% plot3(X_x(:, end), X_y(:,end), X_z(:,end), 'k-', 'linewidth', 4);
% plot3(X_x(:, 1), X_y(:,1), X_z(:,1), 'k-', 'linewidth', 4);
% plot3(X_x(1, :), X_y(1,:), X_z(1,:), 'k-', 'linewidth', 4);
% plot3(X_x(end, :), X_y(end,:), X_z(end,:), 'k-', 'linewidth', 4);


%border curves2
u = 0:0.001:1;
x_p = b_x(1,:);y_p = b_y(1,:);z_p = b_z(1,:);
p_x = zeros(1, length(u));
p_y = zeros(1, length(u));
p_z = zeros(1, length(u));
for i = 1:length(u)
    [t_x, t_y, t_z] = de_casteljau(k_u, x_p, y_p, z_p, u(i));
    p_x(i) = t_x(k_u, k_u); 
    p_y(i) = t_y(k_u, k_u);
    p_z(i) = t_z(k_u, k_u);
end
plot3(p_x, p_y,p_z,'linewidth',5); hold on;


x_p = b_x(end,:);y_p = b_y(end,:);z_p = b_z(end,:);
for i = 1:length(u)
    [t_x, t_y, t_z] = de_casteljau(k_u, x_p, y_p, z_p, u(i));
    p_x(i) = t_x(k_u, k_u); 
    p_y(i) = t_y(k_u, k_u);
    p_z(i) = t_z(k_u, k_u);
end
plot3(x_p, y_p,z_p,'-O'); hold on;
plot3(p_x, p_y,p_z,'linewidth',5); hold on;


x_p = b_x(:,1);y_p = b_y(:,1);z_p = b_z(:,1);
for i = 1:length(u)
    [t_x, t_y, t_z] = de_casteljau(k_u, x_p, y_p, z_p, u(i));
    p_x(i) = t_x(k_u, k_u); 
    p_y(i) = t_y(k_u, k_u);
    p_z(i) = t_z(k_u, k_u);
end
plot3(x_p, y_p,z_p,'-O'); hold on;
plot3(p_x, p_y,p_z,'linewidth',5); hold on;

x_p = b_x(:,end);y_p = b_y(:,end);z_p = b_z(:,end);
for i = 1:length(u)
    [t_x, t_y, t_z] = de_casteljau(k_u, x_p, y_p, z_p, u(i));
    p_x(i) = t_x(k_u, k_u); 
    p_y(i) = t_y(k_u, k_u);
    p_z(i) = t_z(k_u, k_u);
end
plot3(x_p, y_p,z_p,'-O'); hold on;
plot3(p_x, p_y,p_z,'linewidth',5); hold on;




function [Q_x,Q_y, Q_z] = de_casteljau(k, x_p, y_p, z_p, u)
    Q_x = zeros(k, k);
    Q_y = zeros(k, k);
    Q_z = zeros(k, k);
    Q_x(:,1) = x_p;
    Q_y(:,1) = y_p;
    Q_z(:,1) = z_p;
    for i = 2:k
        for j = i:k
            Q_x(j,i) = (1-u)*Q_x(j-1, i-1)+u*Q_x(j, i-1);
            Q_y(j,i) = (1-u)*Q_y(j-1, i-1)+u*Q_y(j, i-1);
            Q_z(j,i) = (1-u)*Q_z(j-1, i-1)+u*Q_z(j, i-1);
        end
    end
end