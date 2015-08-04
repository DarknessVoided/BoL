class "Ryze"

  function Ryze:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1875, delay = 0.25, range = 900, width = 55, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.55*AP+(0.015+0.05*level)*source.maxMana end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 60+20*level+0.4*AP+0.025*myHero.maxMana end},
      [_E] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 34+16*level+0.3*AP+0.02*myHero.maxMana end},
      [_R] = { range = 900}
    }
  end

  function Ryze:Load()
    SetupMenu()
    self.passiveTracker = 0
  end

  function Ryze:Draw()
    if self.passiveTracker then
      local barPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
      local posX = barPos.x - 35
      local posY = barPos.y + 50
      DrawText(""..self.passiveTracker, 25, posX, posY, ARGB(255, 255, 0, 0)) 
    end
  end

  function Ryze:Menu()
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
    Config.LaneClear:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaR", "Mana R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    AddGapcloseCallback(_W, data[1].range, true, Config.Misc)
  end

  function Ryze:Msg(Msg, Key)
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

  function Ryze:ApplyBuff(unit, buff) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 1 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:UpdateBuff(unit, buff, stacks) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = stacks end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:RemoveBuff(unit, buff) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 0 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 0 end 
  end

  function Ryze:LastHit()
    target = GetJMinion(900)
    if not target then
      target = GetLowestMinion(900)
    end
    if not target then return end
    if ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      Cast(_Q, target, false, true, 1)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_W, myHero, target) then 
      Cast(_W, target, true)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      Cast(_E, target, true)
    end
  end

  function Ryze:LaneClear()
    target = GetJMinion(900)
    if not target then
      target = GetLowestMinion(900)
    end
    if target and GetDistance(target) < 900 then 
      if Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_R] and Config.LaneClear.R and Config.LaneClear.manaR < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_R) 
        elseif sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
        end
      else 
        if Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then CastSpell(_W, target) end
        if Config.LaneClear.E and Config.LaneClear.manaE < myHero.mana/myHero.maxMana*100 then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config.LaneClear.R and Config.LaneClear.manaR < myHero.mana/myHero.maxMana*100 then 
        CastSpell(_R) 
      end 
    end 
  end

  function Ryze:Combo()
    target = Target
    if Forcetarget ~= nil and ValidTarget(Forcetarget, 900) then 
      target = Forcetarget 
    end 
    if target and GetDistance(target) < 900 then 
      if Config.Combo.Q then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if sReady[_Q] and Config.Combo.Q then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_R] and Config.Combo.R then 
          CastSpell(_R) 
        elseif sReady[_W] and Config.Combo.W then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.Combo.E then 
          CastSpell(_E, target) 
        end 
      else
        if Config.Combo.W then CastSpell(_W, target) end
        if Config.Combo.E then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config.Combo.R then 
        CastSpell(_R) 
      end 
    end 
  end

  function Ryze:Harrass()
    target = Target
    if Forcetarget ~= nil and ValidTarget(Forcetarget, 900) then 
      target = Forcetarget 
    end 
    if target and GetDistance(target) < 900 then 
      if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_W] and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
        end
      else 
        if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then CastSpell(_W, target) end
        if Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then CastSpell(_E, target) end 
      end 
    end 
  end

  function Ryze:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_W, enemy, true)
          DelayAction(function() Cast(_E, enemy, true) end, 0.25)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Ryze:DmgCalc()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageAA = GetDmg("AD", myHero, enemy)
        local damageQ  = GetDmg(_Q, myHero, enemy)
        local damageW  = GetDmg(_W, myHero, enemy)
        local damageE  = GetDmg(_E, myHero, enemy)
        local damageR  = GetDmg(_R, myHero, enemy)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        local ready    = 0
        for _,k in pairs({_Q,_W,_E,_R}) do 
          if myHero:CanUseSpell(k) == READY then 
            ready = ready + 1 
          end  
        end 
        local mult     = self.passiveTracker >= (6-ready) and 3 or 1
        if damageQ > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
        end
        if damageW > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."W"
        end
        if damageE > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."E"
        end
        if self.passiveTracker >= 4 then
          killTextTable[enemy.networkID].indicatorText = "Combo"
        end
        if GetRealHealth(enemy) < mult*(damageQ+damageW+damageE) then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Kill"
        end
        if GetRealHealth(enemy) > mult*(damageQ+damageW+damageE) then
          local neededAA = math.ceil(100*(damageQ+damageW+damageE)/(GetRealHealth(enemy)))
          killTextTable[enemy.networkID].indicatorText = neededAA.." % Combodmg"
        end
        local enemyDamageAA = GetDmg("AD", enemy, myHero)
        local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
        if enemyNeededAA ~= 0 then         
          killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
      end
    end
  end