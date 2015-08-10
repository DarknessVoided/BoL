_G.NABVersion = 1
_G.NABInit 	  = true
_G.NABLoaded  = false
_G.NABDrawOn  = true
_G.NABFixAuth = false

function OnLoad()
	if Update() then
		DelayAction(Load, math.pi()/3)
	else
		Load()
	end
end

function Update()
	local ServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Nebelwolfi's Auto Bot.version?no-cache="..math.random(1, 25000))
	if ServerData then
	  local ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
	  if ServerVersion then
	    if tonumber(NABVersion) < ServerVersion then
	      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Nebelwolfi's Auto Bot.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH.."Nebelwolfi's Auto Bot.lua", function() end)
	      Msg("Updated. (v"..NABVersion.." -> v"..ServerVersion..")") 
	      return true
	    end
	  else
		Msg("Error downloading version info")
	  end
	else
	  Msg("Error downloading version info")
	end
	return false
end

function Load()
	if authAttempt then authAttempt = authAttempt + 1 else authAttempt = 1 end
	local auth = Auth()
	if auth == -1 then
	    Msg("Welcome back "..GetUser()..". Authed")
	elseif auth > 0 then
	    Msg("Welcome back "..GetUser()..". Trial mode active! Remaining time: "..auth.." hours")
	elseif auth == 0 then
	    Msg("Welcome User: "..GetUser()..". Starting Trial")
	elseif auth == -2 then
	    Msg("User: "..GetUser().." found. Trial over")
	elseif auth == -3 then
	    Msg("Betauser: "..GetUser().." found. Authed")
	elseif auth == -4 and authAttempt < 9 then
	  	Msg("Auth failed, retrying. Attempt "..authAttempt.."/8")
		DelayAction(Load, math.pi()/3)
	elseif auth == -4 then
	  	Msg("Auth failed. Please try again later..")
	else
	  	Msg("Auth failed. Unknown error occured..")
	end
end

function Auth()
	local authdata = GetWebResult("nebelwolfi.tk", "/auth.php?name="..GetUser():lower().."&time="..(os.time()+86400))
	if authdata and authAttempt < 9 then
	  if type(tonumber(authdata)) == "number" and tonumber(authdata) == -1 then
	    return -1
	  elseif type(tonumber(authdata)) == "number" and tonumber(authdata) > 0 then
	    return (math.ceil((tonumber(authdata)-os.time())/36)/100)
	  elseif type(tonumber(authdata)) == "number" and tonumber(authdata) == 0 then
	    return 0
	  elseif type(tonumber(authdata)) == "number" and tonumber(authdata) == -2 then
	    return -2
	  elseif type(tonumber(authdata)) == "number" and tonumber(authdata) == -3 then
	    return -3
	  end
	else
		return -4
	end
end

function Msg(msg) 
	print("<font color=\"#6699ff\"><b>[Nebelwolfi's Auto Bot]:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
	if msg:lower():find("welcome") and Auth() > -2 then
		AfterLoad()
	end
end

function AfterLoad()
	Msg("Loaded")
	NABLoaded = true
	SetupVars()
	SetupItemList()
	SetupDangerZones()
	if NABDrawOn then
		AddDrawCallback(function() Draw() end)
	end
	AddTickCallback(function() Tick() end)
end

function SetupVars()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 2000, DAMAGE_MAGIC, false, true)
    sReady = {[_Q] = false, [_W] = false, [_E] = false, [_R] = false}
    AddTickCallback(function()for _=0,5 do;sReady[_]=(myHero:CanUseSpell(_)==READY)end;end)
end

function SetupItemList()
end

function SetupDangerZones()
	DangerZonesTable = {}
	DangerColors = {
		[0] = ARGB(255, 255, 255, 255),
		[1] = ARGB(255, 255, 255/2, 0),
		[2] = ARGB(255, 255, 255/3, 0),
		[3] = ARGB(255, 255, 255/4, 0),
		[4] = ARGB(255, 255, 255/5, 0),
		[5] = ARGB(255, 255, 255, 0),
		[6] = ARGB(255, 255, 255/6, 255/6),
		[7] = ARGB(255, 255, 255/7, 255/7),
		[8] = ARGB(255, 255, 255/8, 255/8),
		[9] = ARGB(255, 255, 255/9, 255/9),
		[10] = ARGB(255, 255, 0, 0),
	}
end

function GetDangerZones()
	return DangerZonesTable
end

function Draw()
	DrawDangerZone()
	DrawItemList()
	DrawNextAction()
end

function DrawDangerZone()
end

function DrawItemList()
end

function DrawNextAction()
end

function Tick()
	Calcs()
	Behaviour()
end

function Calcs()
	DetermineDangerZones()
	DetermineNextAction()
end

function DetermineDangerZones()
	DangerZonesTable = {}
end

function DetermineNextAction()
	for _, zone in pairs(GetDangerZones()) do
		for l=2, 5 do
			if zone:Contains(myHero, l) and zone.dangerous > 3 and GetDistance(Vector(zone)) > 0 then
			    local movePos = myHero - (Vector(zone) - myHero):normalized() * 250
			    nextMove = movePos
			end
		end
	end
	if EnemiesAround(myHero, 1000) == 1 then
		STATE_ATTACK = true
	end
	if myHero.mana/myHero.maxMana > 0.3 then
		STATE_SKILLS = true
	end
end

function Behaviour()
	CheckAndBuyItems()
	ExecuteNextAction()
end

function CheckAndBuyItems()
end

function ExecuteNextAction()
	if not STATE_ATTACK and nextMove then
		myHero:MoveTo(nextMove.x, nextMove.z)
		nextMove = nil
	end
	targetSel:update()
	local t = targetSel.target
	if STATE_ATTACK then
		if ValidTarget(t) then
			if STATE_SKILLS and sReady[_Q] then
				Combo(t)
			else
				Attack(t)
			end
		end
	end
	if STATE_MOVE_TARGET then
		if not t then return end
	    local movePos = myHero + (Vector(t) - myHero):normalized() * 250
	    nextMove = movePos
	    STATE_MOVE_TARGET = nil
	end
end

function Combo(unit)
	if sReady[_Q] then
		CastSpell(_Q, unit.x, unit.z)
		DelayAction(function() STATE_SKILLS = false end, 0.25)
	end
end

function Attack(unit)
	if GetDistance(unit) < myHero.range+GetDistance(myHero.minBBox) then
		myHero:Attack(unit)
		DelayAction(function() STATE_ATTACK = false STATE_MOVE_TARGET = true end, 1/myHero.attackSpeed + 0.25)
	end
end

function EnemiesAround(Unit, range)
	local c=0
	if Unit == nil then return 0 end
	for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end


function PredictPos(target,delay,speed)
	if not target then return end
	delay = delay or 0
	speed = speed or target.ms
	dir = GetTargetDirection(target)
	if dir and target.isMoving then
		return Vector(target)+Vector(dir.x, dir.y, dir.z):normalized()*speed/8+Vector(dir.x, dir.y, dir.z):normalized()*target.ms*delay, GetDistance(target.minBBox, target.pos)
	elseif not target.isMoving then
		return Vector(target), GetDistance(target.minBBox, target.pos)
	end
end

function GetTargetDirection(target)
	local wp = GetWayPoints(target)
	if #wp == 1 then
	  return Vector(target.x, target.y, target.z)
	elseif #wp >= 2 then
	  return Vector(wp[2].x-target.x, wp[2].y-target.y, wp[2].z-target.z)
	end
end

function GetWayPoints(target)
	local result = {}
	if target.hasMovePath then
	  table.insert(result, Vector(target))
	  for i = target.pathIndex, target.pathCount do
	    path = target:GetPath(i)
	    table.insert(result, Vector(path))
	  end
	else
	  table.insert(result, Vector(target))
	end
	return result
end