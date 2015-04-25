game = {}

function game.load()
	game.clock = 0 -- time sense game is loaded

	typesOfSlices_names = {"normal"}
	typesOfSlices = {}
	for e,v in ipairs(typesOfSlices_names) do
		if v == "normal" then
			typesOfSlices[v] = {}
			typesOfSlices[v].x = 0
			typesOfSlices[v].groundY = 0
			typesOfSlices[v].image = slices["map_normal"].image

			typesOfSlices[v].body = love.physics.newBody(world, 32, 64, "dynamic")
			typesOfSlices[v].shape = love.physics.newRectangleShape(typesOfSlices[v].x,
				 0, 32*scale, 64*scale, 0 )
			typesOfSlices[v].fixture = love.physics.newFixture(typesOfSlices[v].body, 
					typesOfSlices[v].shape, 1)	
		end
	end

	game.theSlices = {}

	for i = -1, 8, 1 do
		temp = typesOfSlices["normal"]
		temp.x = i*32*scale
		table.insert(game.theSlices, temp)
    end
end

function game.update(dt)
	-- Update clock for the background
	--game.clock = game.clock + dt

	for e,v in ipairs(game.theSlices) do
		v.x = v.x - 0.5

		--v.body:setX(v.body:getX() - 2)  
		if (v.x < -128) then
			table.remove(game.theSlices, e)

		end
	end

	-- if x off screen, remove that slice and add a new one!
	
end

function game.draw()

	for _,v in ipairs(game.theSlices) do
		love.graphics.draw(v.image, 
			v.x, 0, 0, scale, scale)
	end
	--[[
	for i = 0,8  do -- 6 times vertically 
		love.graphics.draw(slices["map_normal"].image, 
			(i-game.clock%1)*32*scale, 0, 0, scale, scale)
--]]
		-- for debuging 
		--love.graphics.setColor(255, 0, 0, 255)
		--love.graphics.rectangle("line", slices["map_normal"].body:getX(), 
		--	slices["map_normal"].body:getY(), 32, 64)

		love.graphics.setColor(255,255,255)

end



function game.keypressed(key)

end
