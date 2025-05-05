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