
class "Gangplank"

  function Gangplank:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { speed = 1200, delay = 0.5, range = 1150, width = 40, collision = true, aoe = false, type = "linear"},
      [_W] = { delay = 1.5, range = 5000},
      [_E] = { range = 1000},
      [_R] = { range = 2000}
    }
  end

  function Gangplank:Load()
    SetupMenu(false)
  end

  function Gangplank:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Combo:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 10, 1, 20, 0)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Harrass:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 5, 1, 20, 0)
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
    Config.LaneClear:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Gangplank:Tick()
	  for i = 1, myHero.buffCount, 1 do      
		  local buff = myHero:getBuff(i)
		  if buff.name and buff.valid then print(buff.type.." "..buff.name)  end
		  if buff.valid and buff.name and (buff.type == 24 or buff.type == 5 or buff.type == 11 or buff.type == 22 or buff.type == 21 or buff.type == 8)
		  or (buff.type == 10 and buff.name and buff.name:lower():find("fleeslow"))
		  or buff.name and buff.name:lower():find("summonerexhaust")) then
			  Cast(_W)
		  end                    
	  end  
  end
  
  function Gangplank:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
  end

  function Gangplank:LaneClear()
    -- soon
  end

  function Gangplank:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target, false, true, 2)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, data[2].range) then
      if GetDmg(_E, myHero, Target) >= GetRealHealth(Target) then
        Cast(_E)
      end
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and EMinionDmg and EMinionDmg >= winion.health+winion.shield and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          killableCounter = killableCounter +1
        end   
      end   
      if killableCounter > 0 and GetStacks(Target) > 0 then
        Cast(_E)
      end
      if Config.Combo.Er and GetStacks(Target) >= Config.Combo.Es then
        pos, b = PredictPos(Target,0.25)
        pos2, b = PredictPos(myHero,0.25)
        pos2 = pos2 or myHero
        if pos and pos2 and GetDistance(Target) <= data[2].range and GetDistance(pos,pos2) > data[2].range then
          Cast(_E)
        end
      end
    end
  end
  
  function Gangplank:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target, false, true, 2)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, data[2].range) then
      local harrassUnit = nil
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and EMinionDmg and EMinionDmg >= winion.health+winion.shield and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          killableCounter = killableCounter +1
        end   
      end 
      for i, unit in pairs(GetEnemyHeroes()) do    
        local EChampDmg = GetDmg(_E, myHero, unit)      
        if unit ~= nil and EChampDmg and EChampDmg > 0 and ValidTarget(unit, data[2].range) and GetDistance(unit) < data[2].range then
          harrassUnit = unit
        end      
      end    
      if killableCounter >= 1 and harrassUnit ~= nil then
        Cast(_E)
      end
      if Config.Harrass.Er and GetStacks(Target) > Config.Harrass.Es then
        pos, b = PredictPos(Target,0.25)
        pos2, b = PredictPos(myHero,0.25)
        pos2 = pos2 or myHero
        if pos and pos2 and GetDistance(Target) <= data[2].range and GetDistance(pos,pos2) > data[2].range then
          Cast(_E)
        end
      end
    end
  end

  function Gangplank:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local health = GetRealHealth(enemy)
        if myHero:CanUseSpell(_E) == READY and GetStacks(enemy) > 0 and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) and GetDistance(enemy) < data[2].range then
          Cast(_E)
        elseif myHero:CanUseSpell(_Q) == READY and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) and GetDistance(enemy) < data[0].range then
          Cast(_Q, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end

  function Gangplank:ApplyBuff(unit, source, buff)
    if Config.Misc.stackMethod == 1 and unit and source and source.isMe and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 1
    end
  end

  function Gangplank:UpdateBuff(unit, buff, stacks)
    if Config.Misc.stackMethod == 1 and unit and buff and stacks and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = stacks
    end
  end

  function Gangplank:RemoveBuff(unit, buff)
    if Config.Misc.stackMethod == 1 and unit and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end