function [low,high] = guess_a()

    % ODE, how do they work?
	[X,Y] = ode45('F2', [0 0.5], [0.3 0]);
    t_low = 0;
    t_high = 0;
    Temp = Y(:,1);
    
    % Find the x value right before y(x) = 0 and the one right after
    for i = 1:length(X)
        if Temp(i) < 0
            t_low = X(i-1);
            t_high = X(i);
            break
        end
    end
    low = t_low;
    high = t_high;
end