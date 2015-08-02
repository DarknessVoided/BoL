class "KogMaw"
  
  function KogMaw:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 975, delay = 0.25, speed = 1600, width = 80, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+50*level+0.5*AP end},
      [_W] = { range = function() return myHero.range + myHero.boundingRadius*2 + 110+20*myHero:GetSpellData(_W).level end, dmgAP = function(AP, level, Level, TotalDmg, source, target) return target.maxHealth*0.01*(level+1)+0.01*AP+TotalDmg end},
      [_E] = { range = 1200, delay = 0.25, speed = 1300, width = 120, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
      [_R] = { range = 1500, speed = math.huge, delay = 1.1,  width = 250, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.3*AP+0.5*TotalDmg end}
    }
  end

  function KogMaw:Load()
    SetupMenu()
  end

  function KogMaw:Tick()
    targetSel.range = 900+myHero:GetSpellData(_R).level*300
  end

  function KogMaw:Menu()
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

  function KogMaw:LastHit()
    local minionTarget = GetLowestMinion(math.min(data[0].range, data[1].range()))
    if not minionTarget then return end
    if GetDmg(_Q, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_Q, minionTarget, 2)
    elseif GetDmg(_W, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, myHero:Attack(minionTarget))
    elseif GetDmg(_E, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_E, minionTarget2, 2)
    end
  end

  function KogMaw:LaneClear()
    local minionTarget = GetLowestMinion(math.min(data[0].range, data[1].range()))
    if minionTarget then
      if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, minionTarget, 2)
      end
      if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W)
      end
    end
    minionTarget = GetLineFarmPosition(data[2].range, data[2].width)
    if minionTarget then
      if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, minionTarget, 2)
      end
    end
  end

  function KogMaw:Combo()
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target, 2)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W, myHero:Attack(Target))
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target, 2)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
      Cast(_R, Target, 2)
    end
  end

  function KogMaw:Harrass()
    if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 2)
    end
    if Config.Harrass.W and myHero:CanUseSpell(_W) == READY and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, myHero:Attack(Target))
    end
    if Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      Cast(_E, Target, 2)
    end
  end

  function KogMaw:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_E, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_Q, enemy, 1.2) DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end