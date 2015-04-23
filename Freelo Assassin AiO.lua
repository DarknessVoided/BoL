--[[

  ______                 _                                               _                    _   ____  
 |  ____|               | |            /\                               (_)            /\    (_) / __ \ 
 | |__  _ __  ___   ___ | |  ___      /  \    ___  ___   __ _  ___  ___  _  _ __      /  \    _ | |  | |
 |  __|| '__|/ _ \ / _ \| | / _ \    / /\ \  / __|/ __| / _` |/ __|/ __|| || '_ \    / /\ \  | || |  | |
 | |   | |  |  __/|  __/| || (_) |  / ____ \ \__ \\__ \| (_| |\__ \\__ \| || | | |  / ____ \ | || |__| |
 |_|   |_|   \___| \___||_| \___/  /_/    \_\|___/|___/ \__,_||___/|___/|_||_| |_| /_/    \_\|_| \____/ 

 
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
  
  Config:addSubMenu("Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  local predToUse = {"", ""} --, "", ""
  if VP ~= nil then predToUse[1] = "VPrediction" end
  if VIP_USER then
    if DP ~= nil then predToUse[2] = "DivinePred" end
  end
  if predToUse == {"", ""} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro",  "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)
  if Config.misc.pro == 1 then 
	Config.misc:addParam("hitchance", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
  else
	Config.misc:addParam("hitchance", "Accuracy (Default: 1.2)", SCRIPT_PARAM_SLICE, 1.2, 0, 1.5, 1)
  end
  
  Config:addSubMenu("Combo Settings", "comboConfig")
  
  --"QWER", "QEWR", "WQER", "WEQR", "EQWR", "EWQR", "QEWRQ", "QERWQ", "QWERQ", "QWREQ", "QEWQR", "QEQWR", "QWQER", "QQWER", "QEWRE"
  local combo = ""
  local keys = {"Q","W","E"}
  shuffle(keys, #keys)
  keys = {"Q","W","E","R"}
  shuffle(keys, #keys)
  Config.comboConfig:addParam("so",  "Skill Order", SCRIPT_PARAM_LIST, 1, combos)
  
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

function GetCustomTarget(i)
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