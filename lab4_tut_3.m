%% we will define a system first

clearvars; clc; close all;

t = 0:0.01:2;
x1 = sin(2*pi*1*t);
x2 = cos(2*pi*2*t);

%% define system

y1 = mySystem(x1);
y2 = mySystem(x2);

%% for linearity test 

y_linear = a*y1 + b*y2;
% and you have to check that if this matches with mySystem(a*x1 + b*x2)

%% plot the input signal and system output

subplot(3,1,1)
plot(t,x1,'r')
title('Input signal 1')

subplot(3,1,2)
plot(t, x2, 'g')
title('Input Signal 2')

subplot(3,1,3)
plot(t, y1, 'b')
title('System Output for Signal 1')

%%

x = 1:10;
y1 = x.^2;
y2 = 2*x;

% Create a 1x2 grid of subplots and select the first subplot
subplot(1, 2, 1);
plot(x, y1);
title('Plot 1');

% Select the second subplot
subplot(1, 2, 2);
plot(x, y2);
title('Plot 2');

%%

% Define the system equation (example)
% In this example, the system is y(t) = x(t) + x(t+1)
% We'll check if this system is causal.

t = 1:9;  % Adjust the range to avoid accessing elements beyond the array size
x = rand(1, 10);  % Input signal, still with 10 elements for demonstration

% Define the system equation
y = x + circshift(x, -1, 2);

% Check for causality
is_causal = all(y(t) == x(t) + x(t+1));  % Check if the equation holds for current and future values

if is_causal
    disp('The system is causal.');
else
    disp('The system is not causal.');
end

%%

v1 = [1, 2, 3];
v2 = [4, 5, 6];
result1 = dot(v1, v2);  % Calculate the dot product

v3 = [1, 2, 3];
v4 = [4, 5, 6];
result2 = cross(v1, v2);  % Calculate the cross product

v5 = [1, 2, 3];
v6 = [4, 5, 6];
result3 = v1 .* v2;  % Perform element-wise multiplication

disp('The dot product equals to'); result1 
disp('The cross product equals to'); result2 
disp('The element-wise multiplication equals to'); result3

% disp(['The dot product equals to ' num2str(result1)]);

% to reach a element in a vector 

first_element_result3 = result3(1);
first_element_result3

% fprintf('The dot product equals to %.2f\n', result1);
% fprintf('The cross product equals to %.2f\n', result2);
% fprintf('element-wise multiplication equals to %.2f\n', result3);

% disp('cross product equals to'); result2
% disp('element-wise multiplication equals to'); result3