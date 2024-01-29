close all;
clear variables;
clc;

t1 = linspace(0,2,1000);

x1 = 5*sin(2*pi*5*t1);
x2 = (1.5)*exp((0.4)*t1);
a= 0.5;
b=2;
x3 = a*x1 + b*x2;
y1 = (t1+1).*x1;
y2 = (t1+1).*x2;
y3 = (t1+1).*x3;

sumy3 = (t1+1).*(a*x1 + b*x2);

if sumy3==y3

    disp('linear System');
else
    disp('None linear Syatem');

end    

figure(1);

subplot(2,2,1);
plot(t1,x1,'r');
grid on
title('x1(t)')
xlabel("time");
ylabel("x2");
legend();

subplot(2,2,2);
plot(t1,y1,'ro');
grid on
title('y1(t)')
xlabel("time")
ylabel("y1");
legend();


subplot(2,2,3);
plot(t1,x2,'b');
grid on
title('x2(t)')
xlabel("time")
ylabel("x2");
legend();



subplot(2,2,4);
plot(t1,y2,'r--');
grid on
title('y2(t)')
xlabel("time")
ylabel("y2");
legend();


figure(2)

plot(t1,y3,'r--');
hold on
plot(t1,sumy3,'bo');
grid on
title('y3(t) vs ay1(t) + by2(t)')
xlabel('Time,t');
ylabel('Amplitude');


%%

close all;
clear variables;
clc;

t1 = linspace(0,2,1000);

x1 = 5*sin(2*pi*5*t1);
x2 = (1.5)*exp((0.4)*t1);
a= 0.5;
b=2;
x3 = a*x1 + b*x2;
y1 = x1.*x1;
y2 = x2.*x2;
y3 = x3.*x3;

sumy3 = a*y1 + b*y2;

if sumy3==y3

    disp('linear System');
else
    disp('None linear Syatem');

end    

figure(3);

subplot(2,2,1);
plot(t1,x1,'r');
grid on
title('x1(t)')
xlabel("time");
ylabel("x2");
legend();

subplot(2,2,2);
plot(t1,y1,'b--');
grid on
title('y1(t)')
xlabel("time")
ylabel("y1");
legend();


subplot(2,2,3);
plot(t1,x2,'b');
grid on
title('x2(t)')
xlabel("time")
ylabel("x2");
legend();



subplot(2,2,4);
plot(t1,y2,'r--');
grid on
title('y2(t)')
xlabel("time")
ylabel("y2");
legend();


figure(4)

plot(t1,y3,'r--');
hold on
plot(t1,sumy3,'bo');
grid on
title('y3(t) vs ay1(t) + by2(t)')
xlabel('Time,t');
ylabel('Amplitude');

%%

