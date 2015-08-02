class "Brand"

  function Brand:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { speed = 1600, delay = 0.25, range = 1100, width = 60, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+40+0.65*AP end},
      [_W] = { speed = math.huge, delay = 0.85, range = 900, width = 240, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45*level+30+0.6*AP end},
      [_E] = { range = 625, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25*level+30+0.55*AP end},
      [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 100*level+50+0.5*AP end}
    }
    self.Target = nil
  end

  function Brand:Load()
    SetupMenu()
  end

  function Brand:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Brand:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, winion, 1.5)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion)
        end
      end
    end
  end

  function Brand:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) <= 100*data[0].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil then
        Cast(_Q, minionTarget, 1.2)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif minionTarget.health < winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil and (stackTable[minionTarget.networkID] and stackTable[minionTarget.networkID] > 0) then
        Cast(_E, winion)
      end
    end
  end

  function Brand:Combo()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
        Cast(_E, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
        Cast(_W, Target, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        Cast(_Q, Target, 1.5)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 500) > 1 and stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target)
    end
  end

  function Brand:Harrass()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harrass.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harrass.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W, Target, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, 2)
      end
    end
  end

  function Brand:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end
