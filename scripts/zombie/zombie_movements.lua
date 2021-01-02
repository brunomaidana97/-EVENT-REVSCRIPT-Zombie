local zombieMovement = MoveEvent()
function zombieMovement.onStepIn(creature, item, position, fromPosition)
	if not Zombie:onJoin(creature) then
		creature:teleportTo(fromPosition)
		creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
zombieMovement:type("stepin")
zombieMovement:aid(4504)
zombieMovement:register()
