--[[

  _______            _  __    _      ____                      _ 
 |__   __|          | |/ /   | |    |  _ \                    | |
    | | ___  _ __   | ' / ___| | __ | |_) |_ __ __ _ _ __   __| |
    | |/ _ \| '_ \  |  < / _ \ |/ / |  _ <| '__/ _` | '_ \ / _` |
    | | (_) | |_) | | . \  __/   <  | |_) | | | (_| | | | | (_| |
    |_|\___/| .__/  |_|\_\___|_|\_\ |____/|_|  \__,_|_| |_|\__,_|
            | |                                                  
            |_|                                                  

  By Nebelwolfi                             
 
]]--

--[[ Auto updater start ]]--
local version = 0.044
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKBrand.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKBrand.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Brand - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKBrand.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        TopKekMsg("New version available v"..ServerVersion)
        TopKekMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () TopKekMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
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
if  myHero.charName ~= "Brand" then return end -- not supported :(

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

if VIP_USER then HookPackets() end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
local QReady, WReady, EReady, RReady, IReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end, function() if Ignite ~= nil then return myHero:CanUseSpell(self.Ignite) end end
local RebornLoaded, RevampedLoaded, MMALoaded, SxOrbLoaded, SOWLoaded = false, false, false, false, false
local Target 
local sts
local predictions = {}
local combos = {}
local enemyTable = {}
local enemyCount = 0
data = {
    [_Q] = { speed = 1200, delay = 0.5, range = 1050, width = 80, collision = true, aoe = false, type = "linear"},
    [_W] = { speed = 900, delay = 0.25, range = 1050, width = 275, collision = false, aoe = true, type = "circular"},
    [_E] = { range = 625, type = "targeted"},
    [_R] = { range = 750, type = "targeted"}
    }

function OnLoad()
  Config = scriptConfig("Top Kek Brand", "TKBrand1")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro", "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)

  if ActivePred() == "DivinePred" then Config.misc:addParam("time","DPred Extra Time", SCRIPT_PARAM_SLICE, 0.03, 0, 0.3, 2) end
  if ActivePred() == "HPrediction" then SetupHPred() end
  
  Config:addSubMenu("Misc settings", "casual")
  Config.casual:addSubMenu("Zhonya's settings", "zhg")
  Config.casual.zhg:addParam("enabled", "Use Auto Zhonya's", SCRIPT_PARAM_ONOFF, true)
  Config.casual.zhg:addParam("zhghp", "Min. % health for Zhonya's", SCRIPT_PARAM_SLICE, 15, 1, 50, 0)

  Config:addSubMenu("Combo Settings", "comboConfig")
  Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("Qs", "Q only for stun", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("Rhp", "R under enemy HP", SCRIPT_PARAM_SLICE, 30, 1, 100, 0)
  Config.comboConfig:addParam("items", "Use Items", SCRIPT_PARAM_ONOFF, true)

  Config:addSubMenu("Ult Settings", "rConfig")
  Config.rConfig:addParam("r", "Auto-R", SCRIPT_PARAM_ONOFF, true)
  Config.rConfig:addParam("toomanyenemies", "Min. enemies for auto-r", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)

  Config:addSubMenu("Harrass Settings", "harrConfig")
  Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("Qs", "Q only for stun", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
      
  Config:addSubMenu("Killsteal Settings", "KS")
  Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

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
  Config.kConfig:addParam("lc", "Farm (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  
  Config:addSubMenu("Orbwalk Settings", "oConfig")
  SetupOrbwalk()

  Config.kConfig:permaShow("combo")
  Config.kConfig:permaShow("harr")
  Config.kConfig:permaShow("har")
  Config.kConfig:permaShow("lc")
  sts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_MAGICAL, false, true)
  Config:addSubMenu("Target Selector", "ts")
  Config.ts:addTS(sts)

    for i = 1, heroManager.iCount do
        local champ = heroManager:GetHero(i)
        if champ.team ~= player.team then
            enemyCount = enemyCount + 1
            enemyTable[enemyCount] = { player = champ, name = champ.charName, blazed = false, damageQ = 0, damageW = 0, damageE = 0, damageR = 0, indicatorText = "", damageGettingText = "", ready = true}
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
  elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
    require "Big Fat Orbwalker"
    Config.oConfig:addParam("Info", "Big Fat Orbwalker detected!", SCRIPT_PARAM_INFO, "")
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
  
  zhg()

  DmgCalculations()

  if Target ~= nil then
    if Config.rConfig.r then
      local enemies = EnemiesAround(myHero, 250)
      if enemies >= Config.rConfig.toomanyenemies then
        CastR(Target)
      end
    end

    if Config.KS.enableKS then 
      Killsteal()
    end

    if Config.kConfig.har or Config.kConfig.harr then
      Harrass()
    end

    if Config.kConfig.combo then
      Combo()
    end
  end

  if Config.kConfig.lc then
    Farm()
  end
end

function Farm()
  if QReady() and Config.farmConfig.Q and Config.farmConfig.mana <= myHero.mana then
    for i, minion in pairs(minionManager(MINION_ENEMY, data[0].range, player, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion)
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
        CastQ(minion)
      end
    end
  end
  if WReady() and Config.farmConfig.W and Config.farmConfig.mana <= myHero.mana then
    for i, minion in pairs(minionManager(MINION_ENEMY, data[1].range, player, MINION_SORT_HEALTH_ASC).objects) do
      local WMinionDmg = GetDmg("W", minion)
      if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range+data[1].width) then
        CastW(minion)
      end
    end    
  end  
  if EReady() and Config.farmConfig.E and Config.farmConfig.mana <= myHero.mana then    
    for i, minion in pairs(minionManager(MINION_ENEMY, data[2].range, player, MINION_SORT_HEALTH_ASC).objects) do    
      local EMinionDmg = GetDmg("E", minion)      
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        CastE(minion)
      end      
    end    
  end  
end

function Combo()
  if Config.comboConfig.Q and ValidTarget(Target, data[0].range) then
    if Config.comboConfig.Qs then
      for i = 1, enemyCount do
        if enemyTable[i].player == Target then
          if enemyTable[i].blazed then
            CastQ(Target)
          end
        end
      end
    else
      CastQ(Target)
    end
  end
  if Config.comboConfig.W and ValidTarget(Target, data[1].range) then
    CastW(Target)
  end
  if Config.comboConfig.E and ValidTarget(Target, data[2].range) then
    CastE(Target)
  end
  if Config.comboConfig.R and Config.comboConfig.Rhp >= Target.health and ValidTarget(Target, data[3].range) then
    CastR(Target)
  end
end

function OnCreateObj(object)
  if object ~= nil and string.find(object.name, "BrandFireMark") then
    for i = 1, enemyCount do
      if GetDistance(object,enemyTable[i].player) < 80 then
        --print(enemyTable[i].name.." is now blazed! Time: "..os.clock())
        enemyTable[i].blazed = true
      end
    end
  end
end
 
function OnDeleteObj(object)
  if string.find(object.name, "BrandFireMark") then
    for i = 1, enemyCount do
      if GetDistance(object,enemyTable[i].player) < 80 then
        --print(enemyTable[i].name.." is no longer blazed! Time: "..os.clock())
        enemyTable[i].blazed = false
      end
    end
  end
end

function Harrass()
  if Config.harrConfig.Q and ValidTarget(Target, data[0].range) then
    if Config.harrConfig.Qs then
      for i = 1, enemyCount do
        if enemyTable[i].player == Target then
          if enemyTable[i].blazed then
            CastQ(Target)
          end
        end
      end
    else
      CastQ(Target)
    end
  end
  if Config.harrConfig.W and ValidTarget(Target, data[1].range) then
    CastW(Target)
  end
  if Config.harrConfig.E and ValidTarget(Target, data[2].range) then
    CastE(Target)
  end
end

function CastQ(Target) 
  local CastPosition, HitChance, Position = Predict(Target, 0, myHero)
  if HitChance >= 2 and QReady() then
    CCastSpell(_Q, CastPosition.x, CastPosition.z)
  end
end
function CastW(Target) 
  local CastPosition, HitChance, Position = Predict(Target, 1, myHero)
  if HitChance >= 2 and WReady() then
    CCastSpell(_W, CastPosition.x, CastPosition.z)
  end
end
function CastE(Target) 
	if EReady() then CastSpell(_E, Target) end
end
function CastR(Target) 
  if RReady() then CastSpell(_R, Target) end
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
    local wDmg = ((GetDmg("W", enemy)) or 0)  
    local eDmg = ((GetDmg("E", enemy)) or 0)  
    local rDmg = ((GetDmg("R", enemy)) or 0)
    local iDmg = 50 + (20 * myHero.level) / 5
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
        CastQ(enemy)
      elseif enemy.health < wDmg and Config.KS.killstealW and ValidTarget(enemy, data[1].range) then
        CastW(enemy)
      elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
        CastE(enemy)
      elseif enemy.health < rDmg and Config.KS.killstealR and ValidTarget(enemy, data[3].range) then
        CastR(enemy)
      elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady() then
        CCastSpell(Ignite, enemy)
      end
    end
  end
end

function zhg()
  if Config.casual.zhg.enabled then
    if GetInventoryHaveItem(3157) and GetInventoryItemIsCastable(3157) then
      if myHero.health <=  myHero.maxHealth * (Config.casual.zhg.zhghp / 100) then
        CastItem(3157)
      end 
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

-- Credits: Da Vinci
local CastableItems = {
  Bork        = { Range = 450, Slot = function() return GetInventorySlotItem(3153) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3153) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY) end, Damage = function(target) return GetDmg("RUINEDKING", Target, myHero) end},
  Bwc         = { Range = 400, Slot = function() return GetInventorySlotItem(3144) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY) end, Damage = function(target) return GetDmg("BWC", Target, myHero) end},
  Hextech     = { Range = 400, Slot = function() return GetInventorySlotItem(3146) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY) end, Damage = function(target) return GetDmg("HXG", Target, myHero) end},
  Blackfire   = { Range = 750, Slot = function() return GetInventorySlotItem(3188) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3188) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3188)) == READY) end, Damage = function(target) return GetDmg("BLACKFIRE", Target, myHero) end},
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
  MakeHPred("W", 1) 
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
  if Config.Drawing.QRange then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range+data[0].width/4, 0x111111)
  end
  if Config.Drawing.WRange then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[1].range+data[1].width/4, 0x111111)
  end
  if Config.Drawing.ERange then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[2].range, 0x111111)
  end
  if Config.Drawing.RRange then
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
    if not Config.Drawing.DmgCalcs then return end
    for i = 1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("AD", enemy, player)
            local damageQ  = GetDmg("Q", enemy, player)
            local damageW  = GetDmg("W", enemy, player)
            local damageE  = GetDmg("E", enemy, player)
            local damageR  = GetDmg("R", enemy, player)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy)) or 0
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageW = damageW
            enemyTable[i].damageE = damageE
            enemyTable[i].damageR = damageR
            if enemy.health < damageQ then
                enemyTable[i].indicatorText = "Q Kill"
                enemyTable[i].ready = QReady()
            elseif enemy.health < damageW then
                enemyTable[i].indicatorText = "W Kill"
                enemyTable[i].ready = WReady()
            elseif enemy.health < damageE then
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady()
            elseif enemy.health < damageR then
                enemyTable[i].indicatorText = "R Kill"
                enemyTable[i].ready = RReady()
            elseif enemy.health < damageQ + damageW then
                enemyTable[i].indicatorText = "Q + W Kill"
                enemyTable[i].ready = QReady() and WReady()
            elseif enemy.health < damageE + damageQ then
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady() and QReady()
            elseif enemy.health < damageW + damageE then
                enemyTable[i].indicatorText = "W + E Kill"
                enemyTable[i].ready = WReady() and EReady()
            elseif enemy.health < damageR + damageQ then
                enemyTable[i].indicatorText = "Q + R Kill"
                enemyTable[i].ready = RReady() and QReady()
            elseif enemy.health < damageR + damageE then
                enemyTable[i].indicatorText = "E + R Kill"
                enemyTable[i].ready = RReady() and EReady()
            elseif enemy.health < damageR + damageW then
                enemyTable[i].indicatorText = "W + R Kill"
                enemyTable[i].ready = RReady() and WReady()
            elseif enemy.health < damageQ + damageW + damageE then
                enemyTable[i].indicatorText = "Q + W + E Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady()
            elseif enemy.health < damageQ + damageW + damageR then
                enemyTable[i].indicatorText = "Q + W + R Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady()
            elseif enemy.health < damageQ + damageE + damageR then
                enemyTable[i].indicatorText = "Q + E + R Kill"
                enemyTable[i].ready = QReady() and EReady() and EReady()
            elseif enemy.health < damageR + damageW + damageE then
                enemyTable[i].indicatorText = "W + E + R Kill"
                enemyTable[i].ready = RReady() and WReady() and EReady()
            elseif enemy.health < damageQ + damageW + damageE + damageR + damageAA + damageI then
                enemyTable[i].indicatorText = "All-In Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady() and RReady()
            else
                local damageTotal = damageQ + damageW + damageE + damageR
                local healthLeft = math.round(enemy.health - damageTotal)
                local percentLeft = math.round(healthLeft / enemy.maxHealth * 100)
                enemyTable[i].indicatorText = percentLeft .. "% Harass"
                enemyTable[i].ready = QReady() or WReady() or EReady() or RReady()
            end

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
  local MagicPen = myHero.magicPen
  local MagicPenPercent = myHero.magicPenPercent
  
  local Armor = math.max(0, enemy.armor*ArmorPenPercent-ArmorPen)
  local ArmorPercent = Armor/(100+Armor)
  local MagicArmor = math.max(0, enemy.magicArmor*MagicPenPercent-MagicPen)
  local MagicArmorPercent = MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level

  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    APDmg = 40*QLevel+40+0.65*AP
  elseif spell == "W" then
    APDmg = 45*WLevel+30+0.6*AP
  elseif spell == "E" then
    ADDmg = 30*ELevel+30+0.55*AP
  elseif spell == "R" then
    APDmg = 100*RLevel+50+0.5*AP
  end

  return ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
end