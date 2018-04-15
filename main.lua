console = ""
love.graphics.setDefaultFilter("nearest", "nearest")

love.load = function()
    r = 0.5*math.pi
    require 'loadSprites'()
end


function love.draw()
    CAMERA.r = CAMERA.r + 0.05
    --CAMERA.x = CAMERA.x+0.1
    love.graphics.scale(3)
    objects = {}
    for i=-10, 10 do
        for j=-10,10 do
            objects[#objects+1] = {position ={x=i*45,y=j*45,z=0,r=0}, texture="test" }
        end
    end



    objects[#objects+1] = {position ={x=20,y=10,z=3,r=0}, texture="car" }
    DRAWMAP(objects)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end