function s = swap(matrix1)
  N=size(matrix1,1);
  randnum1 = randi([2,N-1]);
  
  randnum2 = randi([2,N-1]);
  while (true)
   if (randnum1 == randnum2)
    randnum2 = randi([2,N-1]);
   else
       break;
   end
  end
  temp = matrix1(randnum1,[2,3]);
  matrix1(randnum1,[2,3]) = matrix1(randnum2,[2,3]);
  matrix1(randnum2,[2,3]) = temp;
  matrix = matrix1;
  swapped = [randnum1, randnum2];
  mf = 'matrix';
  sf = 'swapped';
  s = struct(mf,matrix,sf,swapped);
end

  
  