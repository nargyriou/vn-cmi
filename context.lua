Context = Object:extend()

function Context.new(self, title, image)
	self.title = title
	if type(image) == "string" then
		self:newBackground(image)
	elseif image then
		self.background = image
	end
	return self
end

function Context.newCharacter(self, character)
	self.character = character
end

function Context.newBackground(self, filename)
	local sWidth, sHeight = love.graphics.getDimensions()
	self.background = love.graphics.newImage(filename)
	local width, height = self.background:getDimensions()
	self.sx = sWidth/width
	self.sy = sHeight/height
end

function Context.draw(self)
	love.graphics.draw(self.background, 0, 0, 0, self.sx, self.sy)
	self.character:draw()
end

return Context