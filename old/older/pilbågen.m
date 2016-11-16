Q = @(a) pi^2/(4*a^2) %y(a) = 0 => 0.3cos(sqrt(q)a) = 0 => sqrt(q)a=pi/2 => q=pi^2/(4a^2)
y = @(x) 0.3*cos(sqrt(q)*x)
%Startv‰rden

x = guess()
x_0 = x(1)
x_1 = x(2)
x_2 = 0
% sekantmetod
for
	x_2 = x_1 - (x_1-x_0)/(y(x_1)-y(x_0)) * y(x_1)

	%Om bÂgl‰ngd √§r tillfredsst√§llande n√§ra 0.5 s√• bryter vi
	if abs((arcLength(Q(x_2), x_2) - 0.5) < 1e-12
		break
	end
	x_0 = x_1
	x_1 = x_2
end

X = -x_2:0.01:x_2;
Y = y(X);

plot(X,Y)

M0 = -(Q(x_2))*0.3;
S = M0 / 0.5
