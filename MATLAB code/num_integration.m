x0 = 0;
xn = pi/2;
n = 100;

step = (xn-x0)/100;
x = x0:step:xn;
y = cos(x);

plot(x, y);
grid on;

I_up = 0;
for (i=1:n)
   interval(i) = x(i+1)-x(i);
   S = interval(i)*y(i+1);
   I_up = I_up+S;
end

I_low = 0;
for (i=1:n)
   interval(i) = x(i+1)-x(i);
   S = interval(i)*y(i+1);
   I_low = I_low+S;
end

I_low = 0;
for (i=1:n)
   interval(i) = x(i+1)-x(i);
   S = interval(i)*y(i);
   I_low = I_low+S;
end


I_t = 0;
for (i=1:n)
   interval(i) = x(i+1)-x(i);
   S = interval(i)*(y(i)+y(i+1))/2;
   I_t = I_t+S;
end

I_up
I_low
I_t

abs(1-I_up)
abs(1-I_low)
abs(1-I_t)