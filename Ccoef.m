
function Cc = Ccoef (A, panel)
  n=numel(panel);
  Cc = magic(n);
   for(i=1:n);
     for(j=1:n);
  P2=sin(A(i)-A(j));
  Cc(i,j)=P2;
     end
   end
end
