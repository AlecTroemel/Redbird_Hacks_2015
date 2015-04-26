local anim8 = require 'anim8/anim8'	-- for animation 
game = {}
local image, image2, unicornAnimation, runnerAnimation

function game.load()
	game.hue = 0
	game.clock = 0 -- time sense game is loaded
	game.speed = 2
 	gravity = 800
    jump_height = 100  
	-- create default slices 
	typesOfSlices_names = {"normal","pit1","pit2","pit3", "normal1", "normal2", "normal3", "normal4", "normal5", "normal6", "normal7"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		typesOfSlices[v] = {}
		typesOfSlices[v].groundY = 0
		if v == "normal" then 
			typesOfSlices[v].image = slices["map_normal"].image
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
		elseif v == "pit1" then 
			typesOfSlices[v].image = slices["map_pit1"].image
		elseif v == "pit2" then 
			typesOfSlices[v].image = slices["map_pit2"].image
		elseif v == "pit3" then 
			typesOfSlices[v].image = slices["map_pit3"].image
		else 
			typesOfSlices[v].image = slices["map_normal"].image			
		end
	end

	--initiate first slices
	game.theSlices = {}

	for i = 0, 8, 1 do
		temp = {}
		temp.slice = typesOfSlices["normal1"]
		temp.x = i*tileSize
		table.insert(game.theSlices,temp)
    end

    -- Create the Character 
    -- Create tilesheet and animations
    player = {}
    player.x = 15
    player.y = 65
    player.y_velocity = 0
 	player.jetpack_fuel = 0.1
 	player.jetpack_fuel_max = 0.1
    -- Power Up 
    image = slices["unicornTilesheet"].image
    local g = anim8.newGrid(64, 32,  image:getWidth(), image:getHeight())
    unicornAnimation = anim8.newAnimation(g('1-7',1), 0.1)

    -- Normal 
    image2 = slices["runningmvp"].image
    local g2 = anim8.newGrid(32, 32,image2:getWidth(),image2:getHeight())
    runnerAnimation = anim8.newAnimation(g2('1-3',1), 0.1)

 	player.image = slices["runningmvp"].image
    player.jumping = false
    player.jumpImage = slices["mpjump"].image

    -- Power Up item 
    powerUp = {}
    powerUp.x = 300
    powerUp.y = 20
    powerUp.x_velocity = 0
    powerUp.image = slices["bottle"].image
    powerUp.counter = 0
    powerUp.switcher = false

    successivePits = 0
end



function game.update(dt)

		
	-- power up color change and animation update 
	if powerUp.switcher == true then
		game.hue =game.hue + 7
		if game.hue > 255 then game.hue = 0
  		elseif game.hue < 0 then game.hue = 255 end
		unicornAnimation:update(dt)
		world:setGravity( 0, 0 )
	else 
		runnerAnimation:update(dt)
		world:setGravity(50*12, 0 )
	end

	
	for e,v in ipairs(game.theSlices) do
		-- decide what the floor the player is currently under for collision 
		if (v.x - 32) < player.x  and  player.x < (v.x + 32) then
			floor = v
		end

		-- randomly create a new slice/ delete old one when one leaves map 
		--number = love.math.random( 0, 9 ) 
		if (v.x < -30) then
			table.remove(game.theSlices, e)
			temp = {}
			temp.x = 8*32
			number = love.math.random(0, 11)
			if powerUp.switcher == true and powerUp.counter < 100
										and powerUp.counter > 50 then
				temp.slice = typesOfSlices["normal"]
			elseif successivePits == 2 then
				temp.slice = typesOfSlices["normal1"]
				successivePits = 0
			else
				if number == 0 then
					temp.slice = typesOfSlices["normal1"]
					successivePits = 0
				elseif number == 1 then
					temp.slice = typesOfSlices["normal1"]
					successivePits = 0
				elseif number == 2 then
					temp.slice = typesOfSlices["normal2"]
					successivePits = 0	
				elseif number == 3 then
					temp.slice = typesOfSlices["normal3"]
					successivePits = 0
				elseif number == 4 then
					temp.slice = typesOfSlices["normal4"]	
					successivePits = 0
				elseif number == 5 then
					temp.slice = typesOfSlices["normal5"]
					successivePits = 0	
				elseif number == 6 then
					temp.slice = typesOfSlices["normal6"]
					successivePits = 0
				elseif number == 7 then
					temp.slice = typesOfSlices["normal7"]
					successivePits = 0					
				else
					if number == 8 then
						temp.slice = typesOfSlices["pit1"]
						successivePits = successivePits + 1
					elseif  number == 9 then
						temp.slice = typesOfSlices["pit1"]
						successivePits = successivePits + 1
					elseif  number == 10 then
						temp.slice = typesOfSlices["pit2"]
						successivePits = successivePits + 1
					elseif  number == 11 then
						temp.slice = typesOfSlices["pit3"]
						successivePits = successivePits + 1
					else
						temp.slice = typesOfSlices["normal1"]
						successivePits = 0	
					end
				end
			end
			 	-- The last node to be added
			table.insert(game.theSlices,temp)

		end 
	end

	-- update slice x positions 
	for e,v in ipairs(game.theSlices) do			
		v.x = v.x - game.speed
	end

	-- Super messy collsion stufffff
	floorX = 65 
	if floor.slice == typesOfSlices["pit"]  or
	   floor.slice == typesOfSlices["pit1"] or
	   floor.slice == typesOfSlices["pit2"] or
	   floor.slice == typesOfSlices["pit3"] then
	   		floorX = 128
	end

	-- handle jumping and falling 
	if powerUp.switcher == false then
		if player.jetpack_fuel > 0 -- we can still move upwards
   			and love.keyboard.isDown(" ") then -- and we're actually holding space
        	player.jetpack_fuel = player.jetpack_fuel - dt -- decrease the fuel meter
        	player.y_velocity = 20 + player.y_velocity + jump_height * (2*dt / player.jetpack_fuel_max)
    	end
    	if player.y_velocity ~= 0 or floorX == 128 then -- we're probably jumping
       		player.y = player.y - player.y_velocity * dt -- dt means we wont move at
       		-- different speeds if the game lags
        	player.y_velocity = player.y_velocity - gravity * dt

        	if floorX == 128 then
        		if (player.y > 90) then
        			state = "ks"
        		end
        	elseif player.y > 65 then -- we hit the ground again
            	player.y_velocity = 0
            	player.y = 65
            	player.jetpack_fuel = player.jetpack_fuel_max
        	end
    	end
	end

	-- Power up movement and collision
	--if yhe player is not in the power up state and the power up is not moving 
	if powerUp.switcher == false and powerUp.x_velocity ~= 3 then
		powerUpNumber = love.math.random(0, 250) -- Create random number
		if powerUpNumber == 250 then
			powerUp.x_velocity = 3
		end
	end
	-- If he player hits the power up
	if game.dist(player.x, player.y, powerUp.x, powerUp.y) < 10 then
		powerUp.x = 300
		powerUp.switcher = true
		powerUp.counter = 300	-- length of the power up 
		powerUp.x_velocity = 0
	end
	powerUp.x = powerUp.x - powerUp.x_velocity	-- increment velocity 
	-- if the plater is in the power up state, decrease the counter
	if powerUp.switcher == true then
		powerUp.counter = powerUp.counter - 1
	end
	-- If counter is 0, exit power up state 
	if powerUp.counter < 0 then
		powerUp.switcher = false
	end
	-- Wrap power up back to the right
	if powerUp.x < 0 then
		powerUp.x = 300
		powerUp.x_velocity = 0
	end


	-- Speed up the game.. Currently not working
	--game.speed = game.speed + 0.001

    -- Reset button for debug
	if love.keyboard.isDown("down") then
        player.body:setX(20)
        player.body:setY(50)
        player.xVel = 0;
    end
end

function game.draw()
	love.graphics.scale(scale, scale)

	-- If power up is on, do some crazy color stuff
	if powerUp.switcher == true then
		love.graphics.setColor(HSL(game.hue,255,128))
	else love.graphics.setColor(255,255,255) end

	--draw background
	love.graphics.draw(slices["background"].image,0,0,0,1)

	-- Draw Map
	for _,v in ipairs(game.theSlices) do
		love.graphics.draw(v.slice.image, v.x, 0, 0, 1,1)
	end
	love.graphics.setColor(255,255,255)


	-- Draw Character
	if powerUp.switcher == true then
		unicornAnimation:draw(image, 0,50)
	elseif player.y_velocity ~= 0 then
		love.graphics.draw(player.jumpImage,player.x,player.y,0,1 )
	else
		runnerAnimation:draw(image2, player.x ,player.y)		
	end


	-- Draw the power up (may be off screen)
	love.graphics.draw(powerUp.image, powerUp.x, powerUp.y)
	

	love.graphics.setColor(255,255,255)
end

function game.keypressed(key)
	if key == "i" then
		powerUp.switcher = true
	elseif key == "u" then 
		powerUp.switcher = false
	end
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

-- Distance formula
function game.dist(x1,y1,x2,y2)
	return math.sqrt( (x1-x2)^2 + (y1-y2)^2 )
end
