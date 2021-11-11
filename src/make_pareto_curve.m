s = RandStream('mt19937ar','Seed',0);
A = randn(s,5,10);
b = randn(s,5,1);

tau = linspace(0,3,20);
r_norm = zeros(20,1);
x_norm = zeros(20,1);

for i=1:20
    [x,r,g,info] = spg_lasso(A,b,tau(i),'verbosity',0);
    r_norm(i) = norm(r);
    x_norm(i) = norm(x,1);
end

save('pareto_data.mat', 'r_norm', 'x_norm');
