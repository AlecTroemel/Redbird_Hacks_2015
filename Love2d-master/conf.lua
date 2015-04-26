-- Game Scale
scale = 4
function love.conf(t)
	t.title = "platformer"
	t.window.width = 240*scale
	t.window.height = 120*scale
	t.window.resizable = true
end
