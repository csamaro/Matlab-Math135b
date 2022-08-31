% using Euler's method to solve 
% y' = y-t^2+1, on [0,2] with y(0)=0.5
clc
a = 0;
b = 2;
n = 10;
h = (b - a)/n;

f = @(t,y) y-t^2+1;
t = a;
T = a:h:b;
y = 0.5;
Y = y;
for  i=1:n
 y = y + h*f(t,y);
 t = t+h;
 Y = [Y, y];
end
S = a:h/10:b;
Ys = -0.5*exp(S)+S.^2+2*S+1;
plot(T,Y,'o', S,Ys,'-','LineWidth',2)
legend('Approximation','Exact');
xlabel('t');
ylabel('y');
set(gca,'LineWidth',2,'FontSize',15);

Yt = -0.5*exp(T)+T.^2+2*T+1;
header={'n','Approx f(t_n)','Exact f(t_n)','Abs Error'};
T=table(T.',Y.',Yt.',abs(Y.'-Yt.'),'VariableNames',header);
disp(T)
