% Fourier serisi için temel parametreler
T = 0.5; % Periyot
N = 10; % Toplam harmonik sayısı

t = linspace(0, T, 1000); % Zaman vektörü

% Kare dalga sinyali oluşturma
x = square(2*pi*t/T);

a0 = mean(x); % DC bileşeni
an = zeros(1, N); % Cosine katsayıları
bn = zeros(1, N); % Sine katsayıları

for n = 1:N
    an(n) = 2*mean(x .* cos(2*pi*n*(1/T)*t))/pi;
    bn(n) = 2*mean(x .* sin(2*pi*n*(1/T)*t))/pi;
end

% Fourier serisi toplamını hesaplama
fourier_series = a0/2;
for n = 1:N
    fourier_series = fourier_series + an(n)*cos(2*pi*n*t/T) + bn(n)*sin(2*pi*n*t/T);
end

% Orijinal ve Fourier serisi sinyallerini çizdirme
figure;
subplot(3,1,1);
plot(t, x, 'LineWidth', 2);
title('Orijinal Sinyal');
xlabel('Zaman');
ylabel('Amplitüd');

subplot(3,1,2);
plot(t, fourier_series, 'r--', 'LineWidth', 2);
title('Fourier Serisi Aproximasyonu');
xlabel('Zaman');
ylabel('Amplitüd’);