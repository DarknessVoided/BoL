class "Yasuo"

  function Yasuo:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[3].range, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 500, speed = math.huge, delay = 0.125, width = 55, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20*level+TotalDmg-10 end},
      [_W] = { range = 350},
      [_E] = { range = 475, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+20*level+AP end},
      [_R] = { range = 1200, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 100+100*level+1.5*TotalDmg end},
      [-2] = { range = 1200, speed = 1200, delay = 0.125, width = 65, type = "linear" }
    }
  end

  function Yasuo:Load()
    SetupMenu()
    self.passiveTracker = false
    self.passiveName = "yasuoq3w"
  end

  function Yasuo:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = true
    end
  end

  function Yasuo:UpdateBuff(unit,buff,stacks)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = true
    end
  end

  function Yasuo:RemoveBuff(unit,buff)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = false
    end
  end

  function Yasuo:Tick()
    if Config.Misc.Flee then
      myHero:MoveTo(mousePos.x,mousePos.z)
      self:Move(mousePos)
    end
    if self.passiveTracker then
      data[0].range = 1200
    else
      data[0].range = 500
    end
    if loadedEvade then
      if sReady[_W] and (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and _G.Evade and loadedEvade.m and loadedEvade.m.speed ~= math.huge and Config.Windwall[loadedEvade.m.source.charName..loadedEvade.str[loadedEvade.m.slot]] then
        _G.Evade = false
        local wPos = myHero + (Vector(loadedEvade.m.startPos) - myHero):normalized() * data[1].range 
        loadedEvade.m = nil
        Cast(_W, wPos)
      end
    end
  end

  function Yasuo:Move(x)
    if sReady[_E] then
      local minion = nil
      for _,k in pairs(Mobs.objects) do
        local kPos = myHero+(Vector(k)-myHero):normalized()*data[2].range
        if not minion and k and GetStacks(k) == 0 and GetDistanceSqr(k) < data[2].range*data[2].range and GetDistanceSqr(kPos,x) < GetDistanceSqr(myHero,x) then minion = k end
        if minion and k and GetStacks(k) == 0 and GetDistanceSqr(k) < data[2].range*data[2].range then
          local mPos = myHero+(Vector(minion)-myHero):normalized()*data[2].range
          if GetDistanceSqr(mPos,x) < GetDistanceSqr(kPos,x) and GetDistanceSqr(mPos,x) < GetDistanceSqr(myHero,x) then
            minion = k
          end
        end
      end
      if minion then
        Cast(_E, minion, true)
        return true
      end
      return false
    end
  end

  function Yasuo:ProcessSpell(unit, spell)
    if (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and unit and unit.team ~= myHero.team and GetDistance(unit) < 1500 then
      if myHero == spell.target and spell.name:lower():find("attack") and (unit.range >= 450 or unit.isRanged) and Config.Misc.Waa and GetDmg("AD",unit,myHero)/myHero.maxHealth > 0.1337 then
        local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
        Cast(_W, wPos)
      elseif spell.endPos and not spell.target and not loadedEvade or (_G.Evadeee_Loaded and _G.Evadeee_impossibleToEvade) then
        local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
        if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
          local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
          Cast(_W, wPos)
        end
      end
    end
  end

  function Yasuo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
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
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("Waa", "Auto Shield AAs with W", SCRIPT_PARAM_ONOFF, true)
    DelayAction(function()
        if loadedEvade then
          Config:addSubMenu("Windwall", "Windwall")
          for _,k in pairs(GetEnemyHeroes()) do
            Config.Windwall:addParam(k.charName, k.charName, SCRIPT_PARAM_INFO, "")
            for i=0,3 do
              if loadedEvade.data and loadedEvade.data[k.charName] and loadedEvade.data[k.charName][i] and loadedEvade.data[k.charName][i].name and loadedEvade.data[k.charName][i].name ~= "" then
                Config.Windwall:addParam(k.charName..loadedEvade.str[i], "Block "..loadedEvade.str[i], SCRIPT_PARAM_ONOFF, true)
              end
            end
            Config.Windwall:addParam("info", "", SCRIPT_PARAM_INFO, "")
          end
        end
      end, 3)
  end

  function Yasuo:LastHit()
    local minion = GetLowestMinion(data[2].range)
    if minion and GetStacks(minion) == 0 and minion.health < GetDmg(_E, myHero, minion) and loadedOrb.State[_E] then
      Cast(_E, minion)
    end
    if minion and GetStacks(minion) == 0 and minion.health < GetDmg(_Q, myHero, minion)+GetDmg(_E, myHero, minion) and sReady[_Q] and sReady[_E] and loadedOrb.State[_Q] and loadedOrb.State[_E] then
      Cast(_E, minion)
      DelayAction(function() Cast(_Q, minion) end, 0.125)
    end
  end

  function Yasuo:LaneClear()
    -- mad?
  end

  function Yasuo:Combo()
    if not self.Target then self.Target = Target end
    if not self.Target then return end
    if GetDistance(self.Target) > loadedOrb.myRange and Config.Combo.E then
      if self:Move(self.Target) then
        if sReady[_Q] then
          DelayAction(function() Cast(_Q, self.Target) end, 0.125)
        end
      elseif GetDistance(self.Target) < data[2].range and GetDistance(self.Target) > data[2].range/2 and GetStacks(self.Target) == 0 then
        Cast(_E, self.Target)
        if sReady[_Q] then
          DelayAction(function() Cast(_Q, self.Target) end, 0.125)
        end
      end
    end
    if sReady[_R] and Config.Combo.R then
      if sReady[_Q] and GetDistance(self.Target) < 500 then
        myHero:Attack(self.Target)
      else
        Cast(_R, self.Target)
      end
    end
    if sReady[_Q] and self.passiveTracker and GetDistance(self.Target) < 1200 then
      local CastPosition, HitChance, Position = UPL:Predict(-2, myHero, self.Target)
      if HitChance >= 2 then
        Cast(_Q, CastPosition)
      end
    end
  end

  function Yasuo:Harrass()
    if not self.Target then return end
    if GetDistance(self.Target) > loadedOrb.myRange and GetStacks(self.Target) == 0 and Config.Harrass.E then
      Cast(_E, self.Target)
    end
  end

  function Yasuo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if enemy.y > myHero.y+25 and Config.Killsteal.R and GetDmg(_R,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[3].range then
          Cast(_R, enemy)
        elseif Config.Killsteal.Q and GetDmg(_Q,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[0].range then
          Cast(_Q, enemy, 1)
        elseif Config.Killsteal.Q and self.passiveTracker and GetDmg(_Q,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < 1200 then
          local CastPosition, HitChance, Position = UPL:Predict(-2, myHero, enemy)
          if HitChance >= 2 then
            Cast(_Q, CastPosition)
          end
        elseif Config.Killsteal.E and GetDmg(_E,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[2].range then
          Cast(_E, enemy)
        elseif Config.Killsteal.Q and Config.Killsteal.E and GetDmg(_Q,myHero,enemy)+GetDmg(_E,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_Q) end, 0.25)
        end
      end
    end
  end