game = {}

function game.load()
	game.clock = 0 -- time sense game is loaded

	objects = {}   -- Table to hold all the physical objects


	-- create default slices 
	typesOfSlices_names = {"normal"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		if v == "normal" then
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal"].image		
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
		floor.shape = love.physics.newRectangleShape(32, 64)
		floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)

		table.insert(objects, floor)
    end

    -- create the BALLLLLLALALALALALAL
    
    objects.ball = {}



    objects.ball.body =  love.physics.newBody(world, 20, 50, "dynamic")
    objects.ball.shape = love.physics.newCircleShape(5)
    objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
end

function game.update(dt) 
	-- Update clock for the background
	-- game.clock = game.clock + dt
	world:update(dt) 
	for e,v in ipairs(game.theSlices) do
		v.x = v.x - .5

		--v.body:setX(v.body:getX() - 2)  
		if (v.x < -32) then
			table.remove(game.theSlices, e)
			temp = {}
			temp.slice = typesOfSlices["normal"]
			temp.x = 8*32
			table.insert(game.theSlices,temp)

		end
	end

	-- update physical floor locations
	for e,v in ipairs(objects) do
		if e ~= ball then
			v.body:setX(v.body:getX() - .5)
			if (v.body:getX() < -32) then
				table.remove(objects,e)
				floor = {}
				floor.body = love.physics.newBody(world, 8*32, 96+32, "static")
				floor.shape = love.physics.newRectangleShape(0, 0, 32, 64, 0 )
				floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)
				table.insert(objects, floor)
			end
		end
	end

	objects.ball.body:setX(20)


	-- if x off screen, remove that slice and add a new one!
	
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
	-- draw ball
	love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	love.graphics.circle("fill", objects.ball.body:getX(), 
		objects.ball.body:getY(), objects.ball.shape:getRadius())

	love.graphics.setColor(255,255,255)
end



function game.keypressed(key)

end
