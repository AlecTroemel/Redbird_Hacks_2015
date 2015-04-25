local anim8 = require 'anim8/anim8'	-- for animation 
game = {}

local image, animation

function game.load()
	game.hue = 0
	game.clock = 0 -- time sense game is loaded

	game.speed = 4
	objects = {}   -- Table to hold all the physical objects


	-- create default slices 
	typesOfSlices_names = {"normal", "pit","pit1","pit2","pit3", "normal1", "normal2", "normal3", "normal4", "normal5", "normal6", "normal7"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		typesOfSlices[v] = {}
		typesOfSlices[v].groundY = 0
		if v == "normal" then 
			typesOfSlices[v].image = slices["map_normal1"].image
		elseif v == "normal1" then 
			typesOfSlices[v].image = slices["map_normal1"].image
		elseif v == "normal2" then 
			typesOfSlices[v].image = slices["map_normal2"].image
		elseif v == "normal3" then 
			typesOfSlices[v].image = slices["map_normal3"].image
		elseif v == "normal4" then 
			typesOfSlices[v].image = slices["map_normal4"].image
		elseif v == "normal5" then 
			typesOfSlices[v].image = slices["map_normal5"].image
		elseif v == "normal6" then 
			typesOfSlices[v].image = slices["map_normal6"].image
		elseif v == "normal7" then 
			typesOfSlices[v].image = slices["map_normal7"].image
		elseif v == "pit" then 
			typesOfSlices[v].image = slices["map_pit"].image
		elseif v == "pit1" then 
			typesOfSlices[v].image = slices["map_pit1"].image
		elseif v == "pit2" then 
			typesOfSlices[v].image = slices["map_pit2"].image
		elseif v == "pit3" then 
			typesOfSlices[v].image = slices["map_pit3"].image			
		end
	end

	--initiate first slices
	game.theSlices = {}

	for i = 0, 8, 1 do
		temp = {}
		temp.slice = typesOfSlices["normal1"]
		temp.x = i*tileSize
		table.insert(game.theSlices,temp)

		-- Add floor 
		floor = {}
		floor.body = love.physics.newBody(world, i*32, 96+32, "static")
		floor.shape = love.physics.newRectangleShape(i*32, 64)
		floor.fixture = love.physics.newFixture(floor.body, floor.shape, i)

		table.insert(objects, floor)
    end

    -- Create the Character 

    -- Create tilesheet 
    image = slices["unicornTilesheet"].image
    local g = anim8.newGrid(64, 32, image:getWidth(), image:getHeight())
    animation = anim8.newAnimation(g('1-7',1), 0.1)

    objects.player = {}
    objects.player.image = slices["mp1"].image
    objects.player.jumping = false
    objects.player.body =  love.physics.newBody(world, 20, 50, "dynamic")
    objects.player.shape = love.physics.newCircleShape(5)
    objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape)
   -- objects.player.image = love.graphics.newImage("assets/fhsbdfsb.png")
end



function game.update(dt) 
	-- Update clock for the background


	--game.clock = game.clock + dt
	animation:update(dt)


	game.hue =game.hue + 7
	if game.hue > 255 then game.hue = 0
  	elseif game.hue < 0 then game.hue = 255 end

	world:update(dt) 
	for e,v in ipairs(game.theSlices) do		
		number = love.math.random( 0, 9 ) 
		if (v.x < -64) then
			table.remove(game.theSlices, e)
			temp = {}
			temp.x = 8*32
			number = love.math.random( 0, 11 )

			if number == 0 then
				temp.slice = typesOfSlices["normal"]
			elseif number == 1 then
				temp.slice = typesOfSlices["normal1"]
			elseif number == 2 then
				temp.slice = typesOfSlices["normal2"]	
			elseif number == 3 then
				temp.slice = typesOfSlices["normal3"]
			elseif number == 4 then
				temp.slice = typesOfSlices["normal4"]	
			elseif number == 5 then
				temp.slice = typesOfSlices["normal5"]	
			elseif number == 6 then
				temp.slice = typesOfSlices["normal6"]
			elseif number == 7 then
				temp.slice = typesOfSlices["normal7"]					
			else
				if number == 8 then
					temp.slice = typesOfSlices["pit"]
				elseif  number == 9 then
					temp.slice = typesOfSlices["pit1"]
				elseif  number == 10 then
					temp.slice = typesOfSlices["pit2"]
				elseif  number == 11 then
					temp.slice = typesOfSlices["pit3"]
				end
			end
			table.insert(game.theSlices,temp)
		end 
	end

	for e,v in ipairs(game.theSlices) do			
		v.x = v.x - game.speed
	end

--[[
	-- update physical floor locations
	for e,v in ipairs(objects) do
		if e ~= player then
			v.body:setX(v.body:getX() - game.speed*dt)
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
	end--]]

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
	love.graphics.setColor(HSL(game.hue,255,128))
	--draw background
	love.graphics.draw(slices["background"].image,0,0,0,1)

	
	-- Draw Map
	for _,v in ipairs(game.theSlices) do
		love.graphics.draw(v.slice.image, v.x, 0, 0, 1,1)
	end

	love.graphics.setColor(255,255,255)


	-- Draw Character 
	animation:draw(image, objects.player.body:getX() - 20,objects.player.body:getY() - 50)
	--love.graphics.draw(objects.player.image, 
	--	objects.player.body:getX(),
	--	objects.player.body:getY()-26, 
	--	0, 1,1)
	




	-- for debugging 
	--[[for _,v in ipairs(objects) do
		love.graphics.setColor(255, 0, 0, 255)
		love.graphics.rectangle("line", v.body:getX(), v.body:getY()-32, 32, 64)
		love.graphics.setColor(255,255,255)
	end --]]

	-- draw player (ball right now)
	--love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
	--love.graphics.circle("fill", objects.player.body:getX(), 
		--objects.player.body:getY(), objects.player.shape:getRadius())

	love.graphics.setColor(255,255,255)
end



function game.keypressed(key)

end


-- Converts HSL to RGB. (input and output range: 0 - 255)
function HSL(h, s, l, a)
    if s<=0 then return l,l,l,a end
    h, s, l = h/256*6, s/255, l/255
    local c = (1-math.abs(2*l-1))*s
    local x = (1-math.abs(h%2-1))*c
    local m,r,g,b = (l-.5*c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end return (r+m)*255,(g+m)*255,(b+m)*255,a
end