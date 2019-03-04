
function Gc = Gcoef (A, Acoef, Bcoef, Ecoef, S, panel)
  n=numel(panel);
  Gc = magic(n);
  for(i=1:n);
    for(j=1:n);
      P6=tan((E*S(j))/(Bcoef+Acoef*S(j))).^2;
      Gc(i,j)=P6;
    end
  end
end
