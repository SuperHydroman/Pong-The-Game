require("player")
require("ball")
require("AI")
require("background")

function love.load()	
	Player:load()
	Ball:load()
	AI:load()
	Background:load()

	Score = 
	{
		player = 0,
		ai = 0
	}

	font = love.graphics.newFont(30)
	fps = love.graphics.newFont(17)
end

function love.update(dt)
	Player:update(dt)
	Ball:update(dt)
	AI:update(dt)
	Background:update(dt)
end

function drawScore()
	love.graphics.setFont(font)
	love.graphics.print("Player: "..Score.player, 50, 50)
	love.graphics.print("Bot: "..Score.ai, 1000, 50)
end


function drawFPS()
	love.graphics.setFont(fps)
	love.graphics.print("FPS: "..love.timer.getFPS(), 10	, 10)
end

function love.draw()
	Background:draw()
	Player:draw()
	Ball:draw()
	AI:draw()
	drawScore()
	drawFPS()
end

function checkCollision(a, b)
	if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
		return true
	else
		return false
	end
end