game = {}

function game.load()
	game.clock = 0 -- time sense game is loaded

	-- create default slices 
	typesOfSlices_names = {"normal"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		if v == "normal" then
			typesOfSlices[v] = {}
		
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal"].image

			typesOfSlices[v].body = love.physics.newBody(world, 32, 64, "dynamic")
			typesOfSlices[v].shape = love.physics.newRectangleShape(0,
				 0, 32*scale, 64*scale, 0 )
			typesOfSlices[v].fixture = love.physics.newFixture(typesOfSlices[v].body, 
					typesOfSlices[v].shape, 1)	
		end
	end

	--initiate first slices
	game.theSlices = {}

	for i = 0, 8, 1 do
		temp = {}
		temp.slice = typesOfSlices["normal"]
		temp.x = i*32*scale
		table.insert(game.theSlices,temp)
    end

    -- create the BALLLLLLALALALALALAL
    objects = {}
    objects.ball = {}
    objects.ball.body =  love.physics.newBody(world, 1000, 50, "dynamic")
    objects.ball.shape = love.physics.newCircleShape(5)
    objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
end

function game.update(dt)
	-- Update clock for the background
	--game.clock = game.clock + dt
	world:update(dt) 
	for e,v in ipairs(game.theSlices) do
		v.x = v.x - 1
		v.slice.body:setX(v.x)


		--v.body:setX(v.body:getX() - 2)  
		if (v.x < -128) then
			table.remove(game.theSlices, e)
			temp = {}
			temp.slice = typesOfSlices["normal"]
			temp.x = 8*32*scale
			table.insert(game.theSlices,temp)

		end
	end

	-- if x off screen, remove that slice and add a new one!
	
end

function game.draw()

	for _,v in ipairs(game.theSlices) do
		love.graphics.draw(v.slice.image, v.x, 0, 0, scale, scale)

		-- for debugging 
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", v.slice.body:getX(), 96*scale, 32*scale, 64*scale)
		love.graphics.setColor(255,255,255)

	end
		love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
		love.graphics.circle("fill", objects.ball.body:getX(), 
			objects.ball.body:getY(), objects.ball.shape:getRadius())

		love.graphics.setColor(255,255,255)
end



function game.keypressed(key)

end
