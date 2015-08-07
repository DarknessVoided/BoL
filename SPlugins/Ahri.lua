
class "Ahri"

  function Ahri:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { range = 880, delay = 0.25, speed = 2500, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
      [_E] = { range = 975, delay = 0.25, speed = 1200, width = 60, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
      [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+30+0.3*AP end}
    }
  end

  function Ahri:Load()
    SetupMenu()
    self.Orb = nil
    self.ultOn = 0
  end

  function Ahri:Menu()
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
    Config.Misc:addDynamicParam("Qc", "Catch Q", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, data[2].range, false, Config.Misc)
  end

  function Ahri:ProcessSpell(unit, spell)
    if unit and unit.isMe and not self.Orb then
      if spell.name == "AhriOrbofDeception" then
        self.Orb = {time = GetInGameTimer(), dir = Vector(spell.endPos)}
      end
      if spell.name == "AhriTumble" then
        if self.ultOn < GetInGameTimer()-10 then self.ultOn = GetInGameTimer() end
      end
    end
  end

  function Ahri:Tick()
    if Config.Misc.Qc then self:CatchQ() end
  end

  function Ahri:Draw()
    if self.Orb and self.Orb.time > GetInGameTimer()-2 then
      local draw = Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir))
      DrawLine3D(myHero.x, myHero.y, myHero.z, draw.x, draw.y, draw.z, data[0].width, ARGB(35, 255, 255, 255))
    else
      self.Orb = nil
    end
  end

  function Ahri:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_Q].range)
      if minion and minion.health < GetDmg(_Q, myHero, minion) then 
        Cast(_Q, minion)
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetLineFarmPosition(data[_Q].range, data[_Q].width)
      if BestPos and BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_E] and Config.Combo.E and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if UnitHaveBuff(Target, "ahriseduce") then
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      if Config.Combo.R then
        self:CatchQ()
      end
    end
    if Config.Combo.R and GetRealHealth(Target) < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    elseif Config.Combo.R and self.ultOn > GetInGameTimer()-10 and (not self.Orb or self.Orb.time < GetInGameTimer()-1.5) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb and self.Orb.dir and self.Orb.time > GetInGameTimer()-1.5  then
      local x,y,z = UPL.VP:GetLineCastPosition(Target, data[0].delay, data[0].width, data[0].range, data[0].speed, Vector(Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir))), data[0].collision)
      local x = Vector(self.Orb.dir)+(x-Vector(self.Orb.dir)):normalized()*(data[0].range)
      if self.ultOn > GetInGameTimer()-10 then
        x = Vector(x)-(Vector(Target)-myHero):normalized()*data[3].range
        Cast(_R,x)
      end
    end
  end

  function Ahri:Harrass()
    if not Target then return end
    if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if UnitHaveBuff(Target, "ahriseduce") then
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)*2 and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.Q and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.W and ValidTarget(enemy, data[3].range) then
          Cast(_W)
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_W)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, false, true, 1.5) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, false, true, 1.5) Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, false, true, 1.5) Cast(_W) Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        end
      end
    end
  end
  