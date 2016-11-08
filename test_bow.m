format long e

Q = @(a) (pi/(2*a))^2;
a = @(q) pi/(2*sqrt(q));

a_upper = sqrt(0.5^2-0.3^2); % The x-value given from where the straight line with an arc length of 0.5 intersects the x-axis. We know this is the upper bound for a and thus lower bound for q
a_lower = 0; %Just a guess

iterations = 0;
tic
for q=Q(a_upper):0.001:Q(a_lower)
   iterations = iterations + 1;
    if abs(arcLength(q, a(q))-0.5) < 1e-5
      break
   end
end
toc

iterations
a(q)
q
arcLength(q, a(q))
X = -a(q):0.001:a(q);
Y = 0.3*cos(sqrt(q)*X);
plot(X,Y)