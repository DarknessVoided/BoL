
class "Cassiopeia"

  function Cassiopeia:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST, 900, DAMAGE_MAGICAL, false, true)
    self.lastE = 0
    data = {
      [_Q] = { speed = math.huge, delay = 0.25, range = 850, width = 100, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45+30*level+0.45*AP end},
      [_W] = { speed = 2500, delay = 0.5, range = 925, width = 90, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+5*level+0.1*AP end},
      [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+25*level+0.55*AP end},
      [_R] = { speed = math.huge, delay = 0.5, range = 825, width = 410, collision = false, aoe = true, type = "cone", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+10*level+0.5*AP end}
    }
  end

  function Cassiopeia:Load()
    SetupMenu()
  end

  function Cassiopeia:ProcessSpell(unit, spell)
    if unit and unit.isMe then
      if spell.name == "CassiopeiaTwinFang" then
        self.lastE = GetInGameTimer() + (100+Config.Misc.Humanizer)/200
      end
    end
  end

  function Cassiopeia:Menu()
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
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Misc:addParam("Humanizer", "Humanizer (% add time on E)", SCRIPT_PARAM_SLICE, 0, 0, 200, 0)
  end

  function Cassiopeia:Tick() -- LastHitSomethingPoisonedWithE
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E and not Config.kConfig.Combo and not Config.kConfig.Harrass then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and UnitHaveBuff(minion, "poison") and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and UnitHaveBuff(minion, "poison") and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end    
    end  
  end

  function Cassiopeia:LastHit()
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end    
    end  
  end

  function Cassiopeia:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        Cast(_Q, BestPos)
      else
        local minionTarget = nil
        for minion,winion in pairs(Mobs.objects) do
          if minionTarget == nil then 
            minionTarget = winion
          elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
            minionTarget = winion
          end
        end
        for minion,winion in pairs(JMobs.objects) do
          if minionTarget == nil then 
            minionTarget = winion
          elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
            minionTarget = winion
          end
        end
        if minionTarget ~= nil then
          Cast(_Q, minionTarget)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if self.lastE > GetInGameTimer() then return end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        if winion ~= nil and UnitHaveBuff(winion, "poison") then
          Cast(_E, winion)
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        if winion ~= nil and UnitHaveBuff(winion, "poison") then
          Cast(_E, winion)
        end
      end
    end
  end

  function Cassiopeia:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Combo.E and ValidTarget(Target, data[2].range) then
      if UnitHaveBuff(Target, "poison") then
        Cast(_E, Target)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) + 2*GetDmg(_E, myHero, Target) >= GetRealHealth(Target) or (EnemiesAroundAndFacingMe(Target, 500) > 1 and UnitHaveBuff(Target, "poison"))) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target)
    end
  end

  function Cassiopeia:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and ValidTarget(Target, data[1].range) and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Harrass.E and ValidTarget(Target, data[2].range) and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      if UnitHaveBuff(Target, "poison") then
        Cast(_E, Target)
      end
    end
  end

  function Cassiopeia:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)*2 and UnitHaveBuff(enemy, "poison") and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
          DelayAction(Cast, 0.55, {_E, enemy})
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end