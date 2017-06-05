local level

function love.load()
	Object = require "classic"
	Noeud = require "graphe"
	Character = require "character"
	Player = require "player"

	love.keyboard.setKeyRepeat(0.1, true)

	level = Noeud("Entretien"):addContext("data/locations/classroom.jpg")
	level:addCharacter("Tajine", "data/tajine/cute.png")

	level:setQuestion("Est-ce que c'est plus clair ?")
	level:addChild("Oui.")
		:addContext("data/locations/classroom.jpg")
		:addCharacter("Tajine", "data/tajine/cute.png")
		:addChild("Yay. :D")
			:addContext("data/locations/classroom.jpg")
	level:addChild("Non.")
		:addContext("data/locations/classroom.jpg")
		:addCharacter("Tajine", "data/tajine/triste.png")
		:addChild("Aw. :(")
			:addContext("data/locations/classroom.jpg")
	level:addChild("Nooooooon !")
		:addContext("data/locations/classroom.jpg")
		:addCharacter("Tajine", "data/tajine/triste.png")
		:addChild("Aw. :(")
			:addContext("data/locations/classroom.jpg")
	level:addChild("Nique bien ta mère Y_Y.")
		:addContext("data/locations/classroom.jpg")
		:addCharacter("Tajine", "data/tajine/triste.png")
		:addChild("Aw. :(")
			:addContext("data/locations/classroom.jpg")

	player = Player(level)
	player:initialize()
end

function love.draw()
	player:drawStuff()
end

function love.update(dt)
end
