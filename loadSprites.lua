GFX = {}
CAMERA = {x=48,y=0,r=0, w=320,h=320 }

function DRAWMAP(objects)
    local renderByLayers = {}
    local max = 0
    local min = 1000
    for k,v in pairs(objects) do
        renderByLayers[v.position.z] =renderByLayers[v.position.z] or {}
        renderByLayers[v.position.z][#renderByLayers[v.position.z]+1] = v
        max = math.max(v.position.z, max+GFX[v.texture].slides)
        min = math.min(v.position.z, min)
    end
    local renderObjs = {}
    for i=min, max do
        if(renderByLayers[i]) then
            for k,v in ipairs(renderByLayers[i]) do
                renderObjs[v] = v
            end
        end
        for k,v in pairs(renderObjs) do
            if i >= GFX[v.texture].slides + v.position.z then
                renderObjs[k] = nil
            else
                GFX[v.texture]:draw(v.position.x, v.position.y, v.position.z, i-v.position.z, r)
            end
        end
    end
end
local function draw(self, x,y, z,layer, r)
    local i = layer+1
        local XX= x*math.cos(CAMERA.r)+  y*math.sin(CAMERA.r)
        local YY=  - x*math.sin(CAMERA.r) +  y*math.cos(CAMERA.r)
        love.graphics.draw(self.image, self.quads[i], -CAMERA.x +XX+ 0.5*CAMERA.w,-CAMERA.y+ YY -i-z + 0.5*CAMERA.h,r-CAMERA.r,1,1,self.sizeX/2, self.sizeY/2)
end
return function()
    local f = require 'sprites.formats'
    for _, format in ipairs(f) do
        GFX[format.key] = format
        format.image = love.graphics.newImage("sprites/"..format.file)
        format.quads = {}
        format.sizeX = format.image:getWidth()/format.slides
        format.sizeY = format.image:getHeight()
        for i=1, format.slides do
            format.quads[#format.quads+1] = love.graphics.newQuad((i-1)*format.image:getWidth()/format.slides, 0, format.image:getWidth()/format.slides, format.image:getHeight(), format.image:getWidth(), format.image:getHeight())
        end
        format.draw = draw
    end
end