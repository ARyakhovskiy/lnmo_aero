
function Ac = Acoef (A, x, y, X, Y, panelize)
  n=numel(panelize);
  Ac = magic(n);
  for(i=1:n);
  for(j=1:n);
  P=-(x(i)-X(j))*cos(A(j))-(y(i)-Y(j))*cos(A(i));
  P=Ac(i,j);
end
end
end
