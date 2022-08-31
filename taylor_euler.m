% use Euler's method and taylor series of order 4 to solve 
% x'=1+x^2+t^3, x(1)=-4
clc
a = 1;
b = 2;
n = 100;
h = (b-a)/n;
x = -4;

t=a;

% Taylor series of order 4
X4 = x;
T4 = t;
for i=1:n
    x1 = 1+x^2+t^3; % x'
    x2 = 2*x*x1+3*t^2; % x"
    x3 = 2*x*x2+2*(x1)^2+6*t; % x'"
    x4 = 2*x*x3+6*x1*x2+6; % x^(4)
    x = x + h*x1 + h^2*x2/2 + h^3*x3/6 + h^4*x4/24;
    t = a + i*h;
    X4 = [X4, x];
    T4 = [T4, t];
end

disp(['Taylor series method (order 4) gives ', num2str(X4(end))]);


%% 
f = @(t,x) 1+x^2+t^3;
t=a;
x = -4;
X1 = x;
for  i=1:n
 x = x + h*f(t,x);
 t = a+i*h;
 X1 = [X1, x];
end
disp(['Euler method gives ', num2str(X1(end))]);

% The correct value is approximately 4.371221866