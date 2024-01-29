clearvars;
close all;
clc;
durum = 1;

while durum<=200
    N = durum;
    T = 4; %%period
    t = -2*pi:0.01:2*pi; %%time scale
    w=2*pi/T;
    
    k=-N:0.1:N; %%fs calculate area
    
    figure(1)
    ck = (1/2)*(sinc(k*w));
    x = zeros(1,length(t));
    
    for i=1:length(t)
        for j=1:length(k)
            x(i) = x(i) + ck(j)*exp(1i*k(j)*w*t(i)); 
        end
    end
    plot(t,real(x),'LineWidth',1)
    hold off;
    durum = durum+1;
    
    pause(.1)
    
end