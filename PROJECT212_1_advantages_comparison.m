% Radar chart for advantages comparison
categories = {'Simplicity', 'Convergence', 'Speed', 'Generality', 'Requirements'};
bisection_scores = [5, 5, 3, 2, 4]; % Scores out of 5
gradient_scores = [3, 3, 4, 5, 2];

figure;
polarplot(linspace(0,2*pi,6), [bisection_scores bisection_scores(1)], 'b-o', 'LineWidth', 2);
hold on;
polarplot(linspace(0,2*pi,6), [gradient_scores gradient_scores(1)], 'r--s', 'LineWidth', 2);
hold off;

thetaticks(0:72:360);
thetaticklabels(categories);
title('Method Comparison Radar Chart');
legend('Bisection Method', 'Gradient Descent', 'Location', 'best');
rlim([0 5]);