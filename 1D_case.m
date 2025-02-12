% 1D case didt=(a-bi)i

clc;
clear all;

i0=1;
tspan=[0 10];

figure;
hold on;
a=2;
b=1;
[t,i]=ode45(@(t,i) (a-b*i)*i,tspan,i0);
plot(t,i);
labels1 = num2str([a,b],['alpha  = %d,beta = %d']);

a=-2;
b=1;
[t,i]=ode45(@(t,i) (a-b*i)*i,tspan,i0);
plot(t,i);
labels2 = num2str([a,b],['alpha  = %d,beta = %d']);
legend (labels1,labels2);
xlabel('t  ----->');
ylabel('I  ---->');
title('PLOT FOR 1D CASE ');
grid on;



