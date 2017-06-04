local monNoeud

function love.load()
	Object = require "classic"
	Arbre = require "arbre"
	Character = require "character"

	monNoeud = Arbre()
	monNoeud:addContext(Context("Entretien", "data/locations/classroom.jpg"))
	monNoeud:addCharacter(Character("Tajine", "data/tajine/cute.png"))
end

function love.draw()
	monNoeud:draw()
end

function love.update(dt)
end

function love.textinput(text)
end

function love.mousepressed(x, y, button)  
end

function love.mousereleased(x, y, button)
end