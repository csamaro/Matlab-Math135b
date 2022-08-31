% this code uses composite trapezoid method to approximate the integral
% of xe^(-x) on the interval [0,1]
a = 0;
b = 1;
h = 0.05;
n = (b-a)/h; 

f = @(x) x*exp(-x);

T = (f(a)+f(b))/2;

for i = 1:(n-1); 
   x = i*h;
    T = T + f(x)
end
% T = h[1/2(f(x0)+f(xn))+sum_1^{n-1}f(xi)]


T = T*h;
disp(T);

