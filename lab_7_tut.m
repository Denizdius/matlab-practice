
clear all;
close all ;
clc;

L = 10;
N = 1024;
dx = L/(N-1);
x = 0:dx:L;

f = zeros(size(x));
f(258:768) = 1;

A0 = sum(f.*ones(size(x)))*dx*2/L;
fFS = A0/2;

for k = 1:100
    Ak = sum(f.*cos(2*pi*k*x/L))*dx*2/L;
    Bk = sum(f.*sin(2*pi*k*x/L))*dx*2/L;
    fFS = fFS +  Ak*cos(2*pi*k*x/L) + Bk*sin(2*pi*k*x/L);
end

figure(1)

plot(x,f,'r');
hold on
plot(x,fFS,'-k');

