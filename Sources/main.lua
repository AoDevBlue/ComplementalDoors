
local Game = require 'Game'

-- Constants

fontNormal = love.graphics.newFont("assets/East-Coast-Stationery.ttf", 32)
fontBig = love.graphics.newFont("assets/East-Coast-Stationery.ttf", 64)
fontTiny = love.graphics.newFont("assets/East-Coast-Stationery.ttf", 16)
love.graphics.setFont(fontNormal)

lighterGrey = {220,220,220,255}
lightGrey = {190,190,190,255}
mediumGrey = {120,120,120,255}
darkGrey = {65,65,65,255}
darkerGrey = {30,30,30,255}
white = {255,255,255,255}
black = {0,0,0,255}

LevelBase = require 'LevelBase'

-- Sounds
squeak = love.audio.newSource("assets/squeak.wav", "static")
squeak:setVolume(0.6)
orbTaken = love.audio.newSource("assets/orbTaken.ogg", "static")
squeak:setVolume(0.6)

-- Music
musicPiano = love.audio.newSource("assets/Curtains-piano-garvois.wav")
musicPiano:setLooping(true)

mute = false
keyboardInput = {}
inDialog = true
dialogIndex = {1,1}
dialogs = {{"Where... Where am I?","Did I just die?","Who's talking to me?","Seven life orbs?","I am... a ghost?"},{"I did it.","I feel... alive","I feel ... alive\nAm I?","Created by Aomeas for LD31","Thanks for playing!"}}
dialogTime = {{4,3,4,4,3},{3,3,2,4,2}}
dialogTimer = 0


function love.load()
	love.window.setMode(800, 600)
	love.window.setTitle("Complemental Doors")
	love.graphics.setBackgroundColor(black)

	math.randomseed(os.time())

	game = Game.new()
end

function love.update(dt)
	if not inDialog then
		game:update(dt)
		if game.nbOrbs == 7 then
			inDialog = true
		end
	else
		dialogTimer = dialogTimer + dt
		if dialogTimer > dialogTime[dialogIndex[1]][dialogIndex[2]] then
			dialogTimer = 0
			if dialogIndex[2] ~= #dialogs[dialogIndex[1]] then
				dialogIndex[2] = dialogIndex[2] + 1
			else
				if dialogIndex[1] == 1 then
					dialogIndex[1] = 2
					dialogIndex[2] = 1
					inDialog = false
				end
			end
		end
	end
end

function love.draw()
	
	if inDialog then
		love.graphics.setColor(darkerGrey)
		love.graphics.rectangle("fill",0,0,800,600)
		love.graphics.setFont(fontNormal)
		love.graphics.setColor(white)
		love.graphics.printf(dialogs[dialogIndex[1]][dialogIndex[2]],200, 280, 400,"center")
		love.graphics.setFont(fontNormal)
	else
		game:draw()
	end
end

function love.keypressed( key, isrepeat )
	keyboardInput[key] = true
	if key == "m" then
		if mute then
			mute = false
			if game.nbOrbs >= 1 then
				musicPiano:play()
			end
		else
			mute = true
			if game.nbOrbs >= 1 then
				musicPiano:stop()
			end
		end
	end
end

function love.keyreleased( key )
	keyboardInput[key] = false
end

function collision(x1,y1,w1,h1,x2,y2,w2,h2)
    if x2 >= x1 + w1 or x2 + w2 <= x1 or y2 >= y1 + h1 or y2 + h2 <= y1 then
        return false
    else
        return true
    end
end
--[[
function love.mousepressed(x, y, button)
	print(x,y)
end
]]--