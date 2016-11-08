Q = @(a) pi^2 /(4*a^2); %y(a) = 0 => 0.3cos(sqrt(q)a) = 0 => sqrt(q)a=pi/2 => q=pi^2/(4a^2)
y = @(q, x) 0.3*cos(sqrt(q)*x);
%Startv‰rden

format short e

[x_0, x_1] = guess();
x_2 = 0;
%sekantmetod
while true
	q = Q(x_0);
    %Om bÂgl‰ngd √§r tillfredsst√§llande n√§ra 0.5 s√• bryter vi
	if abs(arcLength(q, x_0) - 0.5) < 1e-5
		break
	end
    
    x_2 = x_1 - ( x_1 - x_0 ) / ( y(q,x_1) - y(q,x_0) ) * y(q, x_1);
	
	x_0 = x_1;
	x_1 = x_2;
end

x_2
X = -x_2:0.01:x_2;
Y = y(X);

%plot(X,Y)

%Kraften i bÂgen
M0 = -(Q(x_2))*0.3;
S = M0 / 0.5