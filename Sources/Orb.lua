local Orb = {
}
Orb.__index = Orb

function Orb.new( position, id )
	local self = setmetatable({}, Orb)
	self.image = love.graphics.newImage("assets/Orb" .. id .. ".png")
  	self.x = position[1]
  	self.y = position[2]
  	self.id = id
  	self.dy = 0
  	self.w = 20
  	self.h = 20
  	self.timer = 0

  	self.taken = false
	return self
end

function Orb:update( dt, player )

	self.timer = self.timer + dt
	if self.timer > 4*math.pi then
		self.timer = self.timer - 4*math.pi
	end

	self.dy = 5 * math.sin(math.pi*self.timer)
	
	if collision(player.x,player.y,player.w,player.h,self.x,self.y+self.dy,self.w,self.h) then
		player.orbs = player.orbs + 1
		self.taken = true
		if not mute then
			orbTaken:play()
		end
		if player.orbs == 1 then
			musicPiano:setVolume(0.2)
			musicPiano:setPitch(0.30)
			if not mute then
				musicPiano:play()
			end
		elseif player.orbs == 2 then
			musicPiano:setVolume(0.25)
			musicPiano:setPitch(0.35)
		elseif player.orbs == 3 then
			musicPiano:setVolume(0.3)
			musicPiano:setPitch(0.40)
		elseif player.orbs == 4 then
			musicPiano:setVolume(0.35)
			musicPiano:setPitch(0.45)
		elseif player.orbs == 5 then
			musicPiano:setVolume(0.4)
			musicPiano:setPitch(0.50)
		elseif player.orbs == 6 then
			musicPiano:setVolume(0.45)
			musicPiano:setPitch(0.55)
		elseif player.orbs == 7 then
			musicPiano:setVolume(0.5)
			musicPiano:setPitch(0.60)
		end
	end
end

function Orb:draw()
	love.graphics.setColor(white)
	love.graphics.draw( self.image, self.x, self.y + self.dy )
end

return Orb