function sumation=evaluation(coords1)

a = coords1(:,2);
b = coords1(:,3);
coords = horzcat(a , b);

N=size(coords,1);

Dis=zeros(N,N);

for i=1:N
    for j=i+1:N
        Dis(i,j) = sqrt((coords(i,1)-coords(j,1)).^2 + (coords(i,2)-coords(j,2)).^2); %Distance Calculator
        Dis(j,i) = Dis(i,j);
    end
end

sumation = 0;
for i=1:N
  
  if i == N
    break
  end
  
  sumation = Dis(i,i+1) + sumation ;
  
end
sumation = sumation + Dis(N , 1);
end