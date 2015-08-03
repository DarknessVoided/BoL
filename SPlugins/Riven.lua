class "Riven"

  function Riven:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 310, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+(0.35+0.05*level)*TotalDmg end},
      [_W] = { range = 265, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+TotalDmg end},
      [_E] = { range = 390},
      [_R] = { range = 930, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (40+40*level+0.6*source.addDamage)*(math.min(3,math.max(1,4*(target.maxHealth-target.health)/target.maxHealth))) end},
    }
    self.Target = nil
    self.QAA = false
    self.QCast = 0
  end

  function Riven:Load()
    SetupMenu(true)
    DelayAction(function()
      LoadSWalk() 
      RemoveOw()
    end, 0.25)
    DelayAction(function()      
      _G.loadedOrb:AddReset(_Q, RESET_PREDICT)
      _G.loadedOrb:AddReset(_W, RESET_SELF)
    end, 2.5)
  end

  function Riven:Menu()
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
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("QAA", "Manual QAA", SCRIPT_PARAM_ONOFF, false)
    Config.Misc:addDynamicParam("Wa", "Auto stun with W", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Wae", "Auto stun if X enemies", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
    AddGapcloseCallback(_W, data[1].range, false, Config.Misc)
  end

  function Riven:Tick()
    self.QAA = Config.Misc.QAA or (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
  end

  function Riven:Msg(Msg, Key)
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
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
  end

  function Riven:Draw()
    local barPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
    local posX = barPos.x - 35
    local posY = barPos.y - 50
    DrawText("Q stacks: "..self.QCast, 18, posX, posY, ARGB(255, 250, 255, 250))
    DrawText("Last AA: "..loadedOrb.orbTable.lastAA, 18, posX, posY+20, ARGB(255, 250, 255, 250))
    local rwu = ((loadedOrb.orbTable.lastAA+loadedOrb.orbTable.windUp)-os.clock())
    DrawText("Remaining Windup: "..(rwu > 0 and rwu or 0), 18, posX, posY+40, ARGB(255, 250, 255, 250))
    if Config.Draws.Q and sReady[_Q] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[0].range, ARGB(105,155,155,155))
    end
    if Config.Draws.W and sReady[_W] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[1].range, ARGB(105,155,155,155))
    end
    if Config.Draws.E and sReady[_E] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range, ARGB(255,255,255,255))
    end
    if Config.Draws.R and sReady[_R] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[3].range, ARGB(255,255,255,255)) 
    end
    if self.movePos then
      local color = IsWall(D3DXVECTOR3(self.movePos.x,self.movePos.y,self.movePos.z)) and ARGB(255,255,0,0) or ARGB(255,255,255,255)
      DrawCircle(self.movePos.x, self.movePos.y, self.movePos.z, 75, color) 
      self.movePos = nil
    end
    if Config.Draws.DMG then
      for i,k in pairs(GetEnemyHeroes()) do
        local enemy = k
        if ValidTarget(enemy) then
          local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
          local posX = barPos.x - 35
          local posY = barPos.y - 50
          DrawText(killTextTable[enemy.networkID].indicatorText, 18, posX, posY, ARGB(255, 250, 255, 250))
          DrawText(killTextTable[enemy.networkID].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 50, 50))
        end
      end
    end
  end

  function Riven:DmgP(unit, ad)
    return myHero:CalcDamage(unit, 5+math.max(5*math.floor((myHero.level+2)/3)+10,10*math.floor((myHero.level+2)/3)-15)*ad/100)
  end

  function Riven:CalcComboDmg(target, damage, disableUlt)
    local unit = {pos = target.pos, armor = target.armor, magicArmor = target.magicArmor, maxHealth = target.maxHealth, health = target.health}
    local dmg = damage or 0
    local ad = myHero.totalDamage*((disableUlt and (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine")) and 1 or 1.2)
    local me = {ap = myHero.ap, level = myHero.level, totalDamage = ad, armorPen = myHero.armorPen, armorPenPercent = myHero.armorPenPercent, magicPen = myHero.magicPen, magicPenPercent = myHero.magicPenPercent}
    if sReady[_Q] then
      dmg = dmg + GetDmg(_Q,me,unit)*3+GetDmg("Tiamat",me,unit)+GetDmg("AD",me,unit)*3+self:DmgP(target, ad)*3
    end
    if sReady[_W] then
      dmg = dmg + GetDmg(_W,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
    end
    if (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine") and not disableUlt then
      unit.health = unit.health-dmg
      dmg = dmg + GetDmg(_R,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
    end
    return dmg
  end