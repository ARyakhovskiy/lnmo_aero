function I = Integral (x, y)
  if (numel(x) == numel(y))
   n = numel(x);
  else
   error("Orders of arrays do not match");
   end
I = 0;
for (i=1:n-1)
   interval(i) = x(i+1)-x(i);
   S = interval(i)*(y(i)+y(i+1))/2;
   I = I+S;
end