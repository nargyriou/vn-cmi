Condition = Object:extend()

function Condition:new(a, op, b)
	self.a = a
	self.b = b
	self.op = op
end

function Condition:check()
	if self.op == "<" then
		return self.a < self.b
	elseif self.op == "<=" then
		return self.a <= self.b
	elseif self.op == "==" then
		return self.a == self.b
	elseif self.op == ">=" then
		return self.a >= self.b
	elseif self.op == ">" then
		return self.a > self.b
	elseif self.op == "~=" then
		return self.a ~= self.b
	end
end

return Condition
