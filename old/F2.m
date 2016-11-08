function f=F2(~,u)
    global q
    f = [u(2) -q*u(1)*((1+(u(2)^2))^(3/2))]';
end