
x = 0:0.1:10;
y0 = 0;
g = 9.8;
vo = 50.75;
angelO = 5*pi / 12;

y = y0 -(0.5*g)*(x.^2)+(vo*sin(angelO))*x;

figure (1)
plot(y,x,'b--');
grid on
xlabel("x values")
ylabel("y function")

