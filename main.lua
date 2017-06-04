local monNoeud

function love.load()
	Object = require "classic"
	Arbre = require "arbre"

	monNoeud = Arbre()
	monNoeud:addContext(Context:new("ma bite", "data/tajine/cute.png"))
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