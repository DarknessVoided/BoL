--[[

  _______            _  __    _      _  __     _ _     _        
 |__   __|          | |/ /   | |    | |/ /    | (_)   | |       
    | | ___  _ __   | ' / ___| | __ | ' / __ _| |_ ___| |_ __ _ 
    | |/ _ \| '_ \  |  < / _ \ |/ / |  < / _` | | / __| __/ _` |
    | | (_) | |_) | | . \  __/   <  | . \ (_| | | \__ \ || (_| |
    |_|\___/| .__/  |_|\_\___|_|\_\ |_|\_\__,_|_|_|___/\__\__,_|
            | |                                                 
            |_|                                                 
            
    By Nebelwolfi

]]--

--[[ Auto updater start ]]--
local version = 0.07
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKKalista.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKKalista.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Kalista - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKKalista.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        TopKekMsg("New version available v"..ServerVersion)
        TopKekMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () TopKekMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version") end) end, 3)
      else
        TopKekMsg("Loaded the latest version (v"..ServerVersion..")")
      end
    end
  else
    TopKekMsg("Error downloading version info")
  end
end
--[[ Auto updater end ]]--

--[[ Libraries start ]]--
local predToUse = {}
VP  = nil
DP  = nil
HP  = nil
TKP = nil
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

if FileExist(LIB_PATH .. "/TKPrediction.lua") then
  require("TKPrediction")
  TKP = TKPrediction()
  table.insert(predToUse, "TKPrediction")
end

if predToUse == {} then 
  TopKekMsg("Please download a Prediction") 
  return 
end

if FileExist(LIB_PATH .. "SourceLib.lua") then
  require("SourceLib")
else
  TopKekMsg("Please download SourceLib")
  return
end
--[[ Libraries end ]]--

--[[ Script start ]]--
if  myHero.charName ~= "Kalista" then return end -- not supported :(
if VIP_USER then HookPackets() end
if myHero:GetSpellData(SUMMONER_1).name:find("smite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("smite") then Smite = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
local QReady, WReady, EReady, RReady, IReady, SReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end, function() if Ignite ~= nil then return myHero:CanUseSpell(Ignite) end end, function() if Smite ~= nil then return myHero:CanUseSpell(Smite) end end
local RebornLoaded, RevampedLoaded, MMALoaded, SxOrbLoaded, SOWLoaded = false, false, false, false, false
local Target 
local sts
local enemyTable = {}
local enemyCount = 0
local osTarget = nil
local MobsK    = {}
local EnemiesK = {}
local Enemies  = GetEnemyHeroes()
data = {
    [_Q] = { speed = 1750, delay = 0.25, range = 1450, width = 70, collision = true, aoe = false, type = "linear"},
    [_W] = { speed = math.huge, delay = 1.5, range = 5500, type = "dontuse"},
    [_E] = { delay = 0.50, range = 1000, type = "notarget"},
    [_R] = { range = 4000, type = "dontuse"}
    }

function OnLoad()
  for _, minion in pairs(minionManager(MINION_JUNGLE, 25000, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    table.insert(MobsK, {unit = minion, stacks = 0, createTime = 0})
  end
  for _, minion in pairs(minionManager(MINION_ENEMY, 25000, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    table.insert(MobsK, {unit = minion, stacks = 0, createTime = 0})
  end
  for _, minion in pairs(minionManager(MINION_OTHER, 25000, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    table.insert(MobsK, {unit = minion, stacks = 0, createTime = 0})
  end
  for _, unit in pairs(Enemies) do
    table.insert(EnemiesK, {unit = unit, stacks = 0, createTime = 0})
  end

  Config = scriptConfig("Top Kek Kalista", "TKKalista")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro", "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)

  if ActivePred() == "DivinePred" then Config.misc:addParam("time","DPred Extra Time", SCRIPT_PARAM_SLICE, 0.03, 0, 0.3, 2) end
  if ActivePred() == "HPrediction" then SetupHPred() end

  Config:addSubMenu("Combo Settings", "comboConfig")
  Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("Er", "Cast E when reset", SCRIPT_PARAM_ONOFF, true)
  --Config.comboConfig:addParam("R", "Use R to save ally", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("items", "Use Items", SCRIPT_PARAM_ONOFF, true)
  if Smite ~= nil then Config.comboConfig:addParam("S", "Use Smite", SCRIPT_PARAM_ONOFF, true) end

  Config:addSubMenu("Harrass Settings", "harrConfig")
  Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addSubMenu("Lane Clear", "lc")
  Config.farmConfig:addSubMenu("Last Hit", "lh")
  Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
  Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 10, 0)
      
  Config:addSubMenu("Killsteal Settings", "KS")
  Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end
  if Smite ~= nil then Config.KS:addParam("killstealS", "Use Smite", SCRIPT_PARAM_ONOFF, true) end

  Config:addSubMenu("Draw Settings", "Drawing")
  Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  
  Config:addSubMenu("Key Settings", "kConfig")
  Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Config:addParam("ragequit",  "Ragequit", SCRIPT_PARAM_ONOFF, false) 
  
  Config:addSubMenu("Orbwalk Settings", "oConfig")
  SetupOrbwalk()

  Config.kConfig:permaShow("combo")
  Config.kConfig:permaShow("harr")
  Config.kConfig:permaShow("har")
  Config.kConfig:permaShow("lh")
  Config.kConfig:permaShow("lc")
  sts = SimpleTS(STS_PRIORITY_LESS_CAST_MAGIC)
  Config:addSubMenu("Target Selector", "sts")
  sts:AddToMenu(Config.sts)

    for i = 1, heroManager.iCount do
        local champ = heroManager:GetHero(i)
        if champ.team ~= player.team then
            enemyCount = enemyCount + 1
            enemyTable[enemyCount] = { player = champ, name = champ.charName, blazed = false, damageQ = 0, damageW = 0, damageE = 0, damageI = 0, damageS = 0, indicatorText = "", damageGettingText = "", ready = true}
        end
    end
end

function SetupOrbwalk()
  if _G.AutoCarry then
    if _G.Reborn_Initialised then
      RebornLoaded = true
      TopKekMsg("Found SAC: Reborn")
      Config.oConfig:addParam("Info", "SAC: Reborn detected!", SCRIPT_PARAM_INFO, "")
    else
      RevampedLoaded = true
      TopKekMsg("Found SAC: Revamped")
      Config.oConfig:addParam("Info", "SAC: Revamped detected!", SCRIPT_PARAM_INFO, "")
    end
  elseif _G.Reborn_Loaded then
    DelayAction(function() SetupOrbwalk() end, 1)
  elseif _G.MMA_Loaded then
    MMALoaded = true
    TopKekMsg("Found MMA")
      Config.oConfig:addParam("Info", "MMA detected!", SCRIPT_PARAM_INFO, "")
  elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    require 'SxOrbWalk'
    SxOrb = SxOrbWalk()
    SxOrb:LoadToMenu(Config.oConfig)
    SxOrbLoaded = true
    TopKekMsg("Found SxOrb.")
  elseif FileExist(LIB_PATH .. "SOW.lua") then
    require 'SOW'
    require 'VPrediction'
    SOWVP = SOW(VP)
    Config.oConfig:addParam("Info", "SOW settings", SCRIPT_PARAM_INFO, "")
     Config.oConfig:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    SOWVP:LoadToMenu(Config.oConfig)
    SOWLoaded = true
    TopKekMsg("Found SOW")
  else
    TopKekMsg("No valid Orbwalker found")
  end
end

function OnTick()
  Target = GetCustomTarget()

  DmgCalculations()

  if Target ~= nil then
    if Config.KS.enableKS then 
      Killsteal()
    end

    if not ultOn and (Config.kConfig.har or Config.kConfig.harr) then
      Harrass()
    end

    if Config.kConfig.combo then
      Combo()
    end
  end

  if Config.kConfig.lh then
    LastHit()
  end
  if Config.kConfig.lc then
    LaneClear()
  end

  if Config.ragequit then Target=myHero.isWindingUp end --trololo ty Hirschmilch
end

function LastHit()
    if QReady and Config.farmConfig.lh.Q then
      for i, mob in pairs(MobsK) do
        local QMinionDmg = GetDmg("Q", mob.unit)
        if QMinionDmg >= minion.health and ValidTarget(mob.unit, data[0].range) then
          CastQ(mob.unit)
        end
      end
    end
    if EReady and Config.farmConfig.lh.E then  
      local killableUnit = {}  
      for i, mob in pairs(MobsK) do    
        local EMinionDmg = GetDmg("E", mob.unit)      
        if EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) then
        	table.insert(killableUnit, mob.unit)
        end      
      end    
      if #killableUnit > Config.farmConfig.lh.Ea then
          CastE()
      end
    end  
end

function LaneClear()
    --Check for lowlife: Lasthit = priority!
    if QReady and Config.farmConfig.lc.Q then
      for i, mob in pairs(MobsK) do
        local QMinionDmg = GetDmg("Q", mob.unit)
        if QMinionDmg >= minion.health and ValidTarget(mob.unit, data[0].range) then
          CastQ(mob.unit)
        end
      end
    end
    if EReady and Config.farmConfig.lc.E then   
      local killableUnit = {}  
      for i, mob in pairs(MobsK) do    
        local EMinionDmg = GetDmg("E", mob.unit)      
        if EMinionDmg >= minion.health and ValidTarget(mob.unit, data[2].range) then
        	table.insert(killableUnit, mob.unit)
        end      
      end    
      if #killableUnit > Config.farmConfig.lc.Ea then
          CastE()
      end
    end 
    --Check for lowestlife: Lanceclear - 2nd priority!
    if QReady and Config.farmConfig.lc.Q then
      local minionTarget = nil
      for i, mob in pairs(MobsK) do
        if minionTarget == nil then 
          minionTarget = mob.unit
        elseif minionTarget.health >= mob.unit.health and ValidTarget(mob.unit, data[0].range) then
          minionTarget = mob.unit
        end
      end
      if minionTarget ~= nil then
        CastQ(minionTarget)
      end
    end
end

function Combo()
	if Config.comboConfig.Q and ValidTarget(Target, data[0].range) then
	  CastQ(Target)
	end
	if Config.comboConfig.E and EReady and ValidTarget(Target, data[2].range) then
      local killableUnit = {}  
      for i, mob in pairs(MobsK) do    
        local EMinionDmg = GetDmg("E", mob.unit)      
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        	table.insert(killableUnit, mob.unit)
        end      
      end    
      if #killableUnit >= 1 and Config.comboConfig.Er then
        CastE()
      elseif GetDmg("E", Target) >= Target.health then
      	CastE()
      end
	end
end

function OnCreateObj(obj)
  if myHero.charName ~= "Kalista" then return end
  if obj == nil then return end
  rendTable = {["Kalista_Base_E_Spear_tar1.troy"] = { rend = 1 }, ["Kalista_Base_E_Spear_tar2.troy"] = { rend = 2 }, ["Kalista_Base_E_Spear_tar3.troy"] = { rend = 3 }, 
               ["Kalista_Base_E_Spear_tar4.troy"] = { rend = 4 }, ["Kalista_Base_E_Spear_tar5.troy"] = { rend = 5 }, ["Kalista_Base_E_Spear_tar6.troy"] = { rend = 6 }}
	for i, unit in pairs(Enemies) do
		if GetDistance(unit,obj) < 80 then
		  if rendTable[obj.name] then
		    EnemiesK.stacks[i] = rendTable[obj.name].rend
		    EnemiesK.createTime[i] = os.clock()
		  end
		end
	end
  for i, mob in pairs(MobsK) do
    if GetDistance(mob.unit,obj) < 80 then
      if rendTable[obj.name] then
        mob.unit.stacks[i] = rendTable[obj.name].rend
        mob.unit.createTime[i] = os.clock()
      end
    end
  end
end

function Harrass()
  if Config.harrConfig.Q and ValidTarget(Target, data[0].range) then
    CastQ(Target)
  end
  if Config.harrConfig.E and ValidTarget(Target, data[2].range) then
    if EReady and Config.farmConfig.lc.E then   
      local minionTarget = nil
      for i, mob in pairs(MobsK) do
        if minionTarget == nil then 
          minionTarget = mob.unit
        elseif minionTarget.health >= mob.unit.health and ValidTarget(mob.unit, data[2].range) then
          minionTarget = mob.unit
        end
      end
      if #killableUnit > Config.harrConfig.Ea then
          CastE()
      end
    end 
  end
end

function CastQ(Targ) 
  local CastPosition, HitChance, Position = Predict(Targ, 0, myHero)
  if HitChance and HitChance >= 2 and WReady then
    CastSpell(_Q)
  end
end
function CastW(Targ) 
  if WReady then CastSpell(_W) end
end
function CastE() 
  if EReady then CastSpell(_E) end
end
function CastR(Targ) 
  if RReady then CastSpell(_R) end
end

function EnemiesAround(Unit, range)
  local c=0
  if Unit == nil then return 0 end
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function Killsteal()
  for i=1, heroManager.iCount do
    local enemy = heroManager:GetHero(i)
    local qDmg = ((GetDmg("Q", enemy)) or 0)  
    local eDmg = ((GetDmg("E", enemy)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    local sDmg = 20 + 8 * myHero.level
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
        CastQ(enemy)
      elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
        CastE()
      elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady then
        CastSpell(Ignite, enemy)
      elseif enemy.health < sDmg and Config.KS.killstealS and ValidTarget(enemy, 760) and SReady then
        CastSpell(Smite, enemy)
      end
    end
  end
end

function GetCustomTarget()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts:GetTarget(1000)
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end

-- Credits: Da Vinci
local CastableItems = {
  Tiamat      = { Range = 400, Slot = function() return GetInventorySlotItem(3077) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3077) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3077)) == READY) end, Damage = function(target) return getDmg("TIAMAT", target, myHero) end},
  Hydra       = { Range = 400, Slot = function() return GetInventorySlotItem(3074) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3074) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3074)) == READY) end, Damage = function(target) return getDmg("HYDRA", target, myHero) end},
  Bork        = { Range = 450, Slot = function() return GetInventorySlotItem(3153) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3153) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY) end, Damage = function(target) return getDmg("RUINEDKING", target, myHero) end},
  Bwc         = { Range = 400, Slot = function() return GetInventorySlotItem(3144) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY) end, Damage = function(target) return getDmg("BWC", target, myHero) end},
  Hextech     = { Range = 400, Slot = function() return GetInventorySlotItem(3146) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY) end, Damage = function(target) return getDmg("HXG", target, myHero) end},
  Blackfire   = { Range = 750, Slot = function() return GetInventorySlotItem(3188) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3188) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3188)) == READY) end, Damage = function(target) return getDmg("BLACKFIRE", target, myHero) end},
  Youmuu      = { Range = 350, Slot = function() return GetInventorySlotItem(3142) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3142) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY) end, Damage = function(target) return 0 end},
  Randuin     = { Range = 500, Slot = function() return GetInventorySlotItem(3143) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3143) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3143)) == READY) end, Damage = function(target) return 0 end},
  TwinShadows = { Range = 1000, Slot = function() return GetInventorySlotItem(3023) end, reqTarget = false, IsReady = function() return (GetInventorySlotItem(3023) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3023)) == READY) end, Damage = function(target) return 0 end},
}
function UseItems(unit)
    if unit ~= nil then
        for _, item in pairs(CastableItems) do
            if item.IsReady() and GetDistance(myHero, unit) < item.Range then
                if item.reqTarget then
                    CastSpell(item.Slot(), unit)
                else
                    CastSpell(item.Slot())
                end
            end
        end
    end
end
-- Credits end

function ActivePred()
    local int = Config.misc.pro
    return tostring(predToUse[int])
end

function SetupHPred()
  MakeHPred("Q", 0) 
end

function MakeHPred(hspell, i)
  if data[i].type == "linear" then
      if data[i].speed ~= math.huge then 
          HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = data[i].range, speed = data[i].speed, width = 2*data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
      else
          HP:AddSpell(hspell, myHero.charName, {type = "PromptLine", range = data[i].range, width = 2*data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
      end
  elseif data[i].type == "circular" then
      if data[i].speed ~= math.huge then 
          HP:AddSpell(hspell, myHero.charName, {type = "DelayCircle", range = data[i].range, speed = data[i].speed, radius = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
      else
          HP:AddSpell(hspell, myHero.charName, {type = "PromptCircle", range = data[i].range, radius = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
      end
  else --Cone!
      HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = data[i].range, speed = data[i].speed, width = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
  end
end

local hpSpells = {Spell_Q, Spell_W, Spell_E, Spell_R}
function SetupHPredNew()
  for i=0,3 do
    hpSpells[i] = MakeHPred(i)
  end
end

function MakeHPredNew(i)
 if data[i].type == "linear" or data[i].type == "cone" or data[i].type == "circular" then 
    if data[i].type == "linear" then
        if data[i].speed ~= math.huge then 
            return HPSkillshot({type = "DelayLine", range = data[i].range, speed = data[i].speed, width = 2*data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
        else
            return HPSkillshot({type = "PromptLine", range = data[i].range, width = 2*data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
        end
    elseif data[i].type == "circular" then
        if data[i].speed ~= math.huge then 
            return HPSkillshot({type = "DelayCircle", range = data[i].range, speed = data[i].speed, radius = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
        else
            return HPSkillshotl({type = "PromptCircle", range = data[i].range, radius = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
        end
    else --Cone!
        return HPSkillshot({type = "DelayLine", range = data[i].range, speed = data[i].speed, width = data[i].width, delay = data[i].delay, collisionM = data[i].collision, collisionH = data[i].collision})
    end
 end
end

local str = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }
function Predict(Target, spell, source)
  if Target == nil then return end
  if ActivePred() == "VPrediction" then
    return VPredict(Target, data[spell], source)
  elseif ActivePred() == "Prodiction" then
    return nil
  elseif ActivePred() == "DivinePred" then
    local State, Position, perc = DPredict(Target, data[spell], source)
    return Position, perc*3/100, Position
  elseif ActivePred() == "HPrediction" then
    local Position, HitChance = HPredict(Target, spell, source)
    return Position, HitChance, Position
  elseif ActivePred() == "TKPrediction" then
    return TKP:Predict(spell, Target, source) 
  end
end

function HPredict(Target, spell, source)
  return HP:GetPredict(str[spell], Target, source) 
end

function DPredict(Target, spell, source)
  local unit = DPTarget(Target)
  local col = spell.collision and 0 or math.huge
  local Spell = nil
  if spell.type == "linear" then
   Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
   Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
   Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return DP:predict(unit, Spell, 1.2, source)
end

function VPredict(Target, spell, source)
  if spell.type == "linear" then
    if spell.aoe then
      return VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source)
    else
      return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source, spell.collision)
    end
  elseif spell.type == "circular" then
    if spell.aoe then
      return VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source)
    else
      return VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source, spell.collision)
    end
  elseif spell.type == "cone" then
    if spell.aoe then
      return VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source)
    else
      return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, source, spell.collision)
    end
  end
end

local colorRangeReady        = ARGB(255, 200, 0,   200)
local colorRangeComboReady   = ARGB(255, 255, 128, 0)
local colorRangeNotReady     = ARGB(255, 50,  50,  50)
local colorIndicatorReady    = ARGB(255, 0,   255, 0)
local colorIndicatorNotReady = ARGB(255, 255, 220, 0)
local colorInfo              = ARGB(255, 255, 50,  0)
local KillText = {}
local KillTextColor = ARGB(255, 216, 247, 8)
local KillTextList = {"Harass Him", "Combo Kill"}
function OnDraw()
  if Config.Drawing.QRange and QReady then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range, 0x111111)
  end
  if Config.Drawing.WRange and WReady then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[1].range, 0x111111)
  end
  if Config.Drawing.ERange and EReady then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[2].range, 0x111111)
  end
  if Config.Drawing.RRange and RReady then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[3].range, 0x111111)
  end
  if Config.Drawing.dmgCalc then
        for i = 1, enemyCount do
            local enemy = enemyTable[i].player
            if ValidTarget(enemy) then
                local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
                local posX = barPos.x - 35
                local posY = barPos.y - 50
                -- Doing damage
                DrawText(enemyTable[i].indicatorText, 15, posX, posY, (enemyTable[i].ready and colorIndicatorReady or colorIndicatorNotReady))
               
                -- Taking damage
                DrawText(enemyTable[i].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 0, 0))
            end
        end
    end 
end

function DmgCalculations()
    if not Config.Drawing.dmgCalc then return end
    for i = 1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("AD", enemy)
            local damageQ  = GetDmg("Q", enemy)
            local damageE  = GetDmg("E", enemy)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy)) or 0
            local damageS  = Smite and (20 + 8 * myHero.level) or 0
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageE = damageE
            enemyTable[i].damageI = damageI
            enemyTable[i].damageS = damageS
            if enemy.health < damageQ then
                enemyTable[i].indicatorText = "Q Kill"
                enemyTable[i].ready = QReady
            elseif enemy.health < damageE then
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady
            elseif enemy.health < damageE + damageQ then
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady and QReady
            elseif enemy.health < damageAA + damageQ + damageE + damageI + damageS then
                enemyTable[i].indicatorText = "All-In Kill"
                enemyTable[i].ready = QReady and EReady and IReady
            else
                local damageTotal = damageAA + damageQ + damageE + damageI
                local healthLeft = math.round(enemy.health - damageTotal)
                local percentLeft = math.round(healthLeft / enemy.maxHealth * 100)
                enemyTable[i].indicatorText = percentLeft .. "% Harass"
                enemyTable[i].ready = QReady or EReady
            end
            local neededAA = math.ceil(enemy.health / damageAA)    
            enemyTable[i].indicatorText = enemyTable[i].indicatorText.." or "..neededAA.." hits"

            local enemyDamageAA = getDmg("AD", player, enemy)
            local enemyNeededAA = math.ceil(player.health / enemyDamageAA)            
            enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
    end
end

function GetDmg(spell, enemy) --Partially from HTTF
  if enemy == nil then
    return
  end
  
  local ADDmg = 0
  local APDmg = 0

  local Level = myHero.level
  local TotalDmg = myHero.totalDamage
  local AP = myHero.ap
  local ArmorPen = myHero.armorPen
  local ArmorPenPercent = myHero.armorPenPercent
  
  local Armor = math.max(0, enemy.armor*ArmorPenPercent-ArmorPen)
  local ArmorPercent = Armor/(100+Armor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level

  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    ADDmg = 60*QLevel+10+1*TotalDmg
  elseif spell == "W" then
    return 0
  elseif spell == "E" then
    local stacks = 0
    for i, unit in pairs(Enemies) do
      if unit == target then
        if EnemiesK.createTime[i] + 4 < os.clock() then
          stacks = EnemiesK.stacks[i]
        end
      end
    end
    for i, mob in pairs(MobsK) do
      if mob.unit == target then
        if mob.createTime + 4 < os.clock() then
          stacks = mob.stacks
        end
      end
    end
    ADDmg = 10 + 10 * ELevel + myHero.totalDamage * 0.6 + stacks * (kalE(ELevel) + (.12 + .03 * ELevel) * myHero.totalDamage )
  elseif spell == "R" then
    return 0
  end

  return ADDmg*(1-ArmorPercent)
end
function kalE(x) 
  if x <= 1 then 
    return 5 
  else 
    return 2 + x + kalE(x-1)
  end 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end
function DrawLFC(x, y, z, radius, width, color, quality)
    if m.draw.lfc.enable then
        LagFree(x, y, z, radius, width, color, quality)
    else
        local radius = radius or 300
        DrawCircle(x, y, z, radius, color)
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