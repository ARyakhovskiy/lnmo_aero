function I = Integral_S (x, y)
  if (numel(x) == numel(y))
   n = numel(x);
  else
   error("Orders of arrays do not match");
 end
 I=0;
 I=((x(n)-x(1))/6)*(y(1)+4*y((1+n)/2)+y(n));
end