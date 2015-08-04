class "LeeSin"

  function LeeSin:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1100, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 1100, width = 50, delay = 0.25, speed = 1800, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.9*source.addDamage end},
      [_W] = { range = 600},
      [_E] = { range = 0, width = 450, delay = 0.25, speed = math.huge, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+source.addDamage end},
      [_R] = { range = 2000, width = 150, delay = 0.25, speed = 2000, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 200*level+2*source.addDamage end}
    }
  end

  function LeeSin:Load()
    SetupMenu()
    self.Forcetarget = nil
    self.insecTarget = nil
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    self.passiveTracker = 0
    self.passiveName = "blindmonkpassive_cosmetic"
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and (string.find(string.lower(object.name), "ward") or string.find(string.lower(object.name), "trinkettotem")) then
        table.insert(self.Wards, object)
      end
    end
  end

  function LeeSin:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = 2
    end
  end

  function LeeSin:UpdateBuff(unit,buff,stacks)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = stacks
    end
  end

  function LeeSin:RemoveBuff(unit,buff)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = 0
    end
  end

  function LeeSin:Menu()
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
    Config.LaneClear:addParam("Qf", "Safe Q to lasthit (jungle)", SCRIPT_PARAM_ONOFF, true)
    if Smite ~= nil then Config.LaneClear:addParam("S", "Smite (jungle)", SCRIPT_PARAM_ONOFF, true) end
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("FInsec", "Flash Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function LeeSin:Tick()
    if Config.Misc.Insec then
      self:Insec()
    end
    if Config.Misc.FInsec then
      self:FInsec()
    end
    if Config.Misc.Jump then
      self:WardJump()
    end
  end

  function LeeSin:Insec()
    if myHero:GetSpellData(_R).currentCd > 2 then return end
    self.insecTarget = self.Forcetarget or Target
    if self.insecTarget == nil then if GetDistance(mousePos,myHero.pos) > myHero.boundingRadius then myHero:MoveTo(mousePos.x, mousePos.z) end return end
    local insecTowards = nil
    if #GetAllyHeroes() > 0 then
      for _,unit in pairs(GetAllyHeroes()) do
        if GetDistance(unit,insecTarget) < 2000 then
          insecTowards = unit
        end
      end
    end
    if insecTowards == nil or _G.LeftMousDown then
      insecTowards = mousePos
    end
    if insecTowards == nil then return end
    local pos, b = PredictPos(self.insecTarget)
    local pos = pos or self.insecTarget
    local movePos = self.insecTarget+(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    if GetDistance(movePos) < 250 then
      CastSpell(_R, self.insecTarget) 
      if sReady[_Q] then
        DelayAction(function() Cast(_Q, self.insecTarget) end, 0.33)
        DelayAction(function() Cast(_Q) end, 0.67)
      end
      if Smite then CastSpell(Smite, self.insecTarget) end
      return
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius and GetDistance(movePos) < 600 then
      if self:Jump(movePos, myHero.boundingRadius, true) then
        self.casted = false
      elseif not self.casted then
        slot = self:GetWardSlot()
        if not slot or self.casted then return end
        self.casted = true
        CastSpell(slot, movePos.x, movePos.z)
        DelayAction(function() Cast(_R, self.insecTarget) end, 0.05)
      end
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius then 
      myHero:MoveTo(movePos.x,movePos.z)
    end
  end

  function LeeSin:FInsec()
    if myHero:GetSpellData(_R).currentCd > 1 or not Flash or myHero:CanUseSpell(Flash) ~= READY then return end
    self.insecTarget = self.Forcetarget or Target
    if self.insecTarget == nil then if GetDistance(mousePos,myHero.pos) > myHero.boundingRadius then myHero:MoveTo(mousePos.x, mousePos.z) end return end
    local insecTowards = nil
    if #GetAllyHeroes() > 0 then
      for _,unit in pairs(GetAllyHeroes()) do
        if GetDistance(unit,insecTarget) < 2000 then
          insecTowards = unit
        end
      end
    end
    if insecTowards == nil or _G.LeftMousDown then
      insecTowards = mousePos
    end
    if insecTowards == nil then return end
    local pos, b = PredictPos(self.insecTarget)
    local pos = pos or self.insecTarget
    local movePos = self.insecTarget-(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    local movePos2 = self.insecTarget+(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    if GetDistance(movePos) < 150 then
      CastSpell(_R, self.insecTarget) 
      DelayAction(function() Cast(Flash, movePos2) end, 0)
      return
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius then 
      myHero:MoveTo(movePos.x,movePos.z)
    end
  end

  function LeeSin:Msg(Msg, Key)
    if Msg == WM_LBUTTONDOWN then 
      _G.LeftMousDown = true
    elseif Msg == WM_LBUTTONUP then
      _G.LeftMousDown = false
    end
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
          ScriptologyMsg("Insec-target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New insec-target selected: "..starget.charName.."")
        end
      end
    end
  end

  function LeeSin:ProcessSpell(unit, spell)  
    if unit == myHero then
      if string.find(string.lower(spell.name), "attack") then
        self.lastWindup = GetInGameTimer()+spell.windUpTime
      end
    end
  end

  function LeeSin:WardJump()
    if self.casted and self.jumped then self.casted, self.jumped = false, false
    elseif myHero:CanUseSpell(_W) == READY and myHero:GetSpellData(_W).name == "BlindMonkWOne" then
      local pos = self:getMousePos()
      if self:Jump(pos, 150, true) then return end
      slot = self:GetWardSlot()
      if not slot then return end
      CastSpell(slot, pos.x, pos.z)
      self.casted = true
    end
  end

  function LeeSin:Jump(pos, range, useWard)
    for _,ally in pairs(GetAllyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
        CastSpell(_W, ally)
        self.jumped = true
        return true
      end
    end
    for minion,winion in pairs(minionManager(MINION_ALLY, range, pos, MINION_SORT_HEALTH_ASC).objects) do
      if (GetDistance(winion, pos) <= range) then
        CastSpell(_W, winion)
        self.jumped = true
        return true
      end
    end
    table.sort(self.Wards, function(x,y) return GetDistance(x) < GetDistance(y) end)
    for i, ward in ipairs(self.Wards) do
      if (GetDistance(ward, pos) <= range) then
        CastSpell(_W, ward)
        self.jumped = true
        return true
      end
    end
  end

  function LeeSin:CreateObj(obj)
    if obj ~= nil and obj.valid then
      if string.find(string.lower(obj.name), "ward") or string.find(string.lower(obj.name), "trinkettotem") then
        table.insert(self.Wards, obj)
      end
    end
  end

  function LeeSin:getMousePos(range)
    local MyPos = Vector(myHero.x, myHero.y, myHero.z)
    local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
    return MyPos - (MyPos - MousePos):normalized() * 600
  end

  function LeeSin:GetWardSlot()
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "trinkettotem") then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (string.find(string.lower(myHero:GetSpellData(slot).name), "ward") and not string.find(string.lower(myHero:GetSpellData(slot).name), "vision")) then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "ward") then
        return slot
      end
    end
    return nil
  end

  function LeeSin:QDmg(unit)
    return GetDmg(_Q, myHero, unit)+GetDmg(_Q, myHero, unit)+myHero:CalcDamage(unit,(unit.maxHealth-unit.health)*0.08)
  end

  function LeeSin:LastHit()
    if ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) and myHero:CanUseSpell(_Q) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = GetDmg(_Q, myHero, winion)
        local MinionDmg2 = self:QDmg(winion)
        if MinionDmg1 and MinionDmg1 >= winion.health+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, 1.5)
        elseif MinionDmg2 and MinionDmg1 and MinionDmg1+MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, 1.5)
          DelayAction(Cast, 0.33, {_Q})
        elseif MinionDmg2 and MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          DelayAction(Cast, 0.33, {_Q})
        end
      end
    end
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and myHero:CanUseSpell(_W) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, 300) then
          Cast(_E)
        end
      end
    end
  end

  function LeeSin:LaneClear()
    if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and self.passiveTracker == 0 then
      local minion = GetLowestMinion(1100)
      if minion ~= nil then
        Cast(_Q, minion, 1)
      end
    end
    if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY then
      local minion = GetJMinion(1100)
      if minion ~= nil and Config.LaneClear.Qf then
        if self:QDmg(minion)+((Smite and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY) and math.max(20*myHero.level+370,30*myHero.level+330,40*myHero.level+240,50*myHero.level+100) or 0) > minion.health then
          Cast(_Q, minion, 1)
          if not self:IsFirstCast(_Q) and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY then
            DelayAction(function() CastSpell(Smite, minion) end, data[0].delay)
          end
        end
      elseif minion ~= nil and not Config.LaneClear.Qf then
        Cast(_Q, minion, 1)
      end
    end
    if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and self.passiveTracker == 0 then
      local BestPos, BestHit = GetFarmPosition(data[2].range, data[2].width)
      if BestHit >= 1 and GetDistance(BestPos) < 250 then 
        Cast(_E)
      end
      local minion = GetJMinion(data[2].width)
      if minion and GetDistance(minion) < data[2].width then 
        Cast(_E)
      end
    end
    if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and self.passiveTracker == 0 then
      local minion = GetLowestMinion(myHero.range+myHero.boundingRadius)
      if minion ~= nil then
        Cast(_W, myHero)
      end
      local minion = GetJMinion(data[2].width)
      if minion and GetDistance(minion) < data[2].width then 
        Cast(_W, myHero)
      end
    end
  end

  function LeeSin:Combo()
    local pos, b = PredictPos(Target)
    if myHero:CanUseSpell(_E) == READY and pos and ValidTarget(Target, data[2].width) and GetDistanceSqr(pos,myHero) < data[2].width ^ 2 and self.passiveTracker == 0 then
      Cast(_E)
    end
    if GetRealHealth(Target) < GetDmg(_Q, myHero, Target)+GetDmg(_R, myHero, Target)+(Target.maxHealth-(Target.health-GetDmg(_R, myHero, Target)*0.08)) then
      if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
        Cast(_Q, Target, 1.5)
      elseif myHero:CanUseSpell(_Q) == READY and GetStacks(Target) > 0 then
        Cast(_R, Target)
        DelayAction(Cast, 0.33, {_Q})
      end
    elseif myHero:CanUseSpell(_Q) == READY and self.passiveTracker == 0 then
      Cast(_Q, Target, false, true, 1.5)
    elseif Target ~= nil and GetStacks(Target) > 0 and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
      Cast(_Q)
    end
  end

  function LeeSin:IsFirstCast(x)
    if string.find(myHero:GetSpellData(x).name, 'One') then
        return true
    else
        return false
    end
  end

  function LeeSin:Harrass()
    if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
      Cast(_Q, Target, 1.5)
    end
    if not self.oldPos and GetStacks(Target) and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
      self.oldPos = myHero
      Cast(_Q)
    end
    if self.oldPos and GetDistance(Target) < 250 and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
      for _,winion in pairs(minionManager(MINION_ALLY, 450, self.oldPos, MINION_SORT_HEALTH_ASC).objects) do
        if GetDistance(self.oldPos) < GetDistance(winion) and GetDistance(winion) < 600 then
          self.oldPos = winion
        end
      end
      DelayAction(function() self:Jump(self.oldPos, 400, false) self.oldPos = nil end, 0.33)
    end
    if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].width) then
      Cast(_E, Target, 1.2)
    end
  end

  function LeeSin:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+self:QDmg(enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
          DelayAction(function() if not self:IsFirstCast(_Q) then Cast(_Q) end end, data[0].delay+GetDistance(enemy, myHero.pos)/data[0].speed)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].width) then
          Cast(_E, enemy, 1.2)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end        