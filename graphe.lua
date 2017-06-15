local Object = require "classic"
local Condition = require "condition"
local Context = require "context"
local Dialog = require "dialog"
local Action = require "actions"
local gamevar = require "game_variables"

local Noeud = Object:extend()

local function getDialogTexts(children)
	local t = {}
	for i,v in pairs(children) do
		table.insert(t, children.title or NULL)
	end
end

function Noeud:new(text, background)
	self.text = text
	self.children = {}
	self.parent = nil
	self.dialog = Dialog()
	self.condition = Condition()
	self.action = nil

	if type(background) == "string" then
		self:addContext(background)
	end
	
	return self
end

function Noeud:addCondition(a, op, b)
	self.condition:set(a, op, b)
	
	return self
end

function Noeud:addAction(name, a, op, b)
	if a == nil then
		self.action = name
	else
		self.action = Action(name, a, op, b)
	end

	return self
end

function Noeud:isUnlocked()
	return self.condition:check()
end

function Noeud:addContext(context)
	if type(context) == "string" then
		self.context = Context(context)
	else
		self.context = context
	end

	return self
end

function Noeud:addCharacter(character, image)
	if type(character) == "string" then
		self.character = Character(character, image)
	else
		self.character = character
	end

	return self
end

function Noeud:setQuestion(text)
	self.dialog:setQuestion(text)
end

function Noeud:addChild(child, path)
	if type(child) == "string" then
		local text = child
		child = Noeud(text, path)
	end

	child.parent = self

	if not child.context then
		child.context = self.context
	end

	table.insert(self.children, child)
	return child
end

function Noeud:getChildByText(text)
	for i,v in pairs(self.children) do
		if type(v) == "table" and v.text == text then
			return v
		end
	end
	return false
end

function Noeud:getChildById(id)
	return self.children[id]
end

function Noeud:initialize()
	self.dialog:reset()
	for k,v in pairs(self.children) do
		if v:isUnlocked() then
			self.dialog:addChoice(v.text)
		end
	end
end

function Noeud:draw()
	-- Draw background
	self.context:draw()

	-- Draw characters
	if self.character then
		self.character:draw()
	end

	-- Draw dialog box
	self.dialog:draw()

end

function Noeud:addScript(script)
	self.script = script
end


return Noeud
