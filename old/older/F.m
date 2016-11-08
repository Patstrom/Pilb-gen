function f=F(~,u)
	%u(1) = y
	%u(2) = y'
	%u(2)' = 0.3cos(sqrt(q)*x)*q = u(1)*q
	%Eftersom a<0.5 så blir ett approximativt lägsta värde på q i q=pi^2/(4a^2) lika med pi^2 
	f = [u(2) -(pi^2)*u(1)*(1+u(2)^2)^(3/2)]';  
end
