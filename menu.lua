loveframes = require("LoveFrames")

menu = {}
--comment
function menu.load()
	menu.front_clock = 0
	menu.middle_clock = 0
	menu.back_clock = 0
	text = "F"
	menu.dt_temp = 0
	title = love.graphics.newImage("assets/title.png")
	title:setFilter("nearest", "nearest") 
	
	-- Clouds 
	clouds = {}
	clouds.front ={
		image = love.graphics.newImage("assets/title_clouds_front.png"),
		x = 0,
		x2 = 32*8*4
	}
	clouds.front.image:setFilter("nearest", "nearest") 

	clouds.middle = {
		image = love.graphics.newImage("assets/title_clouds_middle.png"),
		x = 0,
		x2 = 32*8*4
	}
	clouds.middle.image:setFilter("nearest", "nearest") 

	clouds.back = {
		image =love.graphics.newImage("assets/title_clouds_back.png"),
		x = 0,
		x2 = 32*8*4
	}
	clouds.back.image:setFilter("nearest", "nearest") 

	clouds.sky = love.graphics.newImage("assets/title_clouds_sky.png")
	-- Music
	music = love.audio.newSource("assets/MenuMusic.ogg")
	music:setLooping(true)
    love.audio.play(music)
	
    
end

function menu.draw()

	-- Draw the clouds 
	love.graphics.draw(clouds.sky,0,0,0,scale,scale)

	love.graphics.draw(clouds.back.image, clouds.back.x, 0, 0, scale, scale)
	love.graphics.draw(clouds.back.image, clouds.back.x2, 0, 0, scale, scale)

	love.graphics.draw(clouds.middle.image, clouds.middle.x, 0, 0, scale, scale)
	love.graphics.draw(clouds.middle.image, clouds.middle.x2, 0, 0, scale, scale)

	love.graphics.draw(clouds.front.image, clouds.front.x, 0, 0, scale, scale)
	love.graphics.draw(clouds.front.image, clouds.front.x2, 0, 0, scale, scale)


	love.graphics.draw(title,2*tileSize*scale +50,(menu.dt_temp-1)*30*scale , 0, scale/1.5, scale-0.5)
	love.graphics.setColor(100, 12, 50)
    
    if menu.dt_temp == 2.5 then
		-- printf will take string and formats it 							center | left | right
		love.graphics.printf("Enter", 0, 80*scale, love.graphics.getWidth(), "center")
	end
	love.graphics.setColor(255,255,255)
end

function menu.update(dt)
	--[[for _,v in ipairs(clouds) do
		if (v.x < -40) then
			v.x = 0
		end
	end--]]

	clouds.back.x = clouds.back.x - 2
	clouds.middle.x = clouds.middle.x - 4
	clouds.front.x = clouds.front.x - 6

	clouds.back.x2 = clouds.back.x2 - 2
	clouds.middle.x2 = clouds.middle.x2 - 4
	clouds.front.x2 = clouds.front.x2 - 6
	
	if clouds.back.x < -4*32*8 then
		clouds.back.x = 0 
	end
	if clouds.middle.x < -4*32*8 then
		clouds.middle.x = 0 
	end
	if clouds.front.x < -4*32*8 then
		clouds.front.x = 0 
	end
	if clouds.back.x2 < 0 then
		clouds.back.x2 = 4*32*8
	end
	if clouds.middle.x2 < 0 then
		clouds.middle.x2 = 4*32*8 
	end
	if clouds.front.x2 < 0 then
		clouds.front.x2 = 4*32*8 
	end


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
	game.load()
	state = "game"
    music =love.audio.stop()

   
     --love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")love.graphics.printf("Press Start", 0, 80*scale, love.graphics.getWidth(), "center")
	--this is a test
end
