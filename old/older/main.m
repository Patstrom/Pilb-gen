format short e
N = 100;

for a = 0.35:0.0001:0.55,
 	sqrtq = pi/(2*a);
	h = a/N;
	yp = @(x) -0.3 * sin(sqrtq * x) * sqrtq;
 	yt = @(x) sqrt(1 + yp(x)^2);


	approx = 0;
    k = 1;
    limit = a/h + 1; %(k-1)*h = L => k = L/h + 1
    while k<=limit,
        xk = (k-1) * h;
        k = k + 1;
        xk1 = (k - 1) * h;
        approx = approx + yt(xk) + yt(xk1);
    end
    approx = approx * h/2
    
    if abs(approx - 0.5) < 1e-4
    	break;
    end
end

a
y = @(x) 0.3*cos(sqrtq * x);
X = -a:0.01:a;
Y = y(X);

plot(X,Y)

M0 = -(sqrtq^2)*0.3;
S = M0 / 0.5