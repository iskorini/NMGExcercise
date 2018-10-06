clear;
k = 3;
t = [0 0 0 1 2 3 5 5 5 ];
t_star = t(1):0.01:t(end);
y = zeros(size(t_star));

for i = 1:1:(size(t,2)-k)
    for index = 1:1:(size(t_star,2))
        y(index) = de_boor_basis(i, k, t, t_star(index), k);
    end
    %y = (i*1.5)+y;
    plot(t_star, y, 'linewidth', 2);
    hold on;
end


function [omega] = calc_omega (i, r, t_star, t)
    if t(i) == t(i+r-1)
        omega = 0;
        return;
    elseif t_star <= t(i+r-1)
        omega = (t_star-t(i)) / (t(i+r-1)-t(i));
        return;
    else
        omega = 0;
        return;
    end
end

function [y] = de_boor_basis (i, r, t, t_star, k)
    if r == 1
        if (t_star >= t(i) && t_star < t(i+1)) || ((t_star >= t(i) && t_star <= t(i+1) && t_star == t(end) && i == length(t)-k))
            
            y = 1;
            return;
        else
            y = 0;
            return;
        end
    else
        omega1 = calc_omega(i, r, t_star, t);
        omega2 = (1 - calc_omega(i+1, r, t_star, t));
        db1 = de_boor_basis(i, r-1, t, t_star, k);
        db2 = de_boor_basis(i+1, r-1, t, t_star, k);
        y = omega1 * db1 + omega2 * db2;
        return;
    end
end


