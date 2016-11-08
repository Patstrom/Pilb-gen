global q
format long

y = @(x) 0.3*cos(sqrt(q)*x);
a = 0;
%sekantmetod
x_2 = 0;
flag=0;
iterations = 0;

tic
% For a given value for q
for q= 15.4:0.001:18
    iterations = iterations + 1;
    steps = 0;
    
    % Find an x value right before y = 0 and one right after
    [x_0,x_1] = guess_a();
    
    % Using secant method try to interpolate the exact value where
    % graph intersects the x axis
    while steps < 5
        steps = steps + 1;
        length = arcLength(q, x_0);
        
        % If we find a length that is sufficiently close, break
        if abs(length-0.5) < 1e-5
            a = x_0;
            flag=1;
            break
        end
        x_2 = x_1 - ( x_1 - x_0 ) ./ ( y(x_1) - y(x_0) ) * y(x_1); 

        x_0 = x_1;
        x_1 = x_2;
    end
    
    if flag==1
        break
    end
end

toc
% Print values and draw plot
iterations
q
a
length
X = -a:0.001:a;
Y = 0.3*cos(sqrt(q)*X);
plot(X,Y)