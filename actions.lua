local Object = require "classic"
local gamevar = require "game_variables"
local Action = Object:extend()

-- L'action est une instruction simple exécutée lorsqu'on arrive
-- sur un noeud.
function Action:new(result, a, op, b)
	-- Composée de deux membres et d'une opération
	-- Un membre peut être un nombre ou une variable de jeu
	-- 
	-- ex: "amitie" + 1, "jours_passes" % "jours_semaine"...
	self.a = a -- premier membre; string ou nombre
	self.b = b -- deuxième membre; string ou nombre
	self.op = op -- opération (+ - / * %)
	self.result = result -- string; variable de jeu dans laquelle 
	                     -- stocker le résultat
end

-- Interprète l'action et l'exécute et stocke le résultat dans une 
-- variable
function Action:execute()
	local a = self.a
	local b = self.b
	
	-- Si a est un string on récupère la variable qui porte ce nom
	if type(self.a) == "string" then
		a = gamevar.read(self.a) or 0
	end
	-- same
	if type(self.b) == "string" then
		b = gamevar.read(self.b) or 0
	end
	
	-- Calcul
	if 	type(self.op) == "string" 
	and	type(a) == "number" 
	and	type(b) == "number" then
		if self.op == "+" then
			return gamevar.set(self.result, a + b)
		elseif self.op == "-" then
			return gamevar.set(self.result, a - b)
		elseif self.op == "%" then
			return gamevar.set(self.result, a % b)
		elseif self.op == "*" then
			return gamevar.set(self.result, a * b)
		elseif self.op == "/" then
			return gamevar.set(self.result, a / b)
		else
			return nil, "Unknown operation"
		end
	end
end

return Action