
close all;
clc;
clearvars;
%%

Fc = 250;
Fs = 2000;
n = 15;
[b,a] = butter(n,Fc/(Fs/2),'low'); %low pass filter
h = freqz(b,a,Fs/2);%magnitude

Fc_1 = 750;
n_1 = 25;
[b_1,a_1] = butter(n_1,Fc_1/(Fs/2),'high');%high pass filter

Fc_2 = [250 750];
[b_2,a_2] = butter(n,Fc_2/(Fs/2),'bandpass'); %bandpass


Fc_3 = [400 800];
[b_3,a_3] = butter(n,Fc_3/(Fs/2),'stop'); %stop 

figure

plot(abs(h));
xlabel("Frequency");
ylabel("Mag response of the Lowpass filter");


%%

%filter Example

f1 = 200;
f2 = 550;
Fs_4 =3e3; %% 10^3  *3
t = 0:(1/Fs_4):0.02;
x = sin(2*pi*f1*t) + cos(2*pi*f2.*t);
Fc_5 = 400;
n = 5;
[b_5,a_5] = butter(n, Fc_5/(Fs_4/2),'low');
N = 256;

Filtered_Signal = filter(b_5,a_5,x);
output = fft(Filtered_Signal,N);
input = fft(x,N);

fvect = linspace(-Fs_4/2,Fs_4/2,N);

figure;
subplot(211);
plot(fvect,abs(fftshift(input)));
title('Magnitude Response of Input');
subplot(212);
plot(fvect,abs(fftshift(output)));
title('Magnitude Response of Output');


