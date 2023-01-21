%% AMO - projekt 2-7
%% Bartosz Goławski
%% nr albumu 293452

clear;
close all;

consts;

lambdaV = [1, 0.1, 0.05, 0.01, 0.005, 0.001];

disp("----------------Primal----------------")
for lambda = lambdaV
    [correctCount, wrongCount, wSolution, bSolution, ySolution] = primalProblem(x, y, lambda);
    dispSolution(correctCount, wrongCount, wSolution, bSolution, lambda);
end


disp("----------------Dual----------------")
for lambda = lambdaV
    [correctCount, wrongCount, wSolution, bSolution, ySolution] = dualProblem(x, y, lambda);
    dispSolution(correctCount, wrongCount, wSolution, bSolution, lambda);
end

