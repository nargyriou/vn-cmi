Character = Object:extend()

function Character:new(name, image)
	self.name = name
	if type(image) == "string" then
		self:newImage(image)
	elseif image then
		self.image = image
	end
	return self
end

local sWidth, sHeight = love.graphics.getDimensions()
function Character:newImage(filename)
	-- Un personnage fait 30% de l'écran
	local idealWidth = 0.33333 * sWidth
	-- Charger image
	self.image = love.graphics.newImage(filename)
	-- Dimensionner l'image
	self.oWidth, self.oHeight = self.image:getDimensions()
	-- sx et sy sont mes échelles (scales)
	self.sx = idealWidth/self.oWidth
	self.sy = self.sx
	self.width, self.height = self.sx*self.oWidth, self.sy*self.oHeight
end

function Character:draw()
	love.graphics.draw(self.image, 0, sHeight*0.9 - self.height, 0, self.sx, self.sy)
end

return Character
