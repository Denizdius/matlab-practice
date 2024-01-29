% 
clearvars;
close all;
clc;
%% part1
f1=56;
f2=66;

t=0:0.001:0.6;
x=cos(2*pi*f1*t)+cos(2*pi*f2*t);
h=t.*t;


figure(1);

subplot(311);
plot(t,x); xlabel('t'); title('x(t)');

subplot(312);
plot(t,h); xlabel('t'); title('h(t)');

y=conv(x,h,'same');

subplot(313);
plot(t,y); xlabel('t'); title('x(t)*h(t)');


%% part2.a
Fs=1000;
f=linspace(-Fs/2,Fs/2,600);
c=sin(600*pi*t);
g1=x.*c;
z=rand(1,601);
g2=g1+z;
g3=g2.*c;

figure(2);
subplot(311);
plot(t,g1,'LineWidth',2.5); xlabel('t'); title('g1(t)');
subplot(312);
plot(t,g2); xlabel('t'); title('g2(t)');
subplot(313);
plot(t,g3); xlabel('t'); title('g3(t)');

%% part2.b
N=600;
X=fft(x,N);
X=fftshift(X);

G1=fft(g1,N);
G1=fftshift(G1);

G2=fft(g2,N);
G2=fftshift(G2);

G3=fft(g3,N);
G3=fftshift(G3);

figure(3);
subplot(411);
plot(f,abs(X)/N); xlabel('f'); title('F transform of x(t)');
subplot(412);
plot(f,abs(G1)/N); xlabel('f'); title('F transform of g1(t)');
subplot(413);
plot(f,abs(G2)/N); xlabel('f'); title('F transform of g2(t)');
subplot(414);
plot(f,abs(G3)/N); xlabel('f'); title('F transform of g3(t)');

%% part2.c
n=6;
fc=61;
Fs=1000;
wn=(fc*2)/Fs;


[b,a]=butter(n,wn,'low');
[h,w]=freqz(b,a,Fs/2);


figure(4);
plot(abs(h)); title('|H(jw)|');

%% part2.d

Y1=filter(b,a,g3);
figure(5);
subplot(211);
plot(Y1); title('Y1 in freq. domain');

y1=ifft(Y1,'symmetric');
subplot(212);
plot(y1); title('y1(t)');

% part2.e
n=2;
fc=61;
Fs=1000;
wn=(fc*2)/Fs;


[bi,ai]=butter(n,wn,'low');
[hi,wi]=freqz(bi,ai,Fs/2);

figure(6);
plot(abs(hi)); title('|H2(jw)|');

