
function Bc = Bcoef (x, y, X, Y, panel)
  n=numel(panel);
  Bc = magic(n);
   for(i=1:n);
     for(j=1:n);
  P1=(x(i)-X(j)).^2+(y(i)-Y(j)).^2;
  Bc(i,j)=P1;
     end
   end
end
