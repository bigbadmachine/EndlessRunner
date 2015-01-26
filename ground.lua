-- Creating Ground
groundHeight = 75
groundOffset = 100-groundHeight
groundMin = screenYheight+groundHeight
groundMax = groundMin-10
groundLevel = groundMin
blockXoffset = 79 -- 1 pixel less than background image width

for a = 1, 8, 1 do
	isDone = false
	 
	numGen = math.random(2)
	local newBlock
	if(numGen == 1 and isDone == false) then
		newBlock = display.newImage("images/ground1.png")
		isDone = true
	end
	 
	if(numGen == 2 and isDone == false) then
		newBlock = display.newImage("images/ground2.png")
		isDone = true
	end
	 
	newBlock.name = ("block" .. a)
	newBlock.id = a
	 
	newBlock.x = ((a-1) * blockXoffset)
	newBlock.y = groundLevel
	blocks:insert(newBlock)
end

function updateBlocks()
	for a = 1, blocks.numChildren, 1 do
	  if(a > 1) then
      newX = (blocks[a - 1]).x + blockXoffset
	  else
			newX = (blocks[8]).x + blockXoffset - speed
	  end
	  if((blocks[a]).x < -40) then
	    (blocks[a]).x, (blocks[a]).y = newX, groundLevel
	    updateScore()
	  else
	    (blocks[a]):translate(speed * -1, 0)
	  end
	 	checkEvent()
   end
end

function resetGround()
	--reset the groundLevel
	groundLevel = groundMin
	for a = 1, blocks.numChildren, 1 do
    blocks[a].x = ((a-1) * blockXoffset)
    blocks[a].y = groundLevel
	end
end