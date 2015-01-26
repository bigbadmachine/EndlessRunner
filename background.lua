-- Creating Background
backbackground = display.newImage("images/background.png")
backbackground.x = screenXcenter
backbackground.y = screenYcenter-groundOffset

backgroundfar1 = display.newImage("images/bgfar1.png")
backgroundfar1.x = screenXcenter
backgroundfar1.y = screenYcenter-groundOffset

backgroundfar2 = display.newImage("images/bgfar1.png")
backgroundfar2.x = screenXwidth*1.5
backgroundfar2.y = screenYcenter-groundOffset

backgroundnear1 = display.newImage("images/bgnear2.png")
backgroundnear1.x = screenXcenter
backgroundnear1.y = screenYcenter-groundOffset

backgroundnear2 = display.newImage("images/bgnear2.png")
backgroundnear2.x = screenXwidth*1.5
backgroundnear2.y = screenYcenter-groundOffset

function updateBackgrounds()
	--far background movement
	backgroundfar1.x = backgroundfar1.x - (speed/55)
	if(backgroundfar1.x < -(screenXwidth-1)) then
		backgroundfar1.x = screenXwidth*2-1
	end

	backgroundfar2.x = backgroundfar2.x - (speed/55)
	if(backgroundfar2.x < -(screenXwidth-1)) then
		backgroundfar2.x = screenXwidth*2-1
	end
	 
	--near background movement
	backgroundnear1.x = backgroundnear1.x - (speed/5)
	if(backgroundnear1.x < -(screenXcenter-1)) then
		backgroundnear1.x = screenXwidth*1.5
	end
	 
	backgroundnear2.x = backgroundnear2.x - (speed/5)
	if(backgroundnear2.x < -(screenXcenter-1)) then
		backgroundnear2.x = screenXwidth*1.5
	end
end

function resetBackgrounds()
	backbackground.x = screenXcenter
	backbackground.y = screenYcenter-groundOffset

	backgroundfar1.x = screenXcenter
	backgroundfar1.y = screenYcenter-groundOffset

	backgroundfar2.x = screenXwidth*1.5
	backgroundfar2.y = screenYcenter-groundOffset

	backgroundnear1.x = screenXcenter
	backgroundnear1.y = screenYcenter-groundOffset

	backgroundnear2.x = screenXwidth*1.5
	backgroundnear2.y = screenYcenter-groundOffset
end
