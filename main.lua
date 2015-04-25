loveframes = require("LoveFrames")
require ('menu')
require ('ks')
function love.load()
    -- body
    menu.load()
    --ks.load()
    --local button = loveframes.Create("button")
   -- button:SetPos(10, 10)
end


function love.update(dt)
    --if menu == "menu" then
    if(state == "menu") then
        menu.update(dt)
    end

    if(state == "ks") then 
        ks.update(dt)
    end 

    loveframes.update(dt)

end


function love.draw()

    -- Set Color
   -- love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b)
    -- Draw rectangle for background, fill or line 
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    -- Return the color back to normal 
    love.graphics.setColor(255,255,255)
    -- your code
    if(state=="menu") then
        menu.draw()
    --loveframes.draw()
    end

    if(state == "ks") then 
        ks.draw()
    end 
end

function love.keypressed(key)
    
     if(state == "menu") then 
        menu.keypressed(key) 
    end

     if(state == "ks") then 
        ks.keypressed(key)
    end

    
    --0 love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")

   
end