clear all; close all; clc;
M = dlmread("data.txt")
for i=1:61
  X_up(i)=M(i,1);
endfor
for i=62:122
  X_dw(i)=M(i,1);
endfor
for i=1:61
  Y_up(i)=M(i,2);
endfor
for i=62:122
  Y_dw(i)=M(i,2);
endfor
figure 
  hold on 
  plot(X_up, Y_up, 'b-*'); 
  plot(X_dw, Y_dw, 'b-*'); 