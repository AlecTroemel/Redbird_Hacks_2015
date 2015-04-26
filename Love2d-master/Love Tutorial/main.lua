debug = false

-- Add splash state into the game
require('splash')
require('game')

-- run once when openned, load everything
function love.load()
	-- load images (global assets)
	img_fn = {"bullet", "enemy", "player", "title", "background"}
	imgs = {}
	for _,v in ipairs(img_fn) do
		imgs[v] = love.graphics.newImage("assets/"..v..".gif")
	end

	-- Set filter to nearest
	for _,v in pairs(imgs) do
		v:setFilter("nearest", "nearest") -- takes 2 operands on scale up and scale down, makes crisp 
	end

	-- Play music and loop it
	music = love.audio.newSource("assets/music.ogg", "stream") -- stream doesnt load all the audio into ram
	music:setLooping(true)
	love.audio.play(music)

	-- Load shoot sound
	shoot = love.audio.newSource("assets/shoot.ogg", "static") -- kept in memory 

	-- Initialize font, and set it
	font = love.graphics.newFont("assets/font.ttf", 14*scale) -- heavy process intensive, only in load 
	love.graphics.setFont(font)

	-- define colors (global assets)
	bgcolor = {r=148, g=191, b=19}
	fontcolor = {r=46, g=115, b=46}

	-- Initial State
	state = "splash"

	-- Load the states
	splash.load()
	game.load()

end

-- render frames
function love.draw()
	-- Set Color
	love.graphics.setColor(bgcolor.r, bgcolor.g, bgcolor.b)
	-- Draw rectangle for background, fill or line 
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	-- Return the color back to normal 
	love.graphics.setColor(255,255,255)

	-- Call the states draw function 
	if state == "splash" then
		splash.draw()
	elseif state == "game" then
		game.draw()
	end
end

-- update variables
function love.update(dt) -- dt =delta time
	-- Call the states update function
	if state == "splash" then
		splash.update(dt)
	elseif state == "game" then
		game.update(dt)
	end
end


-- whenever key is pressed 
function love.keypressed(key)
	-- Call the states keypressed function
	if state == "splash" then
		splash.keypressed(key)
	elseif state == "game" then
		game.keypressed(key)
	end

	-- Debug, no else if because we want - to always work
	if key == "-" then
		debug = not debug
	end
end



