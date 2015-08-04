class "Rumble"

  function Rumble:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 310, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+(0.35+0.05*level)*TotalDmg end},
      [_W] = { range = 265, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+TotalDmg end},
      [_E] = { range = 390},
      [_R] = { range = 930, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (40+40*level+0.6*source.addDamage)*(math.min(3,math.max(1,4*(target.maxHealth-target.health)/target.maxHealth))) end},
    }
  end

  function Rumble:Load()
    SetupMenu()
  end

  function Rumble:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rae", "Auto R if X enemies", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  end

  function Rumble:Tick()
    if Config.Misc.Wa and not IsRecalling(myHero) and myHero.mana < 40 then
      CastSpell(_W)
    end
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      if enemies >= Config.Misc.Rae then
        local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
        if CastPosition and HitChance >= 2 then
          CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
        end
      end
    end
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      local allies = AlliesAround(myHero, 500)
      if enemies >= Config.Misc.Rae-1 and allies >= Config.Misc.Rae-1 then
        local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
        if CastPosition and HitChance >= 2 then
          CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
        end
      end
    end
  end

  function Rumble:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion, 1.2)
        end
      end
    end
  end

  function Rumble:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E then
      local minionTarget = GetLowestMinion(data[2].range)
      if minionTarget ~= nil then
        Cast(_E, winion, 1.2)
      end
    end
  end

  function Rumble:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.2)
    end
    if Config.Combo.W then 
      Cast(_W) 
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, 1.5)
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 500) > 2)) and ValidTarget(Target, data[3].range) then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
      if CastPosition and HitChance >= 2 then
        CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
      end
    end
  end

  function Rumble:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.2)
    end
    if Config.Harrass.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, 1.5)
    end
  end

  function Rumble:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
          if CastPosition and HitChance >= 2 then
            CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
          end
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end