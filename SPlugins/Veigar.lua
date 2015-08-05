class "Veigar"
	function Veigar:__init()
		targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_MAGIC, false, true)
		data = {
		  [_Q] = { speed = 2000, delay = 0.25, range = 950, width = 70, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.6*AP end},
		  [_W] = { speed = math.huge, delay = 1.2, range = 900, width = 225, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 70+50*level+AP end},
		  [_E] = { speed = math.huge, delay = 0.5, range = 725, width = 275, collision = false, aoe = false, type = "circular"},
		  [_R] = { range = 650, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 125+125*level+AP+target.ap end} -- 250 / 375 / 500 (+ 100% AP) (+ 80% of target's AP)
		}
		self.Target = nil
	end

  	function Veigar:Load()
    	SetupMenu()
    end

	function Veigar:Menu()
		Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
		Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
		Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
		Config.Combo:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
		Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
		Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
		Config.Harrass:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
		Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
		Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
		if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
		Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
		Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
		Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
		Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
		Config.Misc:addDynamicParam("Ea", "Auto E", SCRIPT_PARAM_ONOFF, true)
		Config.Misc:addParam("Ee", "Enemies to E (stun)", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
	end

	function Veigar:Combo()
		if sReady[_Q] and Config.Combo.Q then
			Cast(_Q, self.Target, 2)
		end
		if sReady[_E] and Config.Combo.E and sReady[_W] and Config.Combo.W then
    		local pos, b = PredictPos(self.Target, 0.125)
    		if GetDistance(pos) < data[_E].range+350 then
    			local ep  = Vector(self.Target) + (Vector(pos) - (self.Target.isMoving and self.Target or myHero)):normalized() * 350
    			local epl = (Vector(myHero) - ep):len()
    			local ept = ep
    			ep = ep + (Vector(myHero) - ep):normalized() * math.min(epl, data[_E].range)
    			ep = GetDistance(ep) == 0 and ept or ep
    			Cast(_E, ep)
				if sReady[_W] and Config.Combo.W then 
					DelayAction(function() Cast(_W, pos) end, 0.33) 
				end
    		end
		elseif sReady[_W] and Config.Combo.W and not Config.Combo.WE then
			Cast(_W, self.Target, 2)
		end
		if sReady[_R] and Config.Combo.R and target.health < GetDmg(_R, myHero, target) then
			Cast(_R, self.Target)
		end
	end

	function Veigar:Harrass()
		if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
			Cast(_Q, self.Target, 2)
		end
		if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
    		local pos, b = PredictPos(self.Target, 0.125)
    		if GetDistance(pos) < data[_E].range+350 then
    			local ep  = Vector(self.Target) + (Vector(pos) - (self.Target.isMoving and self.Target or myHero)):normalized() * 350
    			local epl = (Vector(myHero) - ep):len()
    			local ept = ep
    			ep = ep + (Vector(myHero) - ep):normalized() * math.min(epl, data[_E].range)
    			ep = GetDistance(ep) == 0 and ept or ep
    			Cast(_E, ep)
				if sReady[_W] and Config.Combo.W then 
					DelayAction(function() Cast(_W, pos) end, 0.33) 
				end
    		end
		elseif sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and not Config.Harrass.WE then
			Cast(_W, self.Target, 2)
		end
	end

	function Veigar:LastHit()
		if sReady[_Q] and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana then
		    local BestPos 
		    local BestHit = 0
		    source = source or myHero
		    local objects = minionManager(MINION_ENEMY, data[0].range, source, MINION_SORT_HEALTH_ASC).objects
		    for i, object in ipairs(objects) do
		      local EndPos = Vector(source) + range * (Vector(object) - Vector(source)):normalized()
		      local hit = self:CountObjectsOnLineSegment(source, EndPos, data[0].width, objects)
		      if hit > BestHit then
		        BestHit = hit
		        BestPos = object
		        if BestHit == #objects then
		          break
		        end
		      end
		    end
		    if BestHit > 0 then
		    	Cast(_Q, BestPos)
		    end
		end
	end

	function Veigar:CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
	    local n = 0
	    for i, object in ipairs(objects) do
	      local pointSegment, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
	      local w = width
	      if isOnSegment and object.health <= GetDmg(_Q, myHero, object) and GetDistanceSqr(pointSegment, object) < w * w and GetDistanceSqr(StartPos, EndPos) > GetDistanceSqr(StartPos, object) then
	        n = n + 1
	      end
	    end
	    return n
	end

	function Veigar:LaneClear()
		if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
			local BestPos, BestHit = GetLineFarmPosition(data[0].range, data[0].width)
			if BestPos and BestHit > 0 then
				Cast(_Q, BestPos)
			end
		end
		if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
			local BestPos, BestHit = GetFarmPosition(data[1].range, data[1].width)
			if BestPos and BestHit > 0 then
				Cast(_W, BestPos)
			end
		end
	end

	function Veigar:Killsteal()
	    for k,enemy in pairs(GetEnemyHeroes()) do
	      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
	        local health = GetRealHealth(enemy)
	        if myHero:CanUseSpell(_Q) == READY and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) and GetDistance(enemy) < data[0].range then
	          Cast(_Q, enemy, 2)
	        elseif myHero:CanUseSpell(_R) == READY and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) and GetDistance(enemy) < data[3].range then
	          Cast(_R, enemy)
	        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
	          CastSpell(Ignite, enemy)
	        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
	          CastSpell(Smite, enemy)
	        end
	      end
	    end
	end