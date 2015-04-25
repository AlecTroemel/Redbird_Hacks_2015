loveframes = require("LoveFrames")
--require('menu')
require('game')

function love.load()
    -- body
    --local button = loveframes.Create("button")
    --button:SetPos(10, 10)
    slices_fn = {"map_normal"}
    slices = {}
    for _,v in ipairs(slices_fn) do
        slices[v] = love.graphics.newImage("assets/"..v..".png")
    end

    -- Set filter to nearest
    for _,v in pairs(slices) do
        v:setFilter("nearest", "nearest") -- takes 2 operands on scale up and scale down, makes crisp 
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

    --loveframes.update(dt)
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
    if state == "game" then
        game.keypressed(key)
    end
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