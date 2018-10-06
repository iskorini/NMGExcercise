k_u = 3; k_v = 5;
knots_u = [zeros(1, k_u), ones(1, k_u)];
knots_v = [zeros(1, k_v), ones(1, k_v)];
tab = 0:0.05:1;
B_u = spcol(knots_u, k_u, tab);
B_v = spcol(knots_v, k_v, tab);
for i = 1:length(knots_u)-k_u
   for j = 1: length(knots_v)-k_v
        X = B_u(:,i)*B_v(:,j).';
        surf(tab, tab, X, 'FaceAlpha', 0.8); shading flat;
        s.EdgeColor = 'none';
        hold on;
   end
end