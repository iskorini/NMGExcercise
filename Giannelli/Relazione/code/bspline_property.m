clear;
k = 4;
%knots = augknt([0 1 2 3 4 5], k); 
knots = [0 0 0 1 1 2 3 3 3];
tau = knots(1):0.001:knots(end);
c = spcol(knots, k, tau);
for i = 1:length(knots)-k
    plot(tau, c(:,i), 'linew',2)
    hold on
end

%Supporto locale: N_{i, r}(t) = 0 se t \notin [t_i, t_{i+r}]
%considero la spline con i = 1, t_1 = 0, t_5 = 1, al di fuori di questo
%intervallo vale 0:
plot(tau, c(:, 1), 'linew', 3); hold on;
c1 = spcol(knots, k, 0.95:0.01:1.05);
disp(c1);

%Non negatività: N_{i, r}(t) \geq 0 \forall t \in \mathbb{R}

for i = 1:length(knots)-k
   for j = 1:length(tau)
        if c(j,i) < 0
            disp("Valore minore di 0");
        end
   end
end

%partizione dell'unità: 
%\sum_{i = 0}^{n+k-r} = 1 \forall t \in [t_{r-1}, t_{n+1+k-r}] r = 1 \dots k
%in questo caso abbiamo k = r, quindi 
%\sum_{i = 0}^{n} = 1 \forall t \in [t_{r-1}, t_{n+1+k-r}] r = 1 \dots k
plot(tau, sum(c,2), '--', 'linewidth', 4);
