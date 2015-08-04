class "Azir"

  function Azir:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 975, DAMAGE_MAGICAL)
    data = {
      [_Q] = { range = 880, delay = 0.25, speed = 2500, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
      [_E] = { range = 975, delay = 0.25, speed = 1200, width = 60, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
      [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+30+0.3*AP end}
    }
    self.Target = nil
  end

  function Azir:Load()
    SetupMenu()
    self.soldierToDash = nil
  end

  function Azir:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name == "AzirQ" then
        for _,obj in pairs(objHolder) do
          if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
            objTimeHolder[obj.networkID] = objTimeHolder[obj.networkID] + 1
          end
        end
      end
    end
  end

  function Azir:CountSoldiers(unit)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() and not (unit and GetDistance(obj, unit) > data[1].width) then 
        soldiers = soldiers + 1
      end
    end
    return soldiers
  end

  function Azir:GetSoldier(i)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
        soldiers = soldiers + 1
        if i == soldiers then return obj end
      end
    end
  end

  function Azir:GetSoldiers()
    soldiers = {}
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
        table.insert(soldiers, obj)
      end
    end
    return soldiers
  end

  function Azir:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Azir:Tick()
    if Config.Misc.Flee then
      self:Flee()
    end
    if Config.Misc.Insec then
      self:Insec()
    end
  end

  function Azir:LastHit()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and ((Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, self.Target.pos)
    end
    if ((Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) and self.Target and self:CountSoldiers() > 0 and GetDmg(_Q, myHero, self.Target)*self:CountSoldiers() > self.Target.health then
      Cast(_Q, self.Target.pos)
    end
  end

  function Azir:LaneClear()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target.pos)
    end
    if Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        pos, hit = GetLineFarmPosition(data[0].range,data[0].width,k)
        if pos and hit > 0 then
          Cast(_Q, pos)
        end
      end
    end
  end

  function Azir:Combo()
    if not self.Target then self.Target = Target end
    if not self.Target then return end
    if Config.Combo.Q and Config.Combo.W and myHero:GetSpellData(_Q).currentCd == 0 and sReady[_W] and GetDistance(self.Target) < data[_Q].range then
      Cast(_W, self.Target.pos)
      DelayAction(function() Cast(_Q, self.Target.pos) end, 0.25)
    end
    if sReady[_W] and Config.Combo.W then
      Cast(_W, self.Target.pos)
    end
    if Config.Combo.Q and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target)
      end
    end
    if self.Target and Config.Combo.E and self.Target.health < GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      for _,k in pairs(self:GetSoldiers()) do
        local x, y, z = VectorPointProjectionOnLineSegment(myHero, k, self.Target)
        if x and y and z then
          Cast(_E,k)
        end
      end
    end
    if self.Target and Config.Combo.R and self.Target.health < GetDmg(_R,myHero,self.Target)+GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      Cast(_R,self.Target,2)
    end
  end

  function Azir:Harrass()
    if not self.Target then self.Target = Target end
    if not self.Target then return end
    if self:CountSoldiers() <= 1 and sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target.pos)
    end
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target, 2, k)
      end
    end
  end

  function Azir:Flee()
    if self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        if not self.soldierToDash then
          self.soldierToDash = k
        elseif self.soldierToDash and GetDistanceSqr(k,mousePos) < GetDistanceSqr(self.soldierToDash,mousePos) then
          self.soldierToDash = k
        end
      end
    end
    if not self.soldierToDash and sReady[_W] then
      Cast(_W, mousePos)
    end
    if self:CountSoldiers() > 0 and self.soldierToDash then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * data[0].range
      if movePos then
        Cast(_E, self.soldierToDash, true)
        DelayAction(function() Cast(_Q, movePos) end, 0.25)
        DelayAction(function() self.soldierToDash = nil end, myHero:GetSpellData(_E).currentCd)
      end
    end
  end

  function Azir:Insec()
    local enemy = GetClosestEnemy(mousePos)
    if not enemy then return end
    if GetDistance(enemy) > 750 then return end
    if self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        if not self.soldierToDash then
          self.soldierToDash = k
        elseif self.soldierToDash and GetDistanceSqr(k,enemy) < GetDistanceSqr(self.soldierToDash,enemy) then
          self.soldierToDash = k
        end
      end
    end
    if not self.soldierToDash and sReady[_W] then
      Cast(_W, enemy)
    end
    if self:CountSoldiers() > 0 and self.soldierToDash then
      local movePos = myHero + (Vector(enemy) - myHero):normalized() * data[0].range + (Vector(enemy) - myHero):normalized() * data[1].width
      if movePos then
        Cast(_Q, movePos)
        Cast(_E, self.soldierToDash)
        DelayAction(function() Cast(_R, mousePos) end, 1)
        DelayAction(function() self.soldierToDash = nil end, 2)
      end
    end
  end

  function Azir:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if self:CountSoldiers(enemy)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          myHero:Attack(enemy)
        elseif (self:CountSoldiers(enemy)+1)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          Cast(_W, enemy)
          myHero:Attack(enemy)
        elseif GetDmg(_R,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.R and GetDistance(enemy) < data[3].range then
          Cast(_R, enemy, 1)
        end
      end
    end
  end