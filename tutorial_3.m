

%%
clc;
clear  all;
close all;


%%

y = [5,2,6,14];
x = [1,2,3,4];
z= [50,25,85,115];

%%
figure(1)
plot3(x,y,z,'ro','MarkerSize',10)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
grid on

%%
clc;
clear all;
close all;

z1 = 2 +3i;
z2= 2 +3j;
z3= 2 +3*1i;

real_z = real(z1);
z = rand(1,10) + 1i*rand(1,10);

figure
subplot(2,1,1);
plot(z,'LineWidth',2);
grid on
xlabel('real Part');
ylabel('Imaginary Part');
legend('Ploting line')

subplot(2,1,2);
plot(z,'rx','MarkerSize',10);
grid on
xlabel('real part');
ylabel('Imaginary Part');
legend('The line');

%%
clearvars; clc; close all;

x=0;
y=10;

if x ~= 2
    Z = 'First';
    U =1.1;
elseif x>=y
     Z= 'Second';
    U =2.1;
elseif x==y 
    z = 'Third';
    U =3.1;
elseif x == 3
    Z = 'Other';
    U = 4.1;
end


%%

clearvars; clc; close all;

x = sym('x');
a = sym('alpha');

ph = sym((1+sqrt(5))/2);

y =sym('y');
y = 1/(1+x^2);
xmin = -5;
xmax = 5;

figure 
fplot(y,[xmin,xmax]) %% for sembolic ploting 
grid on;

%%
clearvars; clc; close all;
time1 =0:0.1:6;
N=length(time1);
N1 = 100;
time2 =linspace(0,6,100); %% 100 tane elaman olcak şekilde 0 dan 6 ya git
N2 = length(time2);
i =find(time2 ==2); %%34. elaman
%%

clearvars; clc; close all;
t1 =-2:0.1:4;
x1=3*exp(0.4*t1);
y1=2*exp(-0.9*t1);

figure(1)
plot(t1,x1,'b--','LineWidth',2);
hold on %%aynı eksende 2 plot çizmek için
plot(t1,y1,'r','LineWidth',2);
grid on
xlabel('Time,t');
ylabel('Amplitude');


t2 =-4:0.1:4;
x2=4*exp(t2);
y2=5*exp(t2);

figure(2)
stem(t2,x2,'b--','LineWidth',2);
hold on %%aynı eksende 2 plot çizmek için
stem(t2,y2,'r','LineWidth',2);
grid on
xlabel('Time,t');
ylabel('Amplitude');



