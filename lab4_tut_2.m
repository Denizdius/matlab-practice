close all;
clear variables;
clc;

dt=0.025;

t1=0:dt:0.5;
t2=0.5:dt:1;
t=[t1 t2];

x1=exp(-5*t1);
x2=flip(x1);
x=[x1 x2];

figure(1);
subplot(141)
plot(t,x); title('x(t)')

tshift=t-0.5;
subplot(142)
plot(tshift,x); title('x2(t), shifted x(t)');

xeven=(x+flip(x))/2;
xodd=(x-flip(x))/2;

subplot(143);
plot(tshift,xeven); title('even part of x2(t)');

subplot(144);
plot(tshift,xodd); title('odd part of x2(t)');


%%
t3=(t1+1)/2;
x3=exp(-5*t1);

figure(2);
subplot(121);
plot(t1,x3);
subplot(122);
plot(t3,x3);

%%
dT=0.01;
t=0:dt:1;

f1=abs(cos(100*pi*t));
f2=exp(-5*t);
f3=5*f1+3*f2;

o1=sum(f1);
o2=sum(f2);
o3=sum(f3);
if o3==sum(5*f1+3*f2)
    disp('linear system');
else
    disp('nonlinear system');
end