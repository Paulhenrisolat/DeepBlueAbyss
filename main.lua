io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.y = 0
Lander.rotation = math.rad(0)
Lander.velocityX = 0
Lander.velocityY = 0
Lander.speed = 1
Lander.imgb = love.graphics.newImage("images/ocean1.png")
Lander.img = love.graphics.newImage("images/nautilusN.png")
Lander.img2 = love.graphics.newImage("images/nautilusUP.png")
Lander.img3 = love.graphics.newImage("images/nautilusMove.png")
Lander.imgW = Lander.img:getWidth()
Lander.imgH = Lander.img:getHeight()
Lander.engineUpOn = false
Lander.engineMoveOn = false

function input(dt)
  if love.keyboard.isDown("right") then
    Lander.rotation = Lander.rotation + 2 * dt
  end
  if love.keyboard.isDown("left") then
    Lander.rotation = Lander.rotation - 2 * dt
  end
  if love.keyboard.isDown("up") then
    Lander.engineUpOn = true
    
    local forceX = math.cos(Lander.rotation) * (Lander.speed * dt)
    local forceY = math.sin(Lander.rotation) * (Lander.speed * dt)
    Lander.velocityX = Lander.velocityX + forceX
    Lander.velocityY = Lander.velocityY + forceY
  else
    Lander.engineUpOn = false
  end
  if love.keyboard.isDown("space") then
    Lander.engineMoveOn = true
    
    local forceX = math.cos(Lander.rotation) * (Lander.speed * dt)
    local forceY = math.sin(Lander.rotation) * (Lander.speed * dt)
    Lander.velocityX = Lander.velocityX + forceX
    Lander.velocityY = Lander.velocityY + forceY
  else
    Lander.engineMoveOn = false
  end
end
function love.load()
  screenW = love.graphics.getWidth()
  screenH = love.graphics.getHeight()
  
  Lander.x = screenW/2
  Lander.y = screenH/2
  print("pos:"..Lander.x.."|"..Lander.y.." wh:"..Lander.imgW.."|"..Lander.imgH.." screen:"..screenW.."|"..screenH)
end
function love.update(dt)
  input(dt)
  --Lander.velocityY = Lander.velocityY + (0.6 * dt)
  
  Lander.x = Lander.x + Lander.velocityX
  Lander.y = Lander.y + Lander.velocityY
end
function love.draw()
  love.graphics.draw(Lander.imgb,0,0)
  
  if Lander.engineUpOn == true then
    love.graphics.draw(Lander.img2, Lander.x, Lander.y, Lander.rotation,1,1,Lander.imgW/2,Lander.imgH/2)
  elseif Lander.engineMoveOn == true then
    love.graphics.draw(Lander.img3, Lander.x, Lander.y, Lander.rotation,1,1,Lander.imgW/2,Lander.imgH/2)
  else
    love.graphics.draw(Lander.img, Lander.x, Lander.y, Lander.rotation,1,1,Lander.imgW/2,Lander.imgH/2)
  end
end