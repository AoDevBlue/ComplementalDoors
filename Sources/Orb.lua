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
		if player.orbs == 1 then
			musicPiano:setVolume(0.2)
			musicPiano:setPitch(0.30)
			orbTaken:setPitch(0.4)
			if not mute then
				musicPiano:play()
			end
		elseif player.orbs == 2 then
			musicPiano:setVolume(0.25)
			musicPiano:setPitch(0.35)
			orbTaken:setPitch(0.5)
		elseif player.orbs == 3 then
			musicPiano:setVolume(0.3)
			musicPiano:setPitch(0.40)
			orbTaken:setPitch(0.6)
		elseif player.orbs == 4 then
			musicPiano:setVolume(0.35)
			musicPiano:setPitch(0.45)
			orbTaken:setPitch(0.7)
		elseif player.orbs == 5 then
			musicPiano:setVolume(0.4)
			musicPiano:setPitch(0.50)
			orbTaken:setPitch(0.8)
		elseif player.orbs == 6 then
			musicPiano:setVolume(0.45)
			musicPiano:setPitch(0.55)
			orbTaken:setPitch(0.9)
		elseif player.orbs == 7 then
			musicPiano:setVolume(0.5)
			musicPiano:setPitch(0.70)
			orbTaken:setPitch(1)
		end
		if not mute then
			orbTaken:play()
		end
	end
end

function Orb:draw()
	love.graphics.setColor(white)
	love.graphics.draw( self.image, self.x, self.y + self.dy )
end

return Orb