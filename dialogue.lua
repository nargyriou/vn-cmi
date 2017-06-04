Texte = Object:extend()

function Texte:new()
	self.nbrPropositions = 1
end

local A, B, C, D
function Texte:affiche()
	A = love.graphics.newText(font, "A")
	B = love.graphics.newText(font, "B")
	C = love.graphics.newText(font, "C")
	D = love.graphics.newText(font, "D")
end

return Texte

