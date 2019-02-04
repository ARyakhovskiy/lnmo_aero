function [nodesX, nodesY] = shapeEq(B, T, P, C, E, R, n)

tStep = 2*pi/n;
nodesX = zeros(1, n+1);
nodesY = zeros(1, n+1);
nodesX(1) = 1.0;
nodesY(1) = 0.0;
for i = 2:(n+1)
  theta = tStep*(i-1);
  nodesX(i) = 0.5 + 0.5*abs(cos(theta))^B/(cos(theta));
  nodesY(i) = T/2 * abs(sin(theta))^B/sin(theta)*(1-nodesX(i)^P) + C*sin(pi*nodesX(i)^E) + R*sin(2*pi*nodesX(i));
end



%figure
%hold on
%grid on

%plot(nodesX, nodesY);

%clarkX = A(:, 1);
%clarkY = A(:, 2);
%plot(clarkX, clarkY, '*');
%set(gca,'DataAspectRatio',[1 1 1])
%xlabel('m');
%ylabel('m');
%axis([-0.1*max(abs(clarkX))+min(clarkX) 1.1*max(clarkX) -0.1*max(abs(clarkX)) 0.15*max(abs(clarkX))]);
%legend('Optimized profile', 'Clark Y');
