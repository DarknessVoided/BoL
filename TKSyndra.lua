--[[
  _______            _  __    _       _____                 _           
 |__   __|          | |/ /   | |     / ____|               | |          
    | | ___  _ __   | ' / ___| | __ | (___  _   _ _ __   __| |_ __ __ _ 
    | |/ _ \| '_ \  |  < / _ \ |/ /  \___ \| | | | '_ \ / _` | '__/ _` |
    | | (_) | |_) | | . \  __/   <   ____) | |_| | | | | (_| | | | (_| |
    |_|\___/| .__/  |_|\_\___|_|\_\ |_____/ \__, |_| |_|\__,_|_|  \__,_|
            | |                              __/ |                      
            |_|                             |___/                       
]]--

--[[ Auto updater start ]]--
local version = 0.01
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKSyndra.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKSyndra.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>[TKSyndra]:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKSyndra.version")
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

--[[ Libraries start ]]--
local predToUse = {}
VP = nil
DP = nil
HP = nil
if FileExist(LIB_PATH .. "/VPrediction.lua") then
  require("VPrediction")
  VP = VPrediction()
  table.insert(predToUse, "VPrediction")
end

if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
  require "DivinePred"
  DP = DivinePred() 
  table.insert(predToUse, "DivinePred")
end

if FileExist(LIB_PATH .. "/HPrediction.lua") then
  require("HPrediction")
  HP = HPrediction()
  table.insert(predToUse, "HPrediction")
end
--[[ Libraries end ]]--

local Q = {range = 790, rangeSqr = math.pow(790, 2), width = 125, delay = 0.6, speed = math.huge, LastCastTime = 0, IsReady = function() return myHero:CanUseSpell(_Q) == READY end, type = "circular"}
local W = {range = 925, rangeSqr = math.pow(925, 2), width = 190, delay = 0.8, speed = math.huge, LastCastTime = 0, IsReady = function() return myHero:CanUseSpell(_W) == READY end, status = 0, type = "cone"}
local E = {range = 700, rangeSqr = math.pow(700, 2), width = 45 * 0.5, delay = 0.25, speed = 2500, LastCastTime = 0, IsReady = function() return myHero:CanUseSpell(_E) == READY end, type = "circular"}
local R = {range = 725, rangeSqr = math.pow(725, 2), delay = 0.25, IsReady = function() return myHero:CanUseSpell(_R) == READY end, type = "targeted"}
local QE = {range = 1280, rangeSqr = math.pow(1280, 2), width = 60, delay = 0, speed = 1600}

local Balls = {}
local BallDuration = 6.9
enemyMinions = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC)

function OnLoad()
  Config = scriptConfig("Top Kek Syndra", "TKSyndra")
  Config:addSubMenu("Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
 
  if predToUse == {} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro",  "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)

  if ActivePred() == "HPrediction" then SetupHPred() end
  Config:addParam("combo", "Combo (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config:addParam("stun", "Stun target", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  Config:addParam("har", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config:addParam("harr", "Harrass (TOGGLE)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
end

function OnTick()
  Target = GetCustomTarget()
  if myHero.dead or recall then return end
  if Config.combo then 
  elseif Config.har or Config.harr then 
  elseif Config.stun

  end
end

function GetCustomTarget()
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    sts.target
end

function ActivePred()
    local int = Config.misc.pro
    return tostring(predToUse[int])
end

function SetupHPred()
    Spell_Q = MakeHPred(Spell_Q, Q) 
    Spell_W = MakeHPred(Spell_W, W) 
    Spell_E = MakeHPred(Spell_E, E) 
end

function MakeHPred(hspell, i)
 if hspell == nil then 
  hspell.delay[myHero.charName] = i.delay
  hspell.range[myHero.charName] = i.range
  if i.type == "linear" then
    hspell.width[myHero.charName] = 2*i.width
    if i.speed ~= math.huge then 
        hspell.type[myHero.charName] = "DelayLine"
        hspell.speed[myHero.charName] = i.speed
    else
        hspell.type[myHero.charName] = "PromptLine"
    end
  elseif i.type == "circular" then
    hspell.radius[myHero.charName] = i.width
    if i.speed ~= math.huge then 
        hspell.type[myHero.charName] = "DelayCircle"
        hspell.speed[myHero.charName] = i.speed
    else
        hspell.type[myHero.charName] = "PromptCircle"
    end
  else --Cone!
    hspell.type[myHero.charName] = "DelayLine"
    hspell.width[myHero.charName] = i.width
    hspell.speed[myHero.charName] = i.speed
  end
 end
 return hspell
end


local LastRequest = 0
function ValidRequest()
    if os.clock() - LastRequest < TimeRequest() then
        return false
    else
        LastRequest = os.clock()
        return true
    end
end

function TimeRequest()
    if ActivePred() == "VPrediction" or ActivePred() == "HPrediction" then
        return 0.001
    elseif ActivePred() == "DivinePred" then
        return Config.misc~=nil and Config.misc.time or 0.2
    end
end

function HPredict(Target, spell)
	return HP:GetPredict(spell, Target, myHero)
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
  return DP:predict(unit, Spell)
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