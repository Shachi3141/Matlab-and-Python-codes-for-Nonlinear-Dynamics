%limit cycyle

clc;
clear;

tspan=[0:0.2:5*pi];
plotarrow=@(m) quiver(m(:,1),m(:,2),gradient(m(:,1)),gradient(m(:,2)));

figure;
subplot(2,2,1);
x0=[0;0.2];
[t,x]=ode45(@(t,y)f1(t,y),tspan,x0);
plotarrow(x);
title('phase potrait(initial point is inside)','Color','r');
xlabel('X1 ---->');
ylabel('X2 ---->');
axis tight square;
grid on;
subplot(2,2,2);
plot(t,x(:,1),t,x(:,2));
grid on;

subplot(2,2,3);
y0=[2;0];
[t,y]=ode45(@(t,y)f1(t,y),tspan,y0);
plotarrow(y);
title('phase potrait(initial point is inside)','Color','r');
xlabel('X1 ---->');
ylabel('X2 ---->');
axis tight square;
grid on;

subplot(2,2,4);
plot(t,y(:,1),t,y(:,2));
grid on;

function d=f1(t,y)
d=zeros(2,1);
d(1)=y(1)*(1 - sqrt(y(1)^2+y(2)^2)) -y(2);
d(2)=y(2)*(1 - sqrt(y(1)^2+y(2)^2)) +y(1);
end
