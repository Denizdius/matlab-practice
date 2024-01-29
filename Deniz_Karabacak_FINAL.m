
close all;
clc;
clearvars;
%%

Fs = 4000;
Fc = 700;%%low pass filter 
n=10; %% filter order
N = 1024 ; %%fft length
f = 250; %%standart freq
t = 0:0.01:0.1; %% time interval

m = 2*sin(2*pi*f*t) + 1.5*cos(2*pi*5*f*t) + cos(2*pi*(f/2)*t);
c1 = exp(j*2*pi*400*t);
c2 = exp(-1*j*2*pi*400*t);
x = m.*c1;


[b_low,a_low] = butter(n,Fc/(Fs/2),'low'); %low pass filter
h_low = freqz(b_low,a_low,Fs/2);%magnitude

z = filter(b_low,a_low,x);
y = c2.*z;

v=0;
sympref('HeavisideAtOrigin',v);
h = heaviside(t-0.05) - heaviside(t-0.08);
w = conv(y,h);
conv_time = length(y) + length(h) -1;
m_fourier= fftshift(abs(fft(m,N)))/N;
x_fourier= fftshift(abs(fft(x,N)))/N;
z_fourier= fftshift(abs(fft(z,N)))/N;
y_fourier= fftshift(abs(fft(y,N)))/N;
forier_time = linspace(-Fs/2,Fs/2,N);


figure;

subplot(4,1,1);
plot(forier_time,m_fourier);
grid on
title("Magnitude of Frequency Response of M")
ylabel("Magnitude");
xlabel("Frequency");


subplot(4,1,2);
plot(forier_time,x_fourier);
grid on
title("Magnitude of Frequency Response of X")
ylabel("Magnitude");
xlabel("Frequency");


subplot(4,1,3);
plot(forier_time,z_fourier);
grid on
title("Magnitude of Frequency Response of Z")
ylabel("Magnitude");
xlabel("Frequency");


subplot(4,1,4);
plot(forier_time,y_fourier);
grid on
title("Magnitude of Frequency Response of Y")
ylabel("Magnitude");
xlabel("Frequency");

figure;

subplot(3,1,1);
plot(t,y);
grid on;
title("y(t)");
ylabel("x");
xlabel("time");

subplot(3,1,2);
plot(t,h);
grid on;
title("h(t)");
ylabel("x");
xlabel("time");

subplot(3,1,3);
plot(conv_time,w);
grid on;
title("w(t)");
ylabel("x");
xlabel("time");

%%
close all;
clc;
clearvars;

%%
%question 2

Fs=2000;
t = -0.05:(1/Fs):0.05;
f1 = 100;
f2 = 300;
f3 = 500;
N = 1024;
n = 25;
fcut1 = 250;
fcut2 = 350;
fcut3 = [fcut1,fcut2];

x = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t);

X = fftshift(abs(fft(x,N))) /N;
fft_time = linspace(-Fs/2,Fs/2,N);

figure;

subplot(2,1,1);
plot(t,x)
grid on
title("x(t)")
ylabel("x");
xlabel("time");


subplot(2,1,2);
plot(fft_time,X);
grid on
title("Frequency response of Magnitude of x")
ylabel("X(jw)");
xlabel("frequency");


[b_high1,a_high1] = butter(n,fcut1/(Fs/2),'high'); %high pass filter
h_high1 = freqz(b_high1,a_high1,Fs/2);%magnitude
y1 = filter(b_high1,a_high1,x);

[b_low1,a_low1] = butter(n,fcut2/(Fs/2),'low'); %low pass filter
h_low1 = freqz(b_low1,a_low1,Fs/2);%magnitude
y2 = filter(b_low1,a_low1,y1);


[b_bandpass_1,a_bandpass_1] = butter(n,fcut3/(Fs/2),'bandpass'); %bandpass filter
h_bandpass_1 = freqz(b_bandpass_1,a_bandpass_1,Fs/2);%magnitude
y3 = filter(b_bandpass_1,a_bandpass_1,x);



figure;

subplot(3,1,1);
plot(t,y1);
grid on
title('High Pass Filter');
xlabel("time");
ylabel("filtered x");



subplot(3,1,2);
plot(t,y2);
grid on
title('High & low pass Filter');
xlabel("time");
ylabel("filtered x");



subplot(3,1,3);
plot(t,y3);
grid on
title('Band pass Filter');
xlabel("time");
ylabel("filtered x");


















