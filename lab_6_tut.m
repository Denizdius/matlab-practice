clearvars;
close all;
clc;

dt=0.001;
t=0:dt:5;

xt=5*exp(-0.5*t);

figure(1);
plot(t,xt); xlabel('t'); ylabel('x(t)');
grid on

u=0;
for k=-1000:1:1000
 u=u+1;
 fsc(1,u)=sum(xt.*exp(-1j*(2*pi/5)*k*t))*dt/5;
end

right =(sum(abs(xt).^2)*dt)/5; 

for h=-1000:1:1000 
    left =sum(abs(fsc).^2);
end