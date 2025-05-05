% Comparison of Preconditions
methods = {'Bisection', 'Gradient Descent'};
variables = [1 2]; % 1 = Single-variable, 2 = Multivariable
convergence = [1 2]; % 1 = Guaranteed, 2 = Conditional
requirements = [1 2]; % 1 = f(a)*f(b)<0, 2 = Differentiable

figure;
subplot(2,2,1);
bar(variables);
title('Variable Support');
set(gca,'XTickLabel',methods);
yticks([1 2]);
yticklabels({'Single-variable', 'Multivariable'});

subplot(2,2,2);
bar(convergence);
title('Convergence Guarantee');
set(gca,'XTickLabel',methods);
yticks([1 2]);
yticklabels({'Guaranteed', 'Conditional'});

subplot(2,2,3);
bar(requirements);
title('Requirements');
set(gca,'XTickLabel',methods);
yticks([1 2]);
yticklabels({'f(a)*f(b)<0', 'Differentiable'});

sgtitle('Method Preconditions Comparison');