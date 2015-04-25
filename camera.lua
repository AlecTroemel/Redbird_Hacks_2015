--[[ camera module --
	Includes basic camera functions, bounding box, and paralax implimentation's 
	adapted from http://nova-fusion.com/2011/04/19/cameras-in-love2d-part-1-the-basics/

	Simply do this to impliment
		function love.draw()
			camera:draw()
		end
--]]

-- basics -- 
camera = {}
camera.x = 0
camera.y = 0
camera.scalex = 1
camera.scaley = 1
camera.rotation = 0

-- key function: applies info in camera 
function camera:set()
	love.graphics.push()
	love.graphics.rotate(-self.rotation)
	love.graphics.scale(1/self.scalex, 1/self.scaley)
	love.graphics.translate(-self.x, -self.y)
end

-- Removes latest translation
function camera:unset()
	love.graphics.pop()
end

function camera:move(dx, dy)
	self.x = self.x + (dx or 0)
	self.y = self.y + (dy or 0)
end

function camera:scale(sx, sy)
	sx = sx or 1
	self.scalex = self.scalex * sx
	self.scaley = self.scaley * (sy or sx)
end

function camera:setX(x)
	if self.bounds then
		self.x = math.clamp(x, self.bounds.x1, self.bounds.x2)
	else
		self.x = x
	end
end

function camera:setY(y)
	if self.bounds then
		self.y = math.clamp(y, self.bounds.y1, self.bounds.y2)
	else
		self.y = y
	end
end

function camera:setPosition(x, y)
	if x then self:setX(x) end
	if y then self:setY(y) end
end

function camera:setScale(xs, sy)
	self.scalex = sx or self.scalex
	self.scaley = sy or self.scaley
end

-- returns adjusted (true) mouse position, does NOT adjust for rotation
function camera:mousePosition()
	return love.mouse.getX() * self.scalex + self.x, love.mouse.getY() * self.scaley + self.y
end

-- paralax --
camera.layers = {}

-- Insert new layer, sorted by scale 
function camera:newLayer(scale, func)
	table.insert(self.layers, { draw = func, scale = scale })
	table.sort(self.layers, function(a, b) return a.scale < b.scale end)
end

-- Takes care of drawing all the layers
function camera:draw()
	local bx, by = self.x, self.y

	for _, v in ipairs(self.layers) do 
		self.x = bx * v.scale
		self.y = by * v.scale
		camera:set()
		v.draw()
		camera:unset()
	end
end

-- camera clamping --

function camera:setBounds(x1, y1, x2, y2)
	self.bounds = {x1 = x1, y1 = y1, x2 = x2, y2 = y2}
end

function camera:getBounds()
	return unpack(self.bounds)
end

function math.clamp(x, min, max)
  return x < min and min or (x > max and max or x)
end

