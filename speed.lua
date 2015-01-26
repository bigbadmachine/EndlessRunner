baseSpeed = 5
speed = baseSpeed
lastSpeed = speed

function updateSpeed()
	-- Uncomment to speed up game over time
	speed = speed + .0005
	lastSpeed = speed
end

function resetSpeed()
	speed = baseSpeed
	lastSpeed = baseSpeed
end
