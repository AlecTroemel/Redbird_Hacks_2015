loveframes = require("LoveFrames")

ks = {}

function ks.load()
	ks.dt_temp = 0
	kScreen = love.graphics.newImage("assets/ksScreen.jpeg")
	local button = loveframes.Create(button)
	musicKs = love.audio.newSource("assets/ksMusic.ogg")
	switcher = true
end

function ks.draw()
	-- draw title image, 32is height of title image,will start right above the screen and move down
	--			(ks.dt_temp-1)*30*scale	  x	  y position (+ goes down)	0 = rotation
	
	love.graphics.draw(kScreen, 0, 0, 0, scale-0.7, scale-0.5)
	love.graphics.setColor(255, 255, 255)
    
    if ks.dt_temp == 2.5 then
		-- printf will take string and formats it 							center | left | right
		love.graphics.printf("'R' to Restart", 0, 85*scale, love.graphics.getWidth(), "center")
		love.graphics.printf("'Q' to Quit", 0, 55*scale, love.graphics.getWidth(), "center")
	end

   
	
	love.graphics.setColor(0,0,0)

end

function ks.update(dt)
	if switcher == true then
		love.audio.play(musicKs)
		switcher = false
	end

	-- update dt-temp
	ks.dt_temp = ks.dt_temp + dt
	-- wait 2.5 seconds, then stop in place
	if ks.dt_temp > 2.5 then
		ks.dt_temp = 2.5
	end
end

function ks.keypressed(key)
	--change the game state, and return to the menu
    if key == "r" then 
		state = "menu"
    elseif key == "q" then
      love.event.quit()
    end
end
