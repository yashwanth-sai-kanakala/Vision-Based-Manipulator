clc;
plotLine(20,30,80,70)

 function plotLineHigh(x0,y0, x1,y1)
map = robotics.BinaryOccupancyGrid(100,100);

dx = x1 - x0;
dy = y1 - y0;
xi = 1;
if (dx<0)
    xi =-1;
    dx = -dx;
else 
    D=2*dx-dy;
    x=x0;
end    
 for y = y0:y1
     show(map)
     hold on
     setOccupancy(map,[x y],1)
     if D>0
         x=x+xi;
         D=D-2*dy;
     else 
         D=D+2*dx;
     end 
     show(map)
     hold on
     setOccupancy(map,[x y],1)

 end
    

end

function plotLineLow(x0,y0, x1,y1)
map = robotics.BinaryOccupancyGrid(100,100);
dx = x1 - x0;
dy = y1 - y0;
yi = 1;
if dx<0
    yi =-1;
    dy = -dy;
else
    D= 2*dy-dx;
    y= y0;
end

for x =x0:x1
    show(map)
    hold on
    setOccupancy(map,[x y],1)
    if D > 0
       y = y + yi;
       D = D - 2*dx;
    else
    D = D + 2*dy;
    end
    show(map)
    hold on
    setOccupancy(map,[x y],1)
end


end

function plotLine(x0,y0, x1,y1)
  if abs(y1 - y0) < abs(x1 - x0)
    if x0 > x1
      plotLineLow(x1, y1, x0, y0)
    else
      plotLineLow(x0, y0, x1, y1)
    end 
    
  else
    if y0 > y1
      plotLineHigh(x1, y1, x0, y0)
    else
      plotLineHigh(x0, y0, x1, y1)
    end 
  end
  
end




