class "Veigar"
	function Veigar:__init()
		targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_MAGIC, false, true)
		data = {
		  [_Q] = { speed = 1200, delay = 0.5, range = 1150, width = 40, collision = true, aoe = false, type = "linear"},
		  [_W] = { delay = 1.5, range = 5000},
		  [_E] = { range = 1000},
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
		Config.Misc:addDynamicParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
		Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
	end