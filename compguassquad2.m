% Composite Gaussian quadrature rule using two points for
% xe^(-x) on interval [0,1]

f = @(x) x*exp(-x);

%first node 
x = -1*(1/2)*(sqrt(1/3)) + (1/2);

G = f(x)

%second node
x = (1/2)*(sqrt(1/3)) + (1/2);

G = G + f(x)

G = (1/2)*G;
disp(G);