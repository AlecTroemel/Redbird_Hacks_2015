loveframes = require("LoveFrames")

menu = {}

function menu.load()
	menu.dt_temp = 0
	title = love.graphics.newImage("assets/title.png")
	local button = loveframes.Create(button)
	music = love.audio.newSource("assets/menuMusic.ogg")
   love.audio.play(music)
	
    
end

function menu.draw()
	-- draw title image, 32is height of title image,will start right above the screen and move down
	--								  x	  y position (+ goes down)	0 = rotation
	love.graphics.draw(title, 0, (menu.dt_temp-1)*30*scale, 0, scale/1.5, scale)
	love.graphics.setColor(100, 12, 50)
    
    
	
	love.graphics.setColor(255,255,255)
end

function menu.update(dt)
	-- update dt-temp
	menu.dt_temp = menu.dt_temp + dt
	-- wait 2.5 seconds, then stop in place
	if menu.dt_temp > 2.5 then
		menu.dt_temp = 2.5
	end
end

--function menu.keypressed(key)
	-- change the game state, and init game
	--state = "game"
	--game.load()
--end
