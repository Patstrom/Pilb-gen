function [arc_length] = arcLength(q, a)
	%Solve the båglängd
	y_prime = @(x) -0.3 * sin(sqrt(q) * x) * sqrt(q);
 	y_arc = @(x) sqrt(1 + yp(x)^2);

 	arc_length = integral(y_arc, 0, a)
 end