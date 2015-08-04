class "Vayne"

  function Vayne:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.25+0.05*level)*TotalDmg+TotalDmg end},
      [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return 10+10*level+((0.03+0.01*level)*target.maxHealth) end},
      [_E] = { speed = 2000, delay = 0.25, range = 1000, width = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 10+35*level+0.5*TotalDmg end},
      [_R] = { range = 1000}
    }
  end

  function Vayne:Load()
    SetupMenu(true)
    self.lastCalc = 0
    self.cdTable = {}
    self.roll = false
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
  end

  function Vayne:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, false)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, false)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addDynamicParam("Ea", "Auto E if can stun", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, 500, true, Config.Misc)
  end

  function Vayne:Tick()
    self.roll = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    if not Config.Misc.Ea or not sReady[_E] then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 1000) and enemy ~= nil and not enemy.dead then
        self:MakeUnitHugTheWall(enemy)
      end
    end
  end

  function Vayne:ProcessSpell()
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.roll then
        if sReady[_Q] then
          Cast(_Q, mousePos)
        end
      end
    end
  end

  function Vayne:MakeUnitHugTheWall(unit)
    if not unit or unit.dead or not unit.visible or not sReady[_E] then return end
    local x, y = VP:CalculateTargetPosition(unit, data[2].delay, data[2].width, data[2].speed, myHero)
    local b = unit.boundingRadius
    for _=0,(450)*Config.Misc.offsetE/100,b do
      local dir = x+(Vector(x)-myHero):normalized()*_
      if IsWall(D3DXVECTOR3(dir.x,dir.y,dir.z)) then
        Cast(_E, unit)
        return true
      end
    end
    return false
  end

  function Vayne:LastHit()
    target = GetJMinion(data[2].range)
    if not target then
      target = GetLowestMinion(data[2].range)
    end
    if sReady[_E] and Config.LastHit.E and GetDmg(_E,myHero,target) >= target.health then
      self:MakeUnitHugTheWall(target)
    end
  end

  function Vayne:LaneClear()
    target = GetJMinion(data[2].range)
    if not target then
      target = GetLowestMinion(data[2].range)
    end
    if sReady[_E] and Config.LaneClear.E then
      self:MakeUnitHugTheWall(target)
    end
  end

  function Vayne:Combo()
    if sReady[_E] and Config.Combo.E then
      self:MakeUnitHugTheWall(Target)
    end
  end

  function Vayne:Harrass()
    if sReady[_E] and Config.Harrass.E then
      self:MakeUnitHugTheWall(Target)
    end
  end

  function Vayne:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)*2 and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          self:MakeUnitHugTheWall(enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end