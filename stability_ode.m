% solve y'=ay

% stability of solutions
clearvars
clc
clf

lambda = -10;
dy = @(t,y) lambda*y;

a = 0;
b = 0.5;
tspan = [a b];

for y0=0.5:0.1:1
    [t,y] = ode45(dy, tspan, y0);
    plot(t,y,'LineWidth',2)
    hold on
end
legend('y0=0.5', 'y0=0.6','y0=0.7','y0=0.8','y0=0.9','y0=1')
xlabel('t');
ylabel('y');
set(gca,'LineWidth',2,'FontSize',15);


%%
% stability of numerical methods
% forward Euler
clearvars
clc
clf
lambda = -10;
dy = @(t,y) lambda*y;

a = 0;
b = 6;

h = 0.1;
n = (b-a)/h;

t = a;
T = a:h:b;
y = 0.5;
Y = y;
for  i=1:n
 y = y + h*dy(t,y);
 t = t+h;
 Y = [Y, y];
end
plot(T,Y,'LineWidth',2)
xlabel('t');
ylabel('y');
set(gca,'LineWidth',2,'FontSize',15);
