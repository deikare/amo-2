%% AMO - projekt 2-7
%% Bartosz Goławski
%% nr albumu 293452

clear;

dataset = importdata('monk-2.dat');
x = dataset.data(:, 1:end-1)';
y = dataset.data(:, end)';

for i = 1:length(y)
    if y(i) == 0
        y(i) = -1;
    end
end

lambdaV = [10, 5, 1, 0.1, 0.05, 0.01, 0.005, 0.001, 1e-8];

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