class "SWalk"

  function SWalk:__init(m, Cfg)
    self.melee = m or myHero.range < 450 or myHero.charName == "Rengar"
    aaResetTable, aaResetTable2, aaResetTable3, aaResetTable4 = {}, {}, {}, {}
    self.orbDisabled = false
    self.State = {}
    self.orbTable = { lastAA = 0, windUp = 13.37, animation = 13.37 }
    self.myRange = myHero.range+myHero.boundingRadius
    if Cfg then
      Cfg:addSubMenu("SWalk", "SWalk")
      self.Config = Cfg.SWalk
    else
      self.Config = scriptConfig("SWalk", "SW"..myHero.charName)
    end
    self.Config:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("radj", "Reset AA adjustment", SCRIPT_PARAM_ONOFF, false)
    self.Config:addParam("lhadj", "Lasthit adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("rlhadj", "Reset AA adjustment", SCRIPT_PARAM_ONOFF, false)
    self.Config:setCallback("radj", function(var) if var then self.Config.cadj = 0 self.Config.radj = false end end)
    self.Config:setCallback("rlhadj", function(var) if var then self.Config.lhadj = 0 self.Config.rlhadj = false end end)
    self.Config:addParam("i", "Use items", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("m", "Move", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("a", "Attack", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
    AddTickCallback(function() self:OrbWalk() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    if self.melee and myHero.charName ~= "Jayce" and myHero.charName ~= "Nidalee" then 
      self.Config:addParam("wtt", "Walk to Target", SCRIPT_PARAM_ONOFF, true) 
    end
    if self.aaResetTable or self.aaResetTable2 or self.aaResetTable3 or self.aaResetTable4 then
      self.Config:addParam("aar", "Reset AA only in combo/harrass", SCRIPT_PARAM_ONOFF, true)
    end
    if not targetSel then
      self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
      self.Config:addSubMenu("Target Selector", "ts")
      self.Config.ts:addTS(self.ts)
      ArrangeTSPriorities()
    else
      self.ts = targetSel
    end
    if not Cfg then
      sReady = {}
      self.Config:addSubMenu("Key Settings", "kConfig")
      self.Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    else
      self.Config.kConfig = ScriptologyConfig[myHero.charName].kConfig
    end
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    return self
  end

  function SWalk:Draw()
    if self.orbTable.windUp == 13.37 or self.orbTable.animation == 13.37 then
      DrawText("Please attack something with an unbuffed autoattack", 20, WINDOW_W/3, WINDOW_H/8, ARGB(255,255,255,255))
    end
    if not self.Config.d then return end
    DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.range+myHero.boundingRadius, 1, ARGB(105,0,255,0), 32)
  end

  function SWalk:OrbWalk()
    if self.ts then self.ts:update() if self.ts.target then Target = self.ts.target end end
    self.myRange = myHero.range+myHero.boundingRadius
    if self.Config.kConfig.LastHit then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      dmg = GetDmg("AD",myHero,self.Target)
      if self.Target and dmg and self.Target.health >= dmg then 
        if health >= dmg then
          self.Target = nil
        end
      end
      if health < 0 then self.Target = nil end
    end
    if self.Config.kConfig.LaneClear then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      if not self.Target then
        self.Target = GetJMinion(self.myRange)
      else
        dmg = GetDmg("AD",myHero,self.Target)
        if dmg and health-dmg > 0 then
          mtarget, health = self:GetHighestPMinion(self.myRange)
          if mtarget == self.Target and health ~= mtarget.health and #minionManager(MINION_ENEMY, self.myRange, myHero, MINION_SORT_HEALTH_ASC).objects > 1 then
            self.Target = nil
          else
            self.Target = mtarget
          end
        end
        if health < 0 then self.Target = nil end
      end
    end 
    if self.Config.kConfig.Harrass then
      self.Target = Target
    end
    if self.Config.kConfig.Combo then
      self.Target = Target
    end
    if (self.Forcetarget or Forcetarget or (loadedClass and loadedClass.Forcetarget)) and ValidTarget(self.Forcetarget, self.myRange*1.5) then
      self.Target = self.Forcetarget
    end
    local t = GetTarget()
    if t and ValidTarget(t, self.myRange) then
      self.Target = t
    end
    if self:DoOrb() then
      self:Orb(self.Target) 
    end
  end

  function SWalk:Orb(unit)
    if _G.Evade or self.orbDisabled then return end
    if not ValidTarget(unit, self.myRange) then unit = Target end
    local valid = false
    if myHero.charName == "Azir" and ScriptologyLoaded then 
      if ValidTarget(unit) then
        for _,k in pairs(loadedClass.GetSoldiers()) do
          if GetDistance(k,unit) < data[_W].width and GetDistance(k) <= 850 then
            valid = true
          end
        end
      end
    end
    if not valid then
      valid = ValidTarget(unit, self.myRange)
    end
    if self.Config.a and os.clock() > self.orbTable.lastAA + self.orbTable.animation and valid and ValidTarget(unit) then
      myHero:Attack(unit)
    elseif self.Config.m and GetDistance(mousePos) > myHero.boundingRadius and (self.Config.pc and os.clock() > self.orbTable.lastAA or os.clock() > self.orbTable.lastAA + self.orbTable.windUp) then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and unit and valid and unit.type == myHero.type and self.melee and self.Config.wtt then
        if GetDistance(unit) > myHero.boundingRadius+unit.boundingRadius then
          myHero:MoveTo(unit.x, unit.z)
        end
      elseif self:DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function SWalk:DoOrb()
    for _=0,3 do
      sReady[_] = myHero:CanUseSpell(_) == READY
    end
    self.State[_Q] = true
    self.State[_W] = true
    self.State[_E] = true
    self.IState = self.Config.kConfig.Combo or self.Config.kConfig.Harrass
    return self.Config.kConfig.Combo or self.Config.kConfig.Harrass or self.Config.kConfig.LastHit or self.Config.kConfig.LaneClear
  end

  function SWalk:GetLowestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = VP:GetPredictedHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800), self.orbTable.windUp+self.Config.lhadj/100)
      if minionTarget == nil then 
        minionTarget = minion
        health = hp
      elseif health >= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
      end
    end
    return minionTarget, health
  end

  function SWalk:GetHighestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = VP:GetPredictedHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800), self.orbTable.windUp+self.Config.lhadj/100)
      if minionTarget == nil then 
        minionTarget = minion
        health = hp
      elseif health <= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
      end
    end
    return minionTarget, health
  end

  function SWalk:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name then
      if spell.name:lower():find("attack") then
        self.orbTable.windUp = spell.windUpTime + self.Config.cadj/1000
        self.orbTable.animation = spell.animationTime
        self.orbTable.lastAA = os.clock()
        DelayAction(function() self:WindUp(self.Target) end, spell.windUpTime - GetLatency() / 2000)
      end
    end
  end

  RESET_SELF, RESET_PREDICT, RESET_TARGET, RESET_MOUSE = 111, 222, 333, 444
  function SWalk:AddReset(Spell, type)
    if type == RESET_SELF then
      table.insert(aaResetTable, Spell)
    elseif type == RESET_PREDICT then
      table.insert(aaResetTable2, Spell)
    elseif type == RESET_TARGET then
      table.insert(aaResetTable3, Spell)
    elseif type == RESET_MOUSE then
      table.insert(aaResetTable4, Spell)
    end
  end

  function SWalk:WindUp(unit)
    if ValidTarget(unit) then
      local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
      if (self.Config.aar and self.IState or true) then
        if self.aaResetTable then
          for _,k in pairs(self.aaResetTable) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k)
              return true
            end
          end
        end
        if self.aaResetTable2 then
          for _,k in pairs(self.aaResetTable2) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              if UPLloaded and data[k].type then
                if Cast(k, unit, false, true, 1) then
                  self.orbTable.lastAA = 0
                  return true
                end
              else
                self.orbTable.lastAA = 0
                CastSpell(k, unit.x, unit.z)
                return true
              end
            end
          end
        end
        if self.aaResetTable3 then
          for _,k in pairs(self.aaResetTable3) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, unit)
              return true
            end
          end
        end
        if self.aaResetTable4 then
          for _,k in pairs(self.aaResetTable4) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, mousePos.x, mousePos.z)
              return true
            end
          end
        end
      end
      if self.IState and self.Config.i then return self:CastItems(unit) end
    end
    return false
  end

  function SWalk:CastItems(unit)
    local i = {["ItemTiamatCleave"] = self.myRange, ["YoumusBlade"] = self.myRange}
    local u = {["ItemSwordOfFeastAndFamine"] = 600}
    for slot = ITEM_1, ITEM_6 do
      if i[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= i[myHero:GetSpellData(slot).name] then
        CastSpell(slot) 
        return true
      end
      if u[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= u[myHero:GetSpellData(slot).name] then
        CastSpell(slot, unit) 
        return true
      end
    end
    return false
  end