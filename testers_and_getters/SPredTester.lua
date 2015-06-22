require("SPrediction")
SP = SPrediction()
local sts
local Target
local spells = {_Q, _W, _E, _R}
local str    = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }

function OnLoad() 
  	Config = scriptConfig("Scriptology Prediction Tester", "SPT")
  	Config:addParam("s", "Shoot", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  	Config:addParam("hc","Hitchance", SCRIPT_PARAM_SLICE, 2, 0, 3, 0)
  	for _,k in pairs(spells) do
  		Config:addParam(""..k, "Spell "..str[k], SCRIPT_PARAM_ONOFF, false)
  	end
  	sts = TargetSelector(TARGET_LESS_CAST, 3500, DAMAGE_MAGIC)
  	print("<font color=\"#6699ff\"><b>[Scriptology Prediction Tester]: </b></font> <font color=\"#FFFFFF\">Loaded.</font>") 
end

function OnTick()
	sts:update()
	Target = sts.target
	for _,spell in pairs(spells) do
		if Config[""..spell] then
			local speed, delay, range, width, coll, type = SP:GetData(spell, myHero)
			for _,v in pairs(GetEnemyHeroes()) do
				if not v.dead then 
					if range and width and GetDistance(myHero,v) <= range+width and GetDistance(myHero,v) >=75 and (not Target or v.health < Target.health) then Target = v end
				end
			end
		end
	end
	if Config.s then
		if Target ~= nil then
  			for _,spell in pairs(spells) do
  				if Config[""..spell] then
					CastPosition, HitChance = SP:Predict(spell, myHero, Target)
					if CastPosition and HitChance >= Config.hc then
						CastSpell(spell, CastPosition.x, CastPosition.z)
					end
				end
  			end
		end
	end
end
