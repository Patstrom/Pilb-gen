function [arc_length] = arcLength(a)
	%Solve the båglängd
    global q
 	y_prime = @(x) -0.3 * sin(sqrt(q)*x) * sqrt(q);
    y_arc = @(x) sqrt(1+y_prime(x).^2);
    
    % arc_length = (a-0)*(y_arc(a)+y_arc(0))/2
    
    %h = 0.1;
    %k = 1;
    %N = a/h;
    
    %x_1 = (k-1)*h;
    %x_2 = h;
    %sum = 0;
    
    %for k = 1:h:(N+1)
    %    sum = sum + y_arc(q, x_1) + y_arc(q, x_2);
    %    x_1 = x_2;
    %    x_2 = (k-1)*h;
    %end
    
    %arc_length = sum * h/2;
 	arc_length = integral(y_arc, 0, a);
 end