toCast = {["Jax"] = _Q, ["LeeSin"] = _W, ["Katarina"] = _E}
if not toCast[myHero.charName] then return end

function OnLoad()
	Config = scriptConfig("WardJump","WardJump")
	Config:addParam("wj", "Wardjump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
	Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
	Wards = {}
	casted, jumped = false, false
	for i = 1, objManager.maxObjects do
		local object = objManager:GetObject(i)
		if object ~= nil and object.valid and (object.name:lower():find("ward") or object.name:lower():find("trinkettotem")) then
			table.insert(Wards, object)
		end
	end
end

function OnTick()
	if Config.wj or (casted and not jumped) then
		WardJump()
	end
end

function OnDraw()
	if Config.d then
		local pos = Vector(myHero) - (Vector(myHero) - mousePos):normalized() * (myHero.charName == "LeeSin" and 600 or 700)
		DrawCircle3D(pos.x,pos.y,pos.z,150,1,ARGB(255,255,255,255),32)
	end
end

function WardJump()
	if casted and jumped then 
		DelayAction(function() casted, jumped = false, false end, 0.25)
	elseif (myHero:CanUseSpell(toCast[myHero.charName]) == READY and myHero:GetSpellData(_W).name == "BlindMonkWOne") 
		or (myHero:CanUseSpell(toCast[myHero.charName]) == READY and myHero.charName ~= "LeeSin") then
		local pos = Vector(myHero) - (Vector(myHero) - mousePos):normalized() * (myHero.charName == "LeeSin" and 600 or 700)
		if Jump(pos, 250) then return end
		DelayAction(function() Jump(pos, 250) end, 0.25)
		slot = GetWardSlot()
		if not slot or casted then return end
		CastSpell(slot, pos.x, pos.z)
		casted = true
	end
end

function Jump(pos, range)
	for _,ally in pairs(GetAllyHeroes()) do
		if (GetDistance(ally, pos) <= range) then
			CastSpell(toCast[myHero.charName], ally)
			jumped = true
			return true
		end
	end
	for minion,winion in pairs(minionManager(MINION_ALLY, range, pos, MINION_SORT_HEALTH_ASC).objects) do
		if (GetDistance(winion, pos) <= range) then
			CastSpell(toCast[myHero.charName], winion)
			jumped = true
			return true
		end
	end
	for i, ward in ipairs(Wards) do
		if (GetDistance(ward, pos) <= range) then
			CastSpell(toCast[myHero.charName], ward)
			jumped = true
			return true
		end
	end
	for _=#Wards, 1 do
		local ward = Wards[_]
		if ward and (GetDistance(ward, pos) <= range) then
			CastSpell(toCast[myHero.charName], ward)
			jumped = true
			return true
		end
	end
end

function OnCreateObj(obj)
	if obj ~= nil and obj.valid then
		if obj.name:lower():find("ward") or obj.name:lower():find("trinkettotem") then
			table.insert(Wards, obj)
		end
	end
end

function GetWardSlot()
	for slot = ITEM_7, ITEM_1, -1 do
		if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and myHero:GetSpellData(slot).name:lower():find("trinkettotem") then
			return slot
		end
	end
	for slot = ITEM_7, ITEM_1, -1 do
		if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (myHero:GetSpellData(slot).name:lower():find("ward") and not myHero:GetSpellData(slot).name:lower():find("vision")) then
			return slot
		end
	end
	for slot = ITEM_7, ITEM_1, -1 do
		if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and myHero:GetSpellData(slot).name:lower():find("ward") then
			return slot
		end
	end
	return nil
end