
class "Katarina"

  function Katarina:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST, 700, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 675, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+25*level+0.45*AP end},
      [_W] = { range = 375, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.25*AP+0.6*TotalDmg end},
      [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+30*level+0.25*AP end},
      [_R] = { range = 550, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+10*level+0.2*AP+0.3*source.addDamage end}
    }
    self.Target = nil
  end

  function Katarina:Load()
    SetupMenu()
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and (string.find(string.lower(object.name), "ward") or string.find(string.lower(object.name), "trinkettotem")) then
        table.insert(self.Wards, object)
      end
    end
  end

  function Katarina:Tick()
    if loadedOrb.Target ~= nil then self.Target = loadedOrb.Target end
    if Config.Misc.Jump then self:WardJump() end
  end

  function Katarina:Menu()
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
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Katarina:WardJump()
    if self.casted and self.jumped then self.casted, self.jumped = false, false
    elseif myHero:CanUseSpell(_E) == READY then
      local pos = self:getMousePos()
      if self:Jump(pos, 150, true) then return end
      slot = self:GetWardSlot()
      if not slot then return end
      CastSpell(slot, pos.x, pos.z)
    end
  end

  function Katarina:Jump(pos, range, useWard)
    for _,ally in pairs(GetAllyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
        CastSpell(_E, ally)
        self.jumped = true
        return true
      end
    end
    for _,ally in pairs(GetEnemyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
        CastSpell(_E, ally)
        self.jumped = true
        return true
      end
    end
    for minion,winion in pairs(minionManager(MINION_ALL, range, pos, MINION_SORT_HEALTH_ASC).objects) do
      if (GetDistance(winion, pos) <= range) then
        CastSpell(_E, winion)
        self.jumped = true
        return true
      end
    end
    table.sort(self.Wards, function(x,y) return GetDistance(x) < GetDistance(y) end)
    for i, ward in ipairs(self.Wards) do
      if (GetDistance(ward, pos) <= range) then
        CastSpell(_E, ward)
        self.jumped = true
        return true
      end
    end
  end

  function Katarina:CreateObj(obj)
    if obj ~= nil and obj.valid then
      if string.find(string.lower(obj.name), "ward") or string.find(string.lower(obj.name), "trinkettotem") then
        table.insert(self.Wards, obj)
      end
    end
  end

  function Katarina:getMousePos(range)
    local MyPos = Vector(myHero.x, myHero.y, myHero.z)
    local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
    return MyPos - (MyPos - MousePos):normalized() * 700
  end

  function Katarina:GetWardSlot()
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

  function Katarina:LastHit()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LastHit.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range and self.Target.health < GetDmg(_Q, myHero, self.Target) then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LastHit.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 and self.Target.health < GetDmg(_W, myHero, self.Target) then
      Cast(_W)
    end
    if Config.LastHit.E and sReady[_E] and GetDistance(self.Target) < data[2].range and self.Target.health < GetDmg(_E, myHero, self.Target) then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:LaneClear()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LaneClear.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LaneClear.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.LaneClear.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Combo()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Combo.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Combo.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Combo.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
    if Config.Combo.R and sReady[_R] and GetDistance(self.Target) < 200 and self.Target.health < GetDmg(_R, myHero, self.Target)*10 then
      Cast(_R)
    end
  end

  function Katarina:Harrass()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Harrass.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Harrass.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Harrass.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and GetDistance(enemy) < 700 then
        local dmg = 0
        if Config.Killsteal.Q and sReady[_Q] then
            dmg = dmg + GetDmg(_Q, myHero, enemy)
        end
        if Config.Killsteal.W and sReady[_W] then
            dmg = dmg + GetDmg(_W, myHero, enemy)
        end
        if Config.Killsteal.E and sReady[_E] then
            dmg = dmg + GetDmg(_E, myHero, enemy)
        end
        if dmg+((sReady[_Q] and Config.Killsteal.Q) and myHero:CalcMagicDamage(enemy,15*myHero:GetSpellData(_Q).level+0.15*myHero.ap) or 0)+((myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and Config.Killsteal.R) and GetDmg(_R, myHero, enemy)*10 or 0) >= GetRealHealth(enemy) then
          if Config.Killsteal.Q and sReady[_Q] then
            Cast(_Q, enemy, true)
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy, true})
              if Config.Killsteal.W and sReady[_W] then
                DelayAction(function() Cast(_W) end, 0.5)
                if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.75)
                end
              end
            elseif Config.Killsteal.W and sReady[_W] then
              pos, b = PredictPos(enemy)
              if pos and GetDistance(pos) < data[1].range then
                DelayAction(function() Cast(_W) end, 0.25)
                if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.5)
                end
              end
            end
          elseif Config.Killsteal.E and sReady[_E] then
            Cast(_E, enemy, true)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] then
            pos, b = PredictPos(enemy)
            if pos and GetDistance(pos) < data[1].range then
              Cast(_W)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.25)
              end
            end
          elseif GetDistance(enemy) < 250 and Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
            Cast(_R)
          end
        end
      end
    end
  end
