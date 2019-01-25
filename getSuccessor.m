function s = getSuccessor(matrix,n)
    neighbors = [];
    swaplist = [];
    evals = [];
   
    for i = 1:n
        swapper = swap(matrix);
        swaplist = [swaplist;swapper.swapped];
        neighbors(: , : , i) =  swapper.matrix(:,:,1);
        evals = [evals,evaluation(swapper.matrix)];
    end
    nF = 'neighbors';
    slF = 'swaplist';
    evF = 'evals';
    s = struct(nF,neighbors,slF,swaplist,evF,evals);
end