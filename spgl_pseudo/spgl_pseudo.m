function [x_tau, r_tau] = spgl_pseudo(b, A, x_in, tau, delta, varargin)

    alpha_min = options.step_min; % set min step length
    alpha_max = options.step_max; % set max step length
    gam = 1e-4; % set sufficient descent parameter gamma
    alpha_curr = 1; % set initial step length
    M = options.max_its; % set linesearch history

    % history of iterates
    x = zeros(M,1);
    r = zeros(M,1);
    g = zeros(M,1);
    
    % initial iterates
    x(1) = real_proj(x_in, tau); r(1) = b - A*x(1); g(1) = -A.'*r(1);
    
    i = 1;
    while 1
        % duality gap
        delta_curr = norm(r(i),2) - (b.'*r(i) - tau*norm(g(i), inf))/norm(r(i),2);
        if delta_curr < delta
            break
        end
        
        alpha = alpha_curr; % initial step length
        
        while 1
            x_bar = real_proj(x(i)-alpha*g(i));
            r_bar = b - A*x_bar;
            
            % find armijo condition
            armijo = norm(r(i),2)^2 + gam*(x_bar-x(i).'*g(i));
            for j=1:min(i,M-1)
                tmp = norm(r(i-j),2)^2 + gam*(x_bar-x(i).'*g(i));
                if armijo < tmp;
                    armijo = tmp;
                end
            end
            
            if norm(r_bar, 2)^2 <= armijo
                break
            else
                alpha = alpha/2; % decrease step length
            end
        end
        
        % update iterates
        x(i+1) = x_bar; r(i+1) = r_bar; g(i+1) = -A.'*r(i+1);
        dx = x(i+1) - x(i); dg = g(i+1) - g(i);
        
        % update Barzilai-Borwein step length
        if dx.' * dg <= 0
            alpha_curr = alpha_max;
        else
            bb_step = (dx.' * dx)/(dx.' * dg);
            alpha_curr = min(alpha_max, max(alpha_min, bb_step));
        end
        
        i = i + 1;
    end
    
    x_tau = x(end); r_tau = r(end);
end