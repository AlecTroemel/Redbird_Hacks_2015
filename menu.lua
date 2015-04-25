loveframes = require("LoveFrames")

menu = {}

function menu.load()
	text = "F"
	menu.dt_temp = 0
	title = love.graphics.newImage("assets/title.png")
	
	music = love.audio.newSource("assets/MenuMusic.ogg")
	music:setLooping(true)
   love.audio.play(music)
	
    
end

function menu.draw()
	-- draw title image, 32is height of title image,will start right above the screen and move down
	--								  x	  y position (+ goes down)	0 = rotation
	

	love.graphics.draw(title, 0, (menu.dt_temp-1)*30*scale, 0, scale/1.5, scale-0.5)
	love.graphics.setColor(100, 12, 50)
    
    if menu.dt_temp == 2.5 then
		-- printf will take string and formats it 							center | left | right
		love.graphics.printf("Enter", 0, 80*scale, love.graphics.getWidth(), "center")
	end

   
	
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

function menu.keypressed(key)
--change the game state, and init game
	--state = "game"
	state = "ks"
    	
    	music =love.audio.stop()

   
     --love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")
	--this is a test
	
	ks.load()
end
