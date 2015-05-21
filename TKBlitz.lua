--[[

  _______            _  __    _      ____  _ _ _       
 |__   __|          | |/ /   | |    |  _ \| (_) |      
    | | ___  _ __   | ' / ___| | __ | |_) | |_| |_ ____
    | |/ _ \| '_ \  |  < / _ \ |/ / |  _ <| | | __|_  /
    | | (_) | |_) | | . \  __/   <  | |_) | | | |_ / / 
    |_|\___/| .__/  |_|\_\___|_|\_\ |____/|_|_|\__/___|
            | |                                        
            |_|                                                                                     

  By Nebelwolfi  
  Some of the logic by -unknown-                           
 
]]--

if FileExist(LIB_PATH .. "/UPL.lua") then
  require("UPL")
  UPL = UPL()
else
  TopKekMsg("Please download the Unified Prediction Library!") 
  return 
end
require "Collision"

--[[ Script start ]]--
if myHero.charName ~= "Blitzcrank" or not VIP_USER then return end

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHHJKHMH") 
--Scriptstatus Tracker

local Q = { speed = 1800, delay = 0.25, range = 900, width = 70, collision = true, aoe = false, type = "linear" }
local Col = nil
local ForceTarget = nil
local Menu = nil

function OnLoad()
	Menu = scriptConfig("TKBlitz", "TKBlitz")
	Menu:addParam("Grab", "Grab!", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	Menu:addParam("Grab2", "Grab Stunned/Dashing!", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	Menu:addParam("UseE", "Instant E after pull (needs orbwalker)", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("Move", "Move to mouse (turn me off with orb)", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("DrawQ", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
	Menu:addParam("DrawP", "Draw predicted position", SCRIPT_PARAM_ONOFF, false)
	
  	UPL:AddToMenu(Menu)

	Menu:addParam("AutoR", "AutoR if killable", SCRIPT_PARAM_ONOFF, false)
	Menu:addParam("Lag", "Use Lag-Free circles", SCRIPT_PARAM_ONOFF, true)

  	UPL:AddSpell(_Q, Q)

	Menu:addSubMenu("Targets", "Targets")	
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		if enemy.team ~= myHero.team then
			Menu.Targets:addParam("D"..i, "Dont grab "..enemy.charName, SCRIPT_PARAM_ONOFF, false)
		end
	end
	Col = Collision(Q.range, Q.speed, Q.delay, Q.width+30)
	TopKekMsg("Loaded!")
end

function GetBestTarget(Range)
	local LessToKill = 100
	local LessToKilli = 0
	local target = nil
		
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		if ValidTarget(enemy, Range) then
			DamageToHero = myHero:CalcMagicDamage(enemy, 200)
			ToKill = enemy.health / DamageToHero
			if ((ToKill < LessToKill)  or (LessToKilli == 0)) and not Menu.Targets['D'..i] then
				LessToKill = ToKill
				LessToKilli = i
				target = enemy
			end
		end
	end
	
	return target
end

function TopKekMsg(msg) 
	print("<font color=\"#6699ff\"><b>[Top Kek Series]: Blitzcrank - </b></font> <font color=\"#FFFFFF\">"..msg.."</font>") 
end

function OnTick()
	local target = GetBestTarget(Q.range)
	if Forcetarget ~= nil and ValidTarget(Forcetarget, Q.range) then
		target = Forcetarget	
	end

	if target and (myHero:CanUseSpell(_E) == READY) and Menu.UseE then
		if GetDistance(target, myHero) <= myHero.range+target.boundingRadius  then
			CastSpell(_E)
		end
	end
	
	if target and (myHero:CanUseSpell(_Q) == READY) and (Menu.Grab or Menu.Grab2) then
		MinHitChance = Menu.Grab and 1 or 2
		local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
		if HitChance > MinHitChance and GetDistance(CastPosition) <= Q.range  then
			local Mcol = Col:GetMinionCollision(myHero, CastPosition)
			local Mcol2 = Col:GetMinionCollision(myHero, target)
			if not Mcol and not Mcol2 then
				CastSpell(_Q, CastPosition.x,  CastPosition.z)
			end
		end
	end
	
	if Menu.Move and (Menu.Grab or Menu.Grab2) then
		myHero:MoveTo(mousePos.x, mousePos.z)
	end

	if Menu.AutoR then
		for _,unit in pairs(GetEnemyHeroes()) do
			if unit ~= nil and not unit.dead and GetDistance(myHero, unit) < 500 and unit.health < GetRDmg(unit) then
				CastSpell(_R)
			end
		end
	end
end

function GetRDmg(target)
    if target == nil then return end
    local APDmg, MagicPen, MagicPenPercent  = 0, myHero.magicPen, myHero.magicPenPercent

    local MagicArmor        = math.max(0, target.magicArmor*MagicPenPercent-MagicPen)
    local MagicArmorPercent = MagicArmor/(100+MagicArmor)
    
    APDmg = 125 + (125 * myHero:GetSpellData(_R).level) + myHero.ap

    return APDmg*(1-MagicArmorPercent)
end

function OnDraw()
	local target = GetBestTarget(Q.range)
	if Forcetarget ~= nil and ValidTarget(Forcetarget, Q.range) then
		target = Forcetarget	
	end

	if Menu.DrawQ then
		DrawCircle2(myHero.x, myHero.y, myHero.z, Q.range, ARGB(255, 0, 255, 0), 18)
	end
	
	if Forcetarget ~= nil then
		DrawCircle2(Forcetarget.x, Forcetarget.y, Forcetarget.z, Q.width, ARGB(255, 0, 255, 0), 8)
	end
	
	if Menu.DrawP and myHero:CanUseSpell(_Q) and target ~= nil then
		local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
		if CastPosition then
			DrawCircle2(CastPosition.x, CastPosition.y, CastPosition.z, Q.width, ARGB(255, 255, 0, 0), 8)
			DrawLine3D(myHero.x, myHero.y, myHero.z, CastPosition.x, CastPosition.y, CastPosition.z, 1, ARGB(155,55,255,55))
			DrawLine3D(myHero.x, myHero.y, myHero.z, target.x,		 target.y,		 target.z, 1,		ARGB(255,55,55,255))
		end
	end
end

function DrawCircle2(x, y, z, radius, color, qual)
	local vPos1 = Vector(x, y, z)
	local vPos2 = Vector(cameraPos.x, cameraPos.y, cameraPos.z)
	local tPos = vPos1 - (vPos1 - vPos2):normalized() * radius
	local sPos = WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
	if not Menu.Lag then
		return DrawCircle(x, y, z, radius, color)
	end
	if OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y })  then
		LagFree(x, y, z, radius, 1, color, qual)	
	end
end

function LagFree(x, y, z, radius, width, color, quality)
    local radius = radius or 300
    local screenMin = WorldToScreen(D3DXVECTOR3(x - radius, y, z + radius))
    if OnScreen({x = screenMin.x + 200, y = screenMin.y + 200}, {x = screenMin.x + 200, y = screenMin.y + 200}) then
        radius = radius*.92
        local quality = quality and 2 * math.pi / quality or 2 * math.pi / math.floor(radius / 10)
        local width = width and width or 1
        local a = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(0), y, z - radius * math.sin(0)))
        for theta = quality, 2 * math.pi + quality, quality do
            local b = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
            DrawLine(a.x, a.y, b.x, b.y, width, color)
            a = b
        end
    end
end

function OnWndMsg(Msg, Key)
	if Msg == WM_LBUTTONDOWN then
		local minD = 0
		local starget = nil
		for i, enemy in ipairs(GetEnemyHeroes()) do
			if ValidTarget(enemy) then
				if GetDistance(enemy, mousePos) <= minD or starget == nil then
					minD = GetDistance(enemy, mousePos)
					starget = enemy
				end
			end
		end
		
		if starget and minD < 500 then
			if Forcetarget and starget.charName == Forcetarget.charName then
				Forcetarget = nil
			else
				Forcetarget = starget
				print("<font color=\"#FF0000\">Blitzcrank: New target selected: "..starget.charName.."</font>")
			end
		end
	end
end