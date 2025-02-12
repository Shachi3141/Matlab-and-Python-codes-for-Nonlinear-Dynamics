clear all;
clc;
[x,y]=meshgrid(-pi:0.01:pi);
u=x+ exp(-y);
v=-y;
streamslice(x,y,u,v);
title('phase potrait','FontSize',15,'Color','r');
xlabel('X1 ---->');
ylabel('X2 ---->');
axis tight square;
grid on;

