class "Veigar"
	function Veigar:__init()
		targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_MAGIC, false, true)
		data = {
		  [_Q] = { speed = 2000, delay = 0.25, range = 950, width = 70, collision = true, aoe = false, type = "linear"},
		  [_W] = { speed = math.huge, delay = 1.35, range = 900, width = 225, collision = false, aoe = false, type = "circular"},
		  [_E] = { speed = math.huge, delay = 0.5, range = 700, width = 80, collision = false, aoe = false, type = "circular"},
		  [_R] = { range = 2000}
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
		Config.Misc:addDynamicParam("Ea", "Auto E", SCRIPT_PARAM_ONOFF, true)
		Config.Misc:addParam("Ee", "Enemies to E (stun)", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
	end

	function Veigar:Combo()
		if sReady[_Q] and Config.Combo.Q then
			Cast(_Q, self.Target, 2)
		end
		if sReady[_W] and Config.Combo.W then
			Cast(_W, self.Target, 2)
		end
		if sReady[_E] and Config.Combo.E then
			local CastPos, HitChance = UPL:Predict(_E, myHero, self.Target)
			if CastPos and HitChance >= 1 then
				local ePos = CastPos + Vector(CastPos - (self.Target.isMoving and self.Target or myHero)):normalized()*225
				Cast(_E, ePos)
				DelayAction(function() Cast(_W, CastPos) end, 0.25)
			end
		end
	end