require("SPrediction")
SP = SPrediction()
local sts
local Target
local spell = _Q
local minHitDistance = 75
local pos, chance, hpos, hhpos, hposh, hchance

function OnLoad() 
  	Config = scriptConfig("Scriptology Prediction Tester", "SPT")
  	Config:addParam("s", "Shoot", SCRIPT_PARAM_ONKEYTOGGLE, false, 32)
  	Config:addParam("hc","Hitchance", SCRIPT_PARAM_SLICE, 2, 0, 3, 0)
  	Config:addParam("spell","Spell", SCRIPT_PARAM_SLICE, 0, 0, 3, 0)
  	Config:addParam("p", "Print", SCRIPT_PARAM_ONOFF, false)
  	Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, false)
  	sts = TargetSelector(TARGET_LESS_CAST, 3500, DAMAGE_MAGIC)
end

function OnTick()
	spell = Config.spell
	local speed, delay, range, width, coll, type = SP:GetData(spell, myHero)
	sts:update()
	Target = sts.target
	for _,v in pairs(GetEnemyHeroes()) do
		if not v.dead then 
			if range and width and GetDistance(myHero,v) <= range+width and GetDistance(myHero,v) >= minHitDistance and (not Target or v.health < Target.health) then Target = v end
		end
	end
	if Config.s then
		if Target ~= nil then
			hposh, hchance, hhpos = SP:Predict(spell, myHero, Target)
			if hchance and hchance >= Config.hc then
				if Config.p then print("Shootchance:"..hchance) end
				CastSpell(spell, hposh.x, hposh.z)
			end
		end
	end
	if Config.p then
		print()
	end
end

function OnDraw()
	if not Config.d then return end
	local speed, delay, range, width, coll, type = SP:GetData(spell, myHero)
	DrawCircle3D(myHero.x, myHero.y, myHero.z, range, 1, ARGB(255,255,255,255), 32)

	DrawHitBox(myHero, 2, ARGB(255,255,255,255))
	ppos, range = SP:PredictPos(myHero)
	DrawCircle3D(ppos.x, ppos.y, ppos.z, range, 1, ARGB(255,255,255,255), 32)
    DrawLine3D(myHero.x, myHero.y, myHero.z, ppos.x, ppos.y, ppos.z, 3, ARGB(255, 55, 55, 55))

    if myHero.hasMovePath and myHero.pathCount >= 2 then
      local IndexPath = myHero:GetPath(myHero.pathIndex)
      for i=myHero.pathIndex, myHero.pathCount-1 do
        local Path = myHero:GetPath(i)
        local Path2 = myHero:GetPath(i+1)
      end
    end
    for i, enemy in ipairs(GetEnemyHeroes()) do
	  DrawHitBox(enemy, 2, ARGB(255,255,255,255))
      if enemy.hasMovePath and enemy.pathCount >= 2 then
        local IndexPath = enemy:GetPath(enemy.pathIndex)
        if IndexPath then
          DrawLine3D(enemy.x, enemy.y, enemy.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(255, 255, 255, 255))
        end
        for i=enemy.pathIndex, enemy.pathCount-1 do
          local Path = enemy:GetPath(i)
          local Path2 = enemy:GetPath(i+1)
          DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(255, 255, 255, 255))
        end
      end
    end
	DrawCircle(mousePos.x, mousePos.y, mousePos.z, 25, ARGB(255, 255, 255, 255))
	predTarget = Target --{x = mousePos.x, y = mousePos.y, z = mousePos.z, name = "cursor", charName = "cursor", ms = 400, unitAddRange = myHero.unitAddRange}
	if predTarget ~= nil then
		if not Config.s then
			pos, chance, hpos = SP:Predict(spell, myHero, predTarget)
			if chance and chance > 0 and Config.p then print(predTarget.charName.." Hitchance:"..chance) end
		end
		ppos, range = SP:PredictPos(predTarget)
		DrawCircle3D(ppos.x, ppos.y, ppos.z, range, 1, ARGB(255,255,255,255), 32)
		if pos ~= nil then
			DrawLine3D(myHero.x, myHero.y, myHero.z, predTarget.x, predTarget.y, predTarget.z, 1, ARGB(155,55,255,55))
			DrawLine3D(myHero.x, myHero.y, myHero.z, pos.x,		   pos.y,		 pos.z, 1,		  ARGB(255,55,55,255))
			DrawCircle3D(pos.x, ppos.y, pos.z, range, 1, ARGB(255,255,255,255), 32)
		end
		pos = nil
		if hposh ~= nil then
			DrawLine3D(myHero.x, myHero.y, myHero.z, predTarget.x, predTarget.y, predTarget.z, 1, ARGB(155,55,255,55))
			DrawLine3D(myHero.x, myHero.y, myHero.z, hposh.x,	   hposh.y,		 hposh.z, 1,	  ARGB(255,55,55,255))
			DrawCircle3D(hposh.x, hposh.y, hposh.z, range, 1, ARGB(255,255,255,255), 32)
		end
		hposh = nil
	end
end