function [correctCount, wrongCount, wSolution, bSolution, ySolution] = dualProblem(x, y, lambda)
    n = length(y);

    c = optimvar('c', n);

    constraint1 = optimconstr(n);
    constraint2 = optimconstr(n);
    for i = 1 : n
        constraint1(i) = c(i) >= 0;
        constraint2(i) = c(i) <= 1 / (2 * n * lambda);
    end

    constraint3 = y * c == 0;

    problem = optimproblem('ObjectiveSense','maximize', 'Objective', sum(c) - 0.5 * (y.*c') * (x'*x) * (y'.*c));
    problem.Constraints.c1 = constraint1;
    problem.Constraints.c2 = constraint2;
    problem.Constraints.c3 = constraint3;

    options = optimoptions(problem);
    options.Display = 'none';

    solution = solve(problem, 'Options', options);

    wSolution = sum(solution.c'.*y.*x, 2);
    index = find(abs(solution.c - 1/(4*n*lambda)) == min(abs(solution.c - 1/(4*n*lambda))), 1);
    bSolution = wSolution' * x(:, index) - y(index);
    ySolution = sign(wSolution' * x - bSolution);
    wrongCount = sum((ySolution - y) ~= 0);
    correctCount = n - wrongCount;

    wSolution = wSolution / norm(wSolution);
    bSolution = bSolution / norm(wSolution);
end