function sumation=evaluation(coords1)

a = coords1(:,2);
b = coords1(:,3);
coords = horzcat(a , b);
N=size(coords,1);

sumation = 0;
for i=1:N-1
  
  if i == N
    break
  end
  
  sumation = sumation +  sqrt((coords(i,1)-coords(i+1,1)).^2 + (coords(i,2)-coords(i+1,2)).^2);
  
end
end