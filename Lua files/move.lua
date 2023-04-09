function shift(x,y)
  if(x==-1 and y==0)then
    for i=1,n,1 do
      for j=1,n+x,1 do
        grid[i][j]=grid[i][j+1]
      end
      table.insert(queue,{i,n})
    end
  end
  if(x==1 and y==0)then
    for i=1,n,1 do
      for j=n,1,-1 do
        grid[i][j]=grid[i][j-1]
        grid[i][1]=0
      end
      table.insert(queue,{i,1})
    end
  end
end
