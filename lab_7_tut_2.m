
close all;
clc;
clearvars;

%%
x = linspace(0,2*pi,100);
y = sin(x);

Y = fft(y);
Y_centered = fftshift(Y);

f = linspace(-pi,pi,length(Y));
figure;
subplot(2,1,1); plot(f,abs(Y_centered)); xlabel('Frequency'); ylabel('Magnitude');
subplot(2,1,2); plot(f,angle(Y_centered)); xlabel('Frequency'); ylabel('Phase');

y_recovered = ifft(Y);
figure; plot(x,y,'b-',x,real(y_recovered),'r--'); xlabel('Time'); ylabel('Signal');
legend('Original Signal','Reconstructed Signal');

%%

syms x s;
ft = fourier(sin(x),s);
disp(ft);

ft_direct = zeros(size(x));
for k = 1:length(x)
  ft_direct(k) = sum(y.*exp(-1j*k*x));
end

figure; plot(f,abs(ft_direct),f,abs(Y)); xlabel('Frequency'); ylabel('Magnitude');
legend('Direct Integration','Fast Fourier Transform');

%%

x1 = sin(x);
x2 = cos(2*x);
y_conv = conv(x1,x2);

Y1 = fft(x1);
Y2 = fft(x2);
Y_conv_ft = ifft(Y1.*Y2);

figure; plot(x,y_conv,x,real(Y_conv_ft)); xlabel('Time'); ylabel('Convolution');
legend('Time Domain Convolution','Fourier Transform Convolution');




