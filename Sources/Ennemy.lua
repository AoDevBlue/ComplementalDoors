local Ennemy = {
}
Ennemy.__index = Ennemy

function Ennemy.new( position, direction )
	local self = setmetatable({}, Ennemy)
	self.imageWalking1 = love.graphics.newImage("assets/Rat1.png")
	self.imageWalking2 = love.graphics.newImage("assets/Rat2.png")
  	self.x = position[1]
  	self.y = position[2]
  	self.w = 20
  	self.h = 14
  	self.direction = direction
  	
  	self.gravity = 3000
  	self.vx = 100*direction
  	self.vy = 0
  	self.frame = 0
  	self.frameTime = 0

  	self.squeakTimeMax = math.random(8,20)
  	self.squeakTime = 0

  	self.dead = false
	return self
end

function Ennemy:update(dt, currentLevel, player)
	if not currentLevel:isFreeForEnnemies(self.x + self.vx*dt, self.y, self.w, self.h) or currentLevel:isFreeForEnnemies(self.x + self.direction*self.w , self.y+1, self.w, self.h) then
		self.direction = -self.direction
		self.vx = -self.vx
	end
	self.x = self.x + self.vx*dt

	while not currentLevel:isFree(self.x, self.y + self.vy*dt, self.w, self.h) do
		self.vy = self.vy*0.7
	end
	self.y = self.y + self.vy*dt

	self.vy = self.vy + self.gravity*dt

	if collision(player.x,player.y,player.w,player.h,self.x,self.y,self.w,self.h) then
		if not squeak:isPlaying() and not mute then
			squeak:play()
		end
		player.life = player.life - 1
		player.vx = player.vx + self.direction*2*player.vmax
	end
	self.frameTime = self.frameTime + dt
	self.squeakTime = self.squeakTime + dt
	if self.squeakTime > self.squeakTimeMax then
		self.squeakTime = 0
		self.squeakTimeMax = math.random(8,20)
		if not squeak:isPlaying() and not mute then
			squeak:play()
		end
	end
end

function Ennemy:draw()
	love.graphics.setColor(white)
	if self.frameTime > 0.15 then
		self.frameTime = 0
		self.frame = (self.frame+1) % 2
	end
	if self.frame == 1 then
		love.graphics.draw( self.imageWalking1, self.x + self.w/2, self.y, 0, self.direction, 1, self.imageWalking1:getWidth()*2/3 )
	else
		love.graphics.draw( self.imageWalking2, self.x + self.w/2, self.y, 0, self.direction, 1, self.imageWalking2:getWidth()*2/3 )
	end
end

return Ennemy