
a=1;
b=[1,2,3]; %satır vektor
c=[1;2;3]; %column vektor
d = 1:1:5; %1 den 5 e satır vektoru
t=0:0.001:0.1; %zaman örneklemesi

c_row=transpose(c); %transpose aldık

A = [2 5 6;7 5 8];
w = A(1,1);
wb = b(3);
r = rand();%random sayı
rr =rand(1,5);%1 e lik matrix de random sayılar
ri = randi([0 1],1,6); %0 1 aralğında integer vercek(0 veya 1)
% 1 e 6 bir matrix oluşturacak kareli parantez sınırlar dahil olacak

l = length(ri);% =6 vektör için kullanılır
[m,n] = size(A); % m=2 ,n=3

B = rand(2,3);
sum = A + B;
dif = A-B;
TraB=transpose(B);
sqr_mat = B*TraB;

ae =1:1:3;
be=[1 4 6];
ff = ae.*be; %elementwise multip
Ts=0.001;
tf=0.1;
x = sin(tf).*cos(tf);


AA=[1 0 ; 0 1];
SS = AA^100; %matrix'in üssü
A5 =[1 5 3;6 8 2;5 6 2];
DD=A5^5;
A6 = [1 2 ;2 5];
D6 = A6.^3;%matrix elemenletlerinin üssü

C = [2 3;2 5];
invC =inv(C);
detC = det(C);
A7 = rand(2,2);
B2 = rand(2,1);





x = -pi:0.1:pi;
xt=sin(x);
plot(x,xt);

s1=[1 3 6];
s2 =[65 3 7];
s3 = [s1 s2]; %s1 i s2 ye yazar

tj =-5 +10*rand(10,1);

AA1=rand(5);
BB1=rand(5);
CC1 =[AA1,BB1];
CC2 = [AA1;BB1];


    





