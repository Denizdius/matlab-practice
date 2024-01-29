
close all;
clear variables;
clc;


% Discrete Convolution
n_discrete = 0:4;  % Example discrete time vector for discrete signals
x_discrete = exp(-0.2 * n_discrete);  % Example discrete signal x
h_discrete = sin(0.5 * pi * n_discrete);  % Example discrete signal h

% Manually perform discrete convolution
y_discrete_manual = zeros(1, length(n_discrete)*2 - 1);
for i = 1:length(n_discrete)
    y_discrete_manual(i:i+length(n_discrete)-1) = y_discrete_manual(i:i+length(n_discrete)-1) + x_discrete(i) * h_discrete;
end

% Use conv function for discrete convolution
y_discrete_conv = conv(x_discrete, h_discrete);

% Plot results for discrete convolution
figure;
subplot(3, 2, 1);
stem(n_discrete, x_discrete, 'r', 'LineWidth', 1.5);
title('Discrete Signal x');
subplot(3, 2, 2);
stem(n_discrete, h_discrete, 'b', 'LineWidth', 1.5);
title('Discrete Signal h');
subplot(3, 2, 3);
stem(2 * n_discrete(1:end-1), y_discrete_manual, 'g', 'LineWidth', 1.5);
title('Convolution (Manual)');
subplot(3, 2, 4);
stem(n_discrete, y_discrete_conv, 'm', 'LineWidth', 1.5);
title('Convolution (conv function)');

% Continuous Convolution
t_continuous = linspace(0, 1, 100);  % Example time vector for continuous signals
x_continuous = exp(-2 * t_continuous);  % Example continuous signal x
h_continuous = sin(2 * pi * 5 * t_continuous);  % Example continuous signal h

% Manually perform continuous convolution
y_continuous_manual = zeros(1, length(t_continuous)*2 - 1);
for i = 1:length(t_continuous)
    y_continuous_manual(i:i+length(t_continuous)-1) = y_continuous_manual(i:i+length(t_continuous)-1) + x_continuous(i) * h_continuous;
end

% Use conv function for continuous convolution
y_continuous_conv = conv(x_continuous, h_continuous) * (t_continuous(2)-t_continuous(1));

% Plot results for continuous convolution
subplot(3, 2, 5);
plot(t_continuous, x_continuous, 'r', 'LineWidth', 1.5);
title('Continuous Signal x');
subplot(3, 2, 6);
plot(t_continuous, h_continuous, 'b', 'LineWidth', 1.5);
title('Continuous Signal h');
figure;
subplot(2, 1, 1);
plot(2*t_continuous(1:end-1), y_continuous_manual, 'g', 'LineWidth', 1.5);
title('Convolution (Manual)');
subplot(2, 1, 2);
plot(t_continuous+t_continuous(1), y_continuous_conv, 'm', 'LineWidth', 1.5);
title('Convolution (conv function)');
