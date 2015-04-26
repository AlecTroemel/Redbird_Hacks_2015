loveframes = require("LoveFrames")

--require('menu')
require('game')
require ('menu')
require ('ks')

function love.load()
    -- create physics world 50*12
    world = love.physics.newWorld(0, 50*12, true)

    -- load images (global assets)
    slices_fn = {"mpjump","bottle","background","unicornTilesheet","runningmvp","map_normal","map_pit1","map_pit2","map_pit3","map_normal1","map_normal2","map_normal3","map_normal4","map_normal5","map_normal6","map_normal7" }
    slices = {}
    for _,v in ipairs(slices_fn) do
            slices[v] = {}
            -- The image
            slices[v].image = love.graphics.newImage("assets/"..v..".png")
    end
    -- Set filter to nearest
    for _,v in pairs(slices) do
        v.image:setFilter("nearest", "nearest") -- takes 2 operands on scale up and scale down, makes crisp 
    end

    -- Initial State
    --game.load()
    menu.load()
    ks.load()
    state = "menu"
end


function love.update(dt)
    if(state == "menu") then
        menu.update(dt)
    elseif (state == "game") then 
        game.update(dt)
    elseif(state == "ks") then 
        ks.update(dt)
    end 
    loveframes.update(dt)
end

function love.draw()
    if state == "game" then
        game.draw()
    elseif state == "menu" then
        menu.draw()
    elseif state == "ks" then
        ks.draw()
    end
    loveframes.draw()
end


function love.mousereleased(x, y, button)
    loveframes.mousereleased(x, y, button)
    
end

function love.draw()
    if(state == "menu") then
        menu.draw()
    elseif (state == "game") then
        game.draw()
    elseif(state == "ks") then 
        ks.draw()
    end 
    loveframes.draw() 
    -- Set Color
   -- love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b)
    -- Draw rectangle for background, fill or line 
    ---love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    -- Return the color back to normal 
    love.graphics.setColor(255,255,255)
    -- your code
end

function love.keyreleased(key)
    loveframes.keyreleased(key)
end

function love.textinput(text)
    loveframes.textinput(text)
end

function love.keypressed(key)
    
    if(state == "menu") then 
        menu.keypressed(key) 
    elseif state == "game" then
        game.keypressed(key)
    elseif(state == "ks") then 
        ks.keypressed(key)
    end
end
