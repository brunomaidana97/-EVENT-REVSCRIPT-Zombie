local zombieLogout = CreatureEvent("zombieLogout")
function zombieLogout.onLogout(player)
	local isInEvent = Zombie:findPlayer(player)
	if isInEvent then
		Zombie:onLeave(player:getId(), false)
	end
	return true
end
zombieLogout:register()

local zombieDeath = CreatureEvent("zombieDeath")
function zombieDeath.onPrepareDeath(player, killer)
	local isInEvent = Zombie:findPlayer(player)
	if isInEvent then
		Zombie:onLeave(player:getId(), false)
	end
	return false
end
zombieDeath:register()