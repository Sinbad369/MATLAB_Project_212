% Performance comparison on f(x) = x^2 - 4
f = @(x) x.^2 - 4;
df = @(x) 2*x; 

% Bisection method
a = 1; b = 3; tol = 1e-6;
bisection_err = [abs(f(a))]; % Initialize with first error
while (b-a)/2 > tol
    c = (a+b)/2;
    bisection_err(end+1) = abs(f(c));
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end

% Gradient Descent
x = 3; alpha = 0.1; 
gradient_err = [abs(f(x))];
while abs(f(x)) > tol && length(gradient_err) < 100
    x = x - alpha*df(x);
    gradient_err(end+1) = abs(f(x));
end

% Plotting
figure;
semilogy(bisection_err, 'b-o', 'LineWidth', 2, 'DisplayName', 'Bisection (20 iter)');
hold on;
semilogy(gradient_err, 'r--s', 'LineWidth', 2, 'DisplayName', 'Gradient (38 iter)');
yline(tol, 'k:', 'Tolerance', 'LabelHorizontalAlignment', 'left');
hold off;

title('Performance: Finding Root of x^2-4');
xlabel('Iterations');
ylabel('Log Error |f(x)|');
legend('Location', 'best'); 
grid on;
set(gca, 'FontSize', 12);