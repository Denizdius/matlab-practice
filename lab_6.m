clear variables
clc;

n = 0:0.1:1; % define time scale
n1 = 0:0.001:1; 

derivative_x = heaviside(0.5-n) - heaviside(n-0.5);  
derivative_x_1 = heaviside(0.5-n1) - heaviside(n1-0.5);

x = cumsum(derivative_x*0.1);
x_1 = cumsum(derivative_x_1*0.001);

figure(1);

subplot(2,2,1);
plot(n,derivative_x,'r');
grid on
title('derivative x(n)')
xlabel("time");
ylabel("derivative of x");
legend();

subplot(2,2,2);
plot(n,x,'b');
grid on
title('x(n)')
xlabel("time");
ylabel(" x");
legend();

subplot(2,2,3);
plot(n1,derivative_x_1,'r');
grid on
title('derivative x(n1)')
xlabel("time");
ylabel("derivative of x");
legend();

subplot(2,2,4);
plot(n1,x_1,'b');
grid on
title('x(n1)')
xlabel("time");
ylabel(" x");
legend();

%%


clear variables
close all;
clc;

n = 0:0.1:1; % define time scale
n1 = 0:0.001:1; 

derivative_x = heaviside(0.5-n) - heaviside(n-0.5);  
derivative_x_1 = heaviside(0.5-n1) - heaviside(n1-0.5);

x = cumsum(derivative_x*0.1);
x_1 = cumsum(derivative_x_1*0.001);

N = 1;
w = (2*pi) / N; % define omega
k = -100 :1:100;
s = length(k);

A = zeros(1,201);

for l = 1:101
    for m = 1:N
       A(l) = A(l) + x(m) * exp(-1i*w*m*l);
    end
    disp(A(l));
end


%%
clear variables
close all;
clc;

n = 0:0.1:1; % define time scale
n1 = 0:0.001:1; 

derivative_x = heaviside(0.5-n) - heaviside(n-0.5);  
derivative_x_1 = heaviside(0.5-n1) - heaviside(n1-0.5);

x = cumsum(derivative_x*0.1);
x_1 = cumsum(derivative_x_1*0.001);

N = 1;

for l = 1:N
    for m = 1:N
      parseval = x(m) *x(m);
    end
    disp(parseval);
end



