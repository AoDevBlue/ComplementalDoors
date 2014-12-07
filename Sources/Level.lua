local Level = {
	image = love.graphics.newImage("assets/tileset0.png"),
	matrix = nil,
	index = nil,
	tilesize = 40,
	lastDoorPosition = {2,2}, -- i,j dans la matrice
	lastDoorSide = -1,
	isInDoor = false,
	levelChanged = false,
}
Level.__index = Level

function Level.new(player)
	local self = setmetatable({}, Level)
	self.matrix = LevelBase[1][1]
	self.visibleMatrix = LevelBase[1][2]
	self:updateVisibleMatrix(player.x,player.y,player.w,player.h)
	self.index = 1

	-- QUADS! QUADS EVERYWHERE!
	self.top_left = love.graphics.newQuad(0, 0, 40, 40, self.image:getDimensions())
	self.top_middle = love.graphics.newQuad(40, 0, 40, 40, self.image:getDimensions())
	self.top_right = love.graphics.newQuad(80, 0, 40, 40, self.image:getDimensions())
	self.middle_left = love.graphics.newQuad(0, 40, 40, 40, self.image:getDimensions())
	self.middle_middle = love.graphics.newQuad(40, 40, 40, 40, self.image:getDimensions())
	self.middle_right = love.graphics.newQuad(80, 40, 40, 40, self.image:getDimensions())
	self.bottom_left = love.graphics.newQuad(0, 80, 40, 40, self.image:getDimensions())
	self.bottom_middle = love.graphics.newQuad(40, 80, 40, 40, self.image:getDimensions())
	self.bottom_right = love.graphics.newQuad(80, 80, 40, 40, self.image:getDimensions())
	self.closed = love.graphics.newQuad(0, 120, 40, 40, self.image:getDimensions())
	self.horizontal_tube = love.graphics.newQuad(40, 160, 40, 40, self.image:getDimensions())
	self.vertical_tube = love.graphics.newQuad(0, 160, 40, 40, self.image:getDimensions())
	self.open_right = love.graphics.newQuad(0, 200, 40, 40, self.image:getDimensions())
	self.open_left = love.graphics.newQuad(40, 120, 40, 40, self.image:getDimensions())
	self.open_bottom = love.graphics.newQuad(80, 120, 40, 40, self.image:getDimensions())
	self.open_top = love.graphics.newQuad(80, 160, 40, 40, self.image:getDimensions())
	self.backwall = love.graphics.newQuad(120, 0, 40, 40, self.image:getDimensions())
	self.library_closed = love.graphics.newQuad(160, 0, 40, 40, self.image:getDimensions())
	self.library_left = love.graphics.newQuad(120, 40, 40, 40, self.image:getDimensions())
	self.library_middle = love.graphics.newQuad(160, 40, 40, 40, self.image:getDimensions())
	self.library_right = love.graphics.newQuad(200, 40, 40, 40, self.image:getDimensions())
	self.positive_door_top = love.graphics.newQuad(120, 80, 40, 40, self.image:getDimensions())
	self.negative_door_top = love.graphics.newQuad(160, 80, 40, 40, self.image:getDimensions())
	self.door_bottom = love.graphics.newQuad(200, 80, 40, 40, self.image:getDimensions())

	return self
end

function Level:load(index, player)
	self.matrix = LevelBase[index][1]
	self.visibleMatrix = LevelBase[index][2]
	self:updateVisibleMatrix(player.x,player.y,player.w,player.h)
	self.index = index
end

function Level:update(dt, player)
	local currentDoor = self:getCurrentDoor(player.x, player.y, player.w, player.h)
	if currentDoor then
		if not self.isInDoor then
			self.lastDoorPosition = currentDoor
			self.isInDoor = true
			self:updateVisibleMatrix(player.x,player.y,player.w,player.h)
			if player.x+player.w/2 < (self.lastDoorPosition[2]-1)*self.tilesize+self.tilesize/2 then
				self.lastDoorSide = -1
			else
				self.lastDoorSide = 1
			end
	 	else
			if player.x+player.w/2 < (self.lastDoorPosition[2]-1)*self.tilesize+self.tilesize/2 then
				if self.lastDoorSide ~= -1 then
					if self.matrix[self.lastDoorPosition[1]][self.lastDoorPosition[2]] == 8 then
						self:load(self.index-1, player)
						self.levelChanged = true
					else
						self:load(self.index+1, player)
						self.levelChanged = true
					end
					self.lastDoorSide = -1
				end
				self:updateVisibleMatrix(player.x,player.y,player.w,player.h)
			else
				if self.lastDoorSide ~= 1 then
					if self.matrix[self.lastDoorPosition[1]][self.lastDoorPosition[2]] == 8 then
						self:load(self.index-1, player)
						self.levelChanged = true
					else
						self:load(self.index+1, player)
						self.levelChanged = true
					end
					self.lastDoorSide = 1
				end
				self:updateVisibleMatrix(player.x,player.y,player.w,player.h)
			end
		end
	else
		self.isInDoor = false
	end
end

function Level:isFree(x,y,w,h)
	for i=1,#self.matrix do
    	for j=1,#self.matrix[i] do
    		if self.matrix[i][j] == 1 then
    			if collision(x,y,w,h,self.tilesize*(j-1),self.tilesize*(i-1),self.tilesize,self.tilesize) then
					return false
				end
			end
		end
	end
	return true
end

function Level:isFreeForEnnemies(x,y,w,h)
	for i=1,#self.matrix do
    	for j=1,#self.matrix[i] do
    		if self.matrix[i][j] == 1 or self.matrix[i][j] == 8 or self.matrix[i][j] == 9 then
    			if collision(x,y,w,h,self.tilesize*(j-1),self.tilesize*(i-1),self.tilesize,self.tilesize) then
					return false
				end
			end
		end
	end
	return true
end

function Level:getCurrentDoor(x,y,w,h)
	if self.matrix[math.floor(y/self.tilesize + 1)][math.floor(x/self.tilesize + 1)] == 8 or self.matrix[math.floor(y/self.tilesize + 1)][math.floor(x/self.tilesize + 1)] == 9 then
		return {math.floor(y/self.tilesize + 1),math.floor(x/self.tilesize + 1)}
	end
	if self.matrix[math.floor(y/self.tilesize + 1)][math.floor((x+w)/self.tilesize + 1)] == 8 or self.matrix[math.floor(y/self.tilesize + 1)][math.floor((x+w)/self.tilesize + 1)] == 9 then
		return {math.floor(y/self.tilesize + 1),math.floor((x+w)/self.tilesize + 1)}
	end
	return false
end

function Level:updateVisibleMatrix(player_x, player_y, player_w, player_h)
	
	for i=1,#self.matrix do
    	for j=1,#self.matrix[i] do
    		self.visibleMatrix[i][j] = 1
		end
	end

	-- Was removing too much info from the game
	--[[ 
	player_i = math.floor(player_y/self.tilesize + 1)
	player_j = math.floor(player_x/self.tilesize + 1)

    local posQueue = {}
	
	local currentDoor = self:getCurrentDoor(player_x,player_y,player_w,player_h)
	if not currentDoor then
		self.visibleMatrix[player_i][player_j] = 1
		table.insert(posQueue,{player_i,player_j})
	else
		self.visibleMatrix[currentDoor[1] ][currentDoor[2] ] = 1
		self.visibleMatrix[currentDoor[1]+1][currentDoor[2] ] = 1
	end
	while #posQueue ~= 0 do
		pos = table.remove(posQueue)

		for key,dxy in pairs({{-1,0}, {1,0}, {0,-1}, {0,1}}) do
			if pos[1]+dxy[1] > 0 and pos[1]+dxy[1] < #self.matrix and pos[2]+dxy[2] > 0 and pos[2]+dxy[2] < #self.matrix[1] then
				if self.visibleMatrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] == 0 then
					if self.matrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] == 8 or self.matrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] == 9 then
						self.visibleMatrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] = 1
					elseif self.matrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] ~=1 then
						self.visibleMatrix[pos[1]+dxy[1] ][pos[2]+dxy[2] ] = 1
						table.insert(posQueue,{pos[1]+dxy[1],pos[2]+dxy[2]})
					end
				end
			end
		end
	end
	]]--
end

function Level:getCell(i, j)
	if i == 0 or j == 0 or i > #self.matrix or j > #self.matrix[1] then
		return 1
	elseif self.visibleMatrix[i][j] == 0 then
		return 1
	else
		return self.matrix[i][j]
	end
end

function Level:getQuad(i,j)
	if self:getCell(i-1,j) == 1 then
		if self:getCell(i+1,j) == 1 then
			if self:getCell(i,j-1) == 1 then
				if self:getCell(i,j+1) == 1 then
					return self.middle_middle
				else
					return self.middle_right
				end
			else
				if self:getCell(i,j+1) == 1 then
					return self.middle_left
				else
					return self.vertical_tube
				end
			end
		else
			if self:getCell(i,j-1) == 1 then
				if self:getCell(i,j+1) == 1 then
					return self.bottom_middle
				else
					return self.bottom_right
				end
			else
				if self:getCell(i,j+1) == 1 then
					return self.bottom_left
				else
					return self.open_top
				end
			end
		end
	else
		if self:getCell(i+1,j) == 1 then
			if self:getCell(i,j-1) == 1 then
				if self:getCell(i,j+1) == 1 then
					return self.top_middle
				else
					return self.top_right
				end
			else
				if self:getCell(i,j+1) == 1 then
					return self.top_left
				else
					return self.open_bottom
				end
			end
		else
			if self:getCell(i,j-1) == 1 then
				if self:getCell(i,j+1) == 1 then
					return self.horizontal_tube
				else
					return self.open_left
				end
			else
				if self:getCell(i,j+1) == 1 then
					return self.open_right
				else
					return self.closed
				end
			end
		end
	end
	print("isWut")
	return self.closed
end

function Level:drawBack()
	love.graphics.setColor(white)
	for i=1,#self.matrix do
    	for j=1,#self.matrix[i] do
    		if self.matrix[i][j] == 1 or self.visibleMatrix[i][j] == 0 then
    			love.graphics.draw(self.image, self:getQuad(i, j), self.tilesize*(j-1), self.tilesize*(i-1))
    		elseif self.matrix[i][j] == 0 then
    			love.graphics.draw(self.image, self.backwall, self.tilesize*(j-1), self.tilesize*(i-1))
    		elseif self.matrix[i][j] == 2 then
    			if self.matrix[i][j-1] == 2 then
    				if self.matrix[i][j+1] == 2 then
    					love.graphics.draw(self.image, self.library_middle, self.tilesize*(j-1), self.tilesize*(i-1))
    				else
    					love.graphics.draw(self.image, self.library_right, self.tilesize*(j-1), self.tilesize*(i-1))
    				end
    			else
    				if self.matrix[i][j+1] == 2 then
    					love.graphics.draw(self.image, self.library_left, self.tilesize*(j-1), self.tilesize*(i-1))
    				else
    					love.graphics.draw(self.image, self.library_closed, self.tilesize*(j-1), self.tilesize*(i-1))
    				end
    			end
    		elseif self.matrix[i][j] == 8 then
    			if self.matrix[i-1][j] == 8 then
    				love.graphics.draw(self.image, self.door_bottom, self.tilesize*(j-1), self.tilesize*(i-1))
    			else
    				love.graphics.draw(self.image, self.negative_door_top, self.tilesize*(j-1), self.tilesize*(i-1))
    			end
    		elseif self.matrix[i][j] == 9 then
    			if self.matrix[i-1][j] == 9 then
    				love.graphics.draw(self.image, self.door_bottom, self.tilesize*(j-1), self.tilesize*(i-1))
    			else
    				love.graphics.draw(self.image, self.positive_door_top, self.tilesize*(j-1), self.tilesize*(i-1))
    			end
    		end
    	end
    end
    love.graphics.setColor(white)
    love.graphics.printf("Layer " .. self.index,200, -2, 400,"center")
end

function Level:drawFront()
	love.graphics.setColor(white)
	for i=1,#self.matrix do
    	for j=1,#self.matrix[i] do
    		--[[
    		if self.matrix[i][j] == 4 then
    			love.graphics.draw(self.image, self:getQuad(i, j), self.tilesize*(j-1), self.tilesize*(i-1))
    		end
    		]]--
    	end
    end
end

function Level:loadTileset(index)
	self.image = love.graphics.newImage("assets/tileset" .. index .. ".png")
end

return Level