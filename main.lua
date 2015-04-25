loveframes = require("LoveFrames")
require('game')


function love.load()
    -- create physics world 50*12
    world = love.physics.newWorld(0, 50*12, true)

    -- load images (global assets)
    slices_fn = {"map_normal", "map_pit","map_pit1","map_pit2","map_pit3","map_normal1","map_normal2","map_normal3","map_normal4","map_normal5","map_normal6","map_normal7" }
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
    state = "game"
    game.load()
end


function love.update(dt)

    -- your code
    if state == "game" then
        game.update(dt)
    end
    loveframes.update(dt)
end

function love.draw()

    -- your code
    if state == "game" then
        game.draw()
    end
    loveframes.draw()

end

function love.mousepressed(x, y, button)

    -- your code

    loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)

    -- your code

    loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)

    -- your code

    loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)

    -- your code

    loveframes.keyreleased(key)
end

function love.textinput(text)
    -- my code

    loveframes.textinput(text)
end