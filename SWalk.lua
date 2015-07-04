function OnLoad()
	-- CastSpell(s, myHero:Attack(t)) and CastSpell(s)
		aaResetTable = { ["Rengar"] = {_Q}, ["Riven"] = {_W}, ["Talon"] = {_Q} }
	-- CastSpell(s, x, z)
		aaResetTable2 = { ["Riven"] = {_Q}, ["Yasuo"] = {_Q} }
	-- CastSpell(s, t)
		aaResetTable3 = { ["Teemo"] = {_Q} }
	sReady = {[_Q] = false, [_W] = false, [_E] = false, [_R] = false}
	str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
	orbTable = { lastAA = 0, windUp = 4, animation = 0.5 }
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
	if aaResetTable[myHero.charName] then
		for _,k in pairs(aaResetTable[myHero.charName]) do
			Config.mConfig:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
		end
	end
	if aaResetTable2[myHero.charName] then
		for _,k in pairs(aaResetTable2[myHero.charName]) do
			Config.mConfig:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
		end
	end
	if aaResetTable3[myHero.charName] then
		for _,k in pairs(aaResetTable3[myHero.charName]) do
			Config.mConfig:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
		end
	end
	if aaResetTable[myHero.charName] or aaResetTable2[myHero.charName] or aaResetTable3[myHero.charName] then
		Config.mConfig:addParam("aar", "Reset AA only in combo/harrass", SCRIPT_PARAM_ONOFF, true)
	end
	Config.mConfig:addParam("i", "Use items", SCRIPT_PARAM_ONOFF, true)
	Config.mConfig:addParam("wtt", "Walk to Target (melee)", SCRIPT_PARAM_ONOFF, true)
	if VIP_USER then HookPackets() Config.mConfig:addParam("pc", "Use packet for animation cancel (melee)", SCRIPT_PARAM_ONOFF, true) end
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
	SWalkMsg("Loaded") 
end

function SWalkMsg(msg) 
	print("<font color=\"#6699ff\"><b>[SWalk]: "..myHero.charName.." - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end

function OnTick()
	ts:update()
    for _=0,3 do sReady[_] = myHero:CanUseSpell(_) == READY end
	myRange = myHero.range+myHero.boundingRadius*2
	if Config.kConfig.lh then
		Target, health = GetLowestPMinion(myRange)
		if Target then dmg = myHero:CalcDamage(Target,myHero.totalDamage) end
		if Target and Target.health > dmg then if health > dmg then Target = nil end end
	    if health < 0 then Target = nil end
	end
	if Config.kConfig.lc then
		Target, health = GetLowestPMinion(myRange)
		if Target then dmg = myHero:CalcDamage(Target,myHero.totalDamage) end
		if not Target then Target = GetJMinion(myRange) end
	    if dmg and health ~= Target.health and (health >= dmg or Target.health-health-dmg <= 0) then Target = nil end
	    if health < 0 then Target = nil end
	end
	if Config.kConfig.harrass or Config.kConfig.combo then Target = ts.target end
	if DoOrb() then Orb(Target) end
end

function OnDraw()
	DrawCircle3D(myHero.x, myHero.y, myHero.z, myRange, 1, ARGB(105,0,255,0), 32)
end
	
function Orb(unit)
	if not ValidTarget(unit, myRange) then unit = ts.target end
	if os.clock() > orbTable.lastAA + orbTable.animation and ValidTarget(unit, myRange) then
		myHero:Attack(unit)
	elseif GetDistance(mousePos) > myHero.boundingRadius and os.clock() > orbTable.lastAA + orbTable.windUp + Config.mConfig.cadj/1000 then
		local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
		if DoOrb() and unit and ValidTarget(unit, myRange) and unit.type == myHero.type and Config.mConfig.wtt then
			if GetDistance(unit) > myHero.boundingRadius+unit.boundingRadius then
        		myHero:MoveTo(unit.x, unit.z)
        	end
      	elseif DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
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
			if not Config.mConfig.pc then DelayAction(function() OnWindUp(spell.target) end, 1 / (myHero.attackSpeed * 1 / (spell.windUpTime * myHero.attackSpeed)) - GetLatency() / 2000) end
		end
	end
end

function OnRecvPacket(p)
	if Config.mConfig.pc and p.header == 0xD1 then
	  OnWindUp(ts.target)
	end
end

function OnWindUp(unit)
  	if ValidTarget(unit) then
		if aaResetTable[myHero.charName] then
			for _,k in pairs(aaResetTable[myHero.charName]) do
				if Config.mConfig[str[k]] and sReady[k] then
					orbTable.lastAA = 0
					CastSpell(k)
					return
				end
			end
		end
		if aaResetTable2[myHero.charName] then
			for _,k in pairs(aaResetTable2[myHero.charName]) do
				if Config.mConfig[str[k]] and sReady[k] then
					orbTable.lastAA = 0
					CastSpell(k, unit.x, unit.z)
					return
				end
			end
		end
		if aaResetTable3[myHero.charName] then
			for _,k in pairs(aaResetTable3[myHero.charName]) do
				if Config.mConfig[str[k]] and sReady[k] then
					orbTable.lastAA = 0
					CastSpell(k, unit)
					return
				end
			end
		end
	    if Config.mConfig.i and CastItems(unit) then return end
	end
end

function CastItems(unit)
	local i = {["ItemTiamatCleave"] = myRange, ["YoumusBlade"] = myRange}
	local u = {["ItemSwordOfFeastAndFamine"] = 600}
	for slot = ITEM_1, ITEM_6 do
		if i[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= i[myHero:GetSpellData(slot).name] then
			CastSpell(slot) 
			return true
		end
		if u[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= u[myHero:GetSpellData(slot).name] then
			CastSpell(slot, unit) 
			return true
		end
	end
	return false
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

function GetLowestPMinion(range)
	local minionTarget = nil
	local health = 0
	for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
		local hp = VP:GetPredictedHealth2(minion,  GetDistance(myHero, minion) / VP.projectilespeeds[myHero.charName])
		if minionTarget == nil then 
			minionTarget = minion
			health = hp
		elseif health >= hp and hp > 0 and ValidTarget(minion, range) then
			minionTarget = minion
			health = hp
		end
	end
	return minionTarget, health
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
