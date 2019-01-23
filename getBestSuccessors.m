function [matrix,moves,evaluation] = getBestSuccessors(successors)
    eval = successors.evaluation;
    index = eval== max(eval);
    matrix = successors.mat(index);
    moves = successors.swapped(index);
    evaluation = eval(index);
end
