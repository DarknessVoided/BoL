--[[

  ______             _                                        _                  _  ____  
 |  ____|           | |           /\                         (_)           /\   (_)/ __ \ 
 | |__ _ __ ___  ___| | ___      /  \   ___ ___  __ _ ___ ___ _ _ __      /  \   _| |  | |
 |  __| '__/ _ \/ _ \ |/ _ \    / /\ \ / __/ __|/ _` / __/ __| | '_ \    / /\ \ | | |  | |
 | |  | | |  __/  __/ | (_) |  / ____ \\__ \__ \ (_| \__ \__ \ | | | |  / ____ \| | |__| |
 |_|  |_|  \___|\___|_|\___/  /_/    \_\___/___/\__,_|___/___/_|_| |_| /_/    \_\_|\____/ 
 
 
]]--

--[[ Assassin list start ]]--
_G.Champs = {
	["Ahri"] = {
		[_Q] = { speed = 2500, delay = 0.25, range = 900, width = 100, collision = false, aoe = false, type = "linear"},
		[_E] = { speed = 1000, delay = 0.25, range = 1000, width = 60, collision = true, aoe = false, type = "linear"}
    },
	["Akali"] = {
    },
	["Evelynn"] = {
    },
	["Fiora"] = {
    },
	["Fizz"] = {
        [_R] = { speed = 1350, delay = 0.250, range = 1275, width = 80, collision = false, aoe = false, type = "linear"}
    },
	["Irelia"] = {
        [_R] = { speed = 1700, delay = 0.250, range = 1200, width = 10, collision = false, aoe = false, type = "linear"}
    },
	["Jax"] = {
    },
	["Kassadin"] = {
    },
	["Katarina"] = {
    },
	["Khazix"] = {
        [_W] = { speed = 1700, delay = 0.25, range = 1025, width = 70, collision = true, aoe = false, type = "linear"}
    },
	["Leblanc"] = {
        [_E] = { speed = 1600, delay = 0.250, range = 960, width = 70, collision = true, aoe = false, type = "linear"}
    },
	["LeeSin"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 1100, width = 100, collision = true, aoe = false, type = "linear"}
    },
	["Malzahar"] = {
        [_Q] = { speed = 1170, delay = 0.600, range = 900, width = 50, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.125, range = 800, width = 250, collision = false, aoe = true, type = "circular"}
    },
	["MasterYi"] = {
    },
	["Nidalee"] = {
		[_Q] = { speed = 1300, delay = 0.125, range = 1500, width = 60, collision = true, aoe = false, type = "linear"},
    },
	["Nocturne"] = {
        [_Q] = { speed = 1400, delay = 0.250, range = 1125, width = 60, collision = false, aoe = false, type = "linear"}
    },
	["Pantheon"] = {
    },
	["Poppy"] = {
    },
	["Rengar"] = {
        [_E] = { speed = 1500, delay = 0.50, range = 1000, width = 80, collision = false, aoe = false, type = "linear"}
    },
	["Riven"] = {
        [_R] = { speed = 2200, delay = 0.5, range = 1100, width = 200, collision = false, aoe = false, type = "cone"}
    },
	["Shaco"] = {
    },
	["Talon"] = {
        [_W] = { speed = 2200, delay = 0.5, range = 600, width = 200, collision = false, aoe = false, type = "cone"}
    },
	["Teemo"] = {
    },
	["Tristana"] = {
    },
	["Tryndamere"] = {
    },
	["Twitch"] = {
        [_W] = {speed = 1750, delay = 0.250, range = 950, width = 275, collision = false, aoe = true, type = "circular"}
    },
	["Vayne"] = {
    },
	["Vi"] = {
    }, 
	["Xerath"] = {
        [_W] = { speed = math.huge, delay = 0.5, range = 1100, width = 325, collision = false, aoe = true, type = "circular"},
        [_E] = { speed = 1600, delay = 0.25, range = 1050, width = 125, collision = true, aoe = false, type = "linear"},
        [_R] = { speed = 300, delay = 0.25, range = 5600, width = 265, collision = false, aoe = true, type = "circular"}
    },
	["XinZhao"] = {
    },
	["Yasuo"] = {
        [_Q] =  { speed = math.huge, delay = 250, range = 475, width = 40, collision = false, aoe = false, type = "linear"},
    },
	["Zed"] = {
        [_Q] = { speed = 1700, delay = 0.25, range = 925, width = 50, collision = false, aoe = false, type = "linear"},
    }
}

local CastableItems = {
Tiamat      = { Range = 400 , Slot   = function() return FindItemSlot("TiamatCleave") end,  reqTarget = false,  IsReady                             = function() return (FindItemSlot("TiamatCleave") ~= nil and myHero:CanUseSpell(FindItemSlot("TiamatCleave")) == READY) end, Damage = function(target) return getDmg("TIAMAT", target, myHero) end},
Bork        = { Range = 450 , Slot   = function() return FindItemSlot("SwordOfFeastAndFamine") end,  reqTarget = true,  IsReady                     = function() return (FindItemSlot("SwordOfFeastAndFamine") ~= nil and myHero:CanUseSpell(FindItemSlot("SwordOfFeastAndFamine")) == READY) end, Damage = function(target) return getDmg("RUINEDKING", target, myHero) end},
Bwc         = { Range = 400 , Slot   = function() return FindItemSlot("BilgewaterCutlass") end,  reqTarget = true,  IsReady                         = function() return (FindItemSlot("BilgewaterCutlass") ~= nil and myHero:CanUseSpell(FindItemSlot("BilgewaterCutlass")) == READY) end, Damage = function(target) return getDmg("BWC", target, myHero) end},
Hextech     = { Range = 400 , Slot   = function() return FindItemSlot("HextechGunblade") end,  reqTarget = true,    IsReady                         = function() return (FindItemSlot("HextechGunblade") ~= nil and myHero:CanUseSpell(FindItemSlot("HextechGunblade")) == READY) end, Damage = function(target) return getDmg("HXG", target, myHero) end},
Blackfire   = { Range = 750 , Slot   = function() return FindItemSlot("BlackfireTorch") end,  reqTarget = true,   IsReady                           = function() return (FindItemSlot("BlackfireTorch") ~= nil and myHero:CanUseSpell(FindItemSlot("BlackfireTorch")) == READY) end, Damage = function(target) return getDmg("BLACKFIRE", target, myHero) end},
Youmuu      = { Range = 350 , Slot   = function() return FindItemSlot("YoumusBlade") end,  reqTarget = false,  IsReady                              = function() return (FindItemSlot("YoumusBlade") ~= nil and myHero:CanUseSpell(FindItemSlot("YoumusBlade")) == READY) end, Damage = function(target) return 0 end},
Randuin     = { Range = 500 , Slot   = function() return FindItemSlot("RanduinsOmen") end,  reqTarget = false,  IsReady                             = function() return (FindItemSlot("RanduinsOmen") ~= nil and myHero:CanUseSpell(FindItemSlot("RanduinsOmen")) == READY) end, Damage = function(target) return 0 end},
TwinShadows = { Range = 1000, Slot   = function() return FindItemSlot("ItemWraithCollar") end,  reqTarget = false,  IsReady                         = function() return (FindItemSlot("ItemWraithCollar") ~= nil and myHero:CanUseSpell(FindItemSlot("ItemWraithCollar")) == READY) end, Damage = function(target) return 0 end},
}

--[[ Auto updater start ]]--
local version = 0.01
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/Freelo Assassin AiO.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."Freelo Assassin AiO.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>[Freelo Series] Assassin AiO:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/Freelo Assassin AiO.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        AutoupdaterMsg("New version available v"..ServerVersion)
        AutoupdaterMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        AutoupdaterMsg("Loaded the latest version (v"..ServerVersion..")")
      end
    end
  else
    AutoupdaterMsg("Error downloading version info")
  end
end
--[[ Auto updater end ]]--
VP = nil
--[[ Libraries start ]]--
if FileExist(LIB_PATH .. "/VPrediction.lua") then
  require("VPrediction")
  VP = VPrediction()
end
DP = nil
--if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
--  require "DivinePred"
--  DP = DivinePred() 
--end

--[[ Script start ]]--
if not Champs[myHero.charName] then return end -- not supported :(
if VIP_USER then HookPackets() end
local data = Champs[myHero.charName] -- load skills
local QReady, WReady, EReady, RReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end
local Target 
local sts
local predictions = {}
local combos = {}

function OnLoad()

  Config = scriptConfig("[Freelo Series] Assassin AiO", "Aimbot")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  local predToUse = {} --, "", ""
  if VP ~= nil then table.insert(predToUse, "VPrediction") end
  if VIP_USER then
    if DP ~= nil then table.insert(predToUse, "DivinePred") end
  end
  if predToUse == {} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro",  "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)
  if Config.misc.pro == 1 then 
	Config.misc:addParam("hitchance", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
  else
	Config.misc:addParam("hitchance", "Accuracy (Default: 1.2)", SCRIPT_PARAM_SLICE, 1.2, 0, 1.5, 1)
  end
  
  Config:addSubMenu("Combo Settings", "comboConfig")
  
  local combo = ""
  local keys = {"Q","W","E"}
  shuffle(keys, #keys)
  keys = {"Q","W","E","R"}
  shuffle(keys, #keys)
  Config.comboConfig:addParam("so",  "Skill Order", SCRIPT_PARAM_LIST, 1, combos)
  Config.comboConfig:addParam("aa",  "Autoattack in between skills", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("move",  "Move to mouse", SCRIPT_PARAM_ONOFF, true)
  
	Config:addSubMenu("Killsteal Settings", "KS")
	Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, false)
	Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
			
    Config:addSubMenu("Draw Settings", "Drawing")
	Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("DmgCalcs", "Killable Text", SCRIPT_PARAM_ONOFF, true)
  
  Config:addParam("combo", "Combo (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  
  Config:permaShow("combo")
  sts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGIC, true)
  Config:addTS(sts)
end

function shuffle(a, n)
	if n == 0 then
	  local c = ""
	  for i,v in ipairs(a) do
		c = v..c
	  end
	  combos[#combos+1] = c
	else
		for i=1,n do
			a[n], a[i] = a[i], a[n]
			shuffle(a, n-1)
			a[n], a[i] = a[i], a[n]
		end
	end
end

function OnTick()
	Target = GetCustomTarget()
	Combo()
	if Config.KS.enableKS then
		killsteal()
	end
	DmgCalculations()
	if Config.comboConfig.move and Config.combo then
		myHero:MoveTo(mousePos.x, mousePos.z)
	end
end   

function killsteal()
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		local qDmg = ((getDmg("Q", enemy, myHero)) or 0)	
		local wDmg = ((getDmg("W", enemy, myHero)) or 0)	
		local eDmg = ((getDmg("E", enemy, myHero)) or 0)	
		local rDmg = ((getDmg("R", enemy, myHero)) or 0)
		local iDmg = 50 + (20 * myHero.level)
		if ValidTarget(enemy) and enemy ~= nil and Config.KS.enableKS and not enemy.dead and enemy.visible then
			if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, qRange) then
				CastSpell(_Q, enemy)
			elseif enemy.health < wDmg and Config.KS.killstealW and ValidTarget(enemy, wRange) then
				CastSpell(_W, enemy)
			elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, eRange) then
				CastSpell(_E, enemy)
			elseif enemy.health < rDmg and Config.KS.killstealR and ValidTarget(enemy, rRange) then
				CastSpell(_R, enemy)
			elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady then
				CastSpell(SSpells:GetSlot("summonerdot"), enemy)
			end
		end
	end
end

function Combo()
	local skillOrder = {}
	table.insert(skillOrder, string.sub(Config.comboConfig.so, 1, 1))
	table.insert(skillOrder, string.sub(Config.comboConfig.so, 2, 2))
	table.insert(skillOrder, string.sub(Config.comboConfig.so, 3, 3))
	table.insert(skillOrder, string.sub(Config.comboConfig.so, 4, 4))
	for i=1,4 do
		if skillOrder[i] == "Q" then
			if (sts.target ~= nil) and QReady then
				if ValidTarget(sts.target, data[0].range) and Config.KB.ComboKey then
					if GetDistance(sts.target, myHero) <= data[0].range and Config.CS.comboQ then
						CastSpell(_Q, sts.target)
					end
				end
			end
		elseif skillOrder[i] == "W" then
			if (sts.target ~= nil) and WReady then
				if ValidTarget(sts.target, data[1].range) and Config.KB.ComboKey then
					if GetDistance(sts.target, myHero) <= data[1].range and Config.CS.comboW then
						CastSpell(_W, sts.target)
					end
				end
			end
		elseif skillOrder[i] == "E" then
			if (sts.target ~= nil) and EReady then
				if ValidTarget(sts.target, data[2].range) and Config.KB.ComboKey then
					if GetDistance(sts.target, myHero) <= data[2].range and Config.CS.comboE then
						CastSpell(_E, sts.target)
					end
				end
			end
		elseif skillOrder[i] == "R" then
			if (sts.target ~= nil) and RReady then
				if ValidTarget(sts.target, data[3].range) and Config.KB.ComboKey then
					if GetDistance(sts.target, myHero) <= data[3].range and Config.CS.comboR then
						CastSpell(_R, sts.target)
					end
				end
			end
		end
		if Config.comboConfig.aa then
			
		end
	end
end

function VPredict(Target, spell)
  if spell.type == "linear" then
	if spell.aoe then
		return VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "circular" then
	if spell.aoe then
		return VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "cone" then
	if spell.aoe then
		return VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  else
		return Vector(Target), 2, myHero --CastPosition, HitChance, Position
  end
end

local KillText = {}
local KillTextColor = ARGB(255, 216, 247, 8)
local KillTextList = {"Harass Him", "Combo Kill"}
function DmgCalculations()
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		local qDmg = ((getDmg("Q", enemy, myHero)) or 0)	
		local wDmg = ((getDmg("W", enemy, myHero)) or 0)	
		local eDmg = ((getDmg("E", enemy, myHero)) or 0)	
		local rDmg = ((getDmg("R", enemy, myHero)) or 0)
		local aaDmg = ((getDmg("AD", enemy, myHero)))
		if ValidTarget(enemy) and enemy ~= nil then
			if Config.Drawing.DmgCalcs then
			if enemy.health <= (aaDmg + qDmg + wDmg + eDmg + rDmg) then
				KillText[i] = 2
			elseif enemy.health > (aaDmg + wDmg + eDmg + rDmg) then
				KillText[i] = 1
			end
		end
		end
	end
end

function OnDraw()
	if Config.Drawing.QRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range, 0x111111)
	end
	if Config.Drawing.WRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[1].range, 0x111111)
	end
	if Config.Drawing.ERange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[2].range, 0x111111)
	end
	if Config.Drawing.RRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[3].range, 0x111111)
	end
	if Config.Drawing.DmgCalcs then
	for i = 1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
			if ValidTarget(enemy) and enemy ~= nil then
				local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
				local PosX = barPos.x - 60
				local PosY = barPos.y - 10
				DrawText(KillTextList[KillText[i]], 15, PosX, PosY, KillTextColor)
			end
		end
	end
end

function DPredict(Target, spell)
  local unit = DPTarget(Target)
  local col = (spell.aoe and spell.collision) and 0 or math.huge
  if IsVeigarLuxQ(i) then col = 1 end
  if spell.type == "linear" then
	Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
	Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
	Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return DP:predict(unit, Spell, Config.misc.hitchance)
end

function VPredict(Target, spell)
  if spell.type == "linear" then
	if spell.aoe then
		return VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "circular" then
	if spell.aoe then
		return VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "cone" then
	if spell.aoe then
		return VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  end
end

function GetCustomTarget()
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts.target
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end

class 'SumSpells'
function SumSpells:__init()
	names = {"summonerdot", "summonerflash", "summonerexhaust", "summonerheal", "summonersmite"}
end

function SumSpells:Ready(name)
	local Ready = false
	local Spel = self:GetSlot(name)
	Ready = (Spel ~= nil and myHero:CanUseSpell(Spel) == READY)
	return Ready
end

function SumSpells:GetSlot(name)
	if myHero:GetSpellData(SUMMONER_1).name == name then 
		return SUMMONER_1 
	end
	if myHero:GetSpellData(SUMMONER_2).name == name then 
		return SUMMONER_2 
	end
end