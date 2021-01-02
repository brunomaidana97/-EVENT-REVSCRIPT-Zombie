local TELEPORT_POSITION = Position(32648, 31905, 7) -- posição onde ira criar o teleport
local TELEPORT_ACTIONID = 4504
local TELEPORT_ITEMID = 38946

local config = {
	semana_mes = "semana",
    days = {1, 2, 3, 4, 5, 6, 7},
}

local function warnEvent(i, minutes)
	Game.broadcastMessage("[Zombie]\nThe event will begin in ".. minutes .. " minutes! The teleport is located at event room.")
	if i > 1 then
		addEvent(warnEvent, 2 * 60 * 1000, i - 1, minutes - 2)
	end
end

local function removeTeleport()
local teleport = Tile(TELEPORT_POSITION):getItemById(TELEPORT_ITEMID)
	if teleport then
		teleport:remove()
	else
		error("Nao havia teleport.")
	end	
end

local function openZombie()
	Zombie:Open()
end

local function closeZombie()
	Zombie:Close()
end

local zombie = GlobalEvent("zombieEvent")
function zombie.onTime(interval)
local time = os.date("*t")
	if (config.semana_mes == "semana" and isInArray(config.days,time.wday)) or (config.semana_mes == "mes" and isInArray(config.days,time.day)) or config.semana_mes == "" then
		Game.broadcastMessage("[Zombie]\nThe event will begin in 10 minutes! The teleport is located at event room.")
		local teleport = Game.createItem(TELEPORT_ITEMID, 1, TELEPORT_POSITION)	
		if teleport then
			teleport:setActionId(TELEPORT_ACTIONID)
		else
			error("Erro ao criar teleport.")
		end 
		addEvent(warnEvent, 2 * 60 * 1000, 4, 8) 
		addEvent(removeTeleport, 10 * 60 * 1000) 
		addEvent(openZombie, 10 * 60 * 1000) 
	end
	return true
end
zombie:time("19:26:00") -- modificar o horario
zombie:register()