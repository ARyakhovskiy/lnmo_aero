function I = Integral_S (x, y)
  if (numel(x) == numel(y))
   n = numel(x);
  else
   error("Orders of arrays do not match");
 end
  I=0;
    L=0;
    M=0;
    S=0;
  h=x(2)-x(1);
 if (mod(n, 2) == 0)
   N=n/2;
 for (i=2:N)
  P=y(2*i-1);
  L=L+P;
  end
for (i=1:N-1)
    K=y(2*i);
    M=M+K;
end
 I=I+(h/3)*(y(1)+y(n)+4*L+2*M);
 
else
    N=(n-1)/2;
 for (i=2:N)
  P=y(2*i-1);
  L=L+P;
  end
for (i=1:N-1)
    K=y(2*i);
    M=M+K;
end
   S = h*(y(n-1)+y(n))/2;
 I=I+(h/3)*(y(1)+y(n-1)+4*L+2*M)+S;
   
 end
