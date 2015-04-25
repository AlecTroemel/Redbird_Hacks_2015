game = {}

function game.load()
	game.clock = 0 -- time sense game is loaded
	game.speed = 1
	objects = {}   -- Table to hold all the physical objects


	-- create default slices 
	typesOfSlices_names = {"normal", "pit"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		if v == "normal" then
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal"].image		
		elseif v == "pit" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_pit"].image	
		end
	end

	--initiate first slices
	game.theSlices = {}

	for i = 0, 8, 1 do
		temp = {}
		temp.slice = typesOfSlices["normal"]
		temp.x = i*32
		table.insert(game.theSlices,temp)

		-- Add floor 
		floor = {}
		floor.body = love.physics.newBody(world, i*32, 96+32, "static")
		floor.shape = love.physics.newRectangleShape(32+10, 64)
		floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)

		table.insert(objects, floor)
    end

    -- create the BALLLLLLALALALALALAL
    objects.player = {}
    objects.player.jumping = false
    objects.player.body =  love.physics.newBody(world, 20, 50, "dynamic")
    objects.player.shape = love.physics.newCircleShape(5)
    objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape)
   -- objects.player.image = love.graphics.newImage("assets/fhsbdfsb.png")
end

function game.update(dt) 
	-- Update clock for the background
	-- game.clock = game.clock + dt
	world:update(dt) 
	for e,v in ipairs(game.theSlices) do
		v.x = v.x - game.speed

		--v.body:setX(v.body:getX() - 2)  
		if (v.x < -32) then
			table.remove(game.theSlices, e)
			number = love.math.random( 0, 2 )
			if number > 0 then
				temp = {}
				temp.slice = typesOfSlices["normal"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
			else 
				temp = {}
				temp.slice = typesOfSlices["pit"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
			end
		end
	end

	-- update physical floor locations
	for e,v in ipairs(objects) do
		if e ~= player then
			v.body:setX(v.body:getX() - game.speed)
			if (v.body:getX() < -32) then
				table.remove(objects,e)
				if number > 0 then
					floor = {}
					floor.body = love.physics.newBody(world, 8*32, 96+32, "static")
					floor.shape = love.physics.newRectangleShape(32+10, 64)
					floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)
					table.insert(objects, floor)
				else
					floor = {}
					floor.body = love.physics.newBody(world, 8*32, 200, "static")
					floor.shape = love.physics.newRectangleShape(0, 0, 32, 64, 0 )
					floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)
					table.insert(objects, floor)
				end
			end
		end
	end
	objects.player.body:setX(20)


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


    -- Reset button for debug
	if love.keyboard.isDown("down") then
        objects.player.body:setX(20)
        objects.player.body:setY(50)
         objects.player.xVel = 0;
    end
end

function game.draw()
	love.graphics.scale(scale, scale)
	for _,v in ipairs(game.theSlices) do
		love.graphics.draw(v.slice.image, v.x, 0, 0, 1, 1)
	end

	-- for debugging 
	for _,v in ipairs(objects) do
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", v.body:getX(), v.body:getY()-32, 32, 64)
		love.graphics.setColor(255,255,255)
	end
	-- draw player (ball right now)
	love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	love.graphics.circle("fill", objects.player.body:getX(), 
		objects.player.body:getY(), objects.player.shape:getRadius())

	love.graphics.setColor(255,255,255)
end



function game.keypressed(key)

end
