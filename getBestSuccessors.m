function s = getBestSuccessors(successors)
    eval = successors.evals;
    index = eval== max(eval);
    matrix = successors.neighbors(index);
    moves = successors.swaplist(index,:);
    evaluation = eval(:,:,index);
    matField = 'matrix';
    moveField = 'moves';
    evalField = 'evaluation';
    s = struct(matField,matrix,moveField,moves,evalField,evaluation);
end
