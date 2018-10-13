clear; close all;
k_n = 3; k_m = 4;
b_x = [1 2 3 3; 1 2 3 4; 1 2 3 2];
b_y = [1 1 1 4; 2 2 2 6; 3 3 3 4];
b_z = [2 1 2 5; 2 2 2 4; 0 1 1 4];
% b_x = [1 2 3; 1 2 3; 1 2 3];
% b_y = [1 1 1; 2 2 2; 3 3 3];
% b_z = [2 1 2; 2 2 2; 0 1 1];
% b_x = [1 2 3; 1 2 3];
% b_y = [1 1 1; 2 2 2];
% b_z = [2 1 2; 2 2 2];
plot3(b_x, b_y, b_z, 'bo--', 'linewidth', 2); hold on;
plot3(b_x', b_y', b_z', 'b--', 'linewidth', 2);



%%%%%
knots_u = [zeros(1, k_n), ones(1, k_n)];
knots_v = [zeros(1, k_m), ones(1, k_m)];
tab = 0:0.05:1;
B_u = spcol(knots_u, k_n, tab);
B_v = spcol(knots_v, k_m, tab);
X_x = B_u*b_x*B_v.';
X_y = B_u*b_y*B_v.';
X_z = B_u*b_z*B_v.';
%surf(X_x, X_y, X_z, 'FaceAlpha', 0.8); shading flat;
s.EdgeColor = 'none';
hold on;
plot3(X_x(1, 1), X_y(1,1), X_z(1,1), 'k.', 'MarkerSize', 20);
plot3(X_x(end, end), X_y(end, end), X_z(end, end), 'k.', 'MarkerSize', 20);
plot3(X_x(end, 1), X_y(end,1), X_z(end,1), 'k.', 'MarkerSize', 20);
plot3(X_x(1, end), X_y(1,end), X_z(1,end), 'k.', 'MarkerSize', 20);

%%%%%



for u = 0:0.05:1
    for v = 0:0.05:1
        [x, y, z] = de_casteljau3d(k_n, k_m, b_x, b_y, b_z, u, v);
        plot3(x, y, z, '.-', 'linewidth', 2); hold on;
    end
end
%m = s
%n = r



function [Q_x, Q_y, Q_z] = de_casteljau(k, x_p, y_p, z_p, u)
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

function [Q_x, Q_y, Q_z] = de_casteljau3d(k_n, k_m, p_x, p_y, p_z, u, v)
    Q_x = p_x;
    Q_y = p_y;
    Q_z = p_z;
    for k = 2:min(k_n, k_m)
        for i = 1:min(k_n, k_m)-k+1 %n
            for j = 1:min(k_n, k_m)-k+1 %m
                Q_x(i, j) = [(1 - u) u] * ...
                    [Q_x(i, j), Q_x(i, j+1); Q_x(i+1, j), Q_x(i+1, j+1)] ...
                    * [(1 - v) v]';
                Q_y(i, j) = [(1 - u) u] * ...
                    [Q_y(i, j), Q_y(i, j+1); Q_y(i+1, j), Q_y(i+1, j+1)] ...
                    * [(1 - v) v]';
                Q_z(i, j) = [(1 - u) u] * ...
                    [Q_z(i, j), Q_z(i, j+1); Q_z(i+1, j), Q_z(i+1, j+1)] ...
                    * [(1 - v) v]';
            end
        end
    end
    if k_m > k_n %procedo su r
        for k = (min(k_n, k_m)+1):k_m
            for j = 1:(min(k_n, k_m)-k+1)
                for i = j:min(k_n, k_m)-k+1
                    Q_x(i, j) = [(1-u) u] * [Q_x(i, j), Q_x(i, j+1)]';
                    Q_y(i, j) = [(1-u) u] * [Q_y(i, j), Q_y(i, j+1)]';
                    Q_z(i, j) = [(1-u) u] * [Q_z(i, j), Q_z(i, j+1)]';
                end
            end
        end
    end            
    Q_x = Q_x(1, 1);
    Q_y = Q_y(1, 1);
    Q_z = Q_z(1, 1);
    
    
%     if k_n > k_m %procedo su s
%         for k = min(k_n, k_m):max(k_n, k_m)
%             j = min(k_n, k_m)-k+1;
%             for i = 1:min(k_n, k_m)-k+1
%                 Q_x(i, j) = (1-u)*Q_x(i, j)+u*Q_x(i+1,j);
%                 Q_y(i, j) = (1-u)*Q_y(i, j)+u*Q_y(i+1,j);
%                 Q_z(i, j) = (1-u)*Q_z(i, j)+u*Q_z(i+1,j);
%             end
%         end
%     end

    return;
end