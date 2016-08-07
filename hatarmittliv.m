global q
y = @(x) 0.3*cos(sqrt(q)*x);
format long


%sekantmetod
x_2 = 0;
flag=0;
for q= 16:0.001:18
    steps = 0;
    [x_0,x_1] = guess_a();
    
    while steps < 5
        steps = steps + 1;
        length = arcLength(x_0);
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
q
a
length
X = -a:0.001:a;
Y = 0.3*cos(sqrt(q)*X);
plot(X,Y)