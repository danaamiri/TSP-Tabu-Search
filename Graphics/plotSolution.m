function x =  plotSolution(best,current)
    x = [];
    y = [];
    xs = [];
    ys = [];
    g = graphGenerator(best);
    gs = graphGenerator(current);
    sz = size(best);
    n = sz(1);
    
    for i = 1:n
       temp = best(i,:);
       x = [x,temp(2)];
    end
    
    for i = 1:n
       temp = best(i,:);
       y = [y,temp(3)];
    end
    
    for i = 1:n
       temp = current(i,:);
       xs = [xs,temp(2)];
    end
    
    for i = 1:n
       temp = current(i,:);
       ys = [ys,temp(3)];
    end
    p= plot(g,'Xdata',-y,'Ydata',x,'LineWidth',3);
    p.MarkerSize = 5;
    hold on;
    plot(gs,'Xdata',-ys,'Ydata',xs,'LineWidth',1);
    hold off;
end