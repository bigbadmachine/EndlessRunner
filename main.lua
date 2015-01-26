display.setStatusBar(display.HiddenStatusBar)

-- Game Variables
screenXwidth = display.contentWidth
screenXcenter = screenXwidth/2
screenYheight = display.contentHeight
screenYcenter = screenYheight/2-20

inEvent = 0
eventRun = 0

-- Groups
blocks = display.newGroup()
characters = display.newGroup()
screen = display.newGroup()

require("ground")
require("background")
require("collisions")
require("events")
require("hero")
require("game_over")
require("scoreboard")
require("speed")

screen:insert(backbackground)
screen:insert(backgroundfar1)
screen:insert(backgroundfar2)
screen:insert(backgroundnear1)
screen:insert(backgroundnear2)
screen:insert(blocks)
screen:insert(hero)
screen:insert(collisionRect)
screen:insert(scoreText)
screen:insert(gameOver)


local function update( event )
	if hero.isAlive then
		checkCollisions()
		updateSpeed()
		updateBackgrounds()
		updateBlocks()
		updateCharacter()
	else
		endGame()
	end
end

function touched( event )
	if hero.isAlive then
		if(event.phase == "began") then
			if(onGround) then
				hero.accel = hero.accel + 20
				speed = baseSpeed
			end
		end
	else
		if(event.x < gameOver.x + 150 and event.x > gameOver.x - 150 and event.y < gameOver.y + 95 and event.y > gameOver.y - 95) then
			restartGame()
		end
	end
end


timer.performWithDelay(1, update, -1)
Runtime:addEventListener("touch", touched, -1)

