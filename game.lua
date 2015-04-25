game = {}

function game.load()
	game.clock = 0 -- time sense game is loaded
<<<<<<< HEAD
	game.speed = 1
=======
	game.speed = 2
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
	objects = {}   -- Table to hold all the physical objects


	-- create default slices 
<<<<<<< HEAD
	typesOfSlices_names = {"normal", "pit"}
=======
	typesOfSlices_names = {"normal", "pit","pit1","pit2","pit3", "normal1", "normal2", "normal3", "normal4", "normal5", "normal6", "normal7"}
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		if v == "normal" then
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal"].image		
		elseif v == "pit" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
<<<<<<< HEAD
			typesOfSlices[v].image = slices["map_pit"].image	
=======
			typesOfSlices[v].image = slices["map_pit"].image
		elseif v == "pit1" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_pit1"].image
		elseif v == "pit2" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_pit2"].image
		elseif v == "pit3" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_pit3"].image
		elseif v == "normal1" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal1"].image
		elseif v == "normal2" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal2"].image
		elseif v == "normal3" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal3"].image
		elseif v == "normal4" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal4"].image
		elseif v == "normal5" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal5"].image
		elseif v == "normal6" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal6"].image
		elseif v == "normal7" then 
			typesOfSlices[v] = {}
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal7"].image				
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
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
<<<<<<< HEAD
=======
    
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
    objects.player = {}
    objects.player.jumping = false
    objects.player.body =  love.physics.newBody(world, 20, 50, "dynamic")
    objects.player.shape = love.physics.newCircleShape(5)
    objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape)
<<<<<<< HEAD
   -- objects.player.image = love.graphics.newImage("assets/fhsbdfsb.png")
=======
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
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
<<<<<<< HEAD
			number = love.math.random( 0, 2 )
			if number > 0 then
=======
			number = love.math.random( 0, 11 )
			if number == 0 then
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
				temp = {}
				temp.slice = typesOfSlices["normal"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
<<<<<<< HEAD
			else 
				temp = {}
				temp.slice = typesOfSlices["pit"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
=======
			elseif number == 1 then
				temp = {}
				temp.slice = typesOfSlices["normal1"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
			elseif number == 2 then
				temp = {}
				temp.slice = typesOfSlices["normal2"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)	
			elseif number == 3 then
				temp = {}
				temp.slice = typesOfSlices["normal3"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)	
			elseif number == 4 then
				temp = {}
				temp.slice = typesOfSlices["normal4"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)	
			elseif number == 5 then
				temp = {}
				temp.slice = typesOfSlices["normal5"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)	
			elseif number == 6 then
				temp = {}
				temp.slice = typesOfSlices["normal6"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)
			elseif number == 7 then
				temp = {}
				temp.slice = typesOfSlices["normal7"]
				temp.x = 8*32
				table.insert(game.theSlices,temp)						
			elseif number >=8 then
				if number == 8 then
					temp = {}
					temp.slice = typesOfSlices["pit"]
					temp.x = 8*32
					table.insert(game.theSlices,temp)
				elseif  number == 9 then
					temp = {}
					temp.slice = typesOfSlices["pit1"]
					temp.x = 8*32
					table.insert(game.theSlices,temp)
				elseif  number == 10 then
					temp = {}
					temp.slice = typesOfSlices["pit2"]
					temp.x = 8*32
					table.insert(game.theSlices,temp)
				elseif  number == 11 then
					temp = {}
					temp.slice = typesOfSlices["pit3"]
					temp.x = 8*32
					table.insert(game.theSlices,temp)
				end
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
			end
		end
	end

	-- update physical floor locations
	for e,v in ipairs(objects) do
		if e ~= player then
			v.body:setX(v.body:getX() - game.speed)
			if (v.body:getX() < -32) then
				table.remove(objects,e)
<<<<<<< HEAD
				if number > 0 then
=======
				if number < 8 then
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
					floor = {}
					floor.body = love.physics.newBody(world, 8*32, 96+32, "static")
					floor.shape = love.physics.newRectangleShape(32+10, 64)
					floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)
					table.insert(objects, floor)
<<<<<<< HEAD
				else
=======

				elseif  number >= 8 then
>>>>>>> 033459fd1aae0d930c8d686914ffe9044dee41d2
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
