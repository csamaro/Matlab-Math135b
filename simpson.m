% this code use Simpson's rule to approximate the integral of e^x on
% the interval [0,4]
%%
a = 0;
b = 4;
h = 1;
n=(b-a)/h;
x = a:h:b; % 
%%
f = @(x) x*exp(-x);


S = 0;
for i = 1:2:(n+1-2) % index starts from 1 in Matlab
    S = S + (f(x(i))/3+4*f(x(i+1))/3+f(x(i+2))/3);
end

disp(S);
