%% ========================================================================
%% Title: 
%  1) Fourier series approximation of square wave.
%  2) Demonstration of Gibbs phenomenon (verification of Fig. 3.9 of [1])
%% Author: 
%  Ankit A. Bhurane (ankit.bhurane@gmail.com)
%% Expression:
% The Fourier series approximation of a square wave signal existing between
% -Tau/2 to Tau/2 and period of T0 will have the form:
%
% Original signal to be approximated: 
%                         :
%               __________:__________  A
%              |          :          |
%              |          :          |
%              |          :          |
%    __________|          :          |__________
% -T0/2     -Tau/2        0        Tau/2       T0/2
%                         :
%                         :
%
% Its Fourier series approximation:
%
%                  Inf   
%                  ___ 
%         A*Tau   \     / sin(pi*n*Tau/T0)                    \
% r(t) = -------   |   | ------------------ exp^(j*n*2*pi/T0*t) |
%          T0     /___  \  (pi*n*Tau/T0)                      /
%               n = -Inf 
%
% The left term inside summation are the Fourier series coeffs (Cn). The
% right term is the Fourier series kernel. 
% Tau: range of square wave, T: period of the square wave, 
% t: time variable, n: number of retained coefficients.
% 
%% Observations:
% 1) As number of retained coefficients tends to infinity, the approximated
% signal value at the discontinuity converge to half the sum of values on
% either side. 
% 2) Ripples does not decrease with increasing coefficients with
% approximately 9% overshoot.
% 3) Energy in the error between original and approximated signal, reduces
% as the number of retained coefficients are increased.
% 
%% References: 
% [1] Oppenheim, Willsky, Nawab, "Signals and Systems", PHI, Second edition
% [2] Dean K. Frederick and A. Bruce Carlson, "Fourier series" section in 
%     Linear systems in communication and control 
%% Last Modified: Sept 24, 2013.
%% Copyright (c) 2013-2014 | Ankit A. Bhurane
%% =========================================================================

clc; clear all; close all;

% Specification
A = 1; % Peak-to-peak amplitude of square wave
Tau = 10; % Total range in which the square wave is defined (here -5 to 5)
T0 = 20; % Period (time of repeatation of square wave), here 10 
C = 30; % Coefficients (sinusoids) to retain 
N = 1001; % Number of points to consider
t = linspace(-(T0-Tau),(T0-Tau),N); % Time axis
X = zeros(1,N); X(t>=-Tau/2 & t<=Tau/2) = A; % Original signal
R = 0; % Initialize the approximated signal
k = -C:C; % Fourier coefficient number axis
f = zeros(1,2*C+1); % Fourier coefficient values

% Loop for plotting approximated signals for different retained coeffs.
for c = 0:C % Number of retained coefficients
    for n = -c:c % Summation range (See equation above in comments)
        
        % Sinc part of the Fourier coefficients calculated separately 
        if n~=0
            Sinc = (sin(pi*n*Tau/T0)/((pi*n*Tau/T0))); % At n NOTEQUAL to 0
        else
            Sinc = 1; % At n EQUAL to 0
        end
        Cn = (A*Tau/T0)*Sinc; % Actual Fourier series coefficients
        f(k==n) = Cn; % Put the Fourier coefficients at respective places
        R = R + Cn*exp(1j*n*2*pi/T0.*t); % Sum all the coefficients
    end
    
    R = real(R); % So as to get rid of 0.000000000i (imaginary) factor
    Max = max(R); Min = min(R); M = max(abs(Max),abs(Min)); % Maximum error
    Overshoot = ((M-A)/A)*100; % Overshoot calculation
    E = sum((X-R).^2); % Error energy calculation
    
    % Plots:
    % Plot the Fourier coefficients
    subplot 121; stem(k,f,'m','LineWidth',3); axis tight; grid on;
    xlabel('Fourier coefficient index');ylabel('Magnitude');
    title('Fourier coefficients');
    
    % Plot the approximated signal
    subplot 122; plot(t,X,t,R,'m','LineWidth',3); axis tight; grid on; 
    xlabel('Time (t)'); ylabel('Amplitude');
    title(['Approximation for N = ', num2str(c),...
    '. Overshoot = ',num2str(Overshoot),'%','. Error energy: ',num2str(E)])

    pause(0.1); % Pause for a while
    R = 0; % Reset the approximation to calculate new one
end

%% ========================================================================