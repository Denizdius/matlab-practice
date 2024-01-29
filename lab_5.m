

clear variables

clc;

t = 0:0.1:5;
x = heaviside(t) - heaviside(t-5);
h1 = cos(pi*t);
h2 = 2*exp(-2*t);

figure(1);

subplot(3,1,1);
plot(t,x,'r');
grid on
title('x(t)')
xlabel("time");
ylabel("x");
legend();

subplot(3,1,2);
plot(t,h1,'ro');
grid on
title('h1(t)')
xlabel("time")
ylabel("h1");
legend();


subplot(3,1,3);
plot(t,h2,'b');
grid on
title('h2(t)')
xlabel("time")
ylabel("h2");
legend();




clear variables

clc;


t = 0:0.1:5;
x = heaviside(t) - heaviside(t-5);
h1 = cos(pi*t);
h2 = 2*exp(-2*t);
N = length(x);
M = length(h1);
Nyct = N + M -1 ;
y = zeros(1,Nyct); 
y2 = conv(x,h1);



for i = 1:N
     for k = 1:M
      y(i+k-1) = y(i+k-1) + x(k)*h1(i);
      end
end


m = 0:Nyct-1; %% time scale of plots 

% Make plot
figure 
subplot(2,1,1);
plot(m,y,'linewidth',2,'color','m')
grid;
a = title('Output of an LTI System y(n)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n');
set(a,'Fontsize',10);
%%%%
subplot(2,1,2);
plot(m,y2,'linewidth',2,'color','r')
grid;
a = title('Output y(n) using conv(x,h)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n ');
set(a,'Fontsize',10);



clear variables

clc;


t = 0:0.1:5;
x = heaviside(t) - heaviside(t-5);
h1 = cos(pi*t);
h2 = 2*exp(-2*t);
h3 = h1 + h2;
N = length(x);
M = length(h1);
Nyct = N + M -1 ;
y4 = zeros(1,Nyct); 
y2 = conv(x,h1);



for i = 1:N
     for k = 1:M
      y4(i+k-1) = y4(i+k-1) + x(k)*h3(i);
      end
end

y3= zeros(1,Nyct);

for i = 1:N
     for k = 1:M
      y3(i+k-1) = y3(i+k-1) + x(k)*(h1(i) + h2(i));
      end
end



m = 0:Nyct-1; %% time scale of plots 

% Make plot
figure 
subplot(2,1,1);
plot(m,y4,'linewidth',2,'color','m')
grid;
a = title('Output of an LTI System y(n)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n');
set(a,'Fontsize',10);
%%%%
subplot(2,1,2);
plot(m,y3,'linewidth',2,'color','r')
grid;
a = title('Output y(n) using conv(x,h)');
set(a,'fontsize',10);
a = ylabel('y(n)');
set(a,'Fontsize',10);
a = xlabel('n ');
set(a,'Fontsize',10);






