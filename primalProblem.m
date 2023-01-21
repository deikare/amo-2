function [correctCount, wrongCount, wSolution, bSolution, ySolution] = primalProblem(x, y, lambda)
%     n = length(y);

    [dimmensions, n] = size(x);

    w = optimvar('w', dimmensions);
    b = optimvar('b', 1);
    zeta = optimvar('dzeta', n);
    
    constraints = optimconstr(2*n);
    for i = 1: n
        constraints(2 * i - 1) = y(i) * (w' * x(:, i) - b) >= 1 - zeta(i);
        constraints(2 * i) = zeta(i) >= 0;
    end

    problem = optimproblem('ObjectiveSense', 'minimize', 'Objective', (1/n) * sum(zeta) + lambda * sum(w.^2),'Constraints',constraints);
    options = optimoptions(problem);
    options.Display = 'none';
    solution = solve(problem, 'Options', options);

    wSolution = solution.w;
    bSolution = solution.b;
    ySolution = sign(wSolution' * x - bSolution);
    wrongCount = sum((ySolution - y) ~= 0);
    correctCount = n - wrongCount;

    wSolution = wSolution / norm(wSolution);
    bSolution = bSolution / norm(wSolution);
end