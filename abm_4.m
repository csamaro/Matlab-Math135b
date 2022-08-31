clearvars
clc
a = 0; %starting point
b = 5; %end point
h = 0.5; %step size
N = (b-a)/h;
t = a:h:b;

y = zeros(size(t));
ytemp_all = zeros(size(t));
ytemp_all(1) = 1;
y(1) = 0.5; %initial condition

f=@(t,y) -4*y +1;

for i = 2:N+1
    if i < 5 %<= 4
        K1 = f(t(i-1),y(i-1));
        K2 = f(t(i-1)+ .5*h,y(i-1)+.5*h*K1);
        K3 = f(t(i-1)+ .5*h,y(i-1)+.5*h*K2);
        K4 = f(t(i-1)+h,y(i-1)+h*K3);
        y(i) = y(i-1) + h/6*(K1+2*K2+2*K3+K4);
        ytemp_all(i) = y(i);
    else
        ytemp = y(i-1)+h/24*(55*f(t(i-1),y(i-1))-59*f(t(i-2),y(i-2))+37*f(t(i-3),y(i-3))-9*f(t(i-4),y(i-4))); %predictor
        y(i) = y(i-1) +h/24*(9*f(t(i),ytemp)+19*f(t(i-1),y(i-1))-5*f(t(i-2),y(i-2))+f(t(i-3),y(i-3))); %corrector
        ytemp_all(i) = ytemp;
    end
end

yexact=@(x) (exp(-4*t)+1)/4;

figure;
hold on;
plot(t,y,'*-',t,yexact(t),'r')

steps = 0:N;
header={'n','t_n','y_n (predictor)','y_n (corrector)','exact'};
T=table(steps.',t.',ytemp_all.',y.',(yexact(t)).','VariableNames',header);
disp(T)