console = ""
love.graphics.setDefaultFilter("nearest", "nearest")
require 'lib.atlas'
love.load = function()
    r = 0.5*math.pi
    require 'loadSprites'()
    atlas = Atlas(1, 1, true, '', nil, false, false)
    for _, v in pairs(GFX) do
        v:addQuads()
    end
end


function love.draw()
    CAMERA.r = CAMERA.r + 0.001
    --CAMERA.x = CAMERA.x+0.1
    love.graphics.scale(4)
    objects = {}
    for i=-8, 8 do
        for j=-8,8 do
            if i % 9 >5 then
                objects[#objects+1] = {position ={x=i*48,y=j*48,z=0,r=0}, texture="test" }
            elseif i % 9 >4 then
                objects[#objects+1] = {position ={x=i*48,y=j*48,z=0,r=0}, texture="house" }
            else
                objects[#objects+1] = {position ={x=i*48,y=j*48,z=0,r=0}, texture="grass" }
            end

        end
    end
    objects[#objects+1] = {position ={x=10,y=20+CAMERA.r*16,z=3,r=-CAMERA.r}, texture="car" }
    objects[#objects+1] = {position ={x=-10,y=-20-CAMERA.r*16,z=3,r=CAMERA.r}, texture="car" }
    DRAWMAP(objects)
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
     --love.graphics.draw(atlas.map,0,0)
end