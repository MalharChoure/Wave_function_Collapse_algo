queue={}

function add_tile_to_queue(x,y)
  put_in=true
  if(x>0 and x<n+1)then
    if(y>0 and y<n+1)then
      if(grid[x][y]==0)then
        for k,v in pairs(queue)do
          if(v[1]==x and v[2]==y)then
            put_in=false
          end
        end
        if(put_in)then
          table.insert(queue,{x,y})
        end
      end
    end
  end
end

function add_seed_to_tile()
  a=math.random(2,5)
  mid=math.abs(n/2)
  --add_tile_to_queue(2,2)
  grid[mid][mid]=a;
  add_tile_to_queue(mid-1,mid)
  add_tile_to_queue(mid+1,mid)
  add_tile_to_queue(mid,mid+1)
  add_tile_to_queue(mid,mid-1)
end

function check_orient(x,y)
  local set={}
  local check_set={}
  countn=0
  if(y-1>0)then
    set[2]=pipe_info[grid[x][y-1]==0 and 1 or grid[x][y-1]][4]
    --table.insert(set,a)
    --en[2]=grid[x][y-1]==0 and 1 or grid[x][y-1]
    if(set[2]>0)then
      countn=countn+1
    end
  end
  if(x-1>0)then
    set[1]=pipe_info[grid[x-1][y]==0 and 1 or grid[x-1][y]][3]
    --table.insert(set,a)
    --en[1]=grid[x-1][y]==0 and 1 or grid[x-1][y]
    if(set[1]>0)then
      countn=countn+1
    end
  end
  if(y<n)then
    set[4]=pipe_info[grid[x][y+1]==0 and 1 or grid[x][y+1]][2]
    --table.insert(set,a)
    --en[4]=grid[x][y+1]==0 and 1 or grid[x][y+1]
    if(set[4]>0)then
      countn=countn+1
    end
  end
  if(x<n)then
    set[3]=pipe_info[grid[x+1][y]==0 and 1 or grid[x+1][y]][1]
    --table.insert(set,a)
    --en[3]=grid[x+1][y]==0 and 1 or grid[x+1][y]
    if(set[3]>0)then
      countn=countn+1
    end
  end
  en=set
  for i=1,5,1 do
    count=0
    for j=1,4,1 do
      if(set[j]==1 and pipe_info[i][j]==set[j])then
        count=count+1
      -- else
      --   break
      end
    end
    if(count==countn)then
      table.insert(check_set,i)
    end
  end
  local incounter=0
  for i=1,4,1 do
    if(set[i]~=0)then
      break;
    else
      incounter=1;
    end
  end
  if(incounter==4)then
    check_set={1}
  end
  return check_set
end


function execute_queue()
  if(#queue>0)then
    local temp=queue[1]
    addtile(temp[1],temp[2])
    add_tile_to_queue(temp[1]-1,temp[2])
    add_tile_to_queue(temp[1]+1,temp[2])
    add_tile_to_queue(temp[1],temp[2]+1)
    add_tile_to_queue(temp[1],temp[2]-1)
    table.remove(queue,1)
  end
end


function addtile(x,y)
  local set=check_orient(x,y)
  --en=check_orient(x,y)
  if(#set>0)then
    rand=math.random(1,#set)
    grid[x][y]=set[rand]
  else
    grid[x][y]=0
  end
end

function check_orient2(x,y)
  local set_points={}
  local counts=0
  local check_set_points={}
  if(y-1>0)then
    set_points[1]=pipe_info[grid[x][y-1]==0 and 1 or grid[x][y-1]][3]
  end
end
