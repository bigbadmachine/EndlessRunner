function checkCollisions()
  --boolean variable so we know if we were on the ground in the last frame
	wasOnGround = onGround

	--checks to see if the collisionRect has collided with anything. This is why it is lifted off of the ground
	--a little bit, if it hits something we will want our hero to do something... like die! This is why we don't want it
        --hitting the ground, it wouldn't make sense for the hero to die everything he touched the ground. We check this by cycling through
	--all of the ground pieces in the blocks group and comparing their x and y coordinates to that of the collisionRect
	for a = 1, blocks.numChildren, 1 do
		if(collisionRect.y - 10> blocks[a].y - 170 and blocks[a].x - 40 < collisionRect.x and blocks[a].x + 40 > collisionRect.x) then
			speed = 0
			killHero()
		end
	end

	--this is where we check to see if the hero is on the ground or in the air, if he is in the air then he can't jump(sorry no double
	--jumping for our little hero, however if you did want him to be able to double jump like Mario then you would just need
	--to make a small adjustment here, by adding a second variable called something like hasJumped. Set it to false normally, and turn it to
	--true once the double jump has been made. That way he is limited to 2 hops per jump.
	--Again we cycle through the blocks group and compare the x and y values of each.
	for a = 1, blocks.numChildren, 1 do
		if(hero.y >= blocks[a].y - 170 and blocks[a].x < hero.x + 60 and blocks[a].x > hero.x - 60) then
			hero.y = blocks[a].y - 171
			onGround = true
			break
		else
			onGround = false
		end
	end
end