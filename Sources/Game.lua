local Game = {
    player = nil,
    level = nil,
    ennemy = {},
    orbs = {},
    index = nil,
    nbOrbs = 0,
    timer = 0,
    flashTime = 0.5,
    generateFlash = false,
    orbImage = love.graphics.newImage("assets/Orb1.png")
}
Game.__index = Game

local Player = require 'Player'
local Level = require 'Level'
local Ennemy = require 'Ennemy'
local Orb = require 'Orb'

function Game.new()
    local self = setmetatable({}, Game)
    self.player = Player.new({45,45},7)
    self.level = Level.new(self.player)
    self.index = self.level.index
    for i=1,#LevelBase[self.level.index][3] do
        table.insert(self.ennemy, Ennemy.new(LevelBase[self.level.index][3][i][1],LevelBase[self.level.index][3][i][2]))
    end
    for i=1,#LevelBase[self.level.index][4] do
        table.insert(self.orbs, Orb.new(LevelBase[self.level.index][4][i][1],LevelBase[self.level.index][4][i][2]))
    end
    return self
end

function Game:update(dt)
    self.player:update(dt, self.level)
    if self.nbOrbs ~= self.player.orbs then
        if self.player.orbs < 7 then
            self.level:loadTileset(self.player.orbs)
        end
        self.nbOrbs = self.player.orbs
        self.generateFlash = true
    end
    self.level:update(dt,self.player)
    if self.level.levelChanged then
        LevelBase[self.index][3] = {}
        for i=1,#self.ennemy do
            table.insert(LevelBase[self.index][3], {{self.ennemy[i].x, self.ennemy[i].y}, self.ennemy[i].direction})
        end
        LevelBase[self.index][4] = {}
        for i=1,#self.orbs do
            table.insert(LevelBase[self.index][4], {{self.orbs[i].x, self.orbs[i].y}, self.orbs[i].id})
        end
        self.index = self.level.index
        self.ennemy = {}
        for i=1,#LevelBase[self.level.index][3] do
            table.insert(self.ennemy, Ennemy.new(LevelBase[self.level.index][3][i][1],LevelBase[self.level.index][3][i][2]))
        end
        self.orbs = {}
        for i=1,#LevelBase[self.level.index][4] do
            table.insert(self.orbs, Orb.new(LevelBase[self.level.index][4][i][1],LevelBase[self.level.index][4][i][2]))
        end
        self.level.levelChanged = false
    end
    for i=1,#self.ennemy do
        self.ennemy[i]:update(dt, self.level, self.player)
    end
    local i = 1
    while i <= #self.orbs do
        self.orbs[i]:update(dt, self.player)
        if self.orbs[i].taken then
            table.remove(self.orbs,i)
            i = i - 1
        end
        i = i + 1
    end
    if self.player.life == 0 then
        if self.level.lastDoorSide == 1 then
            self.player = Player.new({(self.level.lastDoorPosition[2]-1/2)*40,(self.level.lastDoorPosition[1]-1)*40},self.player.orbs)
        else
            self.player = Player.new({(self.level.lastDoorPosition[2]-1)*40,(self.level.lastDoorPosition[1]-1)*40},self.player.orbs)
        end
    end
    if self.generateFlash then
        self.timer = self.timer + dt
        if self.timer > self.flashTime then
            self.generateFlash = false
            self.timer = 0
        end
    end
end

function Game:draw()
    self.level:drawBack()
    self.player:draw()
    self.level:drawFront()
    for i=1,#self.ennemy do
        self.ennemy[i]:draw()
    end
    for i=1,#self.orbs do
        self.orbs[i]:draw()
    end

    
    love.graphics.setColor(white)
    love.graphics.draw(self.orbImage,20,570)
    love.graphics.setFont(fontTiny)
    love.graphics.print(self.nbOrbs .. " / 7",45, 570)
    love.graphics.print("M to Mute",720, 570)
    love.graphics.setFont(fontNormal)
    if self.generateFlash then
        love.graphics.setColor(255,255,255,255*(self.flashTime - self.timer))
        love.graphics.rectangle("fill",0,0,800,600)
    end
end

return Game