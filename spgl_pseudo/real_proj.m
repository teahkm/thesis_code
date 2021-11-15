function [x] = real_proj(c, tau)
    n = size(c,2);
    
    if norm(c,1) <= tau % c is feasible
        x = c;
        return
    end
    gamma = 0; delta = 0; nu = -tau;
    
    c_bar = build_heap(abs(c));
    
    for j=1:n
        c_min = c_bar(1); % extract largest element
        nu = nu + c_min; % accumulate infeasibility
        gamma = nu/j; % define current solution
        
        if gamma >= c_min % remaining iterations satisfy soft thresholding condition
            break
        end
        
        c_bar = delete_max(c_bar);
        delta = gamma; % element in d
    end
    x = soft_threshold(c, delta);
end
