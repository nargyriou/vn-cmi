Input = require "input"

Keymap = Object:extend()

local gamemodes = {}
local input = Input()

function Keymap:new()
	self.binds = {}
	return self
end

function Keymap:getBinds()
	return self.binds
end

function Keymap:add(key, callback)
	self.binds[key] = callback
end

function Keymap:activate()
	for i,v in pairs(self.binds) do
		input:bind(i, v)
	end
end

function Keymap:deactivate()
	for i,v in pairs(self.binds) do
		input:unbind(i, v)
	end
end

return Keymap