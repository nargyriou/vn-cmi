Condition = require "condition"
Context = require "context"

Noeud = Object:extend()

function Noeud.new(self)
	self.children = {}
	return self
end

function Noeud.addContext(self, context)
	self.context = context
end

function Noeud.addChild(self, child)
	table.add(self.children, child)
end

function Noeud.draw(self)
	self.context:draw()
end

return Noeud