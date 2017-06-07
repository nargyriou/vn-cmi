colors = require "colors"

Dialog = Object:extend()

local font = love.graphics.newFont("data/fonts/Arimo-Regular.ttf", 22)
local sWidth, sHeight = love.graphics.getDimensions()

local function printf(text, x, y, limit, align)
	width, wrappedtext = font:getWrap(text, limit)
	
	local lineHeight = font:getHeight()*1.1
	local offset = 0

	for k,v in pairs(wrappedtext) do
		local dText = love.graphics.newText(font, v)
		love.graphics.draw(dText, x, y+offset)
		offset = offset + lineHeight
	end
	return offset
end

function Dialog:new(...)
	-- Fonction variadique
	self.choices = {...} -- :) tous les arguments

	self.width = sWidth*0.7
	self.height = 0.3*sHeight
	self.x = 0.15*sWidth
	self.y = sHeight-self.height

	self.tx = self.x+0.01*self.width
	self.ty = self.y+0.01*self.width
	self.tw = self.width*0.98

	self.selection = 1
	return self
end

function Dialog:reset()
	self.choices = {}
	self.selection = 1
end

function Dialog:setQuestion(text)
	self.question = text
end

function Dialog:addChoice(text)
	return table.insert(self.choices, text)
end

function Dialog:setChoice(i, text)
	self.choices[i] = text
end

function Dialog:draw()
	love.graphics.setColor(colors.royalBlue)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(colors.white)

	local offset = 0
	local indent = ""

	if self.question then
		offset = offset + printf(indent .. self.question, self.tx, self.ty+offset, self.tw)
	end

	for k,v in pairs(self.choices) do
		if k == self.selection then
			indent = ">  "
		else
			indent = "    "
		end
		offset = offset + printf(indent .. v, self.tx, self.ty+offset, self.tw)
	end
end

function Dialog:select(n)
	self.selection = n
end
function Dialog:forward()
	self.selection = (self.selection + 1)
	if self.selection > #self.choices then
		self.selection = 1
	end
end
function Dialog:backwards()
	self.selection = (self.selection - 1)
	if self.selection == 0 then
		self.selection = #self.choices
	end
end

function Dialog:getSelectedItem()
	return self.selection, self.choices[self.selection]
end

return Dialog