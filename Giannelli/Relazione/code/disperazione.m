n = 3; m = 3;
P = zeros(n,m,3);
P(:,:,1) = [1 3 3; 1 3 3; 1 3 3];
P(:,:,2) = [1 1 1; 4 4 4; 3 3 3];
P(:,:,3) = [2 1 2; 2 2 2; 0 1 1];
plot3(P(:,:,1), P(:,:,2), P(:,:,3), 'k--o'); hold on;
plot3(P(:,:,1)', P(:,:,2)', P(:,:,3)', 'k--o')
knots_u = [zeros(1, n), ones(1, n)];
knots_v = [zeros(1, m), ones(1, m)];
tab = 0:0.05:1;
B_u = spcol(knots_u, n, tab); B_v = spcol(knots_v, m, tab);
surface(:,:,1) = B_u*P(:,:,1)*B_v.';
surface(:,:,2) = B_u*P(:,:,2)*B_v.';
surface(:,:,3) = B_u*P(:,:,3)*B_v.';
surf(surface(:,:,1), surface(:,:,2), surface(:,:,3), 'FaceAlpha', 0.8);
for u0 = 0:0.05:1
    for v0 = 0:0.05:1
        s = deCasteljau2(P, n, m, u0, v0);
        plot3(s(1), s(2), s(3), 'r.', 'markersize', 15)
    end
end
function [s] = deCasteljau2(P, n, m, u0, v0)
    Q = zeros(1, max(n,m), 3);
    if(n>m)
        for j = 1:m
            Q(:,j,:) = deCasteljau1(permute(P(:,j,:),[2 1 3]), n, u0);
        end
        s =  deCasteljau1(Q, m, v0);
    else
        for i = 1:n
            Q(:,i,:) = deCasteljau1(P(i,:,:), m, v0);
        end
        s =  deCasteljau1(Q, n, u0);
    end
end
function [c] = deCasteljau1(P, n, u)
    Q = P;
    for k = 2:n+1
        for i = 1:n-k+1
            Q(:,i,:) = (1-u)*Q(:,i,:)+u*Q(:,i+1,:);
        end
    end
    c = [Q(1,1,1), Q(1,1,2), Q(1,1,3)]';
end