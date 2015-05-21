--[[

  _______            _  __    _      _                
 |__   __|          | |/ /   | |    | |               
    | | ___  _ __   | ' / ___| | __ | |    _   ___  __
    | |/ _ \| '_ \  |  < / _ \ |/ / | |   | | | \ \/ /
    | | (_) | |_) | | . \  __/   <  | |___| |_| |>  < 
    |_|\___/| .__/  |_|\_\___|_|\_\ |______\__,_/_/\_\
            | |                                       
            |_|                                       

    By Nebelwolfi

]]--

--[[ Auto updater start ]]--
local version = 0.01
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKLux.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKLux.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Lux - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKLux.version")
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
UPL = nil
if FileExist(LIB_PATH .. "/UPL.lua") then
  require("UPL")
  UPL = UPL()
else 
  PrintChat("Please download the UPLib.") 
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
if  myHero.charName ~= "Lux" then return end -- not supported :(
if VIP_USER then HookPackets() end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
local QReady, WReady, EReady, RReady, IReady = function() return myHero:CanUseSpell(_Q) == READY end, function() return myHero:CanUseSpell(_W) == READY end, function() return myHero:CanUseSpell(_E) == READY end, function() return myHero:CanUseSpell(_R) == READY end, function() if Ignite ~= nil then return myHero:CanUseSpell(self.Ignite) == READY end end
local RebornLoaded, RevampedLoaded, MMALoaded, SxOrbLoaded, SOWLoaded = false, false, false, false, false
local Target 
local sts
local predictions = {}
local enemyTable = {}
local enemyCount = 0
local lastWindup = 0
local data = {
  [_Q] = { speed = 1025, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear" },
  [_W] = { speed = 1630, delay = 0.25, range = 1250, width = 210, collision = false, type = "linear" },
  [_E] = { speed = 1275, delay = 0.25, range = 1100, width = 250, collision = false, type = "circular" },
  [_R] = { speed = 25000, delay = 1, range = 3600, width = 250, collision = false, type = "linear" }
}

function OnLoad()
  Config = scriptConfig("Top Kek Lux", "TKLux")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  UPL:AddToMenu(Config.misc)

  for k,v in pairs(data) do
    UPL:AddSpell(k, v)
  end

  Config:addSubMenu("Misc settings", "casual")
  Config.casual:addSubMenu("Zhonya's settings", "zhg")
  Config.casual.zhg:addParam("enabled", "Use Auto Zhonya's", SCRIPT_PARAM_ONOFF, true)
  Config.casual.zhg:addParam("zhonyapls", "Min. % health for Zhonya's", SCRIPT_PARAM_SLICE, 15, 1, 50, 0)

  Config:addSubMenu("Combo Settings", "comboConfig")
  Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("items", "Use Items", SCRIPT_PARAM_ONOFF, true)

  Config:addSubMenu("Ult Settings", "rConfig")
  Config.rConfig:addParam("r", "Auto-R", SCRIPT_PARAM_ONOFF, true)
  Config.rConfig:addParam("toomanyenemies", "Min. enemies for auto-r", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)

  Config:addSubMenu("Harrass Settings", "harrConfig")
  Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addSubMenu("Lane Clear", "lc")
  Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
  Config.farmConfig:addSubMenu("Last Hit", "lh")
  Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
  
  Config:addSubMenu("Killsteal Settings", "KS")
  Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

  Config:addSubMenu("Draw Settings", "Drawing")
  Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  
  Config:addSubMenu("Key Settings", "kConfig")
  Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Config.kConfig:addParam("r", "Cast R", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
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
          enemyTable[enemyCount] = { player = champ, name = champ.charName, damageQ = 0, damageW = 0, damageE = 0, damageR = 0, damageI = 0, indicatorText = "", damageGettingText = "", ready = true}
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

function isLight(unit)
  --if unit == nil then return end
  for i = 1, unit.buffCount do
   local buff = unit:getBuff(i)
   if buff and buff.valid and buff.name ~= nil and string.find(buff.name, "luxilluminati") and buff.endT > GetInGameTimer() then return true end
  end
  return false
end

function isInE(unit)
  --if unit == nil then return end
  for i = 1, unit.buffCount do
   local buff = unit:getBuff(i)
   if buff and buff.valid and buff.name ~= nil and string.find(buff.name, "LuxLightStrikeKugel") and buff.endT > GetInGameTimer() then return true end
  end
  return false
end

function OnTick()
  if lastWindup > GetInGameTimer() then return end
  Target = GetCustomTarget()

  DmgCalculations()

  if Config.KS.enableKS then 
    Killsteal()
  end

  zhg()
  
  if Target ~= nil then
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" then
      CastSpell(_E)
    end

    if (Config.kConfig.har or Config.kConfig.harr) and Config.harrConfig.mana <= myHero.mana then
      Harrass()
    end

    if Config.kConfig.combo then
      Combo()
    end

    if Config.kConfig.r then
      CastR(Target)
    end

    DoSomeUltLogic()

    if Config.ragequit then Config.ragequit=false Target=myHero.isWindingUp end --trololo ty Hirschmilch
  end

  if Config.kConfig.lh and not (Config.kConfig.har or Config.kConfig.harr) and not Config.kConfig.combo and Config.farmConfig.lh.mana <= myHero.mana then
    LastHit()
  end

  if Config.kConfig.lc and not (Config.kConfig.har or Config.kConfig.harr) and not Config.kConfig.combo and Config.farmConfig.lc.mana <= myHero.mana then
    LaneClear()
  end

  if Config.ragequit then Config.ragequit=true Target=myHero.isWindingUp end --trololo ty Hirschmilch
end

function zhg()
  if Config.casual.zhg.enabled then
    if GetInventoryHaveItem(3157) and GetInventoryItemIsCastable(3157) then
      if myHero.health <= myHero.maxHealth * (Config.casual.zhg.zhonyapls / 100) then
        CastItem(3157)
      end 
    end 
  end 
end

function DoSomeUltLogic()
  if Config.rConfig.r then
    local enemies = EnemiesAround(Target, data[3].width)
    if enemies >= Config.rConfig.toomanyenemies and Config.rConfig.r then
      CastR(Target)
    end
  end
end

function EnemiesAround(Unit, range)
  local c=0
  if Unit == nil then return 0 end
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function LastHit()
  if QReady() and Config.farmConfig.lh.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, data[0].range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion)
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
        CastQ(minion)
      end
    end
  end
  if EReady() and Config.farmConfig.lh.E then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local EMinionDmg = GetDmg("E", minion, GetMyHero())      
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        CastE(minion)
        return
      end      
    end    
  end  
end

function LaneClear()
  --Check for lowlife: Lasthit = priority!
  if QReady() and Config.farmConfig.lc.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion, GetMyHero())
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
        CastQ(minion)
      end
    end
  end
  if EReady() and Config.farmConfig.lc.E then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local EMinionDmg = GetDmg("E", minion, GetMyHero())      
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        CastE(minion)
      end      
    end    
  end  
  --Check for lowestlife: Lanceclear - 2nd priority!
  if QReady() and Config.farmConfig.lc.Q then
    local minionTarget = GetLowestMinion(data[0].range)
    if minionTarget ~= nil then
      CastQ(minionTarget)
    end
  end
  if EReady() and Config.farmConfig.lc.E then
    local pos, hit = GetEFarmPosition(data[2].range, data[2].width)
    if pos ~= nil then
      CastE(pos)
    end
  end  
end

function GetEFarmPosition(range, radius)
    local BestPos 
    local BestHit = 0
    local objects = minionManager(MINION_ENEMY, data[2].range, myHero, MINION_SORT_HEALTH_ASC).objects
    for i, object in ipairs(objects) do
        local hit = CountObjectsNearPos(object.pos or object, range, radius, objects)
        if hit > BestHit then
            BestHit = hit
            BestPos = Vector(object)
            if BestHit == #objects then
               break
            end
         end
    end
    return BestPos, BestHit
end

function GetLowestMinion(range)
  local minionTarget = nil
  for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if minionTarget == nil then 
      minionTarget = minion
    elseif minionTarget.health >= minion.health and ValidTarget(minion, range) then
      minionTarget = minion
    end
  end
  return minionTarget
end

function Combo()
  if not isLight(Target) and QReady() and EReady() then
    if Config.comboConfig.E and ValidTarget(Target, data[2].range) then
      CastE(Target)
    end
  elseif not isLight(Target) and QReady() and not EReady() then
    if Config.comboConfig.Q and ValidTarget(Target, data[0].range) then
      CastQ(Target)
    end
  elseif not isLight(Target) and EReady() and not QReady() then
    if Config.comboConfig.E and ValidTarget(Target, data[2].range) then
      CastE(Target)
    end
  elseif isLight(Target) and QReady() then
    DelayAction(function () if Config.comboConfig.Q and ValidTarget(Target, data[0].range) then
                              CastQ(Target)
                            end
                          end, lastWindup-GetInGameTimer()+0.25)
  elseif isLight(Target) and EReady() then
    DelayAction(function () if Config.comboConfig.E and ValidTarget(Target, data[2].range) then
                              CastE(Target)
                            end
                          end, lastWindup-GetInGameTimer()+0.25)
  end
  if Config.comboConfig.W and myHero.health/myHero.maxHealth <= 50 then
    CastW(Target)
  end
  if isLight(Target) and Config.comboConfig.R and Target.health < GetDmg("Rl", Target, myHero) and ValidTarget(Target, data[3].range) then
    local doR = true
    CastR(Target)
  elseif Config.comboConfig.R and Target.health < GetDmg("R", Target, myHero) and ValidTarget(Target, data[3].range) then
    local doR = true
    CastR(Target)
  end
end

function Harrass()
  if Config.harrConfig.Q and ValidTarget(Target, data[0].range) then
    CastQ(Target)
  end
  if Config.harrConfig.E and ValidTarget(Target, data[2].range) then
    CastE(Target)
  end
end

function CastQ(unit) 
  if unit == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, unit)
  if HitChance and HitChance >= 1.2 and QReady() then
    CCastSpell(_Q, CastPosition.x, CastPosition.z)
  end
end
function CastW(unit) 
  if unit == nil then return end
  CCastSpell(_W, myHero.x, myHero.z)
end
function CastE(unit) 
  if unit == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_E, myHero, unit)
  if HitChance and HitChance >= 1.2 and EReady() then
    CCastSpell(_E, CastPosition.x, CastPosition.z)
  end
end
function CastR(unit) 
  if unit == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, unit)
  if HitChance and HitChance >= 2 and RReady() then
    CCastSpell(_R, CastPosition.x, CastPosition.z)
  end
end
function OnProcessSpell(unit, spell)  
  if unit == myHero then
    if not string.find(spell.name, "summoner") then
      lastWindup = GetInGameTimer()+spell.windUpTime
      --print(spell.name.." "..spell.windUpTime.." new lastWindup: "..(math.ceil(lastWindup*100)/100))
    end
  end
end

function Killsteal()
  for i=1, heroManager.iCount do
    local enemy = heroManager:GetHero(i)
    local pDmg = ((GetDmg("PASSIVE", enemy, myHero)) or 0) 
    local qDmg = ((GetDmg("Q", enemy, myHero)) or 0)  
    local wDmg = ((GetDmg("W", enemy, myHero)) or 0)  
    local eDmg = ((GetDmg("E", enemy, myHero)) or 0)  
    local rDmg = ((GetDmg("R", enemy, myHero)) or 0)  
    local rlDmg = ((GetDmg("Rl", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    if enemy ~= nil and ValidTarget(enemy) and not enemy.dead and enemy.visible then
      if enemy.health < qDmg and Config.KS.killstealQ and GetDistance(enemy, myHero) <= data[0].range then
        CastQ(enemy)
      elseif enemy.health < eDmg and Config.KS.killstealE and GetDistance(enemy, myHero) <= data[2].range then
        CastE(enemy)
      elseif enemy.health < rDmg and Config.KS.killstealR and GetDistance(enemy, myHero) <= data[3].range then
        CastR(enemy)
      elseif enemy.health < rlDmg+pDmg and isLight(enemy) and Config.KS.killstealR and GetDistance(enemy, myHero) <= data[3].range then
        CastR(enemy)
      elseif enemy.health < qDmg+rlDmg+pDmg and Config.KS.killstealQ and Config.KS.killstealR and QReady() and RReady() and GetDistance(enemy, myHero) <= data[1].range then
        CastQ(enemy)
        CastR(enemy)
      elseif enemy.health < eDmg+rlDmg+pDmg and Config.KS.killstealE and Config.KS.killstealR and EReady() and RReady() and GetDistance(enemy, myHero) <= data[2].range then
        CastE(enemy)
        CastE(enemy) 
        CastR(enemy)
      elseif enemy.health < qDmg+eDmg+rlDmg+pDmg and Config.KS.killstealQ and Config.KS.killstealE and Config.KS.killstealR and QReady() and EReady() and RReady() and GetDistance(enemy, myHero) <= data[2].range then
        CastQ(enemy)
        CastE(enemy)
        CastE(enemy)
        CastR(enemy)
      elseif enemy.health < iDmg and Config.KS.killstealI and GetDistance(enemy, myHero) <= 600 and IReady() then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

function GetCustomTarget()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts:GetTarget(2000)
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
function OnDraw()
  if Config.Drawing.QRange and QReady() then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range, 0x111111)
  end
  if Config.Drawing.ERange and EReady() then
    DrawCircle(myHero.x, myHero.y, myHero.z, data[2].range+data[2].width/4, 0x111111)
  end
  if Config.Drawing.RRange and RReady() then
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
    if not Config.Drawing.DmgCalc then return end
    for i = 1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("PASSIVE", enemy, player)
            local damageQ  = GetDmg("Q", enemy, player)
            local damageE  = GetDmg("E", enemy, player)
            local damageR  = GetDmg("Rl", enemy, player)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy)) or 0
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageE = damageE
            enemyTable[i].damageR = damageR
            if enemy.health < damageQ then
                enemyTable[i].indicatorText = "Q Kill"
                enemyTable[i].ready = QReady()
            elseif enemy.health < damageE then
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady()
            elseif enemy.health < damageR then
                enemyTable[i].indicatorText = "R Kill"
                enemyTable[i].ready = RReady()
            elseif enemy.health < damageE + damageQ then
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady() and QReady()
            elseif enemy.health < damageR + damageQ then
                enemyTable[i].indicatorText = "Q + R Kill"
                enemyTable[i].ready = RReady() and QReady()
            elseif enemy.health < damageR + damageE then
                enemyTable[i].indicatorText = "E + R Kill"
                enemyTable[i].ready = RReady() and EReady()
            elseif enemy.health < damageQ + damageE + damageR then
                enemyTable[i].indicatorText = "Q + E + R Kill"
                enemyTable[i].ready = QReady() and EReady() and EReady()
            elseif enemy.health < damageQ + damageE + damageR + damageAA + damageI then
                enemyTable[i].indicatorText = "All-In Kill"
                enemyTable[i].ready = QReady() and EReady() and RReady()
            else
                local damageTotal = damageQ + damageE + damageR
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

function GetDmg(spell, enemy, source) --Partially from HTTF
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
  local MagicArmor    = enemy.magicArmor*MagicPenPercent-MagicPen
  local MagicArmorPercent = MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level

  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "PASSIVE" then
    APDmg = 10+8*myHero.level+0.2*AP
  elseif spell == "Q" then
    APDmg = 10+50*QLevel+0.7*AP
  elseif spell == "W" then
    APDmg = 0
  elseif spell == "E" then
    APDmg = 15+45*ELevel+0.6*AP
  elseif spell == "R" then
    APDmg = 20+100*RLevel+0.75*AP
  elseif spell == "Rl" then
    APDmg = 220+150*RLevel+0.75*AP
  end

  return (ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent))*0.9
end