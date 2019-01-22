%For Adding StartCity to End of problem to turn salesman back to his
%hometown
function init = makeProblem(problem)
    sz = size(problem);
    startCity = problem(1,:);
    n = sz(1);
    startCity(1) = n+1;
    init = [problem;startCity];
end