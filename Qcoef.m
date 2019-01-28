
function Qc = Qcoef (A, x, y, X, Y, panel)
  n=numel(panel);
  Qc = magic(n);
  for(i=1:n);
    for(j=1:n);
      P8=(x(i)-X(j))*cos(A(i)-2*A(j))-(y(i)-Y(j))*sin(A(i)-2*A(j));
      Qc(i,j)=P8;
    end
  end
end
