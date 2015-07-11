require("ImprovedScriptConfig")

function OnLoad()
  -- CastSpell(s, myHero:Attack(t)) and CastSpell(s)
    aaResetTable = { ["Diana"] = {_E}, ["Darius"] = {_W}, ["Hecarim"] = {_Q}, ["Jax"] = {_W}, ["Rengar"] = {_Q}, ["Riven"] = {_W}, ["Sivir"] = {_W}, ["Talon"] = {_Q} }
  -- CastSpell(s, x, z) -> target
    aaResetTable2 = { ["Diana"] = {_Q}, ["Kalista"] = {_Q}, ["Riven"] = {_Q}, ["Talon"] = {_W}, ["Yasuo"] = {_Q} }
  -- CastSpell(s, t)
    aaResetTable3 = { ["Jax"] = {_Q}, ["Lucian"] = {_Q}, ["Teemo"] = {_Q}, ["Tristana"] = {_E}, ["Yasuo"] = {_R} }
  -- CastSpell(s, x, z) -> mouse
    aaResetTable4 = { ["Lucian"] = {_E},  ["Vayne"] = {_Q} }
  SWalk(myHero.range < 450, aaResetTable[myHero.charName], aaResetTable2[myHero.charName], aaResetTable3[myHero.charName], aaResetTable4[myHero.charName])
  Riven()
end

class "SWalk"

  function SWalk:__init(m, a1, a2, a3, a4)
    self.melee = m or myHero.isMelee
    -- CastSpell(s, myHero:Attack(t)) and CastSpell(s)
      self.aaResetTable = a1
    -- CastSpell(s, x, z) <- target
      self.aaResetTable2 = a2
    -- CastSpell(s, t)
      self.aaResetTable3 = a3
    -- CastSpell(s, x, z) <- mouse
      self.aaResetTable4 = a4
    self.State = {}
    self.orbTable = { lastAA = 0, windUp = 4, animation = 0.5 }
    self.myRange = myHero.range+myHero.boundingRadius
     self.Config = scriptConfig("SWalk", "SW"..myHero.charName)
    self.Config:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("radj", "Reset AA adjustment", SCRIPT_PARAM_ONOFF, false)
    self.Config:setCallback("radj", function(var) if var then self.Config.cadj = 0 self.Config.radj = false end end)
    local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    if self.aaResetTable then
      for _,k in pairs(self.aaResetTable) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    if self.aaResetTable2 then
      for _,k in pairs(self.aaResetTable2) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    if self.aaResetTable3 then
      for _,k in pairs(self.aaResetTable3) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    if self.aaResetTable4 then
      for _,k in pairs(self.aaResetTable4) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    self.Config:addParam("i", "Use items", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("m", "Move", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("a", "Attack", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
    AddTickCallback(function() self:OrbWalk() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    if VIP_USER and self.melee then 
      self.Config:addParam("wtt", "Walk to Target", SCRIPT_PARAM_ONOFF, true) 
      if VIP_USER then
        self.Config:addParam("pc", "Use packet for animation cancel", SCRIPT_PARAM_ONOFF, true)
        AddRecvPacketCallback2(function(x) self:RecvPacket(x) end) 
      end
    end
    if self.aaResetTable or self.aaResetTable2 or self.aaResetTable3 or self.aaResetTable4 then
      self.Config:addParam("aar", "Reset AA only in combo/harrass", SCRIPT_PARAM_ONOFF, true)
    end
		self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
		self.Config:addSubMenu("Target Selector", "ts")
		self.Config.ts:addTS(self.ts)
		ArrangeTSPriorities()
		sReady = {}
		self.Config:addSubMenu("Key Settings", "kConfig")
		self.Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		self.Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		self.Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		self.Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    return self
  end

  function SWalk:Draw()
    if not self.Config.d then return end
    DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.range+myHero.boundingRadius, 1, ARGB(105,0,255,0), 32)
  end

  function SWalk:OrbWalk()
    if self.ts then self.ts:update() if self.ts.target then Target = self.ts.target end end
    myRange = myHero.range+myHero.boundingRadius
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
        if dmg and health ~= self.Target.health and (health >= dmg or self.Target.health-health-dmg <= 0) then
          self.Target = nil
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
    if (self.Forcetarget or Forcetarget or (loadedClass and loadedClass.Forcetarget)) and ValidTarget(self.Forcetarget, self.myRange*1.2) then
      self.Target = self.Forcetarget
    end
    if self:DoOrb() then
      if ScriptologyLoaded and loadedClass.Target then loadedClass.Target = self.Target end
      self:Orb(self.Target) 
    end
  end

  function SWalk:Orb(unit)
    if _G.Evade then return end
    if not ValidTarget(unit, myRange) then unit = Target end
    local valid = false
    if myHero.charName == "Azir" then 
      if ValidTarget(unit) then
        for _,k in pairs(loadedClass.GetSoldiers()) do
          if GetDistance(k,unit) < data[_W].width and GetDistance(k) <= 850 then
            valid = true
          end
        end
      end
    end
    if not valid then
      valid = ValidTarget(unit, myRange)
    end
    if self.Config.a and os.clock() > self.orbTable.lastAA + self.orbTable.animation and valid and ValidTarget(unit) then
      myHero:Attack(unit)
      if myHero.charName == "Kalista" then
        local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250 
        if self:DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
          myHero:MoveTo(movePos.x, movePos.z)
        end
      end
    elseif self.Config.m and GetDistance(mousePos) > myHero.boundingRadius and (self.Config.pc and os.clock() > self.orbTable.lastAA or os.clock() > self.orbTable.lastAA + self.orbTable.windUp + self.Config.cadj/1000) then
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
      local hp = VP:GetPredictedHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800), self.orbTable.windUp)
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

  function SWalk:SetStates(mode)
    self.State[_Q] = mode.Q
    self.State[_W] = mode.W
    self.State[_E] = mode.E
    if myHero.charName == "Rengar" and myHero.mana == 5 then
      self.State[_Q] = false
      self.State[_W] = false
      self.State[_E] = false
      if Config.Misc.Empower2 == 1 then
        self.State[_Q] = true
      elseif Config.Misc.Empower2 == 2 then
        self.State[_W] = true
      elseif Config.Misc.Empower2 == 3 then
        self.State[_E] = true
      end
    end
    return true
  end

  function SWalk:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name and not self.Config.pc then
      if spell.name:lower():find("attack") then
        self.orbTable.windUp = myHero.charName == "Kalista" and 0 or spell.windUpTime
        self.orbTable.animation = myHero.charName == "Kalista" and 0 or spell.animationTime
        self.orbTable.lastAA = myHero.charName == "Kalista" and 0 or os.clock()
        DelayAction(function() self:WindUp(self.Target) end, 1 / (myHero.attackSpeed * 1 / (spell.windUpTime * myHero.attackSpeed)) - GetLatency() / 2000)
      end
    end
  end

  function SWalk:RecvPacket(p)
    if self.Config.pc and p.header == 0x2A then
      if self.Target and p:DecodeF() == self.Target.networkID then
        self.orbTable.lastAA = 0
        self:WindUp(self.Target)
      end
    end
  end

  function SWalk:WindUp(unit)
    if ValidTarget(unit) then
      local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
      if (self.Config.aar and self.IState or true) then
        if self.aaResetTable then
          for _,k in pairs(self.aaResetTable) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k)
              return
            end
          end
        end
        if self.aaResetTable2 then
          for _,k in pairs(self.aaResetTable2) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              if UPLloaded and data[k].type then
                Cast(k, unit, false, true, 1)
              else
                CastSpell(k, unit.x, unit.z)
              end
              return
            end
          end
        end
        if self.aaResetTable3 then
          for _,k in pairs(self.aaResetTable3) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, unit)
              return
            end
          end
        end
        if self.aaResetTable4 then
          for _,k in pairs(self.aaResetTable4) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, mousePos.x, mousePos.z)
              return
            end
          end
        end
      end
      if self.IState and self.Config.i and self:CastItems(unit) then return end
    end
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

  function ArrangeTSPriorities()
    local priorityTable2 = {
        p5 = {"Alistar", "Amumu", "Blitzcrank", "Braum", "ChoGath", "DrMundo", "Garen", "Gnar", "Hecarim", "JarvanIV", "Leona", "Lulu", "Malphite", "Nasus", "Nautilus", "Nunu", "Olaf", "Rammus", "Renekton", "Sejuani", "Shen", "Shyvana", "Singed", "Sion", "Skarner", "Taric", "Thresh", "Volibear", "Warwick", "MonkeyKing", "Yorick", "Zac"},
        p4 = {"Aatrox", "Darius", "Elise", "Evelynn", "Galio", "Gangplank", "Gragas", "Irelia", "Jax","LeeSin", "Maokai", "Morgana", "Nocturne", "Pantheon", "Poppy", "Rengar", "Rumble", "Ryze", "Swain","Trundle", "Tryndamere", "Udyr", "Urgot", "Vi", "XinZhao", "RekSai"},
        p3 = {"Akali", "Diana", "Fiddlesticks", "Fiora", "Fizz", "Heimerdinger", "Janna", "Jayce", "Kassadin","Kayle", "KhaZix", "Lissandra", "Mordekaiser", "Nami", "Nidalee", "Riven", "Shaco", "Sona", "Soraka", "Vladimir", "Yasuo", "Zilean", "Zyra"},
        p2 = {"Ahri", "Anivia", "Annie",  "Brand",  "Cassiopeia", "Ekko", "Karma", "Karthus", "Katarina", "Kennen", "LeBlanc",  "Lux", "Malzahar", "MasterYi", "Orianna", "Syndra", "Talon",  "TwistedFate", "Veigar", "VelKoz", "Viktor", "Xerath", "Zed", "Ziggs" },
        p1 = {"Ashe", "Caitlyn", "Corki", "Draven", "Ezreal", "Graves", "Jinx", "Kalista", "KogMaw", "Lucian", "MissFortune", "Quinn", "Sivir", "Teemo", "Tristana", "Twitch", "Varus", "Vayne"},
    }
     local priorityOrder = {
        [1] = {1,1,1,1,1},
        [2] = {1,1,2,2,2},
        [3] = {1,1,2,3,3},
        [4] = {1,2,3,4,4},
        [5] = {1,2,3,4,5},
    }
    local function _SetPriority(table, hero, priority)
        if table ~= nil and hero ~= nil and priority ~= nil and type(table) == "table" then
            for i=1, #table, 1 do
                if hero.charName:find(table[i]) ~= nil and type(priority) == "number" then
                    TS_SetHeroPriority(priority, hero.charName)
                end
            end
        end
    end
    for i=1, #table, 1 do

    end
    local enemies = #GetEnemyHeroes()
    if priorityTable2~=nil and type(priorityTable2) == "table" and enemies > 0 then
      for i, enemy in ipairs(GetEnemyHeroes()) do
        _SetPriority(priorityTable2.p1, enemy, math.min(1, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p2, enemy, math.min(2, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p3,  enemy, math.min(3, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p4,  enemy, math.min(4, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p5,  enemy, math.min(5, #GetEnemyHeroes()))
      end
    end
  end
