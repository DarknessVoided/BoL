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
local version = 1.03
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
UPL = nil
if FileExist(LIB_PATH .. "/UPL.lua") then
  require("UPL")
  UPL = UPL()
else 
  AutoupdaterMsg("Please download the UPLib.") 
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
local EnemiesK = {}
local Enemies  = GetEnemyHeroes()
local MobsK = {}
local Mobs = minionManager(MINION_ALL, 25000, myHero, MINION_SORT_HEALTH_ASC)
data = {
    [_Q] = { speed = 1750, delay = 0.25, range = 1450, width = 70, collision = true, aoe = false, type = "linear"},
    [_W] = { speed = math.huge, delay = 1.5, range = 5500, type = "dontuse"},
    [_E] = { delay = 0.50, range = 1000, type = "notarget"},
    [_R] = { range = 4000, type = "dontuse"}
    }

function OnLoad()
  for _, unit in pairs(Enemies) do
    table.insert(EnemiesK, {unit = unit, stacks = 0, createTime = 0})
  end

  Config = scriptConfig("Top Kek Kalista", "TKKalista")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  UPL:AddSpell(_Q, data[0])
  UPL:AddToMenu(Config.misc)

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
  Config.harrConfig:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addSubMenu("Lane Clear/Jungle Clear", "lc")
  Config.farmConfig:addSubMenu("Last Hit", "lh")
  Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
  Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
  Config.farmConfig:addParam("E", "Use E always", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  Config.farmConfig:addParam("Ej", "Take big one in jungle with E", SCRIPT_PARAM_ONOFF, true)
      
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
  Config.Drawing:addParam("lfc", "Lagg Free Circles", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("lfcq", "LFC Quality", SCRIPT_PARAM_SLICE, 32, 8, 64, mlog(8))
  
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
      enemyTable[enemyCount] = { player = champ, name = champ.charName, damageQ = 0, damageE = 0, damageI = 0, indicatorText = "", damageGettingText = "", ready = true}
    end
  end

  oObject = oObject()
end

class "oObject"

function oObject:__init()
  AddCreateObjCallback(function(obj) self:HandleCreateObj(obj) end)
  return self
end

function oObject:HandleCreateObj(obj)
  if obj == nil then return end
  rendTable = {
    ["Kalista_Base_E_Spear_tar1.troy"] = { rend = 1 }, ["Kalista_Base_E_Spear_tar2.troy"] = { rend = 2 }, ["Kalista_Base_E_Spear_tar3.troy"] = { rend = 3 }, 
    ["Kalista_Base_E_Spear_tar4.troy"] = { rend = 4 }, ["Kalista_Base_E_Spear_tar5.troy"] = { rend = 5 }, ["Kalista_Base_E_Spear_tar6.troy"] = { rend = 6 }
  }
  rendTableSkin = {
    ["Kalista_Skin01_E_Spear_tar1.troy"] = { rend = 1 }, ["Kalista_Skin01_E_Spear_tar2.troy"] = { rend = 2 }, ["Kalista_Skin01_E_Spear_tar3.troy"] = { rend = 3 }, 
    ["Kalista_Skin01_E_Spear_tar4.troy"] = { rend = 4 }, ["Kalista_Skin01_E_Spear_tar5.troy"] = { rend = 5 }, ["Kalista_Skin01_E_Spear_tar6.troy"] = { rend = 6 }
  }
  for i, unit in pairs(EnemiesK) do
    if GetDistance(unit.unit,obj) < 80 then
      if rendTable[obj.name] or rendTableSkin[obj.name] then
        unit.stacks = (unit.stacks >= 6 and (unit.stacks+1) or rendTable[obj.name].rend)
        unit.createTime = GetInGameTimer()
      end
      if rendTableSkin[obj.name] then
        unit.stacks = (unit.stacks >= 6 and (unit.stacks+1) or rendTableSkin[obj.name].rend)
        unit.createTime = GetInGameTimer()
      end
    end
  end
  for i, mob in pairs(MobsK) do
    if GetDistance(mob.unit,obj) < 80 then
      if rendTable[obj.name] then
        mob.stacks = (mob.stacks >= 6 and (mob.stacks+1) or rendTable[obj.name].rend)
        mob.createTime = GetInGameTimer()
      end
      if rendTableSkin[obj.name] then
        mob.stacks = (mob.stacks >= 6 and (mob.stacks+1) or rendTableSkin[obj.name].rend)
        mob.createTime = GetInGameTimer()
      end
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
  Mobs:update()
  if #Mobs.objects ~= #MobsK or (#Mobs.objects > 0 and Mobs.objects[1] ~= MobsK[1].unit) then
    MobsT = {}
    for k,v in pairs(MobsK) do
      table.insert(MobsT, v)
    end   
    MobsK = {}
    for _, minion in pairs(Mobs.objects) do
      local winion = nil
      for _, mob in pairs(MobsT) do
        if mob.unit == minion then winion = mob end
      end
      if winion ~= nil then
        table.insert(MobsK, {unit = minion, stacks = winion.stacks, createTime = winion.createTime})
      else          
        table.insert(MobsK, {unit = minion, stacks = 0, createTime = 0})
      end
    end
  end
  Target = GetCustomTarget()

  DmgCalculations()

  if Target ~= nil then
    if Config.KS.enableKS then 
      Killsteal()
    end

    if (Config.kConfig.har or Config.kConfig.harr) then
      Harrass()
    end

    if Config.kConfig.combo then
      Combo()
    end
  end

  if EReady() and Config.farmConfig.Ej then  
    local killableUnit = {}  
    for i, mob in pairs(MobsK) do  
      local EMinionDmg = GetDmg("E", mob.unit, myHero)      
      if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range and (string.find(mob.unit.charName, "Baron") or string.find(mob.unit.charName, "Dragon") or string.find(mob.unit.charName, "Gromp") or (string.find(mob.unit.charName, "Krug") or string.find(mob.unit.charName, "Murkwolf") or string.find(mob.unit.charName, "Razorbeak")) and not string.find(mob.unit.charName, "Mini")) then
        table.insert(killableUnit, mob.unit)   
      end    
    end
    if #killableUnit >= 1 then
        CastE()
    end
  end  

  if EReady() and Config.farmConfig.E then  
    local killableUnit = {}  
    for i, mob in pairs(MobsK) do  
      local EMinionDmg = GetDmg("E", mob.unit, myHero)      
      if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range then
        table.insert(killableUnit, mob.unit)   
      end    
    end
    if #killableUnit >= Config.farmConfig.Ea then
        CastE()
    end
  end  

  if Config.kConfig.lh then
    LastHit()
  end
  if Config.kConfig.lc then
    LaneClear()
  end

  if Config.ragequit then Config.ragequit=false Target=myHero.isWindingUp end --trololo ty Hirschmilch
end

function LastHit()
  if QReady() and Config.farmConfig.lh.Q then
    for i, mob in pairs(MobsK) do
      local QMinionDmg = GetDmg("Q", mob.unit, myHero)
      if QMinionDmg and QMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[0].range) and GetDistance(mob.unit) < data[0].range then
        CastQ(unit)
      end
    end
  end
  if EReady() and Config.farmConfig.lh.E then  
    local killableUnit = {}  
    for i, mob in pairs(MobsK) do  
      local EMinionDmg = GetDmg("E", mob.unit, myHero)      
      if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range then
        table.insert(killableUnit, mob.unit)   
      end    
    end
    if #killableUnit >= Config.farmConfig.lh.Ea then
        CastE()
    end
  end  
end

function LaneClear()
    --Check for lowlife: Lasthit = priority!
  if QReady() and Config.farmConfig.lc.Q then
    for i, mob in pairs(MobsK) do
      local QMinionDmg = GetDmg("Q", mob.unit, myHero)
      if QMinionDmg and QMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[0].range) and GetDistance(mob.unit) < data[0].range then
        CastQ(mob.unit)
      end
    end
  end
  if EReady() and Config.farmConfig.lc.E then   
    local killableUnit = {}  
    for i, mob in pairs(MobsK) do
      local EMinionDmg = GetDmg("E", mob.unit, myHero)      
      if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range then
        table.insert(killableUnit, mob.unit)
      end
    end    
    if #killableUnit >= Config.farmConfig.lc.Ea then
        CastE()
    end
  end 
  --Check for lowestlife: Lanceclear - 2nd priority!
  if QReady() and Config.farmConfig.lc.Q then
    local minionTarget = nil
    for i, mob in pairs(MobsK) do
      if minionTarget == nil then 
        minionTarget = mob.unit
        if QMinionDmg and QMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[0].range) and GetDistance(mob.unit) < data[0].range then
          minionTarget = mob.unit
        end
      end
      if minionTarget ~= nil then
        CastQ(minionTarget)
      end
    end
  end
end

function Combo()
  if Config.comboConfig.Q and ValidTarget(Target, data[0].range) then
    CastQ(Target)
  end
  if Config.comboConfig.E and EReady() and ValidTarget(Target, data[2].range) then
    local killableUnit = {}  
    local harrassUnit = {} 
    for i, mob in pairs(MobsK) do    
      local EMinionDmg = GetDmg("E", mob.unit, myHero)      
      if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range then
        table.insert(killableUnit, unit)
      end   
    end  
    for i, unit in pairs(EnemiesK) do    
      local EChampDmg = GetDmg("E", unit.unit, myHero)      
      if EChampDmg and EChampDmg > 0 and ValidTarget(unit.unit, data[2].range) and GetDistance(unit.unit) < data[2].range then
        table.insert(harrassUnit, unit)
      end      
    end    
    if #killableUnit >= 1 and #harrassUnit > 0 and Config.comboConfig.Er then
      CastE()
    elseif GetDmg("E", Target, myHero) >= Target.health then
      CastE()
    end
  end
end

function Harrass()
  if Config.harrConfig.Q and ValidTarget(Target, data[0].range) then
    CastQ(Target)
  end
  if Config.harrConfig.E and ValidTarget(Target, data[2].range) then
    if EReady() and Config.farmConfig.lc.E then   
      local killableUnit = {} 
      local harrassUnit = {} 
      for i, mob in pairs(MobsK) do    
        local EMinionDmg = GetDmg("E", mob.unit, myHero)      
        if EMinionDmg and EMinionDmg >= mob.unit.health and ValidTarget(mob.unit, data[2].range) and GetDistance(mob.unit) < data[2].range then
          table.insert(killableUnit, unit)
        end   
      end  
      for i, unit in pairs(EnemiesK) do    
        local EChampDmg = GetDmg("E", unit.unit, myHero)      
        if EChampDmg and EChampDmg > 0 and ValidTarget(unit.unit, data[2].range) and GetDistance(unit.unit) < data[2].range then
          table.insert(harrassUnit, unit)
        end      
      end    
      if #killableUnit >= Config.harrConfig.Ea and #harrassUnit > 0 then
        CastE()
      end
    end 
  end
end

function CastQ(Targ) 
  local CastPosition, HitChance, Position = UPL:Predict(_Q, Targ, myHero)
  if HitChance and HitChance >= 2 and WReady() then
    CastSpell(_Q)
  end
end
function CastW(Targ) 
  if WReady() then CastSpell(_W) end
end
function CastE() 
  if EReady() then CastSpell(_E) end
end
function CastR(Targ) 
  if RReady() then CastSpell(_R) end
end

function EnemiesAround(Unit, range)
  local c=0
  if Unit == nil then return 0 end
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function Killsteal()
  for i=1, heroManager.iCount do
    local enemy = heroManager:GetHero(i)
    local qDmg = ((GetDmg("Q", enemy, myHero)) or 0)  
    local eDmg = ((GetDmg("E", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    local sDmg = 20 + 8 * myHero.level
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
        CastQ(enemy)
      elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
        CastE()
      elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady() then
        CastSpell(Ignite, enemy)
      elseif enemy.health < sDmg and Config.KS.killstealS and ValidTarget(enemy, 760) and SReady() then
        CastSpell(Smite, enemy)
      end
    end
  end
end

function CCastSpell(Spell, xPos, zPos)
  if not xPos and not zPos then
    if VIP_USER and Config.misc.pc then
        Packet("S_CAST", {spellId = Spell}):send()
    else
        CastSpell(Spell)
    end
  elseif xPos and not zPos then
    target = xPos
    if VIP_USER and Config.misc.pc then
        Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
    else
        CastSpell(Spell, target)
    end
  elseif xPos and zPos then
    if VIP_USER and Config.misc.pc then
      Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
    else
      CastSpell(Spell, xPos, zPos)
    end
  end
end

function GetCustomTarget()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts:GetTarget(data[1].range)
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
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
  if Config.Drawing.QRange and QReady() then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[0].range, ARGB(255, 155, 155, 155))--0x111111)
  end
  if Config.Drawing.WRange and WReady() then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[1].range, ARGB(255, 155, 155, 155))
  end
  if Config.Drawing.ERange and EReady() then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range, ARGB(255, 155, 155, 155))
  end
  if Config.Drawing.RRange and RReady() then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[3].range, ARGB(255, 155, 155, 155))
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
    for k,v in pairs(MobsK) do
      if v.stacks > 0 and GetDistance(v.unit) <= 1000 then
        dmg = GetDmg("E", v.unit, myHero)
        if dmg and dmg > 0 then
          DrawText3D(math.floor(100/v.unit.health*dmg).."%", v.unit.x-45, v.unit.y-45, v.unit.z+45, 20, TARGB({255,250,250,250}), 0) 
        end
      end
    end
  end 
end

function DmgCalculations()
    if not Config.Drawing.dmgCalc then return end
    for i = 1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("AD", enemy, myHero)
            local damageQ  = GetDmg("Q", enemy, myHero)
            local damageE  = GetDmg("E", enemy, myHero)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy, myHero)) or 0
            local damageS  = Smite and (20 + 8 * myHero.level) or 0
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageE = damageE
            enemyTable[i].damageI = damageI
            enemyTable[i].damageS = damageS
            if enemy.health < damageE then
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady()
            elseif enemy.health < damageE + damageQ then
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady() and QReady()
            end
            local neededAA = math.ceil(enemy.health / (damageAA+(kalE(myHero:GetSpellData(_E).level)+(0.12 + 0.03 * myHero:GetSpellData(_E).level)*myHero.totalDamage)))

            enemyTable[i].indicatorText = neededAA.." hits until E"

            local enemyDamageAA = GetDmg("AD", myHero, enemy)
            local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
            if enemyNeededAA ~= 0 then         
              enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
            end
        end
    end
end

function GetDmg(spell, target, source)
  if target == nil or source == nil or target.team == myHero.team then
    return
  end
  local ADDmg            = 0
  local APDmg            = 0
  local Level            = source.level
  local TotalDmg         = source.totalDamage
  local ArmorPen         = source.armorPen
  local ArmorPenPercent  = source.armorPenPercent
  local MagicPen         = source.magicPen
  local MagicPenPercent  = source.magicPenPercent

  local Armor         = math.floor((target.armor*ArmorPenPercent-ArmorPen)*100)/100
  local ArmorPercent  = Armor < 0 and Armor/(100+Armor) or Armor/(100+Armor)
  local MagicArmor    = math.floor((target.magicArmor*MagicPenPercent-MagicPen)*100)/100
  local MagicArmorPercent = MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level
  if source ~= myHero then
    return TotalDmg*(1-ArmorPercent)
  end
  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    ADDmg = 60*QLevel+10+TotalDmg
  elseif spell == "W" then
    return 0
  elseif spell == "E" then
    stacks = 0
    for i, unit in pairs(EnemiesK) do
      if unit.unit == target then
        if unit.createTime + 4 > GetInGameTimer() then
          stacks = unit.stacks
        end
      end
    end
    for i, mob in pairs(MobsK) do
      if mob.unit == target then
        if mob.createTime + 4 > GetInGameTimer() then
          stacks = mob.stacks
        end
      end
    end
    ADDmg = stacks==0 and 0 or (10 + (10 * ELevel) + (TotalDmg * 0.6)) + stacks *(kalE(ELevel) + (0.12 + 0.03 * ELevel)*TotalDmg)
  elseif spell == "R" then
    return 0
  end
  return ADDmg*(1-ArmorPercent)*0.9
end

function kalE(x)
  if x <= 1 then 
    return 10
  else 
    return kalE(x-1) + 2 + x
  end 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end
function DrawLFC(x, y, z, radius, color)
    if Config.Drawing.lfc then
        LagFree(x, y, z, radius, 1, color, Config.Drawing.lfcq)
    else
        local radius = radius or 300
        DrawCircle(x, y, z, radius, 0x111111)
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