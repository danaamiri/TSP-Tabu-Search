function x =  plotSolution(cities)
    x = [];
    y = [];
    g = graphGenerator(cities);
    
    sz = size(cities);
    n = sz(1);
    
    for i = 1:n
       temp = cities(i,:);
       x = [x,temp(2)];
    end
    
    for i = 1:n
       temp = cities(i,:);
       y = [y,temp(3)];
    end
    
    plot(g,'Xdata',x,'Ydata',y);
end