function [arc_length] = arcLength(a)
	% Calculate the length of the arc
    global q
 	y_prime = @(x) -0.3 * sin(sqrt(q)*x) * sqrt(q);
    y_arc = @(x) sqrt(1+y_prime(x).^2);
    
 	arc_length = integral(y_arc, 0, a);
 end