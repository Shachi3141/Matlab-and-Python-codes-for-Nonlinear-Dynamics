clc;
clear all;
b=1;
tspan=[0,10];
y0=[1;1];
plotarrow=@(m) quiver(m(:,1),m(:,2),gradient(m(:,1)),gradient(m(:,2)));

figure;
subplot(2,2,1);
[t,y]=ode45(@(t,y)f1(t,y,b),tspan,y0);
plotarrow(y);
title('phase potrait(beta=1)','FontSize',10,'Color','r');
xlabel('X1 ---->');
ylabel('X2 ---->');
axis tight square;
grid on;

subplot(2,2,2);
plot(t,y(:,1),t,y(:,2));
title('x1 & x2(beta=1)','FontSize',10,'Color','r');
grid on;

subplot(2,2,3);
b=-1;
[t,y]=ode45(@(t,y)f1(t,y,b),tspan,y0);
plotarrow(y);
title('phase potrait(beta=-1)','FontSize',10,'Color','r');
xlabel('X1 ---->');
ylabel('X2 ---->');
grid on;
axis tight square;
subplot(2,2,4);
plot(t,y(:,1),t,y(:,2));
title('x1 & x2 (beta=-1)','FontSize',10,'Color','r');
grid on;


function d=f1(t,y,b)
d=zeros(2,1);
d(1)=y(2);
d(2)=-y(1)-b*y(2);
end
