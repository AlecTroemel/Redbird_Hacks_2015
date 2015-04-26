-- code from https://love2d.org/wiki/Tutorial:Platformer_Jumping
-- impliments simple jumping with physics 

function love.load()
    player = { -- nice and organised.
        x = 0,
        y = 0,
        image = love.graphics.newImage("assets/sprites/player.png"), -- let's just re-use this sprite.
        y_velocity = 0,
        jetpack_fuel = 0.5, -- note: not an actual jetpack. variable is the time (in seconds)
        -- you can hold spacebar and jump higher.
        jetpack_fuel_max = 0.5,

    }
    gravity = 400
    jump_height = 300

    winW, winH = love.graphics.getWidth(), love.graphics.getHeight() -- this is just
    -- so we can draw it in a fabulous manner.
end

function love.draw()
    love.graphics.rectangle("fill", 0, winH / 2, winW, winH / 2)
    love.graphics.translate(winW / 2, winH / 2) -- you don't need to understand this

    love.graphics.draw(player.image, player.x, -player.y, 0, 1, 1, 64, 103) -- trust me
    -- on the origin position. just trust me.
end

function love.update(dt)
    if player.jetpack_fuel > 0 -- we can still move upwards
    and love.keyboard.isDown(" ") then -- and we're actually holding space
        player.jetpack_fuel = player.jetpack_fuel - dt -- decrease the fuel meter
        player.y_velocity = player.y_velocity + jump_height * (dt / player.jetpack_fuel_max)
    end
    if player.y_velocity ~= 0 then -- we're probably jumping
        player.y = player.y + player.y_velocity * dt -- dt means we wont move at
        -- different speeds if the game lags
        player.y_velocity = player.y_velocity - gravity * dt
        if player.y < 0 then -- we hit the ground again
            player.y_velocity = 0
            player.y = 0
            player.jetpack_fuel = player.jetpack_fuel_max
        end
    end
end

function love.keypressed(key)
    if key == " " then
        if player.y_velocity == 0 then -- we're probably on the ground, let's jump
            player.y_velocity = jump_height
        end
    end
end