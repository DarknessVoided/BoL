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
    if Config.Misc.Flee then
      myHero:MoveTo(mousePos.x, mousePos.z)
      if sReady[_E] then
        Cast(_E, mousePos)
      end
      if not sReady[_E] and sReady[_Q] and self.EDelay + 350 < GetTickCount() then
        Cast(_Q, mousePos)
      end
    end
    if Config.Misc.Jump then
      self.jumpPos = myHero + (Vector(mousePos) - myHero):normalized() * 50
      self.movePos = myHero + (Vector(mousePos) - myHero):normalized() * 225
      if self.QCast < 2 then
        Cast(_Q, myHero.pos)
      end
      if not IsWall(D3DXVECTOR3(self.jumpPos.x,self.jumpPos.y,self.jumpPos.z)) then
        myHero:MoveTo(self.movePos.x, self.movePos.z)
      else
        if sReady[_Q] then
          Cast(_Q, mousePos)
        end
      end
    end
    for _,k in pairs(GetEnemyHeroes()) do
      if sReady[_W] and ValidTarget(k, data[_W].range) and (Config.Misc.Wae <= EnemiesAround(k, data[_W].range)) then
        Cast(_W)
      end
    end
  end

  function Riven:ProcessSpell(unit,spell)
    if unit and unit.isMe and spell then
      if spell.name == "RivenTriCleave" then
        self.QCast = self.QCast + 1
        DelayAction(function() if not sReady[_Q] then self.QCast = 0 end end, 4)
      elseif spell.name == "RivenFeint" then
        self.EDelay = GetTickCount()
      end
    end
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
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
  end

  function Riven:DmgCalc()
    if not Config.Draws.DMG then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageC  = self:CalcComboDmg(enemy, 0, not Config.Combo.R)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        if GetRealHealth(enemy) < damageC+damageI then
          killTextTable[enemy.networkID].indicatorText = "Kill!!"
        else
          local neededAA = math.floor(100 * (damageC+damageI) / (GetRealHealth(enemy)))
          killTextTable[enemy.networkID].indicatorText = neededAA.."% Combo dmg"
        end
        local enemyDamageAA = GetDmg("AD", enemy, myHero)
        local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
        if enemyNeededAA ~= 0 then         
          killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
      end
    end
  end

  function Riven:Draw()
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
    if self.Forcetarget then
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
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

  function Riven:Combo()
    if GetDistance(self.Target) > loadedOrb.myRange + 30 and sReady[_E] and Config.Combo.E and GetDistance(self.Target) < data[2].range then
      if Config.Combo.R and self:CalcComboDmg(self.Target, 0) >= self.Target.health and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
        Cast(_E, self.Target.pos)
        DelayAction(function() Cast(_R) end, 0.075) 
      else
        Cast(_E, self.Target.pos)
      end
    end
    if myHero.isWindingUp and Config.Combo.R and GetDistance(self.Target) < data[2].range and self:CalcComboDmg(self.Target, 0) >= self.Target.health and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then Cast(_R) end
    if myHero.isWindingUp and (GetDmg(_R,myHero,self.Target)+GetDmg(_Q,myHero,self.Target)+GetDmg("AD",myHero,self.Target)+self:DmgP(self.Target,myHero.totalDamage*1.2) >= self.Target.health) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target.pos) end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Combo.W then
      Cast(_W)
    end
    if sReady[_Q] and not sReady[_E] and GetDistance(self.Target) > loadedOrb.myRange + 30 then
      if self.EDelay + 300 < GetTickCount() and self.QDelay + 1.2 < os.clock() then
        Cast(_Q, self.Target.pos)
      end
    end
  end

  function Riven:Harrass()
    if GetDistance(self.Target) > loadedOrb.myRange + 30 and sReady[_E] and Config.Harrass.E and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target.pos)
    end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Harrass.W then
      Cast(_W)
    end
  end

  function Riven:LaneClear()
    local minion = GetJMinion(450)
    if not minion then
      minion = GetClosestMinion(450)
    end
    if GetDistance(minion) > loadedOrb.myRange + 30 and sReady[_E] and Config.LaneClear.E and GetDistance(minion) < data[2].range then
      Cast(_E, minion.pos)
    end
    if sReady[_E] and minion.team > 200 then
      Cast(_E, minion.pos)
    end
    if sReady[_W] and GetDistance(minion) < data[1].range and Config.LaneClear.W then
      Cast(_W)
    end
    if sReady[_Q] and GetDistance(minion) > loadedOrb.myRange + 36 then
      Cast(_Q, minion.pos)
    end
  end

  function Riven:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local health = GetRealHealth(enemy)
        if Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end