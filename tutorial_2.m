



%sind ve sin farklı fonksiyonlar sind derece şekilde alır.

%exp(x) exponential

x = -2*pi:0.01*pi:2*pi; %% -2pi den 2pi ye 0.0001 küçük adımlı

y=sin(x);
z=cos(x);

%%
figure(1) % figür numarısını tanımla figür bir olarak 
%plot(x,z,"r--") % x değerler y fonksiyon 

plot(x,y)
grid on
title ("Sine wave")
legend("Sine")
axis([min(x) max(x) min(y) max(y)]) % grafiği limitlemek için 
propertyeditor % daha iyi grafik özellikleri için 


%%
figure(2)
plot(y)
grid on


%%


%%
figure(3) % figür numarısını tanımla figür bir olarak 
%plot(x,z,"r--") % x değerler y fonksiyon 

plot(x,z)
grid on %% hold
title ("Cosine wave")
legend("Cosine")
axis([min(x) max(x) min(y) max(y)]) % grafiği limitlemek için 
propertyeditor % daha iyi grafik özellikleri için 


%%

figure(4) % figür numarısını tanımla figür bir olarak 
%plot(x,z,"r--") % x değerler y fonksiyon 
plot(x,y,"b-.")
hold on
plot(x,z,"r")
grid on 
xlabel("radian")
ylabel("values")
title ("Sine & Cosine")
legend("Sine","Cosine")
axis([min(x) max(x) min(y) max(y)]) % grafiği limitlemek için 

%%

figure(4) % figür numarısını tanımla figür bir olarak 
%plot(x,z,"r--") % x değerler y fonksiyon 
plot(x,y,"b-.")
hold on
stem(x,z,"r")
grid on 
xlabel("radian")
ylabel("values")
title ("Sine & Cosine")
legend("Sine","Cosine")
axis([min(x) max(x) min(y) max(y)]) % grafiği limitlemek için 

%%



