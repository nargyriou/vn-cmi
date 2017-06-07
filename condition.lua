local gamevar = require "game_variables"

Condition = Object:extend()

function Condition:new(a, op, b)
	self.a = a
	self.b = b
	self.op = op
end

function Condition:set(a, op, b)
	self.a = a
	self.b = b
	self.op = op
end

function Condition:none()
	self.a = nil
	self.b = nil
	self.op = nil
end

function Condition:check()
	if self.op == nil then
		return true
	elseif self.op == "<" then
		return gamevar.read(self.a) < gamevar.read(self.b)
	elseif self.op == "<=" then
		return gamevar.read(self.a) <= gamevar.read(self.b)
	elseif self.op == "==" then
		return gamevar.read(self.a) == gamevar.read(self.b)
	elseif self.op == ">=" then
		return gamevar.read(self.a) >= gamevar.read(self.b)
	elseif self.op == ">" then
		return gamevar.read(self.a) > gamevar.read(self.b)
	elseif self.op == "~=" then
		return gamevar.read(self.a) ~= gamevar.read(self.b)
	end
end

return Condition
