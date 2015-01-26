-- Creating Game Over
gameOver = display.newImage("images/gameOver.png")
gameOver.name = "gameOver"
gameOver.x = 0
gameOver.y = 500

function endGame()
	speed = 0

	gameOver.x = screenXcenter
	gameOver.y = screenYcenter
	hero:setSequence("jumping")
	hero:pause()
	-- timer.cancel( event.source )
end

function restartGame()
	--move menu
	gameOver.x = 0
	gameOver.y = screenYheight * 2
	
	resetScore()
	resetSpeed()
	resetHero()
	resetGround()
	resetBackgrounds()

	-- timer.performWithDelay(1, update, -1)
end