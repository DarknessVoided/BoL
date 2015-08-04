class "Teemo"

  function Teemo:__init()
   targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, myHero.range+myHero.boundingRadius*3, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*3, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.8*AP end},
      [_W] = { range = 25000},
      [_E] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 9*level+0.3*AP end},
      [_R] = { range = myHero.range, width = 250}
    }
  end

  function Teemo:Load()
    SetupMenu()
  end

  function Teemo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Teemo:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
  end

  function Teemo:LaneClear()
    if Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
  end

  function Teemo:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target)
    end
    if Config.Combo.I and Ignite and myHero:CanUseSpell(Ignite) == READY and ValidTarget(Target, 600) and (GetRealHealth(Target) < (50+20*myHero.level+GetDmg(_Q,myHero,Target)+GetDmg("AD",myHero,Target)*5*myHero.attackSpeed) or killTextTable[Target.networkID].indicatorText:find("Killable")) then
      CastSpell(Ignite, Target)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy)
        elseif GetRealHealth(enemy) < GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy) and Config.Killsteal.E and Config.Killsteal.Q and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
          DelayAction(Cast, 0.25, {_Q, enemy})
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end