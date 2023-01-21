function performSVM(x, y, lambdaV)
    disp("----------------Primal----------------")
    for lambda = lambdaV
        [correctCount, wrongCount, wSolution, bSolution, ~] = primalProblem(x, y, lambda);
        dispSolution(correctCount, wrongCount, wSolution, bSolution, lambda);
    end
    
    
    disp("----------------Dual----------------")
    for lambda = lambdaV
        [correctCount, wrongCount, wSolution, bSolution, ~] = dualProblem(x, y, lambda);
        dispSolution(correctCount, wrongCount, wSolution, bSolution, lambda);
    end
end