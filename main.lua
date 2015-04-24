loveframes = require("LoveFrames")
function love.load()
    -- body
    local button = loveframes.Create("button")
    button:SetPos(10, 10)
end


function love.update(dt)

    -- your code

    loveframes.update(dt)
end

function love.draw()

    -- your code

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