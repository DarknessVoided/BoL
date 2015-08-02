class "Orianna"

  function Orianna:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1200, delay = 0.250, range = 825, width = 175, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.5*AP end},
      [_W] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+0.7*AP end},
      [_E] = { speed = 1800, delay = 0.250, range = 825, width = 80, collision = false, aoe = false, type = "targeted", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.3*AP end},
      [_R] = { speed = math.huge, delay = 0.250, range = 0, width = 410, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+75*level+0.7*AP end}
    }
  end

  function Orianna:Load()
    SetupMenu()
  end

  function Orianna:Tick()
    if self.Ball and (GetDistance(self.Ball) <= myHero.boundingRadius*2+7 or GetDistance(self.Ball) > 1250) then
      self.Ball = nil
    end
    if Config.Misc.Ra then
      if enemies >= EnemiesAround(self.Ball or myHero, data[3].width-myHero.boundingRadius) then
        CastSpell(_R)
      end
    end
  end

  function Orianna:Draw()
    if self.Ball then
      DrawCircle(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 0x111111)
      for i=0,2 do
        LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (math.pi/4.5)*(i))
      end 
      LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
    end
  end

  function Orianna:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
  end

  function Orianna:CreateObj(obj)
    if obj and obj.name and obj.valid and obj.name == "TheDoomBall" then
      self.Ball = Vector(obj)
    end
  end

  function Orianna:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe then
      if spell.name == "OrianaIzunaCommand" then
        self.Ball = nil
      end
      if spell.name == "OrianaRedactCommand" then
        self.Ball = spell.target
      end
    end
  end

  function Orianna:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if sReady[_W] and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmgQ = GetDmg(_Q, myHero, winion)
        local MinionDmgW = GetDmg(_W, myHero, winion)
        if MinionDmgQ and MinionDmgW >= winion.health and (self.Ball and GetDistance(winion, self.Ball) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_W)
        end
        if sReady[_Q] and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= winion.health and (self.Ball and GetDistance(winion, self.Ball) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_Q, winion, 1.2)
          DelayAction(Cast, 0.25, {_W})
        end
      end
    end
  end

  function Orianna:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_W].width)
      if BestHit > 1 and self.Ball and GetDistance(self.Ball, BestPos) < 50 then 
        Cast(_W)
      end
    end
  end

  function Orianna:Combo()
    if sReady[_Q] and Config.Combo.Q then
      local CastPosition, HitChance, Pos = UPL:Predict(_Q, self.Ball or myHero, Target)
      if HitChance and HitChance >= 1.5 then
        local tPos = CastPosition + (Vector(CastPosition) - (self.Ball or myHero)):normalized()*(Target.boundingRadius/2)
        Cast(_Q, tPos)
      end
    end
    if sReady[_W] and not (Config.Combo.WE == 2 and sReady[_E]) and Config.Combo.W then
      self:CastW(Target)
    end
    if sReady[_E] and not (Config.Combo.WE == 1 and sReady[_W]) and Config.Combo.E and self.Ball then
      local ProjPoint,_,OnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, Target)
      if OnSegment then
        if GetDistanceSqr(ProjPoint, Target) < (Target.boundingRadius + data[2].width) ^ 2 then
          Cast(_E, myHero)
        end
      end
    end
    if sReady[_R] and GetRealHealth(Target) < self:CalcRComboDmg(Target) and Config.Combo.R then
      self:CastR(Target)
    end
  end

  function Orianna:CalcRComboDmg(unit)
    dmg = 0
    if myHero:GetSpellData(_Q).currentCd < 1.5 then
      dmg = dmg + GetDmg(_Q, myHero, unit)
    end
    return GetDmg(_R, myHero, unit)+dmg
  end

  function Orianna:Harrass()
    if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 1.5, self.Ball)
    end
    if sReady[_W] and not (Config.Harrass.WE == 2 and sReady[_E]) and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:CastW(Target)
    end
    if sReady[_E] and not (Config.Harrass.WE == 1 and sReady[_W]) and Config.Harrass.E and self.Ball and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      local ProjPoint,_,OnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, Target)
      if OnSegment then
        if GetDistanceSqr(ProjPoint, Target) < (Target.boundingRadius + data[2].width) ^ 2 then
          Cast(_E, myHero)
        end
      end
    end
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local Ball = self.Ball or myHero
        if sReady[_Q] and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, Target, 1.5, Ball)
        elseif sReady[_W] and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W then
          self:CastW(enemy)
        elseif sReady[_E] and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and self.Ball and GetDistance(self.Ball) > 150 and VectorPointProjectionOnLineSegment(self.Ball, myHero, enemy) and GetDistance(self.Ball)-self.Ball.boundingRadius > GetDistance(enemy) then
          Cast(_E, myHero)
        elseif sReady[_R] and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif sReady[_R] and GetRealHealth(enemy) < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
          self:CastR(enemy)
          DelayAction(Cast, data[3].delay, {_Q, Target, 1.5, Ball})
          DelayAction(function() self:CastW(enemy) end, data[3].delay+data[0].delay+GetDistance(Ball,enemy)/data[0].speed)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Orianna:CastW(unit)
    if myHero:CanUseSpell(_W) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local pos, b = PredictPos(unit)
    if pos and GetDistance(pos, Ball) < data[1].width-b then 
      Cast(_W)
    end  
  end

  function Orianna:CastR(unit)
    if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local pos, b = PredictPos(unit, 0.5)
    if pos and GetDistance(pos, Ball) < data[3].width-b then 
      Cast(_R) 
    end  
  end