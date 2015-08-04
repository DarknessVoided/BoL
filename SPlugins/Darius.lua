class "Darius"

  function Darius:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, math.max(550,myHero.range+myHero.boundingRadius*2), DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 0, width = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 35*level+35+0.7*TotalDmg end},
      [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+0.2*level*TotalDmg end},
      [_E] = { range = 550},
      [_R] = { range = 450, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return math.floor(70+90*level+0.75*myHero.addDamage+0.2*GetStacks(target)*(70+90*level+0.75*myHero.addDamage)) end}
    }
    stackTable = {}
    self.doW = false
  end

  function Darius:Load()
    SetupMenu(true)
  end

  function Darius:Menu()
    Config.Combo:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetQ", "Max Q range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
  end

  function Darius:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = self:GetDmg("Q1", myHero, winion)
        local MinionDmg2 = self:GetDmg("Q", myHero, winion)
        if MinionDmg1 and MinionDmg1 >= winion.health+winion.shield and ValidTarget(winion, 450) then
          CastQ(winion)
        elseif MinionDmg2 and MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          Cast(_Q)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = self:GetDmg("W", myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, myHero.range+myHero.boundingRadius) then
          CastSpell(_W, myHero:Attack(winion))
        end
      end
    end
  end

  function Darius:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(0, data[0].width)
      if BestHit > 1 and GetDistance(BestPos) < 150 then 
        Cast(_Q)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then
      local minionTarget = nil
      for i, minion in pairs(minionManager(MINION_ENEMY, 250, myHero, MINION_SORT_HEALTH_ASC).objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.health+minionTarget.shield >= minion.health+minion.shield and ValidTarget(minion, 250) then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        CastSpell(_W, myHero:Attack(minionTarget))
      end
    end
  end

  function Darius:Combo()
    if Config.Combo.Qd and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) >= 250 then
      self:CastQ(Target)
    elseif Config.Combo.Qs and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) < 250 then
      Cast(_Q)
    end
    if Config.Combo.Q and myHero:CanUseSpell(_E) == READY then
      self:CastE(Target)
    end
    if Config.Combo.Q and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) > GetRealHealth(Target) and Config.Combo.R then
      Cast(_R, enemy)
    end
  end

  function Darius:Tick()
    self.doW = (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harrass and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana) or (Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana)
    if loadedAnWalker and loadedOrb and not addedAAreset then
      addedAAreset = true
      loadedOrb:AddReset(_W, RESET_SELF)
    end
  end

  function Darius:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doW then
        DelayAction(function() Cast(_W) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Darius:Harrass()
    if Config.Harrass.Qd and Config.Harrass.manaQ < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) >= 250 then
      self:CastQ(Target)
    elseif Config.Harrass.Qs and Config.Harrass.manaQ < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) < 250 then
      Cast(_Q)
    end
  end

  function Darius:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      local qDmg = ((GetDmg(_Q, myHero, enemy)*1.5) or 0) 
      local q1Dmg = ((GetDmg(_Q, myHero, enemy)) or 0)  
      local wDmg = ((GetDmg(_W, myHero, enemy)) or 0)   
      local rDmg = ((GetDmg(_R, myHero, enemy)) or 0)
      local iDmg = (50 + 20 * myHero.level) / 5
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:GetSpellData(_R).level == 3 and myHero:CanUseSpell(_R) and GetRealHealth(enemy) < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and GetRealHealth(enemy) < qDmg and Config.Killsteal.Q and ValidTarget(enemy, 450) then
          self:CastQ(enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and GetRealHealth(enemy) < q1Dmg and Config.Killsteal.Q and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) and sReady[_W] and GetRealHealth(enemy) < wDmg and Config.Killsteal.W then
          if ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
            CastSpell(_W, myHero:Attack(enemy))
          elseif ValidTarget(enemy, data[2].range*(Config.Misc.offsetE/100)) and sReady[_E] then
            self:CastE(enemy)
            DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif myHero:CanUseSpell(_R) and sReady[_R] and GetRealHealth(enemy) < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          if ScriptologyDebug then print(rDmg)  end
          Cast(_R, enemy)
        elseif GetRealHealth(enemy) < iDmg and Config.Killsteal.I and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) == READY then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Darius:CastQ(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[0].width*(Config.Misc.offsetQ/100)-dist and GetDistance(target) >= 250 then
      Cast(_Q)
    end
  end

  function Darius:CastE(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[2].range*(Config.Misc.offsetE/100)-dist then
      Cast(_E, target)
    end
  end

  function Darius:ApplyBuff(unit, source, buff)
    if unit and source and source.isMe and buff and buff.name == "dariushemo" then
      stackTable[unit.networkID] = 1
    end
  end

  function Darius:UpdateBuff(unit, buff, stacks)
    if unit and buff and stacks and buff.name == "dariushemo" then
      stackTable[unit.networkID] = stacks
    end
  end

  function Darius:RemoveBuff(unit, buff)
    if unit and buff and buff.name == "dariushemo" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end