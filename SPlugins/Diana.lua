

class "Diana"

  function Diana:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 835, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { speed = 1500, delay = 0.250, range = 835, width = 130, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35*level+45+0.2*AP end },
      [_W] = { range = 250, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 12*level+10+0.2*AP end },
      [_E] = { range = 395 },
      [_R] = { range = 825, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 60*level+40+0.6*AP end }
    }
  end

  function Diana:Load()
    SetupMenu()
    self.passiveTracker = 0
  end

  function Diana:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Diana:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == "dianapassivemarker" then
      self.passiveTracker = 1
    end
    if unit and unit == source and unit.isMe and buff.name == "dianaarcready" then
      self.passiveTracker = 2
    end
  end

  function Diana:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe then
      if spell.name == "DianaTeleport" then
      end
    end
  end

  function Diana:RemoveBuff(unit,buff)
    if unit and unit.isMe and (buff.name == "dianapassivemarker" or buff.name == "dianaarcready") then
      self.passiveTracker = 0
    end
  end

  function Diana:Combo()
    if sReady[_Q] and sReady[_R] then
      if GetDistance(Target,myHero) < 790+Target.boundingRadius and GetDistance(Target,myHero) > 825-Target.boundingRadius then
        local target, cPos, CastPosition, HitChance, Position
        local LessToKill, LessToKilli = 100, 0
        for _,enemy in pairs(GetEnemyHeroes()) do
          if ValidTarget(enemy) and GetDistance(enemy, Target) < data[0].range and enemy ~= Target then
            DamageToHero = GetDmg(_Q, myHero, enemy)
            ToKill = GetRealHealth(enemy) / DamageToHero
            if ((ToKill < LessToKill) or (LessToKilli == 0)) then
              LessToKill = ToKill
              LessToKilli = i
              target = enemy
            end
          end
        end
        if target then
          CastPosition, HitChance, Position = UPL:Predict(_Q, Target, target)
          cPos = Target+(Vector(CastPosition)-Target):normalized()*GetDistance(Target,target)
        else
          HitChance = 2
          cPos = Target
        end
        if HitChance and HitChance >= 1 then
          Cast(_R, Target)
          Cast(_Q, cPos)
        end
      elseif sReady[_Q] and GetDistance(Target) < 830-Target.boundingRadius then
        local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Target)
        if HitChance and HitChance >= 1 then
          Cast(_Q, CastPosition)
        end
        if HitChance and HitChance >= 2 then
          DelayAction(function() Cast(_R, Target) end, 0.25 + GetLatency() / 2000)
        end
      end
    elseif sReady[_Q] and GetDistance(Target) < 830-Target.boundingRadius then
      local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Target)
      if HitChance and HitChance >= 1 then
        Cast(_Q, CastPosition)
      end
    end
    if sReady[_R] and GetStacks(Target) > 0 and GetDistance(Target) < data[_R].range then
      Cast(_R, Target)
    end
    if sReady[_W] and GetDistance(Target) < data[_W].range then
      Cast(_W)
    end
  end

  function Diana:Harrass()
    if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
      Cast(_Q, Target, 1.5)
    end
    if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < data[_W].range then
      Cast(_W)
    end
  end

  function Diana:LastHit()
    if sReady[_Q] and Config.Harrass.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana*100 then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1)
        end
      end
    end
  end

  function Diana:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < data[_W].range then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 and GetDistance(BestPos) < 250 then 
        CastSpell(_W)
      end
    end
  end

  function Diana:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, 1)
          DelayAction(function() Cast(_R, enemy) end, 0.25 + GetLatency() / 2000)
        elseif myHero:CanUseSpell(_R) == READY and EnemiesAround(enemy, 1000) <= 3 and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20 + 8 * myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end