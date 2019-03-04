function panels = panelize(X, Y)
  n = numel(X) - 1;
  alpha = zeros(1, n);
  h = zeros(1, n);
  centerX = zeros(1, n);
  centerY = zeros(1, n);
  for i=1:n
    y1=Y(i);
    y2=Y(i+1);
    x1=X(i);
    x2=X(i+1);
    alpha(i)= FunAngle(y1,y2,x1,x2);
    h(i)=sqrt((y2-y1)^2 + (x2-x1)^2);
    centerX(i) = (x_u(i+1) + x_u(i))/2;
    centerY(i) = (y_u(i+1) + y_u(i))/2; 
    panels(i) = struct('centerX', centerX(i), 'centerY', centerY(i), 'angle', alpha(i), 'length', h(i));
    end
endfunction

