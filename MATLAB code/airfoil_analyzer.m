%program airfoil analyzer
clear all; close all; clc
%Initialize geometry
%wedge

c = 2; 
num_points = 1000;

deltax = c/(num_points-1);

x = 0:deltax:c;


for i=1:num_points
  y_u(i)=x(i)*tan(5*pi/180);
end;
for i=1:0.5*num_points
  y_u(num_points+i)=y_u(num_points)*(1-2*i/num_points);
  end
y_l = -y_u;
x((num_points+1):(1.5*num_points)) = x(num_points);
x_u = x;
x_l = x;

%panelization
[alpha_u, h_u, alpha_l, h_l] = panelize(x_u, x_l, y_u, y_l)

%calculate p, tau
p_u = zeros(1, numel(y_u)-1);
p_l = zeros(1, numel(y_l)-1);
tau_u = zeros(1, numel(y_u)-1);
tau_l = zeros(1, numel(y_l)-1);

p_u(1:num_points-1) = 1.31e+05; %N/m^2
p_l(1:num_points-1) = 1.31e+05; %N/m^2
p_u(num_points:1.5*num_points-1) = 1.01e+05;
p_l(num_points:1.5*num_points-1) = 1.01e+05;

for (i = 1:num_points-1)
  centersx_u(i) = (x_u(i+1)+x_u(i))/2;
  centersx_l(i) = (x_l(i+1)+x_l(i))/2;
  centersy_u(i) = (y_u(i+1)+y_u(i))/2;
  centersy_l(i) = (y_l(i+1)+y_l(i))/2;
  s_u(i) = sqrt(centersx_u(i)^2+centersy_u(i)^2);
  s_l(i) = sqrt(centersx_l(i)^2+centersy_l(i)^2);
  tau_u(i) = 431*s_u(i)^(-0.2);
  tau_l(i) = 431*s_l(i)^(-0.2);
endfor
  s_u(num_points) = sqrt(c^2+max(y_u)^2)+h_u(num_points);
for (i = (num_points+1):(num_points+(num_points/2)-1))
  s_u(i) = s_u(i-1)+h_u(i);
endfor
s_l = s_u;
%plot(s_u(1:99), tau_u(1:99));

D1 = Integral(s_u, p_u.*sin(alpha_u))
D2 = Integral(s_u(1:num_points-1), tau_u(1:num_points-1).*cos(alpha_u(1:num_points-1)))
D3 = abs(Integral(s_l, p_l.*sin(alpha_l)))
D4 = Integral(s_l(1:num_points-1), tau_l(1:num_points-1).*cos(alpha_l(1:num_points-1)))

D = D1+D2+D3+D4;