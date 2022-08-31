clearvars
clc
a = 0;
b = 0.5;
h = 0.1;
N = (b-a)/h;
t = a:h:b;

y = zeros(size(t));
ytemp_all = zeros(size(t));
ytemp_all(1) = 1;
y(1) = 1;

f=@(t,y) t*y;

for i = 2:N+1
    if i < 3
        K1 = f(t(i-1),y(i-1));
        K2 = f(t(i-1)+h,y(i-1)+h*K1);
        y(i) = y(i-1) + h/2*(K1+K2);
        ytemp_all(i) = y(i);
    else
        ytemp = y(i-1)+h/2*(3*f(t(i-1),y(i-1))-f(t(i-2),y(i-2)));
        y(i) = y(i-1) +h/2*(f(t(i),ytemp)+f(t(i-1),y(i-1)));
        ytemp_all(i) = ytemp;
    end
end

yexact=@(x) exp(t.^2/2);

figure;
hold on;
plot(t,y,'*-',t,yexact(t),'r')

steps = 0:N;
header={'n','t_n','y_n (predictor)','y_n (corrector)','exact'};
T=table(steps.',t.',ytemp_all.',y.',(yexact(t)).','VariableNames',header);
disp(T)