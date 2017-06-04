Context = Object:extend()

function Context.new(self, title, image)
	self.title = title
	if type(image) == "string" then
		self:newImage(image)
	elseif image then
		self.background = image
	end
	return self
end

function Context.newImage(self, filename)
	self.background = love.graphics.newImage(filename)
end

function Context.draw(self)
	return love.graphics.draw(self.background)
end

return Context