local monNoeud

function love.load()
	Object = require "classic"
	Noeud = require "graphe"
	Character = require "character"
	Input = require "input"

	monNoeud = Noeud("Entretien", "data/locations/classroom.jpg")
	monNoeud:addContext("data/locations/classroom.jpg")
	monNoeud:addCharacter("Tajine", "data/tajine/cute.png")

	monNoeud:setQuestion("Est-ce que c'est plus clair ?")
	monNoeud:addChild(Noeud("Oui.", "data/locations/classroom.jpg"))
	monNoeud:addChild(Noeud("Non.", "data/locations/classroom.jpg"))
	monNoeud:addChild(Noeud("Nooooooon !", "data/locations/classroom.jpg"))
	monNoeud:addChild(Noeud("Nique bien ta mère Y_Y.", "data/locations/classroom.jpg"))

	input = Input()
	input:bind("down", function() print(2) end)
	input:bind("up", function() print(2) end)
end

function love.draw()
	monNoeud:draw()
end

function love.update(dt)
end
