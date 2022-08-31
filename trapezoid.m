% this code use trapezoid method to approximate the integral of xe^(-x) on
% the interval [0,1]
a = 0;
b = 1;
n = 4;
h = (b-a)/n;
x = a:h:b; % 

f = @(x) x*e^(-x);

T = (f(a)+f(b))/2;

for i = 2:n % index starts from 1 in Matlab
    T = T + f(x(i));
end
% T = h[1/2(f(x0)+f(xn))+sum_1^{n-1}f(xi)]


T = T*h;
disp(T);

I = ? ; % integrate sin(x) from 0 to pi 
error = I - T

% Q: do we have an estimate of the error without calculating I and T?