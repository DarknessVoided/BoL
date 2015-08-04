class "Talon"

  function Talon:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+30*level+0.3*(myHero.addDamage) end},
      [_W] = { speed = 900, delay = 0.5, range = 600, width = 200, collision = false, aoe = false, type = "cone", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(5+25*level+0.6*(myHero.addDamage)) end},
      [_E] = { range = 700},
      [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 650, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(70+50*level+0.75*(myHero.addDamage)) end}
    }
  end

  function Talon:Load()
    SetupMenu()
  end

  function Talon:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Talon:LastHit()
    if myHero:GetSpellData(_Q).currentCd == 0 and not self.Target and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          CastSpell(_Q, myHero:Attack(winion))
        end
      end
    end
    if myHero:GetSpellData(_Q).currentCd > 0 and not self.Target and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, winion)
        end
      end
    end
  end

  function Talon:LaneClear()
    if Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      if self.Target and GetDistance(self.Target) < data[0].range then
        CastSpell(_Q, myHero:Attack(self.Target))
      end
    end
    if Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      pos, hit = GetFarmPosition(data[1].range, data[1].width)
      if pos and hit > 0 then
        Cast(_W, pos)
      end
    end
  end

  function Talon:Combo()
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(self.Target, data[2].range) then
      Cast(_E, self.Target, true)
    end
    if myHero:CanUseSpell(_E) ~= READY and myHero:CanUseSpell(_R) == READY and Config.Combo.R and ValidTarget(self.Target, data[3].width) and self.Target.health < GetDmg(_Q, myHero, self.Target)+GetDmg(_W, myHero, self.Target)+GetDmg("AD", myHero, self.Target)+GetDmg(_R, myHero, self.Target) then
      Cast(_R, self.Target, true)
    end
  end

  function Talon:Harrass()
    if Config.Harrass.E and ValidTarget(Target, data[2].range) then
      if myHero:CanUseSpell(_E) == READY then
        Cast(_E, self.Target, true)  
      end
    elseif myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(self.Target, data[0].range) then
      CastSpell(_Q, myHero:Attack(self.Target))
    elseif myHero:CanUseSpell(_W) == READY and Config.Harrass.W and ValidTarget(self.Target, data[1].range) then
      Cast(_W, self.Target, false, true, 2)
    end
  end

  function Talon:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local dmg = 0
        local c = 0
        if Config.Killsteal.Q and sReady[_Q] then
            dmg = dmg + GetDmg(_Q, myHero, enemy)
            c = c + 1
        end
        if Config.Killsteal.W and sReady[_W] then
            dmg = dmg + GetDmg(_W, myHero, enemy)
            c = c + 1
        end
        if Config.Killsteal.E and sReady[_E] then
            dmg = dmg + GetDmg(_E, myHero, enemy)
            c = c + 1
        end
        dmg = dmg + (c > 0 and GetDmg("AD", myHero, enemy) or 0)
        dmg = dmg*((sReady[_E]) and 1+0.03*myHero:GetSpellData(_E).level or 1)+((sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") and Config.Killsteal.R and GetDmg(_R, myHero, enemy)*2 or 0)
        if dmg >= GetRealHealth(enemy) and EnemiesAround(enemy,750) < 3 then
          if Config.Killsteal.Q and myHero:GetSpellData(_Q).currentCd == 0 and GetDistance(enemy) < data[2].range then
            if GetDistance(enemy) < data[0].range then CastSpell(_Q, myHero:Attack(enemy)) end
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy, true})
              if Config.Killsteal.W and sReady[_W] then
                DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.5)
                if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.75)
                end
              end
            elseif Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.E and sReady[_E] and GetDistance(enemy) < data[2].range then
            Cast(_E, enemy, true)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] and GetDistance(enemy) < data[1].range then
            Cast(_W, enemy, false, true, 1)
            if Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
              DelayAction(function() Cast(_R) end, 0.25)
            end
          elseif GetDistance(enemy) < data[3].width and Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
            Cast(_R)
          end
        end
      end
    end
  end        