function RHS = RHS (A, al, panel) %%al - ���� �����
  n=numel(panel)
 RHS=magic(n);
  for(i=1:n)
    RHS(i,1) == sin((A(i)-al));
    end
endfunction
