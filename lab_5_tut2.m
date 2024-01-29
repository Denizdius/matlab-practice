
clear variables
close all
clc;

n1 = -20:1:20;
n2 = -40:2:40;
x = sin(n1);            
h = exp(-0.2 * n2);
y2 = conv(x,h);
N = length(x);
M = length(h);
Ny = N + M -1;
y = zeros(1,Ny);
for i = 1:N
      for k = 1:M
       y(i+k-1) = y(i+k-1) + h(k)*x(i);
      end
end
m = 0: Ny-1; %% time scale of plots 
% Make plot
figure 
subplot(2,1,1);
stem(m,y,'linewidth',2,'color','m')
grid;
a = title('Output of an LTI System y(n)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n');
set(a,'Fontsize',10);
% Using matlab built in function (you get the same results)
subplot(2,1,2);
stem(m,y2,'linewidth',2,'color','r')
grid;
a = title('Output y(n) using conv(x,h)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n ');
set(a,'Fontsize',10);

%%

clear variables
close all
clc;

t1 = 0:0.1:100;
t2 = -50:0.1:50;
h1 = exp(-2*t2);
x1 = sin(t1);
y_auto = conv(x1,h1);
N1 = length(x1);
M1 = length(h1);
Nyct = N1 + M1 -1 ;
y1 =zeros(1,Nyct);

for i = 1:N1
      for k = 1:M1
       y1(i+k-1) = y1(i+k-1) + h1(k)*x1(i);
      end
end

m1 = 0:Nyct-1;

figure(2);

subplot(2,1,1);
plot(m1,y1,'linewidth',3,'color','m')
grid;
a = title('Output of an LTI System y(n)');
set(a,'fontsize',14);
a = ylabel('y(n)');
set(a,'Fontsize',14);
a = xlabel('n');
set(a,'Fontsize',14);
% Using matlab built in function (you get the same results)
subplot(2,1,2);
plot(m1,y_auto,'linewidth',3,'color','r')
grid;
a = title('Output y(n) using conv(x,h)');
set(a,'fontsize',14);
a = ylabel('y(n)');
set(a,'Fontsize',14);
a = xlabel('n ');
set(a,'Fontsize',14);




