
clc;
close all;
clearvars;



t = 0:0.1:pi;
y1 = t;
y2 = sin(t);
y3 = cos(t);
y4 = tan(t);

%subplot(m,n,p) m = div of heigt,n no .of division of width, p is the
%position of graph


figure(1)
subplot(2,2,1);
plot(t,y1,'r');
xlabel("time");
ylabel("values");
legend();

subplot(2,2,2);
plot(t,y2,'ro');
xlabel("time")
ylabel("sine function");
legend();


subplot(2,2,3);
plot(t,y3,'b');
xlabel("time")
ylabel("cosine function");
legend();



subplot(2,2,4);
plot(t,y4,'r--');
xlabel("time")
ylabel("tan function");
legend();



