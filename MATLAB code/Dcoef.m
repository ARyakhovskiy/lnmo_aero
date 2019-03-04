
function Dc = Dcoef (A, panel)
  n=numel(panel);
  Dc = magic(n);
   for(i=1:n);
     for(j=1:n);
  P3=cos(A(i)-A(j));
  Dc(i,j)=P3;
     end
   end
end
