-- Game Scale
scale = 4
tileSize = 32;	-- size of each tile
function love.conf(t)
	t.title = "platformer"
	t.window.width = 8*tileSize*scale
	t.window.height = 5*tileSize*scale
	t.window.resizable = true
	t.window.vsync = true       -- Enable vertical sync (boolean)
	t.window.fsaa = 0           -- The number of FSAA-buffers (number)
end