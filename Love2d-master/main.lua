local sti = require "sti"


function love.load()
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

    -- Initiate Tiled world
    map = sti.new("assets/maps/level_1")
    love.physics.setMeter(24)
    world = love.physics.newWorld(0, 50*12, true)
    collision = map:initWorldCollision(world)
    for _,v in ipairs(collision) do
        v.fixture:setFriction(.9)
    end

    --how about this? does this commit work?

    -- Set up object and Player
    objects = {}
    objects.player = 
    {
        image = love.graphics.newImage("assets/sprites/player.png"),
        jumping = false,
        yVel = 0,
        xVel = 0,
    }
    objects.player.image:setFilter("nearest")
  
    objects.player.body = love.physics.newBody(world, 50, 50, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
    objects.player.shape = love.physics.newCircleShape(5) --the ball's shape has a radius of 20
    objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1) -- Attach fixture to body and give it a density of 1.

    -- Add Player to new layer in the map
    --map:addCustomLayer("Sprite Layer", 2)
    --local spriteLayer = map.layers["Sprite Layer"]
    --spriteLayer.player = objects.player

    -- creates ball
    --[[objects = {}
    objects.ball = {}
    objects.ball.body = love.physics.newBody(world, 50, 50, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
    objects.ball.shape = love.physics.newCircleShape(5) --the ball's shape has a radius of 20
    objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
    objects.ball.fixture:setRestitution(0.5) --let the ball bounce
    objects.ball.fixture:setFriction(0.5)
    -- Add ball to a new layer in the map
    map:addCustomLayer("Sprite Layer", 2)
    local spriteLayer = map.layers["Sprite Layer"]
    spriteLayer.ball = objects.ball --]]


end

function love.update(dt)
    -- update map and physics world
    map:update(dt)  
    world:update(dt)  
    
    -- Left and Right
    if love.keyboard.isDown("left") then
       -- objects.player.body:applyForce(-30,0)
        objects.player.xVel = -2;
        -- objects.player.body:setX(objects.player.body:getX() - 5)        
    elseif love.keyboard.isDown("right") then
        objects.player.xVel = 2;
        -- objects.player.body:setX(objects.player.body:getX() + 5)
    else
        objects.player.xVel = 0;
    end


    -- jump
    if objects.player.jumping == false then
        if love.keyboard.isDown("up") then
            objects.player.jumping = true
            objects.player.body:applyLinearImpulse(0,-25)
        end
    end
    x, y = objects.player.body:getLinearVelocity( )
    if (y == 0) then 
        objects.player.jumping = false 
    end


    -- reset player to screen 
    if love.keyboard.isDown("down") then
        objects.player.body:setX(50)
        objects.player.body:setY(50)
         objects.player.xVel = 0;
    end



    objects.player.body:setX(objects.player.body:getX() + objects.player.xVel);

    -- objects.player.body:setY(objects.player.body:getY() + objects.player.yVel);
end

function love.keypressed(key,isrepeat)
    if key == "space" then
        objects.player.body:setX(objects.player.body:getX() - 50)    
        objects.player.body:applyLinearImpulse(0, 4000)--press the up arrow key to push the ball to the left
    end
end

function love.draw()
    love.graphics.scale(scale, scale)
    map:draw()

    -- Debug (draw collision squares)
    love.graphics.setColor(255, 0, 0, 255)
    map:drawWorldCollision(collision)

    -- Draw Player
    love.graphics.draw(objects.player.image, 
        objects.player.body:getX(), 
        objects.player.body:getY(),
        0, 1, 1, 12, 20)



    -- draw Ball 
    --love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
    --love.graphics.circle("fill", objects.player.body:getX(), objects.player.body:getY(), 4)
    love.graphics.setColor(255, 255, 255, 255)
    
end

function love.resize(w, h)
    map:resize(w, h)
end