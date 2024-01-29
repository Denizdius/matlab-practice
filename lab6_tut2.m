% Define the discrete Fourier series coefficients
N = 100; % Number of coefficients
t = linspace(0, 2*pi, N+1); % Time vector
t = t(1:end-1); % Remove the last element to have N points
f = sin(t); % Sampled function values (Example: sine function)

% Compute the discrete Fourier series coefficients
F = fft(f)/N; % Normalize by dividing by the number of points

% Reconstruct the function from the Fourier coefficients
reconstructed_f = ifft(F)*N;

% Use Heaviside function
heaviside_f = heaviside(t - pi); % Heaviside function applied at t = pi

% Multiply Fourier coefficients by Heaviside function
F_heaviside = F .* heaviside_f;

% Reconstruct the function with Heaviside function applied
reconstructed_f_heaviside = ifft(F_heaviside)*N;

% Compute the cumulative sum of the reconstructed function with Heaviside function applied
cumulative_sum = cumsum(reconstructed_f_heaviside);

% Plotting
figure;

subplot(2,2,1);
plot(t, f);
title('Original Function');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,2);
stem(abs(F));
title('Fourier Coefficients');
xlabel('Frequency');
ylabel('Magnitude');

subplot(2,2,3);
plot(t, reconstructed_f);
title('Reconstructed Function');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,4);
plot(t, cumulative_sum);
title('Cumulative Sum of Reconstructed Function');
xlabel('Time');
ylabel('Cumulative Sum');
