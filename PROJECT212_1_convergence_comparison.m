% Convergence comparison
iterations = 1:20;
bisection_error = 1./(2.^iterations);
gradient_error = 1./iterations; % Simplified model

figure;
semilogy(iterations, bisection_error, 'b-o', 'LineWidth', 2);
hold on;
semilogy(iterations, gradient_error, 'r--s', 'LineWidth', 2);
hold off;

title('Convergence Rate Comparison (Log Scale)');
xlabel('Iterations');
ylabel('Error (log scale)');
legend('Bisection Method', 'Gradient Descent', 'Location', 'best');
grid on;




#################### FOR MORE ACCURATE REPRESENTATION, use the following matlab code
%% Clear workspace and reset figures
clc;
clear all;
close all;
format long;

%% 1. Bisection Method (Root Finding)
f_bisection = @(x) sin(x) - x/2;  % Function with a root around x ≈ 1.895
a = 1; b = 3;                     % Interval containing the root
max_iter = 20;
true_root = fzero(f_bisection, [a, b]);  % True root for error calculation
bisection_errors = zeros(1, max_iter);

fprintf('Running Bisection Method...\n');
for n = 1:max_iter
    mid = (a + b)/2;
    bisection_errors(n) = abs(mid - true_root);
    fprintf('Iter %2d: x = %.8f, error = %.2e\n', n, mid, bisection_errors(n));
    
    if abs(f_bisection(mid)) < 1e-6
        break;
    elseif f_bisection(a) * f_bisection(mid) < 0
        b = mid;
    else
        a = mid;
    end
end

%% 2. Gradient Descent (Optimization)
f_gd = @(x) x^2 + 3*sin(x);      % Function to minimize
df_gd = @(x) 2*x + 3*cos(x);     % Derivative
x0 = 3;                          % Initial guess
alpha = 0.1;                     % Learning rate
max_iter_gd = 20;
true_min = fminunc(f_gd, x0);    % Find the actual minimum for comparison
gd_errors = zeros(1, max_iter_gd);

fprintf('\nRunning Gradient Descent...\n');
x = x0;
for n = 1:max_iter_gd
    x = x - alpha * df_gd(x);
    gd_errors(n) = abs(x - true_min);
    fprintf('Iter %2d: x = %.8f, error = %.2e\n', n, x, gd_errors(n));
end

%% 3. Optimized Plot for Clear Comparison
figure('Position', [100, 100, 800, 600]);

% Plot both methods using log scale for clarity
semilogy(1:max_iter, bisection_errors, 'b-o', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
semilogy(1:max_iter_gd, gd_errors, 'r--s', 'LineWidth', 2, 'MarkerSize', 8);
hold off;

xlabel('Iterations');
ylabel('Error (log scale)');
title('Convergence Comparison: Bisection vs. Gradient Descent');
legend('Bisection Method', 'Gradient Descent');
grid on;
set(gca, 'FontSize', 12);

%% Display final results
fprintf('\nFinal Results:\n');
fprintf('Bisection Method:\n');
fprintf('\tFinal estimate: %.12f\n\tTrue root: %.12f\n\tError: %.2e\n\n',...
        (a+b)/2, true_root, bisection_errors(end));

fprintf('Gradient Descent:\n');
fprintf('\tFinal estimate: %.12f\n\tTrue min: %.12f\n\tError: %.2e\n',...
        x, true_min, gd_errors(end));
