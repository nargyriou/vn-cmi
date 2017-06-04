Texte = Object:extend()

function Texte:new()
	self.nbrPropositions = 1
end

function Texte:check()
	A.text = love.graphics.newText(font, "A")
	B.text = love.graphics.newText(font, "B")
	C.text = love.graphics.newText(font, "C")
	D.text = love.graphics.newText(font, "D")
end

return Texte

