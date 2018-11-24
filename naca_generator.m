clear all; close all; clc;


c = 1; % длина хорды [m]
num_points = 200;

deltax = c/(num_points-1);

x = 0:deltax:c;

XX = 12;
a1 = 0.2969;
a2 = -0.1260;
a3 = -0.3516;
a4 = 0.2843;
a5 = -0.1015;
y_t = 5*XX*c/100*(a1*x.^(0.5) + a2*x +a3*x.^2 + a4*x.^3 +a5*x.^4);
y_plus = y_t;
y_minus = -y_t;

figure
hold on
plot(x, y_plus, 'b-*');
plot(x, y_minus, 'b-*');
plot(x, zeros(1, num_points), 'r-*');
grid on;
title('NACA0012');
xlabel('x');
ylabel('y');

%Ассиметричный профиль
M = 2;
P = 4;
XX = 12;

c = 1; %длина хорды
m = 0.01*M;
p = 0.1*P;

%Средняя линия
for i = 1:num_points
  if (x(i) < (p*c))
      y_c(i) = m/p^2*(2*p*(x(i)/c) - (x(i)/c)^2);
      dy_cdx(i) = 2*m/(p^2)*(p-x(i)/c);
  else
    y_c(i) = m/((1-p)^2)*((1-2*p)+2*p*(x(i)/c) - (x(i)/c)^2);
    dy_cdx(i) = 2*m/((1-p)^2)*(p-x(i)/c);
  end
end

theta = atan(dy_cdx);

y_t = 5*XX*c/100*(a1*x.^(0.5) + a2*x +a3*x.^2 + a4*x.^3 +a5*x.^4);
x_u = x - y_t.*sin(theta);
x_l = x + y_t.*sin(theta);
y_u = y_c + y_t.*cos(theta);
y_l = y_c - y_t.*cos(theta);

figure
hold on
plot(x, y_c, 'k-*');
plot(x_u, y_u, 'b-*');
plot(x_l, y_l, 'b-*');
axis([-0.1*max(x)+min(x) 1.1*max(x) 2*min(y_l) 2*max(y_u)]);
set(gca,'DataAspectRatio',[1 1 1])

