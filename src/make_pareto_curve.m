% This script produces the points for the Pareto curve using a random
% matrix A and vector b.

% random matrix A and vector b
s = RandStream('mt19937ar','Seed',0);
A = randn(s,5,10);
b = randn(s,5,1);

tau = linspace(0,3,20);
r_norm = zeros(20,1);
x_norm = zeros(20,1);

% solve Lasso_tau for different values of tau
for i=1:20
    [x,r,g,info] = spg_lasso(A,b,tau(i),'verbosity',0);
    r_norm(i) = norm(r);
    x_norm(i) = norm(x,1);
end

% data to be exported to Python plotting script
save('pareto_data.mat', 'r_norm', 'x_norm');
