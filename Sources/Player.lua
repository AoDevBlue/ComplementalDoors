local Player = {
}
Player.__index = Player

function Player.new( position, nbOrbs )
	local self = setmetatable({}, Player)
	self.imageStill = love.graphics.newImage("assets/PersoStanding.png")
	self.imageWalking1 = love.graphics.newImage("assets/PersoWalking1.png")
	self.imageWalking2 = love.graphics.newImage("assets/PersoWalking2.png")
	self.imageWalking3 = love.graphics.newImage("assets/PersoWalking3.png")
	self.imageJumping1 = love.graphics.newImage("assets/PersoJumping1.png")
	self.imageJumping2 = love.graphics.newImage("assets/PersoJumping2.png")
	self.imageJumping3 = love.graphics.newImage("assets/PersoJumping3.png")

  	self.x = position[1]
  	self.y = position[2]
  	self.w = 16
  	self.h = 60
  	self.direction = 1
  	
  	self.gravity = 3000
  	self.vmax = 300
  	self.vx = 0
  	self.vy = 0
  	self.jumping = true

  	self.life = 1
  	self.orbs = nbOrbs
  	self.frameTime = 0
  	self.frame = 1
  	self.win = false
	return self
end

function Player:update(dt, currentLevel)
	if keyboardInput["a"] then
		self.vx = -self.vmax
		self.direction = -1
	end
	if keyboardInput["d"] then
		self.vx = self.vmax
		self.direction = 1
	end
	if keyboardInput["w"] or keyboardInput[" "] then
		if not currentLevel:isFree(self.x, self.y + 1, self.w, self.h) then
			self.vy = -2.5*self.vmax
			self.jumping = true
		end
	end

	while not currentLevel:isFree(self.x + self.vx*dt, self.y, self.w, self.h) do
		self.vx = self.vx*0.7
	end

	if math.abs(self.vy) > 100 then
		self.jumping = true
	end

	if not currentLevel:isFree(self.x, self.y + 1, self.w, self.h) and self.vy > 0 then
		self.jumping = false
	end

	self.x = self.x + self.vx*dt

	while not currentLevel:isFree(self.x, self.y + self.vy*dt, self.w, self.h) do
		self.vy = self.vy*0.7
	end
	self.y = self.y + self.vy*dt


	self.vy = self.vy + self.gravity*dt
	self.vx = self.vx * 0.7 * (1-dt)

	if self.y + self.h > 600 then
		self.life = 0
	end

	self.frameTime = self.frameTime + dt
end

function Player:draw()
	love.graphics.setColor(white)
	if self.jumping then
		if self.frameTime > 0.12 then
			self.frameTime = 0
			self.frame = (self.frame+1) % 3
		end
		if self.frame == 1 then
			love.graphics.draw( self.imageJumping1, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageJumping1:getWidth()/2 )
		elseif self.frame == 2 then
			love.graphics.draw( self.imageJumping2, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageJumping2:getWidth()/2 )
		else
			love.graphics.draw( self.imageJumping3, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageJumping3:getWidth()/2 )
		end
	elseif math.abs(self.vx) > 10 then
		if self.frameTime > 0.15 then
			self.frameTime = 0
			self.frame = (self.frame+1) % 4
		end
		if self.frame == 1 then
			love.graphics.draw( self.imageWalking3, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageWalking3:getWidth()/2 )
		elseif self.frame == 2 then
			love.graphics.draw( self.imageWalking2, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageWalking2:getWidth()/2 )
		elseif self.frame == 3 then
			love.graphics.draw( self.imageWalking1, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageWalking1:getWidth()/2 )
		else
			love.graphics.draw( self.imageWalking2, self.x+self.w/2, self.y, 0, self.direction, 1, self.imageWalking2:getWidth()/2 )
		end
	else
		self.frame = 0
		love.graphics.draw( self.imageStill, self.x+ self.w/2, self.y, 0, self.direction, 1, self.imageStill:getWidth()/2 )
	end
end

return Player