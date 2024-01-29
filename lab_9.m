
close all;
clc;
clearvars;
%%

Fs = 1200;
Fc_low = 100;
Fc_high=400;
Fc_stop = [100 400];
n_1 = 5;
n_2 = 20;

[b_low1,a_low1] = butter(n_1,Fc_low/(Fs/2),'low'); %low pass filter
h_low1 = freqz(b_low1,a_low1,Fs/2);%magnitude

[b_low2,a_low2] = butter(n_2,Fc_low/(Fs/2),'low'); %low pass filter
h_low2 = freqz(b_low2,a_low2,Fs/2);%magnitude

[b_high1,a_high1] = butter(n_1,Fc_high/(Fs/2),'high'); %high pass filter
h_high1 = freqz(b_high1,a_high1,Fs/2);%magnitude

[b_high2,a_high2] = butter(n_2,Fc_high/(Fs/2),'high'); %high pass filter
h_high2 = freqz(b_high2,a_high2,Fs/2);%magnitude


[b_stop1,a_stop1] = butter(n_1,Fc_stop/(Fs/2),'stop'); %stopband filter
h_stop1 = freqz(b_stop1,a_stop1,Fs/2);%magnitude


[b_stop2,a_stop2] = butter(n_2,Fc_stop/(Fs/2),'stop'); %stopband filter
h_stop2 = freqz(b_stop2,a_stop2,Fs/2);%magnitude


figure;

subplot(3,1,1);
plot(abs(h_low1));
hold on 
plot (abs(h_low2));
grid on
title("low pass filter 5th order vs 20 th order")
xlabel("Frequency");
ylabel("Mag response of the Lowpass filter");


subplot(3,1,2);
plot(abs(h_high1));
hold on 
plot (abs(h_high2));
grid on
title("High pass filter 5th order vs 20 th order")
xlabel("Frequency");
ylabel("Mag response of the Lowpass filter");

subplot(3,1,3);
plot(abs(h_stop1));
hold on 
plot (abs(h_stop2));
grid on
title("Stopband filter 5th order vs 20 th order")
xlabel("Frequency");
ylabel("Mag response of the Lowpass filter");

%%
close all;
clc;
clearvars;

Fs = 1200;
t = 0:(1/Fs):0.5;
x = cos(150*pi*t) +2*sin(250*pi*t) +0.5*cos(700*pi*t) -sin(1000*pi*t);
N = 1024;
Fc_low = 100;

n_1 = 5;
n_2 = 20;

[b_low1,a_low1] = butter(n_1,Fc_low/(Fs/2),'low'); %low pass filter
h_low1 = freqz(b_low1,a_low1,Fs/2);%magnitude

[b_low2,a_low2] = butter(n_2,Fc_low/(Fs/2),'low'); %low pass filter
h_low2 = freqz(b_low2,a_low2,Fs/2);%magnitude

fiveth_Filtered_Signal = filter(b_low1,a_low1,x);
tweth_Filtered_Signal = filter(b_low2,a_low2,x);

y1= fft(fiveth_Filtered_Signal,N) / N;
y2 = fft(tweth_Filtered_Signal,N) / N;
X = fft(x,N) /N;

fft_time= linspace(-Fs/2,Fs/2,N);

figure;

subplot(3,1,1);
plot(fft_time,abs(fftshift(X)));
grid on
title("Freq response of x(t)")
xlabel("X(jw)")
ylabel("frequency")

subplot(3,1,2);
plot(fft_time,abs(fftshift(y1)));
grid on
title("5th Low Pass Filter");
xlabel("frequency");
ylabel("y1(t)");

subplot(3,1,3);
plot(fft_time,abs(fftshift(y2)));
grid on
title("20th Low Pass Filter");
xlabel("frequency");
ylabel("y2(t)");



%%


close all;
clc;
clearvars;

Fs = 1200;
t = 0:(1/Fs):0.5;
x = cos(150*pi*t) +2*sin(250*pi*t) +0.5*cos(700*pi*t) -sin(1000*pi*t);
N = 1024;
Fc_high = 400;

n_1 = 5;
n_2 = 20;

[b_high1,a_high1] = butter(n_1,Fc_high/(Fs/2),'high'); %high pass filter
h_high1 = freqz(b_high1,a_high1,Fs/2);%magnitude

[b_high2,a_high2] = butter(n_2,Fc_high/(Fs/2),'high'); %high pass filter
h_high2 = freqz(b_high2,a_high2,Fs/2);%magnitude


fiveth_Filtered_Signal = filter(b_high1,a_high1,x);
tweth_Filtered_Signal = filter(b_high2,a_high2,x);

y1= fft(fiveth_Filtered_Signal,N) / N;
y2 = fft(tweth_Filtered_Signal,N) / N;
X = fft(x,N) /N;

fft_time= linspace(-Fs/2,Fs/2,N);

figure;

subplot(3,1,1);
plot(fft_time,abs(fftshift(X)));
grid on
title("Freq response of x(t)")
xlabel("X(jw)")
ylabel("frequency")

subplot(3,1,2);
plot(fft_time,abs(fftshift(y1)));
grid on
title("5th High Pass Filter");
xlabel("frequency");
ylabel("y1(t)");

subplot(3,1,3);
plot(fft_time,abs(fftshift(y2)));
grid on
title("20th High Pass Filter");
xlabel("frequency");
ylabel("y2(t)");


%%

close all;
clc;
clearvars;

Fs = 1200;
t = 0:(1/Fs):0.5;
x = cos(150*pi*t) +2*sin(250*pi*t) +0.5*cos(700*pi*t) -sin(1000*pi*t);
N = 1024;
Fc_stop = [100 400];

n_1 = 5;
n_2 = 20;

[b_stop1,a_stop1] = butter(n_1,Fc_stop/(Fs/2),'stop'); %stopband filter
h_stop1 = freqz(b_stop1,a_stop1,Fs/2);%magnitude


[b_stop2,a_stop2] = butter(n_2,Fc_stop/(Fs/2),'stop'); %stopband filter
h_stop2 = freqz(b_stop2,a_stop2,Fs/2);%magnitude


fiveth_Filtered_Signal = filter(b_stop1,a_stop1,x);
tweth_Filtered_Signal = filter(b_stop2,a_stop2,x);

y1= fft(fiveth_Filtered_Signal,N) / N;
y2 = fft(tweth_Filtered_Signal,N) / N;
X = fft(x,N) /N;

fft_time= linspace(-Fs/2,Fs/2,N);

figure;

subplot(3,1,1);
plot(fft_time,abs(fftshift(X)));
grid on
title("Freq response of x(t)")
xlabel("X(jw)")
ylabel("frequency")

subplot(3,1,2);
plot(fft_time,abs(fftshift(y1)));
grid on
title("5th Stopband Filter");
xlabel("frequency");
ylabel("y1(t)");

subplot(3,1,3);
plot(fft_time,abs(fftshift(y2)));
grid on
title("20th Stopband Filter");
xlabel("frequency");
ylabel("y2(t)");









