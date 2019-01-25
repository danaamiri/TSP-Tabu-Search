function s = removeSuccessor(successor,successors)
    index = successor.index;
    successors.evals(index) = Inf;
    s = successors;
end