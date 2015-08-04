class "Malzahar"

  function Malzahar:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = math.huge, delay = 1, range = 900, width = 85, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+55*level+0.8*AP end},
      [_W] = { speed = math.huge, delay = 0.5, range = 800, width = 250, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return (0.04+0.01*level)*target.maxHealth+AP/100 end},
      [_E] = { range = 650, dmgAP = function(AP, level, Level, TotalDmg, source, target) return (20+60*level)/8+0.1*AP end},
      [_R] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.26*AP end}
    }
  end

	function Malzahar:Load()
		SetupMenu()
	end

	function Malzahar:Menu()
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
		Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
		Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
		Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
		Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
	end

	function Malzahar:LastHit()
		if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
			for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
				local QMinionDmg = GetDmg(_Q, myHero, minion)
				if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
					Cast(_Q, minion, 1.2)
				end
			end
		end
		if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then    
			for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
				local WMinionDmg = GetDmg(_W, myHero, minion)      
				if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range) then
					Cast(_W, minion, 1.5)
				end      
			end    
		end  
		if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
			for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
				local EMinionDmg = GetDmg(_E, myHero, minion)
				if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
					Cast(_E, minion)
				end
			end
		end 
	end

  function Malzahar:LaneClear()
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[0].range)
        if minionTarget ~= nil then
          Cast(_Q, minionTarget, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
        if BestHit > 1 then 
          Cast(_W, BestPos)
        end
      end  
      if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget)
        end
      end 
  end

  function Malzahar:Combo()
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target)
      end
      if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
        Cast(_R, Target)
      end
  end

  function Malzahar:Harrass()
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target)
      end
  end

  function Malzahar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)*2.5 and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end        