function s = swap(matrix1)
  
  N=size(matrix1,1);
  randnum1 = 1+randi(N-2);
  
  randnum2 = 1+randi(N-2);
  while (true)
   if (randnum1 == randnum2)
    randnum2 = 1+randi(N-2);
    else break;
   end
  end
  
  temp = matrix1(randnum1,:);
  matrix1(randnum1,:) = matrix1(randnum2,:);
  matrix1(randnum2,:) = temp;
  
  matrix = matrix1;
  swapped = [randnum1, randnum2];
  mf = 'matrix';
  sf = 'swapped';
  s = struct(mf,matrix,sf,swapped);
end

  
  