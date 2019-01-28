
function Ac = Acoef (A, x, y, X, Y, panel)
  n=numel(panel);
  Ac = magic(n);
  for(i=1:n);
    for(j=1:n);
      P=-(x(i)-X(j))*cos(A(j))-(y(i)-Y(j))*sin(A(j));
      Ac(i,j)=P;
    end
  end
end
