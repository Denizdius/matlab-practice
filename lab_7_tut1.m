close all;
clc;
clearvars;
%%
Fc = 50;
Fs = 1000;
t = 0:1/Fs:0.5;

x1 = cos(2*pi*Fc.*t).*(t>=0 & t<=0.1); 

N = 1024;
Fvector = linspace(-Fs/2, Fs/2, N);

X1 = zeros(1,N);

for f=1:N
    for i=1:length(t)
        X1(f) = X1(f) + (x1(i)*exp(-1i*2*pi*Fvector(f)*t(i)))*(1/1000);
    end
end


FT_check = fftshift(fft(x1,N));

figure;
plot(t,x1)


figure;
subplot(211)
plot(Fvector,abs(FT_check)/N);
subplot(212)
plot(Fvector,abs(X1));

%%
figure;

%– Obtain time vector t = 0 : Ts : d where d = 0.5s and Ts = 0.001s.
Ts = 0.001;
d = 0.5;
t = 0:Ts:d;
N = length(t);

x2 = (t<0.1 & t>=0)*1 +(t<=0.2 & t>=0.1)*2 ;
y = (t<0.1 & t>=0)*1 + (t<0.2 & t>=0.1)*2 + (t>0.3 & t<=0.4)*2 + (t>0.4 & t<=0.5)*4 ;

X2 = fft(x2,N);
Y = fft(y,N);
H = abs(Y)./abs(X2);

h = ifft(H,N);

subplot(311)
plot(t,x2)
subplot(312)
plot(t,y)
subplot(313)
plot(t,h);

figure;
subplot(311)
plot(abs(X2))
subplot(312)
plot(abs(Y))
subplot(313)
plot(abs(H));