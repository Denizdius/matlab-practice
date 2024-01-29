
clear variables
clc;

n = 0:0.1:5; % define time scale
N = 5; % define a period
x = heaviside(n) - heaviside(n-5); % define function
%%EN = (n>2.5).*exp(-n) + (n<=2.5).*exp(n); other way to define picewise
w = (2*pi) / N; % define omega
k = 10;
A = zeros(1,k);
for l = 1:k
    for m = 1:N
        A(l) = A(l) +  (1/N)*x(m) * exp(-1i*w*m*l);
    end
    disp(A(l));
end

for k= -100:1:100
    ak(k+101) = int(x*exp(-1i*k*n),n,0)
    disp(ak)
end




