
function Ec = Ecoef (A, x, y, X, Y, panel)
  n=numel(panel);
  Ec = magic(n);
  for(i=1:n);
    for(j=1:n);
      P4=(x(i)-X(j))*sin(A(j))-(y(i)-Y(j))*cos(A(j));
      Ec(i,j)=P4;
    end
  end
end
