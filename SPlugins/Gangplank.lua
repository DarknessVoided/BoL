class "Gangplank"

  function Gangplank:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 625},
      [_W] = { range = 25000},
      [_E] = { range = 1000, speed = math.huge, delay = 1, width = 125, type = "circular"},
      [_R] = { range = 2000}
    }
    barrels = {}
    self.Target = nil
  end

  function Gangplank:Load()
    SetupMenu()
  end

  function Gangplank:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Q", "Auto Q barrels (1hp)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("W", "Anti-CC W", SCRIPT_PARAM_ONOFF, true)
  end

  function Gangplank:Tick()
  	local ccType = {[5] = true, [8] = true, [11] = true, [21] = true, [22] = true, [24] = true}
  	if Config.Misc.W then
	  for i = 1, myHero.buffCount, 1 do      
		  local buff = myHero:getBuff(i) -- partially from summoner item usage - ralphlol
		  if buff.valid and buff.name and ccType[buff.type] or (buff.type == 10 and buff.name and buff.name:lower():find("fleeslow")) or buff.name and buff.name:lower():find("summonerexhaust") then
			  Cast(_W)
		  end                    
	  end
	end
	if Config.Misc.Q then
  		for _,k in pairs(barrels) do
			if GetDistance(k.barrel) < data[0].range and GetInGameTimer() >= k.time + (myHero.level >= 13 and 1.25 or myHero.level >= 7 and 2.25 or 3.25) - GetDistance(k.barrel)/1000 - GetLatency() / 2000 then
				Cast(_Q, k.barrel)
			end
  		end
  	end
  end

  function Gangplank:CreateObj(obj)
  	if GetDistance(obj) < data[2].range and obj.name == "Barrel" then
  		table.insert(barrels, {barrel = obj, time = GetInGameTimer()})
  	end
  end

  function Gangplank:Combo()
  	if myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and Config.Combo.E and GetDistance(self.Target) <= data[2].range and #GetBarrelsAround(self.Target) < 1 then
  		Cast(_E, self.Target, 2)
  	elseif myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and GetDistance(self.Target) <= data[0].range then
  		Cast(_Q, self.Target)
  	end
  end

  function Gangplank:Harrass()
  	if myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.E and GetDistance(self.Target) <= data[2].range and #GetBarrelsAround(self.Target) < 1 then
  		Cast(_E, self.Target, 2)
  	elseif myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and Config.Harrass.Q and GetDistance(self.Target) <= data[0].range then
  		Cast(_Q, self.Target)
  	end
  end

  function Gangplank:GetBarrelsAround(unit)
  	local result = {}
  	for _,k in pairs(barrels) do
  		if k.barrel.health > 0 and GetDistance(k.barrel, unit) < data[2].width then
  			table.insert(result, k.barrel)
  		end
  	end
  	return result
  end