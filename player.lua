Keymap = require "keymapping"

local default = Keymap()
local instanciated = false
local instance = nil
Player = Object:extend()

function Player:new(level)
	if not instanciated then
		instanciated = true
		instance = self
	else
		return false
	end

	self.levelEntryPoint = level
	self.node = level

end

function Player:drawStuff()
	self.node:draw()
end

function Player:navigDown()
	self.node.dialog:forward()
end

function Player:navigUp()
	self.node.dialog:backwards()
end

function Player:forward()
	local _, text = self.node.dialog:getSelectedItem()
	local temp = self.node:getChildByText(text)
	if type(temp) == "table" then
		self.node = temp
	else
		print("Error: This dialog led to no valid path (" .. tostring(text) .. ")")
	end
	return self
end

function Player:initialize()
	--Setup key mapping
	default:add("down", function() self:navigDown() end)
	default:add("up", function() self:navigUp() end)
	default:add("return", function() self:forward() end)

	default:activate()
end

return Player