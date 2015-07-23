
class "Orianna"

  function Orianna:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    LoadUPL()
  end

  function Orianna:Load()
    ScriptologyConfig:addSubMenu("Target Selector", "ts")
    ScriptologyConfig.ts:addTS(targetSel)
    ArrangeTSPriorities()
    self:Menu()
    MakeData()
    self.Ball = nil
  end

  function Orianna:Tick()
    if objHolder["TheDoomBall"] and (GetDistance(objHolder["TheDoomBall"], myHero.pos) <= myHero.boundingRadius*2+7 or GetDistance(objHolder["TheDoomBall"]) > 1250) then
      objHolder["TheDoomBall"] = nil
    end
    if Config.Misc.Ra then
      local enemies = 0
      if objHolder["TheDoomBall"] then
        enemies = EnemiesAround(objHolder["TheDoomBall"], data[3].width-myHero.boundingRadius)
      else
        enemies = EnemiesAround(myHero, data[3].width-myHero.boundingRadius)
      end
      if enemies >= Config.Misc.Re then
        CastSpell(_R)
      end
    end
  end

  function Orianna:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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

  function Orianna:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmgQ = GetDmg(_Q, myHero, winion)
        local MinionDmgW = GetDmg(_W, myHero, winion)
        if MinionDmgQ and MinionDmgW >= winion.health and (objHolder["TheDoomBall"] and GetDistance(winion, objHolder["TheDoomBall"]) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_W)
        end
        if myHero:CanUseSpell(_Q) == READY and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= winion.health and (objHolder["TheDoomBall"] and GetDistance(winion, objHolder["TheDoomBall"]) < data[1].width or GetDistance(winion) < data[1].width) then
            Cast(_Q, winion, 1.2)
            DelayAction(Cast, 0.25, {_W})
        end
      end
    end
  end

  function Orianna:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos, false)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_W].width)
      if BestHit > 1 and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"], BestPos) < 50 then 
        Cast(_W)
      end
    end
  end

  function Orianna:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
      Cast(_Q, Target, 1.5, objHolder["TheDoomBall"])
    end
    if myHero:CanUseSpell(_W) == READY and Config.Combo.W then
      self:CastW(Target)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
      Cast(_E, myHero, true)
    end
    if myHero:CanUseSpell(_R) == READY and GetRealHealth(Target) < self:CalcRComboDmg(Target) and Config.Combo.R then
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
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 1.5, objHolder["TheDoomBall"])
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:CastW(Target)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
      Cast(_E, myHero)
    end
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local Ball = objHolder["TheDoomBall"] or myHero
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, Target, 1.5, Ball)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W then
          self:CastW(enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, enemy) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius > GetDistance(enemy) then
          Cast(_E, myHero)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
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
    local Ball = objHolder["TheDoomBall"] or myHero
    local pos, b = PredictPos(unit)
    if pos and GetDistance(pos, Ball) < data[1].width-b then 
      Cast(_W)
    end  
  end

  function Orianna:CastR(unit)
    if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
    local Ball = objHolder["TheDoomBall"] or myHero
    local pos, b = PredictPos(unit, 0.5)
    if pos and GetDistance(pos, Ball) < data[3].width-b then 
      Cast(_R) 
    end  
  end