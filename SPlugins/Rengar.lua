class "Rengar"

  function Rengar:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+(0.95+0.05*level)*TotalDmg end},
      [_W] = { speed = math.huge, delay = 0.5, range = 490, width = 490, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.8*AP end},
      [_E] = { speed = 1375, delay = 0.25, range = 1000, width = 80, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 50*level+0.7*TotalDmg end},
      [_R] = { range = 4000}
    }
    self.Target = nil
  end

  function Rengar:Load()
    SetupMenu()
    self.lastEmpChange = 0
    self.Target = nil
    self.keyStr = {[0] = "Q", [1] = "W", [2] = "E"}
    self.doQ = false
  end

  function Rengar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Combo:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
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
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("Empower", "Empower", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    Config.Misc:addParam("Empower2", "Active Empower: ", SCRIPT_PARAM_LIST, 1, {"Q", "W", "E"})
  end

  function Rengar:Tick()
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    self.doQ = (myHero.mana == 5 and (Config.Misc.Empower2 == 1 and self.doQ) or self.doQ)
    if Config.Misc.Empower and self.lastEmpChange < GetInGameTimer() then
      self.lastEmpChange = GetInGameTimer() + 0.33
      Config.Misc.Empower = false
      local os = Config.Misc.Empower2
      Config.Misc.Empower2 = Config.Misc.Empower2 + 1
      if Config.Misc.Empower2 == 4 then Config.Misc.Empower2 = 1 end
      if os ~= Config.Misc.Empower2 then
        PrintAlert("Switched Empoweredmode! Now using: "..self.keyStr[Config.Misc.Empower2-1], 0.25, 0xff, 0x00, 0x00)
      end
    end
  end

  function Rengar:Msg(Msg, Key)
    if Msg == WM_LBUTTONDOWN then
      local minD = 0
      local starget = nil
      for i, enemy in ipairs(GetEnemyHeroes()) do
        if ValidTarget(enemy) then
          if GetDistance(enemy, mousePos) <= minD or starget == nil then
            minD = GetDistance(enemy, mousePos)
            starget = enemy
          end
        end
      end
      
      if starget and minD < starget.boundingRadius*2 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
  end

  function Rengar:Animation(unit, ani)
    if unit and unit.isMe and ani then
      if ani == "Spell5" and (Config.kConfig.Combo or Config.kConfig.Harrass) then
        if not self.Target then self.Target = Target end
        if self.Target and Smite ~= nil and Config.Combo.S then CastSpell(Smite, self.Target) end
        if self.Target and Ignite ~= nil and Config.Combo.I then CastSpell(Ignite, self.Target) end
        if self.Target then DelayAction(function() self:CastHydra(self.Target) end, 0.1 - GetLatency() / 2000) end
        if loadedOrb then
          loadedOrb.orbTable.lastAA = 0
          loadedOrb.orbTable.animation = 0
        end
        if (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harrass and Config.Harrass.E) then DelayAction(function() if self.Target then CastSpell(_E, self.Target.x, self.Target.z) DelayAction(function() Cast(_W) end, 0.2) end end, GetDistance(self.Target) / (2500+myHero.ms) - GetLatency() / 2000) end
        if self.Target then Cast(_Q) end
      end
    end
  end

  function Rengar:CastHydra(unit)
    for slot = ITEM_1, ITEM_6 do
      if myHero:GetSpellData(slot).name:lower():find("tiamat") and myHero:CanUseSpell(slot) == READY then
        CastSpell(slot) 
      end
    end
  end

  function Rengar:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doQ then
        DelayAction(function() Cast(_Q) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Rengar:Combo()
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        Cast(_Q)
      elseif Config.Misc.Empower2 == 2 then
        Cast(_W, self.Target, 1)
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, self.Target, 2)
      end
    else
      if Config.Combo.W and sReady[_W] then
        Cast(_W, self.Target, 1)
      end
      if Config.Combo.E and sReady[_E] then
        Cast(_E, self.Target, 1)
      end
    end
  end

  function Rengar:Harrass()
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        Cast(_Q)
      elseif Config.Misc.Empower2 == 2 then
        Cast(_W, self.Target, 1)
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, self.Target, 2)
      end
    else
      if Config.Harrass.W and sReady[_W] then
        Cast(_W, self.Target, 1)
      end
      if Config.Harrass.E and sReady[_E] then
        Cast(_E, self.Target, 1)
      end
    end
  end

  function Rengar:LastHit()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local minionTarget = GetLowestMinion(data[1].range)
        if minionTarget ~= nil and minionTarget.health < GetDmg(_W, myHero, minionTarget) then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil and minionTarget.health < GetDmg(_E, myHero, minionTarget) then
          Cast(_E, minionTarget, 1)
        end
      end
    end
  end

  function Rengar:LaneClear()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local pos, hit = GetFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, 1)
        end
      end
    end
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local pos, hit = GetJFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetJMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, 1)
        end
      end
    end
  end

  function Rengar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end        