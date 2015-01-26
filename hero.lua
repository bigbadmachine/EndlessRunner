-- Creating Animated Character
function killHero()
	hero.isAlive = false
end

function resetHero()
	hero.x = screenXcenter
	hero.y = screenYcenter -- fall from middle of screen to start
	hero.gravity = -6
	hero.accel = 0
	hero.isAlive = true
	hero:setSequence("running")
	hero:play()
	hero.rotation = 0
end

local options =
{
    width = 100,
    height = 100,
    numFrames = 7
}
local imageSheet = graphics.newImageSheet( "images/heroSpriteSheet.png", options )

local sequenceData =
{
    { name="running", frames={ 1, 2, 3, 4, 5, 6 }, time=600 },
    { name="jumping", start=7, count=1, time=300 }
}
hero = display.newSprite( imageSheet, sequenceData )

resetHero()

collisionRect = display.newRect(hero.x + 22, hero.y, 1, 70)
collisionRect.strokeWidth = 1
collisionRect:setFillColor(140, 140, 140)
collisionRect:setStrokeColor(180, 180, 180)
collisionRect.alpha = 0

character = display.newGroup()
character:insert(hero)
character:insert(collisionRect)

characters:insert(character)

function updateCharacter()
	--if our hero is jumping then switch to the jumping animation
	--if not keep playing the running animation
	if(hero.isAlive == true) then
		if(onGround) then
			if(wasOnGround) then

			else
				hero:setSequence("running")
				hero:play()
			end
		else
			hero:setSequence("jumping")
			hero:play()
		end
		
		if(hero.accel > 0) then
			hero.accel = hero.accel - 1
		end
		
		hero.y = hero.y - hero.accel
		hero.y = hero.y - hero.gravity
	end
	collisionRect.y = hero.y

	-- -- if we are running right then keep moving right
  -- if(right) then
  --     hero.x = hero.x + 3
  -- --if we are not moving right keep moving left
  -- else
  --     hero.x = hero.x - 3
  -- end

  -- --if our hero has run off the screen have him turn
  -- --and run in the opposite direction. hero.xScale = -1
  -- --will flip our sprite horizontally
  -- if(hero.x > 380) then
  --     right = false
  --     hero.xScale = -1
  -- end

  -- if(hero.x < -60) then
  --     right = true
  --     hero.xScale = 1
  -- end
end