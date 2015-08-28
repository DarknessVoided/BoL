--
local version = 0.1

local AUTOUPDATE = true

function AutoupdaterMsg(msg) print("<font color = \"#FFFFFF\">[Call of Legends] </font><font color=\"#FF0000\">"..msg.."</font>") end
if AUTOUPDATE then
	local ServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Call of Legends.version?no-cache="..math.random(1, 25000))
	if ServerData then 
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				AutoupdaterMsg("New version available"..ServerVersion)
				AutoupdaterMsg("Updating, please don't press F9")
          		DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Call of Legends.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH.."Call of Legends.lua", function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 1)
			else
				AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
			end
		end
	else
		AutoupdaterMsg("Error downloading version info")
	end
end

local isSAC = false
local isSX = false
local isMMA = false

function OnLoad()
    if FileExist(LIB_PATH .. "SPrediction.lua") and FileExist(LIB_PATH .. "SpellData.lua") then
	    require("SPrediction")
	    _G.SP = SPrediction()
	    data = loadfile(LIB_PATH .. "SpellData.lua")()
	    data = data[myHero.charName]
    	targetSel = TargetSelector(TARGET_LESS_CAST, 1000, DAMAGE_MAGIC, false, true)
		LoadMenu()
		AutoupdaterMsg("loaded!")
	else
		DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPrediction.lua?no-cache="..math.random(1, 25000), LIB_PATH.."SPrediction.lua", function() end)
		DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SpellData.lua?no-cache="..math.random(1, 25000), LIB_PATH.."SpellData.lua", function() end)
		DelayAction(OnLoad, 2)
	end
end

function LoadMenu()
	Config = scriptConfig("Call of Legends", "CoL")
	
	Config:addSubMenu("Move Bindings", "MKeys")
		Config.MKeys:addParam("Up", "Up", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("W"))
		Config.MKeys:addParam("Left", "Left", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("A"))
		Config.MKeys:addParam("Down", "Down", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("S"))
		Config.MKeys:addParam("Right", "Right", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("D"))
		
	Config:addSubMenu("Orbwalker", "Orbwalker")
		DelayAction(function()
		if _G.Reborn_Loaded then
			PrintChat("<font color = \"#FFFFFF\">[Call of Legends] </font><font color = \"#FF0000\">SAC Status:</font> <font color = \"#FFFFFF\">Successfully integrated.</font> </font>")
			Config.Orbwalker:addParam("SACON","[Call of Legends] SAC:R support is active.", 5, "")
			isSAC = true
		elseif _G.MMA_IsLoaded then
			PrintChat("<font color = \"#FFFFFF\">[Call of Legends] </font><font color = \"#FF0000\">MMA Status:</font> <font color = \"#FFFFFF\">Successfully integrated.</font> </font>")
			Config.Orbwalker:addParam("MMAON","[Call of Legends] MMA support is active.", 5, "")
			isMMA = true
		elseif not _G.Reborn_Loaded or not _G.MMA_IsLoaded then
			require "SxOrbwalk"
			PrintChat("<font color = \"#FFFFFF\">[Call of Legends] </font><font color = \"#FF0000\">Orbwalker not found:</font> <font color = \"#FFFFFF\">SxOrbWalk integrated.</font> </font>")
			SxOrb:LoadToMenu(Config.Orbwalker)
			isSX = true
		end
	end, 7)

	Config:addParam("Enabled", "Enabled", SCRIPT_PARAM_ONOFF, true)
end

function OnTick()
	MoveIt()
	Shoot()
end

local str = {[_Q] = "Q", [_W] = "W", [_E] = "E"}
local selectedSkill = _Q
function OnWndMsg(msg, key)
	if key == 4287102976 then
		selectedSkill = selectedSkill + 1
		if selectedSkill > 2 then selectedSkill = 0 end
		PrintAlert("Selected Skill: "..str[selectedSkill], 0.25, 0xff, 0xff, 0xff)
	end
	--print(key)
	if IsKeyDown(16) then return end
	if msg == WM_LBUTTONDOWN then
		isCasting = true
		if targetSel then
			targetSel:update()
			if targetSel.target and _G.SP and data[selectedSkill] and data[selectedSkill].type then
				local CastPosition, HitChance, Position = SP:Predict(targetSel.target, data[selectedSkill].range, data[selectedSkill].speed, data[selectedSkill].delay, data[selectedSkill].width, (myHero.charName == "Lux" or myHero.charName == "Veigar") and 1 or data[selectedSkill].collision, myHero)
				if HitChance and HitChance >= 2 then
					CastSpell(selectedSkill, CastPosition.x, CastPosition.z)
					CastSpell(selectedSkill)
				else
					CastSpell(selectedSkill, mousePos.x, mousePos.z)
					CastSpell(selectedSkill)
				end
			else
				CastSpell(selectedSkill, mousePos.x, mousePos.z)
				targetSel:update()
				if targetSel.target then
					CastSpell(_R, targetSel.target)
				end
				CastSpell(selectedSkill)
			end
		else
			CastSpell(selectedSkill, mousePos.x, mousePos.z)
			CastSpell(selectedSkill)
		end
	end
	if msg == WM_RBUTTONDOWN then
		isCasting = true
		CastSpell(_R, mousePos.x, mousePos.z)
		targetSel:update()
		if targetSel.target then
			CastSpell(_R, targetSel.target)
		end
		CastSpell(_R)
	end
	if key == 70 then
		isCasting = true
		local oldSel = selectedSkill
		selectedSkill = SUMMONER_2
		DelayAction(function() selectedSkill = oldSel end, 0.1)
	end
	if key == 82 then
		isCasting = true
		local oldSel = selectedSkill
		selectedSkill = SUMMONER_1
		CastSpell(SUMMONER_1, mousePos.x, mousePos.z)
		DelayAction(function() selectedSkill = oldSel end, 0.1)
	end
end

function MoveIt()
	local x = 0
	local y = 0
	if Config.MKeys.Up then
		y = y + 200
	end
	if Config.MKeys.Down then
		y = y - 200
	end
	if Config.MKeys.Left then
		x = x - 200
	end
	if Config.MKeys.Right then
		x = x + 200
	end
	if x ~= 0 or y ~= 0 then
		MoveMe(x, y)
	end
	
	if not Config.MKeys.Up or not Config.MKeys.Down or not Config.MKeys.Left or not Config.MKeys.Right then
		if not Orbwalking() then
			if isSX then SxOrb:ForcePoint(nil) end
			if isSAC then _G.AutoCarry.Orbwalker:OverrideOrbwalkLocation(nil) end
			if isMMA then _G.MMA_MoveTo() end
		end
	end
end

function Shoot()
end

function MoveMe(XPos, ZPos)
	local MovePos = {x = myHero.x + XPos, z = myHero.z + ZPos}
	
	if Orbwalking() then
		if isSX then
			SxOrb:ForcePoint(MovePos.X, MovePos.Z)
			if Config.MKeys.Up or Config.MKeys.Down or Config.MKeys.Left or Config.MKeys.Right then
				SxOrb:ForcePoint(MovePos.x, MovePos.z)
			else
				SxOrb:ForcePoint(nil)
			end
		elseif isSAC then
			if Config.MKeys.Up or Config.MKeys.Down or Config.MKeys.Left or Config.MKeys.Right then
				_G.AutoCarry.Orbwalker:OverrideOrbwalkLocation({x = myHero.x + XPos, z = myHero.z + ZPos})
			else
				_G.AutoCarry.Orbwalker:OverrideOrbwalkLocation(nil)
			end
		elseif isMMA then
			if Config.MKeys.Up or Config.MKeys.Down or Config.MKeys.Left or Config.MKeys.Right then
				_G.MMA_MoveTo(MovePos.x, MovePos.z)
			else
				_G.MMA_MoveTo()
			end
		end
	else
		myHero:MoveTo(MovePos.x, MovePos.z)
	end
end

function Orbwalking()
	if isSAC == true then
		local k = _G.AutoCarry.Keys
		return k.AutoCarry or k.MixedMode or k.LaneClear or k.LastHit
	end
	if isSX == true then
		local k = SxOrb:GetMode()
		return k == 1 or k == 2 or k == 3 or k == 4
	end
	if isMMA == true then
		return _G.MMA_IsOrbwalking() or _G.MMA_IsLastHitting() or _G.MMA_IsLaneClearing() or _G.MMA_IsDualCarrying()
	end
end

function Set(list)
    local set = {}
    local c = 0
    for _, l in ipairs(list) do 
    	set[l] = c
    	c = c + 1
    end
    return set
end

local skills = Set {0x22, 0x9C, 0x39, 0x2D, 0xFE, 0x15}
AddSendPacketCallback(function(p)
	if p.header == 0x140 and Config.Enabled then
		p.pos = 6
		local op = p:Decode1()
		if skills[op] == selectedSkill and isCasting then
			isCasting = false
		elseif skills[op] then
			p:Block()
		end
    end
end)