

class "Blitzcrank"

  function Blitzcrank:__init()
    require "Collision"
    self.Forcetarget = nil
    data = {
      [_Q] = { speed = 1800, delay = 0.25, range = 1150, width = 70, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 55*level+25+AP end},
      [_W] = { range = 25000},
      [_E] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*TotalDmg end},
      [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 600, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 125*level+125+AP end}
    }
    self.Col = Collision(data[0].range, data[0].speed, data[0].delay, data[0].width+30)
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[0].range, DAMAGE_MAGIC, false, true)
    self.Target = nil
  end

  function Blitzcrank:Load()
    SetupMenu()
  end

  function Blitzcrank:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    if Smite ~= nil then Config.Misc:addParam("S", "Smitegrab", SCRIPT_PARAM_ONOFF, true) end
    AddGapcloseCallback(_Q, data[0].range, false, Config.Misc)
  end

  function Blitzcrank:Combo()
    local target = self.Target
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance >= 1 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        if not Mcol then
          Cast(_Q, CastPosition)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and Config.Misc.S and Mcol and #mcol == 1 then
          local minion = mcol[1]
          if minion and GetDistance(minion) < 600 then
            Cast(_Q, CastPosition)
            DelayAction(function() Cast(Smite, minion) end, (GetDistance(minion) / 2) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Combo.E and (GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range)) then
      Cast(_E)
    end

    if target and myHero:CanUseSpell(_R) == READY and Config.Combo.R then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
        Cast(_R)
      end
    end
  end

  function Blitzcrank:Harrass()
    local target = self.Target
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end
    
    if target and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.5 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        if not Mcol then
          Cast(_Q, CastPosition)
        elseif Smite and Config.Misc.S and #mcol == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = mcol[1]
          if minion and GetDistance(minion) < 600 then
            Cast(_Q, CastPosition)
            DelayAction(function() Cast(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and (GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range)) then
      Cast(_E)
    end
  end

  function Blitzcrank:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range-enemy.boundingRadius) then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Blitzcrank:Draw()
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end
    
    if self.Forcetarget ~= nil then
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, data[0].width, ARGB(255, 0, 255, 0))
    end
    
    if Config.Draws.Q and myHero:CanUseSpell(_Q) and target ~= nil then
      local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if CastPosition then
        DrawLFC(CastPosition.x, CastPosition.y, CastPosition.z, data[0].range, ARGB(255, 255, 0, 0))
        DrawLine3D(myHero.x, myHero.y, myHero.z, CastPosition.x, CastPosition.y, CastPosition.z, 1, ARGB(155,55,255,55))
        DrawLine3D(myHero.x, myHero.y, myHero.z, target.x,       target.y,       target.z,       1, ARGB(255,55,55,255))
      end
    end
  end

  function Blitzcrank:WndMsg(Msg, Key)
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
          ScriptologyMsg("New target selected: "..starget.charName)
        end
      end
    end
  end
