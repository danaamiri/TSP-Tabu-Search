function s = getBestSuccessors(successors)
    eval = successors.evals;
    index = find(eval== min(eval));
    matrix = successors.neighbors(:,:,index);
    moves = successors.swaplist(index,:);
    evaluation = eval(index);
    matField = 'matrix';
    moveField = 'moves';
    evalField = 'evaluation';
    indField = 'index';
    s = struct(matField,matrix,moveField,moves,evalField,evaluation,indField,index);
end
