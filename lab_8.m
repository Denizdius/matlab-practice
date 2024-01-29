
close all;
clc;
clearvars;
%%

t = linspace(-0.5,0.5,1000);

x = cos(2*pi*50*t);

N = 1024;
Ftime = linspace(-500, 500, N);

X1 = zeros(1,N);

for f=1:N
    for i=1:length(t)
        X1(f) = X1(f) + (x(i)*exp(-1i*2*pi*Ftime(f)*t(i)))*(1/1000);
    end
end

X2 =  fft(x,N) / N;

abs_shift_X1 = abs(X1);
abs_shift_X2 = fftshift(abs(X2));

figure;
subplot(3,1,1);
plot(t,x);
grid on 
title("x(t)");
xlabel("Time ")
ylabel("X")

subplot(3,1,2);
plot(Ftime,abs_shift_X1);
grid on
title ("Manual Forier Transform");
xlabel("Frequency");
ylabel("X1");


subplot(3,1,3);
plot(Ftime,abs_shift_X2);
grid on
title ("Automatic Forier Transform");
xlabel("Frequency");
ylabel("X2");





%%

close all;
clc;
clearvars;

t = sym('t');
f = sym('f');


y = 0.5*(sign(t+0.5)-sign(t-0.5));

z = subs(y,t,-2*t);

Y = fourier(y,f);
Z = fourier(z,f);

figure;
subplot(2,2,1);
fplot(t,y,[-1,1]);
grid on 
title("y(t)");
xlabel("Time ")
ylabel("y")

subplot(2,2,2);
fplot(f,Y,[-40,40]);
grid on
title ("Forier Transform of Y");
xlabel("Frequency");
ylabel("Y");


subplot(2,2,3);
fplot(t,z,[-1,1]);
grid on
title ("z(t)");
xlabel("Frequency");
ylabel("z");


subplot(2,2,4);
fplot(f,Z,[-40,40]);
grid on
title ("Forier Transform of Z");
xlabel("Frequency");
ylabel("Z");






