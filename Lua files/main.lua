
require "tile_layer"
require "move"

n=10

pipes={}
pipes[1]=love.graphics.newImage("pipes/blank.png")
pipes[2]=love.graphics.newImage("pipes/down.png")
pipes[3]=love.graphics.newImage("pipes/left.png")
pipes[4]=love.graphics.newImage("pipes/right.png")
pipes[5]=love.graphics.newImage("pipes/up.png")
en={1}
grid={}
pipe_info={}
pipe_info[1]={0,0,0,0}
pipe_info[2]={0,1,1,1}
pipe_info[3]={1,1,1,0}
pipe_info[4]={1,0,1,1}
pipe_info[5]={1,1,0,1}

function love.load()
  for i=1,n,1 do
    table.insert(grid,{})
  end
  for i=1,n,1 do
    for j=1,n,1 do
      table.insert(grid[i],0)
    end
  end
  love.window.setMode(100*n,100*n)
  math.randomseed(os.time())
  add_seed_to_tile()
end

function love.update()
    execute_queue()
end

function love.mousepressed()
    execute_queue()
end

function love.keypressed(key)
  if(key=='w')then
    shift(0,1)
  end
  if(key=='s')then
    shift(0,-1)
  end
  if(key=='a')then
    shift(-1,0)
  end
  if(key=='d')then
    shift(1,0)
  end
end

function love.draw()
  for i=1,n,1 do
    for j=1,n,1 do
      if(grid[i][j]>0)then
        love.graphics.draw(pipes[grid[i][j]],(j-1)*100,(i-1)*100)
        --love.graphics.print(grid[i][j],10*j,10*i)
      end
    end
  end
  love.graphics.print(#queue)
  for i=1,#en,1 do
    --love.graphics.print(en[i],i*100)
  end
end
