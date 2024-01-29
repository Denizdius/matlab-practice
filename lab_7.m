clear all;
clc;

T = 1; % Duration of Signal
N = 4; 
l = [1,2,4,21];

t = linspace(0, T, 1000); %%sampling frequency
f1 = 1 / 5; %% period off sampling 

x = square(2*pi*5*t); %% square wave


a0 = mean(x); % DC 

fourier_series = a0/2;

for k = 1:N
    fourier_series = fourier_series + (sin(2*pi*(2*k-1)*t/f1)/(2*k-1));

end

fourier_series = (fourier_series * 4 ) / pi;


% Squarewave vs FourierSeries 
figure;
plot(t, x, 'LineWidth', 2);
title('Square Wave');
xlabel('Time');
ylabel('Amplitude');



figure
plot(t, fourier_series, 'r', 'LineWidth', 2);
title('Fourier Series');
xlabel('Time');
ylabel("Amplitude");


%%


clear all;
clc;

T = 1; % Duration of Signal
N = 4; 

t = linspace(0, T, 1000); %%sampling frequency
f1 = 1 / 5; %% period off sampling 

x = square(2*pi*5*t); %% square wave


a0 = mean(x); % DC 

fourier_series = a0/2;
mse = a0/2;

for k = 1:N
    fourier_series = fourier_series + (sin(2*pi*(2*k-1)*t/f1)/(2*k-1));

end

fourier_series = (fourier_series * 4 ) / pi;

for l = 1:N
    mse = (mse - fourier_series).*(mse-fourier_series);
end

mse = mse/N;


% Squarewave vs FourierSeries 
figure;
plot(t, x, 'LineWidth', 2);
title('Square Wave');
xlabel('Time');
ylabel('Amplitude');



figure
plot(t, fourier_series, 'r', 'LineWidth', 2);
title('Fourier Series');
xlabel('Time');
ylabel("Amplitude");


figure
plot(t,mse,'b');
