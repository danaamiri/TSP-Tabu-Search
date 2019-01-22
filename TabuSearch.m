function result = TabuSearch(problem, solutionResult, iteration)
    %begin
    initial = makeProblem(problem);
    answer = solutionResult;
    bound = iteration;
    sz = size(problem);
    n = sz(1);
    
    %intialization
    currentSolution = initial;
    tabuTenure = round(sqrt(n));
    tabuList = zeros(n);
    currentCost = evaluation(currentSolution);
    currentCost
    plotSolution(currentSolution);
    %Start Algorithm
    for counter = 1:bound
    end
end