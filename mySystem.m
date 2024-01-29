% Define system parameters
A = 2; % Gain
B = 1; % Bias

% Input signals
t = 0:0.01:2*pi;  % Time vector
x1 = sin(t);      % Sine wave input
x2 = cos(t);      % Cosine wave input
x3 = exp(-0.1*t); % Exponential input

% Check linearity:
% Superposition Principle: A*Y1(t) + B*Y2(t) = Y1(t) + Y2(t)
Y1 = sqrt(A * x1 + B);
Y2 = sqrt(A * x2 + B);
Y_combined = sqrt(A * x1 + B + A * x2 + B);

if isequal(Y1 + Y2, Y_combined)
    disp('The system is linear (satisfies superposition).');
else
    disp('The system is not linear.');
end

% Check causality: 
% A causal system means the output only depends on past or present inputs.
% For the given system, it's causal since it doesn't rely on future inputs.

% Plot the system response
figure;
subplot(3, 1, 1);
plot(t, Y1);
title('Response to sqrt(A * Sin(t) + B)');

subplot(3, 1, 2);
plot(t, Y2);
title('Response to sqrt(A * Cos(t) + B)');

subplot(3, 1, 3);
plot(t, Y_combined);
title('Response to sqrt(A * Sin(t) + B + A * Cos(t) + B)');

% You can further customize this code to include additional functions or operations as needed.
