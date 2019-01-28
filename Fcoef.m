
function Fc = Fcoef (A, Acoef, Bcoef, S, panel)
  n=numel(panel);
  Fc = magic(n);
  for(i=1:n);
    for(j=1:n);
      P5=ln(1+ ((S(j)).^2+2*Acoef*S(j))/Bcoef);
      Fc(i,j)=P5;
    end
  end
end
