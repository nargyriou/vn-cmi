local Object = require "classic"

local Context = Object:extend()

function Context:new(image)
	if type(image) == "string" then
		self:newBackground(image)
	elseif image then
		self.background = image
	end
	return self
end

function Context:newBackground(filename)
	local sWidth, sHeight = love.graphics.getDimensions()
	self.background = love.graphics.newImage(filename)
	local width, height = self.background:getDimensions()
	self.sx = sWidth/width
	self.sy = sHeight/height
end

function Context:draw()
	love.graphics.draw(self.background, 0, 0, 0, self.sx, self.sy)
end

return Context