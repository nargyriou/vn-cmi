local Object = require "classic"
local gamevar = require "game_variables"
local Action = Object:extend()

function Action:new(result, a, op, b)
	self.a = a
	self.b = b
	self.op = op
	self.result = result
end

function Action:execute()
	local a = self.a
	local b = self.b
	
	if type(self.a) == "string" then
		a = gamevar.read(self.a) or 0
	end
	if type(self.b) == "string" then
		b = gamevar.read(self.b) or 0
	end
	
	if 	type(self.op) == "string" 
	and	type(a) == "number" 
	and	type(b) == "number" then
		if self.op == "+" then
			print(tostring(self.result) .. " = " .. tostring(a + b))
			return gamevar.set(self.result, a + b)
		elseif self.op == "-" then
			print(tostring(self.result) .. " = " .. tostring(a - b))
			return gamevar.set(self.result, a - b)
		elseif self.op == "%" then
			print(tostring(self.result) .. " = " .. tostring(a % b))
			return gamevar.set(self.result, a % b)
		elseif self.op == "*" then
			print(tostring(self.result) .. " = " .. tostring(a * b))
			return gamevar.set(self.result, a * b)
		elseif self.op == "/" then
			print(tostring(self.result) .. " = " .. tostring(a / b))
			return gamevar.set(self.result, a / b)
		else
			return nil, "Unknown operation"
		end
	end
end

return Action