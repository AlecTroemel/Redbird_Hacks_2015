game = {}



function game.load()
	game.clock = 0 -- time sense game is loaded
end


function game.draw()
	for i = 0,8 do -- 6 times vertically 
		love.graphics.draw(slices["map_normal"], 
			(i-game.clock%1)*32*scale, 0, 0, scale, scale)
	end
end

function game.update(dt)
	-- Update clock for the background
	game.clock = game.clock + dt
end

function game.keypressed(key)

end