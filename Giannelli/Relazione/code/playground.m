d = 5;
knots = {[zeros(1,d), ones(1,d)],...
    [zeros(1,d), ones(1,d)]};
coefs = eye(d*d);
basis = spmak(knots, reshape(coefs, 25, 5, 5));
[ctrPtsY, ctrPtsX] = meshgrid(0:4, 0:4);
ctrPtsX = ctrPtsX + 0.5*rand(d);
ctrPtsY = ctrPtsY + 0.5*rand(d);
ctrPtsZ = rand(d);
ctrPts = cat(1, reshape(ctrPtsX,1,5,5),...
    reshape(ctrPtsY,1,5,5),...
    reshape(ctrPtsZ,1,5,5));

surface = spmak(knots, ctrPts);

t = 0:0.04:1;
pts = spval(surface, {t,t});
x = squeeze(pts(1,:,:));
y = squeeze(pts(2,:,:));
z = squeeze(pts(3,:,:));

% figure(1)
% surf(x,y,z, 'FaceAlpha', 0.8);
% hold on;

figure(2)
surf(x,y,z, 'FaceAlpha', 0.5);
hold on;
plot3(ctrPtsX, ctrPtsY, ctrPtsZ, 'ro--', 'Linewidth', 2)
plot3(ctrPtsX', ctrPtsY', ctrPtsZ', 'r--', 'Linewidth', 2)

[i2, i1] = meshgrid(0:4);
i1s = string(i1);
i2s = string(i2);
str = strcat('c', i1s, i2s);

shift = [0.1, 0.1, 0.1];
text(ctrPtsX(:)+shift(1), ctrPtsY(:)+shift(2), ctrPtsZ(:)+shift(3), str, 'Color', 'red')
shading interp

[ctrPtsY2, ctrPtsX2] = meshgrid(0:4, -4:0);
ctrPtsX2 = ctrPtsX2 + rand(d);
ctrPtsY2 = ctrPtsY2 + rand(d);
ctrPtsZ2 = rand(5);

ctrPtsX2(5,:) = ctrPtsX(1,:);
ctrPtsY2(5,:) = ctrPtsY(1,:);
ctrPtsZ2(5,:) = ctrPtsZ(1,:);

ctrPtsX2(4,:) = -ctrPtsX(2,:) + 2*ctrPtsX(1,:); 
ctrPtsY2(4,:) = -ctrPtsY(2,:) + 2*ctrPtsY(1,:); 
ctrPtsZ2(4,:) = -ctrPtsZ(2,:) + 2*ctrPtsZ(1,:); 

ctrPts2 = cat(1, reshape(ctrPtsX2,1,5,5),...
    reshape(ctrPtsY2,1,5,5),...
    reshape(ctrPtsZ2,1,5,5));

surface2 = spmak(knots, ctrPts2);

t = 0:0.04:1;
pts2 = spval(surface2, {t,t});
x2 = squeeze(pts2(1,:,:));
y2 = squeeze(pts2(2,:,:));
z2 = squeeze(pts2(3,:,:));

surf(x2,y2,z2, 'FaceAlpha', 0.5);
hold on;
plot3(ctrPtsX2, ctrPtsY2, ctrPtsZ2, 'bo--', 'Linewidth', 2)
plot3(ctrPtsX2', ctrPtsY2', ctrPtsZ2', 'b--', 'Linewidth', 2)

str2 = strcat('d', i1s, i2s);

shift = [0.1, 0.1, 0.1];
text(ctrPtsX2(:)+shift(1), ctrPtsY2(:)+shift(2), ctrPtsZ2(:)+shift(3), str2, 'Color', 'blue')
shading interp
