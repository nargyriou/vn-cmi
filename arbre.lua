Condition = require "condition"
Context = require "context"

Noeud = Object:extend()

function Noeud:new()
	self.children = {}
	return self
end

function Noeud:addContext(context)
	self.context = context
end

function Noeud:addCharacter(character)
	self.character = character
end

function Noeud:addChild(child)
	table.add(self.children, child)
end

function Noeud:draw()
	self.context:draw()
	if self.character then
		self.character:draw()
	end
end

return Noeud