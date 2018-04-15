console = ""
love.graphics.setDefaultFilter("nearest", "nearest")

love.load = function()
    r = 0.5*math.pi
    require 'loadSprites'()
end


function love.draw()
    CAMERA.r = CAMERA.r + 0.05
    --CAMERA.x = CAMERA.x+0.1
    love.graphics.scale(2)
    objects = {}
    objects[#objects+1] = {position ={x=0,y=0,z=0,r=0}, texture="test" }
    objects[#objects+1] = {position ={x=48,y=0,z=0,r=0}, texture="test" }
    objects[#objects+1] = {position ={x=96,y=0,z=0,r=0}, texture="test" }
    objects[#objects+1] = {position ={x=20,y=10,z=3,r=0}, texture="car" }
    DRAWMAP(objects)
end