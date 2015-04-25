game = {}
local sti = require "sti"
-- Add splash state into the game


function game.load()

	windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()
	game.clock = 0 -- time sense game is loaded
end

function game.update(dt)
 	-- update map and physics world
 	game.clock = game.clock + dt
    
    --world:update(dt) 
end

function game.draw()
	--love.graphics.scale(scale, scale)
	for i = 0,8 do -- 6 times vertically 
		love.graphics.draw(slices["map_normal"], 
			(i-game.clock%1)*32*scale, 0, 0, scale, scale)
	end
end



function game.keypressed(key)

end