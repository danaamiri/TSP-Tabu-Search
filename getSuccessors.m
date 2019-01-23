function [neighbors , swaplist , evals] = getSuccessors (matrix,n)
  
  combs = combnk (2 : size(matrix,1)-1 , 2) ;
  
  a = randperm (size(combs,1));
  b = a (1:n);
  
  for i = 1 : n
    
    swaplist (i,1) = combs(b(i),1);
    swaplist (i,2) = combs(b(i),2);
  
  end
  
%  swaplist = combs(1:n, :) ;
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
  
  swaplist
  evals
  
end
