% composite simpsons 1/3 rule for xe^(-x)
% on interval [0,1]
a = 0;
b = 1;
h = 0.05;
n = (b-a)/h;

f = @(x) x*exp(-x);

S = (f(a) + f(b));

%sum_1^n/2 f(a+(2i-1)h)
for i = 1:(n/2);
    x = h*(2*i -1);
    S = S + 4*f(x)
end

%sum_1^(n-2)/2 f(a+2ih)
for i = 1:((n-2)/2);
    x = 2*h*i;
    S = S + 2*f(x)
end

S = (S*h)/3;
disp(S);
