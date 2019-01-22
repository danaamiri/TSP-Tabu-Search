function g = graphGenerator(cities)
    row1 = [];
    row2 = [];
    sz = size(cities);
    n = sz(1);
    for i = 1:n-1
        row1 = [row1,cities(i)];
    end
    
    for i = 2:n
        row2 = [row2,cities(i)];
    end
    
    g = graph(row1,row2);
    
    
end