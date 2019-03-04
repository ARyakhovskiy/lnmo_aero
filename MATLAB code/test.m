close all; clear all; clc

c=0.3; %хорда [m]
rho = 1.2;

%M = Mach(v, T)
%Re = Reynolds(rho, c, v, T)

T = 170:10:300;
v = 30:10:400;
plot(T, Reynolds(rho, c, v, T), 'r');
figure
plot(T, Mach(v, T));


plot(v, Mach(v, 300));
