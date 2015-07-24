
class "Kalista"

  function Kalista:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { speed = 1200, delay = 0.5, range = 1150, width = 40, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-50+60*level+TotalDmg end},
      [_W] = { delay = 1.5, range = 5000},
      [_E] = { range = 1000, dmgAD = function(AP, level, Level, TotalDmg, source, target) return GetStacks(target) > 0 and (10 + (10 * level) + (TotalDmg * 0.6)) + (GetStacks(target)-1) * (kalE(level) + (0.175 + 0.025 * level)*TotalDmg) or 0 end},
      [_R] = { range = 2000}
    }
    stackTable = {}
  end

  function Kalista:Load()
    SetupMenu()
    self.soulMate = nil
    self.saveAlly = false
    for k,v in pairs(GetAllyHeroes()) do
      if UnitHaveBuff(v, "kalistacoopstrikeally") then
        self.soulMate = v
        Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      end
    end
  end

  function Kalista:ProcessSpell(unit, spell)
    if not unit or not spell then return end
    if spell.name == "KalistaPSpellCast" and GetDistance then 
      self.soulMate = spell.target
      Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      ScriptologyMsg("Soulmate found: "..spell.target.charName)
    end
    if Config.Misc.stackMethod == 2 then
      if spell.name:lower():find("attack") and unit.isMe then
        stackTable[spell.target.networkID] = GetStacks(spell.target) + 1
      elseif spell.name:lower():find("kalistaexpunge") then
        stackTable = {}
      end
    end
    if not self.soulMate or unit.type ~= myHero.type then return end
    if Config.Misc.R and self.saveAlly and GetDistance(self.soulMate) < data[3].range and unit.team ~= self.soulMate.team and (self.soulMate == spell.target or GetDistance(spell.endPos,self.soulMate) < self.soulMate.boundingRadius*3) then
      Cast(_R)
      ScriptologyMsg("Saving soulmate from spell: "..spell.name)
      self.saveAlly = false
    end
  end

  function Kalista:Menu()
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
    Config.Misc:addParam("stackMethod", "Method to count stacks:", SCRIPT_PARAM_LIST, 1, {"BuffCallbacks", "Count + Buff"})--, "Objects"})
    Config.Misc:addDynamicParam("WallJump", "WallJump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ej", "Use E to steal Jungle", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("AAGap", "AAs as Gapcloser on minions", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("R", "Save ally with R (none bound)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rhp", "Save ally under X% hp", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
  end

  function Kalista:Tick()
    if Config.Misc.WallJump then
      CastSpell(_Q, mousePos.x, mousePos.z)
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
    if myHero:CanUseSpell(_E) and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E) or Config.Misc.Ej) then
      local killableCounter = 0
      local killableCounterJ = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)  
        if winion ~= nil and EMinionDmg > winion.health+winion.shield and GetDistance(winion) < data[2].range then    
          killableCounter = killableCounter + 1
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)  
        if winion ~= nil and EMinionDmg > winion.health+winion.shield and GetDistance(winion) < data[2].range then
          if (string.find(winion.charName, "Crab") or string.find(winion.charName, "Rift") or string.find(winion.charName, "Baron") or string.find(winion.charName, "Dragon") or string.find(winion.charName, "Gromp") or ((string.find(winion.charName, "Krug") or string.find(winion.charName, "Murkwolf") or string.find(winion.charName, "Razorbeak") or string.find(winion.charName, "Red") or string.find(winion.charName, "Blue")))) then
            if not string.find(winion.charName, "Mini") then       
              killableCounterJ = killableCounterJ + 1
            end
          end
        end
      end
      if (Config.kConfig.LaneClear and killableCounter >= Config.LaneClear.Ea) or (Config.kConfig.LastHit and killableCounter >= Config.LastHit.Ea) or (Config.Misc.Ej and killableCounterJ >= 1) then
        Cast(_E)
      end
    end
    if self.soulMate and self.soulMate.health/self.soulMate.maxHealth < Config.Misc.Rhp/100 then
      self.saveAlly = true
    else
      self.saveAlly = false
    end
    if Target and Config.kConfig.Combo and Config.Misc.AAGap and GetDistance(GetClosestEnemy()) > myHero.range+myHero.boundingRadius+Target.boundingRadius then
      local winion = GetLowestMinion(myHero.range+myHero.boundingRadius*2)  
      if winion ~= nil then
        myHero:Attack(winion)
        myHero:MoveTo(mousePos.x, mousePos.z)
      end    
    end
    if Config.Misc.stackMethod == 2 then
      for _, unit in pairs(GetEnemyHeroes()) do
        if not UnitHaveBuff(unit, "kalistaexpungemarker") then
          stackTable[unit.networkID] = 0
        end
      end
    end
  end

  function Kalista:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
  end

  function Kalista:LaneClear()
    -- soon
  end

  function Kalista:Combo()
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
  
  function Kalista:Harrass()
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

  function Kalista:Killsteal()
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

  function ApplyBuff(unit, source, buff)
    if Config.Misc.stackMethod == 1 and unit and source and source.isMe and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 1
    end
  end

  function UpdateBuff(unit, buff, stacks)
    if Config.Misc.stackMethod == 1 and unit and buff and stacks and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = stacks
    end
  end

  function RemoveBuff(unit, buff)
    if Config.Misc.stackMethod == 1 and unit and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end