function [neighbors , swaplist , evals] = getSuccessors (matrix,n)
  
  combs = combnk (1 : size(matrix,1) , 2) ;
  swaplist = combs(1 : n, :) ;
  neighbors = [];
  
  for i = 1:size(swaplist,1)

    matrix2 = matrix ;    
    temp = matrix2(swaplist(i,1),:);
    matrix2(swaplist(i,1),:) = matrix2(swaplist(i,2),:);
    matrix2(swaplist(i,2),:) = temp;
    neighbors(: , : , i) = matrix2 ;

  end
  
  evals = [];
  
  for i = 1:size(neighbors,3)

    evals(i) = evaluation (neighbors(: , : , i));
  
  end
  
  evals
  swaplist
  
end
