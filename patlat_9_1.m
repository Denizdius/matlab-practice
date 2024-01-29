clc;
close all;
clear variables;

f1=50;
f2=200;
f3=500;

FS=5000;
t=-0.05:1/FS:0.05;

x1=0.1*sin(2*pi*f1*t);
x2=0.5*cos(2*pi*f2*t);
x3=(-0.9)*sin(2*pi*f3*t);

h1= double(t==0);
h2= double(t==0);
h3= double(t==0);

figure(1);
subplot(1,4,1);
plot(t,x1); xlabel('t'); title('x1(t)');
subplot(1,4,2);
plot(t,x2); xlabel('t'); title('x2(t)');
subplot(1,4,3);
plot(t,x3); xlabel('t'); title('x3(t)');
subplot(1,4,4);
plot(t,h1); xlabel('t'); title('h1,h2,h3');

%%%%%%%%%%%%%%%%%%%%%%%%b

x4= conv(x1,h1,'same')+conv(x2,h2,'same')+conv(x3,h3,'same');

figure(2);
subplot(1,1,1);
plot(t,x4); xlabel('t'); title('x4(t)');


N=1024;
f=linspace(-FS/2,FS/2,N);
X4=fft(x4,N);
X4=fftshift(X4);

figure(3);
plot(f,abs(X4/N)); xlabel('f'); title('F transform of X4');

%%%%%%%%%%%%%%%%%%%%%%%%c

Fo1=75;
Fo2=350;
Fs=5000;

Wn=(Fo1*2)/Fs;

n=5;
[bn,an]=butter(n,Wn,'low');
[hn,wn]=freqz(bn,an,Fs/2);

fn=wn/(2*pi);


Fc = [75 350];
Fs = 5000;
[bn1,an1]=butter(n,Fc./(Fs/2),'bandpass');
hn3=freqz(bn1,an1,Fs/2);



WN1=(Fo2*2)/Fs;
[Bn,An]=butter(n,WN1,'high');
[hn2,WN]=freqz(Bn,An,Fs/2);

FN=WN/(2*pi);



figure(4);

subplot(1,3,1);
plot(fn*Fs,abs(hn))
subplot(1,3,2);
plot(FN*FS,abs(hn2))
subplot(1,3,3);
plot(FN*FS,abs(hn3))

Y1=filter(bn,an,x4);
Y2=filter(bn1,an1,x4);
Y3=filter(Bn,An,x4);

Y1=fft(Y1,N);
Y11f=fft(Y1,N);
Y11f=fftshift(Y1);

Y2=fft(Y2,N);
Y22f=fft(Y2,N);
Y22f=fftshift(Y2);

Y3=fft(Y3,N);
Y33f=fft(Y3,N);
Y33f=fftshift(Y3);


figure(5);
subplot(1,3,1);
plot(f,abs(Y11f)); title('Y1(f)')
subplot(1,3,2);
plot(f,abs(Y22f)); title('Y2(f)')
subplot(1,3,3);
plot(f,abs(Y33f)); title('Y3(f)')
