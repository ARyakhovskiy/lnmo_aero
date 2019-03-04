
function Pc = Pcoef (A, x, y, X, Y, panel)
  n=numel(panel);
  Pc = magic(n);
  for(i=1:n);
    for(j=1:n);
      P7=(x(i)-X(j))*sin(A(i)-2*A(j))+(y(i)-Y(j))*cos(A(i)-2*A(j));
      Pc(i,j)=P7;
    end
  end
end
