local level

function love.load()
	Object = require "classic"
	Noeud = require "graphe"
	Character = require "character"
	Player = require "player"

	love.keyboard.setKeyRepeat(0.1, true)

	local triste = Character("Tajine", "data/tajine/triste.png")
	local cute = Character("Tajine", "data/tajine/cute.png")
	local classroom = Context("data/locations/classroom.jpg")

	level = Noeud("Entretien"):addContext(classroom)
	level:addCharacter(cute)

	level:setQuestion("Est-ce que c'est plus clair ?")
	level:addChild("Oui.")
		:addCharacter(cute)
		:addChild("Yay. :D")
	level:addChild("Non.")
		:addCharacter(triste)
		:addChild("Aw. :(")
	level:addChild("Nooooooon !")
		:addCharacter(triste)
		:addChild("Aw. :(")
	level:addChild("Nique bien ta mère Y_Y.")
		:addCharacter(triste)
		:addChild("Aw. :(")

	player = Player(level)
	player:initialize()
end

function love.draw()
	player:drawStuff()
end

function love.update(dt)
end
