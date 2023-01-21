function dispSolution(correct, wrong, w, b, lambda)
    fprintf("lambda = %0.3f, classifiedCorrectly = %d, wrong = %d\n", lambda, correct, wrong);
    fprintf("w:\n");
    disp(w);
    fprintf("b:\n");
    disp(b);
end