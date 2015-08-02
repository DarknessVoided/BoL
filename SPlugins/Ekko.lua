class "Ekko"

  function Ekko:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { speed = 1050, delay = 0.25, range = 825, width = 140, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15*level+45+0.2*AP end},
      [_W] = { speed = math.huge, delay = 2, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
      [_E] = { delay = 0.50, range = 350, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30*level+20+0.2*AP+TotalDmg end},
      [_R] = { speed = math.huge, delay = 0.5, range = 0, width = 400, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 150*level+50+1.3*AP end}
    }
  end

  function Ekko:Load()
    SetupMenu()
  end

  function Ekko:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
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
  end

  function Ekko:GetTwin()
    local twin = nil
    for _,k in pairs(objHolder) do
      if k and k.name == "Ekko" and k.valid then
        twin = k
      end
    end
    return twin
  end

  function Ekko:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, winion)
        if QMinionDmg and QMinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range+myHero.range+myHero.boundingRadius) and GetDistance(winion) < data[2].range+myHero.range+myHero.boundingRadius then
          Cast(_E, winion)
        end
      end
    end
  end

  function Ekko:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      pos, hit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if hit > 1 then
        Cast(_Q, pos)
      end
    end
  end

  function Ekko:Combo()
    if Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.2)
    end
    if Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, 1)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target)
      end
    else
      if Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    end
  end

  function Ekko:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.5)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target)
      end
    else
      if Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    end
  end

  function Ekko:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, self:GetTwin())
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end