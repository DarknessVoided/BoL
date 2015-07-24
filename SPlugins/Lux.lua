class "Lux"

  function Lux:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1350, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
      [_W] = { speed = 1630, delay = 0.25, range = 1250, width = 210, collision = false, type = "linear"},
      [_E] = { speed = 1275, delay = 0.25, range = 1100, width = 325, collision = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+45*level+0.6*AP end},
      [_R] = { speed = math.huge, delay = 1, range = 3340, width = 200, collision = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 200+100*level+0.75*AP end}
    }
  end

  function Lux:Load()
    DelayAction(function()
      LoadUPL()
      FillUPL()
    end, 0.25)
    DelayAction(function()
      ScriptologyConfig:addSubMenu("Target Selector", "ts")
      ScriptologyConfig.ts:addTS(targetSel)
      ArrangeTSPriorities()
    end, 0.25)
    self:Menu()
  end

  function Lux:Menu()
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
    Config.Misc:addParam("Wa", "Shield with W (auto)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("manaW", "Min Mana % for shield", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Misc:addParam("Ea", "Detonate E (auto)", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_Q, data[0].range, false, Config.Misc)
  end

  function Lux:Tick()
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" and Config.Misc.Ea then
      Cast(_E)
    end
  end

  function Lux:ProcessSpell(unit, spell)
    if unit and spell and not spell.name:lower():find("attack") and Config.Misc.Wa and unit.team ~= myHero.team and unit.type == myHero.type and not IsRecalling(myHero) and Config.Misc.manaW <= 100*myHero.mana/myHero.maxMana then
      if spell.target then
        if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero, false)
        end
      else
        local makeUpPos = unit + (Vector(spell.endPos) - unit):normalized() * math.min(1250, GetDistance(unit))
        if GetDistance(spell.endPos) < GetDistance(myHero.pos, myHero.minBBox)*3 or GetDistance(makeUpPos) < GetDistance(myHero.pos, myHero.minBBox)*3 then
          if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
            Cast(_W, myHero, false)
          end
        end
      end
    end
  end

  function Lux:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
          Cast(_Q, winion, 2, false)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, winion, false)
        end
      end
    end 
  end

  function Lux:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetLowestMinion(data[_Q].range)
      if minionTarget ~= nil then
        Cast(_Q, minionTarget, false)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_E].range, data[_E].width)
      if BestHit > 1 then 
        Cast(_E, BestPos, false)
      end
    end  
  end

  function Lux:Combo()
    if GetStacks(Target) > 0 and Config.Combo.R and myHero:CanUseSpell(_R) == READY and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= GetRealHealth(Target) then
      Cast(_R, Target, 2)
    end
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY then
      Cast(_Q, Target, 2)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target, 1.5)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) >= GetRealHealth(Target) then
      Cast(_R, Target, 2)
    end
  end

  function Lux:Harrass()
    if GetStacks(Target) == 0 then
      if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, 2)
      end
      if Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target, 1.5)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, data[3].range) then
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
