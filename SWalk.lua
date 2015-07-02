function OnLoad()
	orbTable = { lastAA = 0, windUp = 3.75, animation = 0.625 }
	myRange = myHero.range+myHero.boundingRadius*2
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, myHero.range+myHero.boundingRadius*2, DAMAGE_PHISYCAL)
	Config = scriptConfig("SWalk", "SW")
	Config:addSubMenu("Key Settings", "kConfig")
	Config:addSubMenu("Misc Settings", "mConfig")
	Config.kConfig:addParam("combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	Config.kConfig:addParam("harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
	Config.kConfig:addParam("lh", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
	Config.kConfig:addParam("lc", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
	Config:addSubMenu("Target Selector", "ts")
	Config.ts:addTS(ts)
	Config.mConfig:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -10, 10, 0)
	SWalkMsg("Loaded") 
end

function SWalkMsg(msg) 
	print("<font color=\"#6699ff\"><b>[SWalk]: "..myHero.charName.." - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end

function OnTick()
	ts:update()
	myRange = myHero.range+myHero.boundingRadius*2
	if Config.kConfig.lh then
		Target = GetLowestMinion(myRange)
		if Target and Target.health > myHero:CalcDamage(Target,myHero.totalDamage) then
			Target = nil
		end
	end
	if Config.kConfig.lc then
		Target = GetLowestMinion(myRange)
		if not Target then
			Target = GetJMinion(myRange)
		end
	end
	if Config.kConfig.harrass or Config.kConfig.combo then
		Target = ts.target
	end
	if DoOrb() then
		Orb(Target) 
	end
end

function OnDraw()
	DrawCircle3D(myHero.x, myHero.y, myHero.z, myRange, 1, ARGB(105,0,255,0), 32)
end
	
function Orb(unit)
	if not ValidTarget(unit, myRange) then
		unit = ts.target
	end
	
	if os.clock() > orbTable.lastAA + orbTable.animation and ValidTarget(unit, myRange) then
		myHero:Attack(unit)
	elseif GetDistance(mousePos) > myHero.boundingRadius and os.clock() > orbTable.lastAA + orbTable.windUp + Config.mConfig.cadj/1000 then
		local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
		if DoOrb() and GetDistance(mousePos) > 125 then
			myHero:MoveTo(movePos.x, movePos.z)
		end
	end
end

function DoOrb()
	return Config.kConfig.combo or Config.kConfig.harrass or Config.kConfig.lc or Config.kConfig.lh
end

function OnProcessSpell(unit, spell)
	if unit and unit.isMe and spell then
		if spell.name:lower():find("attack") then
			orbTable.windUp = spell.windUpTime
			orbTable.animation = spell.animationTime
			orbTable.lastAA = os.clock()
		end
	end
end

function GetLowestMinion(range)
	local minionTarget = nil
	for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if minionTarget == nil then 
			minionTarget = minion
		elseif minionTarget.health >= minion.health and ValidTarget(minion, range) then
			minionTarget = minion
		end
	end
	return minionTarget
 end
 
 function GetJMinion(range)
	local minionTarget = nil
	for i, minion in pairs(minionManager(MINION_JUNGLE, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
		if minionTarget == nil then 
			minionTarget = minion
		elseif minionTarget.maxHealth < minion.maxHealth and ValidTarget(minion, range) then
			minionTarget = minion
		end
	end
	return minionTarget
end