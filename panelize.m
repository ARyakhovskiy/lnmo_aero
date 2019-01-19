function [alpha_u, h_u, alpha_l, h_l] = panelize(x_u, x_l, y_u, y_l)
  alpha_u = zeros(1, numel(y_u)-1);
  alpha_l = zeros(1, numel(y_l)-1);
  h_u = zeros(1, numel(y_u)-1); %length between points (up)
  h_l = zeros(1, numel(y_l)-1);%length between points (down)
  for i=1:numel(y_u)-1
    y1=y_u(i);
    y2=y_u(i+1);
      x1=x_u(i);
    x2=x_u(i+1);
    alpha_u(i)= FunAngle(y1,y2,x1,x2);
    h_u(i)=Length(y1,y2,x1,x2);
  end
  for i =1:numel(y_l)-1
    y1=y_l(i);
    y2=y_l(i+1);
    x1=x_l(i);
    x2=x_l(i+1);
    alpha_l(i)= FunAngle(y1,y2,x1,x2);
    h_l(i)=Length(y1,y2,x1,x2);
  end
endfunction
