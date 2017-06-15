local Object = require "classic"
local Keymap = require "keymapping"

local default = Keymap()
local instanciated = false
local instance = nil
local Player = Object:extend()

function Player:new(level)
	if not instanciated then
		instanciated = true
		instance = self
	else
		return false
	end

	self.levelEntryPoint = level
	self:moveTo(level)
end

function Player:drawStuff()
	self.node:draw()
end

-- Se déplace dans le menu vers le bas
function Player:navigDown()
	self.node.dialog:forward()
end

-- Se déplace dans le menu vers le haut
function Player:navigUp()
	self.node.dialog:backwards()
end

-- Se déplace vers le noeud suivant en accord avec le menu
-- (Utilise moveTo)
function Player:forward()
	local _, text = self.node.dialog:getSelectedItem()
	local nextNode = self.node:getChildByText(text)
	if type(nextNode) == "table" then
		self:moveTo(nextNode)
	else
		print("Error: This dialog led to no valid node (" .. tostring(text) .. ")")
	end
	return self
end

-- Se téléporte vers un nouveau noeud du graphe
function Player:moveTo(node)
	self.node = node
	self.node:initialize()

	if self.node.action then
		self.node.action:execute()
	end
end

-- Called when the player moves onto a new node
function Player:initialize()
	--Setup key mapping
	default:add("down", function() self:navigDown() end)
	default:add("up", function() self:navigUp() end)
	default:add("return", function() self:forward() end)
	default:add("right", function() self:forward() end)

	default:activate()
end

return Player
