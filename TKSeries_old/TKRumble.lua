--[[

  _______            _  __    _      _____                 _     _      
 |__   __|          | |/ /   | |    |  __ \               | |   | |     
    | | ___  _ __   | ' / ___| | __ | |__) |   _ _ __ ___ | |__ | | ___ 
    | |/ _ \| '_ \  |  < / _ \ |/ / |  _  / | | | '_ ` _ \| '_ \| |/ _ \
    | | (_) | |_) | | . \  __/   <  | | \ \ |_| | | | | | | |_) | |  __/
    |_|\___/| .__/  |_|\_\___|_|\_\ |_|  \_\__,_|_| |_| |_|_.__/|_|\___|
            | |                                                         
            |_|                                                         

    By Nebelwolfi

]]--

--[[ Auto updater start ]]--
local version = 0.082
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKRumble.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKRumble.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Rumble - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKRumble.version")
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
if not _G.UPLloaded then
  if FileExist(LIB_PATH .. "/UPL.lua") then
    require("UPL")
    _G.UPL = UPL()
  else 
    TopKekMsg("Downloading UPL, please don't press F9")
    DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () TopKekMsg("Successfully downloaded UPL. Press F9 twice.") end) end, 3) 
    return
  end
end
--[[ Libraries end ]]--

--[[ Script start ]]--
if myHero.charName ~= "Rumble" then return end -- not supported :(

--Scriptstatus Tracker
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

if VIP_USER then HookPackets() end
local QReady, WReady, EReady, RReady = function() return myHero:CanUseSpell(_Q) == READY end, function() return myHero:CanUseSpell(_W) == READY end, function() return myHero:CanUseSpell(_E) == READY end, function() return myHero:CanUseSpell(_R) == READY end
local RebornLoaded, RevampedLoaded, MMALoaded, SxOrbLoaded, SOWLoaded = false, false, false, false, false
local Target 
local sts
local enemyTable = {}
local enemyCount = 0
local data = {
[_Q] = { speed = 5000, delay = 0.250, range = 600, width = 500, collision = false, aoe = false, type = "cone"},
[_E] = { speed = 1200, delay = 0.250, range = 850, width = 90, collision = true, aoe = false, type = "linear"},
[_R] = { speed = 1200, delay = 0.250, range = 1700, width = 90, collision = false, aoe = false, type = "linear"}
}

function OnLoad()
  Config = scriptConfig("Top Kek Rumble", "TKRumble")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  UPL:AddSpell(_Q, data[_Q])
  UPL:AddSpell(_E, data[_E])
  UPL:AddSpell(_R, data[_R])
  UPL:AddToMenu(Config.misc)

  Config:addSubMenu("Combo Settings", "comboConfig")
  Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  if VIP_USER then Config.comboConfig:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, false) end

  if VIP_USER then 
    Config:addSubMenu("Ult Settings", "rConfig")
    Config.rConfig:addParam("r", "Auto-R", SCRIPT_PARAM_ONOFF, true)
    Config.rConfig:addParam("toomanyenemies", "Min. enemies for auto-r", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
    Config.misc:addParam("SPACE", " ", SCRIPT_PARAM_INFO,"")
    Config.rConfig:addParam("omgisteamfight", "Auto-R in teamfights", SCRIPT_PARAM_ONOFF, true)
    Config.rConfig:addParam("teamfightallies", "Min. allies in teamfight", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.rConfig:addParam("teamfightenemies", "Min. enemies in teamfight", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  end

  Config:addSubMenu("Harrass Settings", "harrConfig")
  Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
      
  Config:addSubMenu("Draw Settings", "Drawing")
  Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, false)
  Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  
  Config:addSubMenu("Key Settings", "kConfig")
  Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  Config.kConfig:addParam("lc", "Last Hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Config.kConfig:addParam("shield", "Auto W", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("N"))
  if VIP_USER then Config.kConfig:addParam("r", "Aim R", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T")) end
  
  Config:addSubMenu("Orbwalk Settings", "oConfig")
  SetupOrbwalk()

  Config.kConfig:permaShow("combo")
  Config.kConfig:permaShow("harr")
  Config.kConfig:permaShow("har")
  Config.kConfig:permaShow("lc")
  Config.kConfig:permaShow("shield")
  sts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_MAGICAL, false, true)
  Config:addSubMenu("Target Selector", "ts")
  Config.ts:addTS(sts)

    for i = 1, heroManager.iCount do
        local champ = heroManager:GetHero(i)
        if champ.team ~= player.team then
            enemyCount = enemyCount + 1
            enemyTable[enemyCount] = { player = champ, name = champ.charName, damageQ = 0, damageE = 0, damageR = 0, indicatorText = "", damageGettingText = "", ready = true}
        end
    end
end

function SetupOrbwalk()
  if _G.AutoCarry then
    if _G.Reborn_Initialised then
      RebornLoaded = true
      TopKekMsg("Found SAC: Reborn.")
      Config.oConfig:addParam("Info", "SAC: Reborn detected!", SCRIPT_PARAM_INFO, "")
    else
      RevampedLoaded = true
      TopKekMsg("Found SAC: Revamped.")
      Config.oConfig:addParam("Info", "SAC: Revamped detected!", SCRIPT_PARAM_INFO, "")
    end
  elseif _G.Reborn_Loaded then
    DelayAction(function() SetupOrbwalk() end, 1)
  elseif _G.MMA_Loaded then
    MMALoaded = true
    TopKekMsg("Found MMA.")
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
    TopKekMsg("Found SOW.")
  else
    TopKekMsg("No valid Orbwalker found. :/")
  end
end

function OnTick()
    local target
    target = GetCustomTarget()
    
    if Config.kConfig.shield and WReady() then 
      if myHero.mana < 40 then
        CastSpell(_W)
      end
    end

    if (Config.kConfig.harr or Config.kConfig.har) and ValidTarget(target, data[2].range) then
      if Config.harrConfig.Q then
      local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, target)
      if HitChance >= 2 then
        CCastSpell(_Q, CastPosition.x, CastPosition.z)
      end
      end
      if Config.harrConfig.E then
        local CastPosition, HitChance, Position = UPL:Predict(_E, myHero, target)
      if HitChance >= 2 then
        CCastSpell(_E, CastPosition.x, CastPosition.z)
      end
      end
    end

    if Config.kConfig.lc then
    FarmQ()
    FarmE()
    end

    if Config.kConfig.combo and ValidTarget(target, 1500) then
      if Config.comboConfig.Q then
      local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, target)
      if HitChance >= 2 then
        CCastSpell(_Q, CastPosition.x, CastPosition.z)
      end
      end
      if Config.comboConfig.W and WReady() then
    CastSpell(_W)
      end
      if Config.comboConfig.E then
      local CastPosition, HitChance, Position = UPL:Predict(_E, myHero, target)
      if HitChance >= 2 then
        CCastSpell(_E, CastPosition.x, CastPosition.z)
      end
      end
      if VIP_USER and Config.comboConfig.R then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, target)
      if HitChance >= 2 then
        CastR(CastPosition, target)
      end
      end
    end
    
    DoSomeUltLogic()

    if VIP_USER and Config.kConfig.r then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, target)
      if HitChance >= 2 then
        CastR(CastPosition, target)
      end
    end
end

function DoSomeUltLogic()
  if not VIP_USER then return end
    if Config.rConfig.r then
      local enemies = EnemiesAround(Target, 250)
      if enemies >= Config.rConfig.toomanyenemies then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, target)
        if HitChance >= 2 then
          CastR(CastPosition, target)
        end
      end
    end
    if Config.rConfig.omgisteamfight then
      local enemies = EnemiesAround(Target, 250)
      local allies = AlliesAround(myHero, 500)
      if enemies >= Config.rConfig.teamfightenemies and allies >= Config.rConfig.teamfightallies then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, target)
        if HitChance >= 2 then
          CastR(CastPosition, target)
        end
      end
    end
end

function EnemiesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function AlliesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team == myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function FarmQ()
  if Config.farmConfig.FarmQ and QReady() then
    for index, minion in pairs(minionManager(MINION_ENEMY, 600, player, MINION_SORT_HEALTH_ASC).objects) do
      local mhp = minion.health
      local qDmg = GetDmg("Q", minion, myHero)
      if qDmg >= mhp then
              CCastSpell(_Q, minion.x, minion.z)
      end
    end
  end
end

function FarmE()
  if Config.farmConfig.FarmE and EReady() then
    for index, minion in pairs(minionManager(MINION_ENEMY, 850, player, MINION_SORT_HEALTH_ASC).objects) do
      local mhp = minion.health
      local eDmg = GetDmg("E", minion, myHero)
      local CastPosition, HitChance, Position = UPL:Predict(_E, myHero, target)
      if eDmg >= mhp and HitChance > 1.5 then
          CCastSpell(_E, CastPosition.x, CastPosition.z)
      end
    end
    end
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end
function CastR(Target, target)
  Pos = Target + (Vector(target) - Target):normalized()*(GetDistance(Target)) --myHero+(Vector(Target)-myHero):normalized()*GetDistance(Target)
  Packet("S_CAST", {spellId = _R, fromX = Pos.x, fromY = Pos.z, toX = Target.x, toY = Target.z}):send()
end

function GetCustomTarget()
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts.target
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

local colorRangeReady        = ARGB(255, 200, 0,   200)
local colorRangeComboReady   = ARGB(255, 255, 128, 0)
local colorRangeNotReady     = ARGB(255, 50,  50,  50)
local colorIndicatorReady    = ARGB(255, 0,   255, 0)
local colorIndicatorNotReady = ARGB(255, 255, 220, 0)
local colorInfo              = ARGB(255, 255, 50,  0)
local KillText = {}
local KillTextColor = ARGB(255, 216, 247, 8)
local KillTextList = {"Harass Him", "Combo Kill"}
function DmgCalculations()
    if not Config.Drawing.DmgCalcs then return end
    for i = 1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("AD", enemy, myHero)
            local damageQ  = GetDmg("Q", enemy, myHero)
            local damageW  = GetDmg("W", enemy, myHero)
            local damageE  = GetDmg("E", enemy, myHero)
            local damageR  = GetDmg("R", enemy, myHero)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy, myHero)) or 0
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
            local neededE = math.ceil(enemy.health / damageE)    
            enemyTable[i].indicatorText = enemyTable[i].indicatorText.." or "..neededE.." E's"

            local enemyDamageAA = GetDmg("AD", myHero, enemy)
            local enemyNeededAA = math.ceil(player.health / enemyDamageAA)            
            enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
    end
end

function GetDmg(spell, target, source)
  if target == nil or source == nil then
    return
  end
  local ADDmg            = 0
  local APDmg            = 0
  local Level            = source.level
  local TotalDmg         = source.totalDamage
  local ArmorPen         = math.floor(source.armorPen)
  local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
  local MagicPen         = math.floor(source.magicPen)
  local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

  local Armor        = target.armor*ArmorPenPercent-ArmorPen
  local ArmorPercent = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or math.ceil(Armor*100/(100-Armor))/100
  local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
  local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level
  if source ~= myHero then
    return TotalDmg*(1-ArmorPercent)
  end
  if spell == "IGNITE" then
    return 50+20*Level/2
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    APDmg = 5+20*QLevel+0.33*AP
  elseif spell == "W" then
    return 0
  elseif spell == "E" then
    return 20+25*ELevel+0.4*AP
  elseif spell == "R" then
    return 75+55*RLevel+0.3*AP
  end
  dmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  return math.floor(dmg)
end