--[[

  _______            _  __    _      __  __       _          _                
 |__   __|          | |/ /   | |    |  \/  |     | |        | |               
    | | ___  _ __   | ' / ___| | __ | \  / | __ _| |______ _| |__   __ _ _ __ 
    | |/ _ \| '_ \  |  < / _ \ |/ / | |\/| |/ _` | |_  / _` | '_ \ / _` | '__|
    | | (_) | |_) | | . \  __/   <  | |  | | (_| | |/ / (_| | | | | (_| | |   
    |_|\___/| .__/  |_|\_\___|_|\_\ |_|  |_|\__,_|_/___\__,_|_| |_|\__,_|_|   
            | |                                                               
            |_|                                                               
            
    By Nebelwolfi

]]--

--[[ Auto updater start ]]--
local version = 0.02
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKMalzahar.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKMalzahar.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Malzahar - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKMalzahar.version")
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
if myHero.charName ~= "Malzahar" then return end -- not supported :(

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

if VIP_USER then HookPackets() end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
local QReady, WReady, EReady, RReady, IReady = function() return myHero:CanUseSpell(_Q) == READY end, function() return myHero:CanUseSpell(_W) == READY end, function() return myHero:CanUseSpell(_E) == READY end, function() return myHero:CanUseSpell(_R) == READY end, function() if Ignite ~= nil then return myHero:CanUseSpell(self.Ignite) == READY end end
local RebornLoaded, RevampedLoaded, MMALoaded, SxOrbLoaded, SOWLoaded = false, false, false, false, false
local Target 
local sts
local predictions = {}
local enemyTable = {}
local enemyCount = 0
local lastAttack = 0
local previousWindUp = 0
local previousAttackCooldown = 0
local ultOn      = 0
local data = {
  [_Q] = { speed = math.huge, delay = 0.5, range = 900, width = 100, collision = false, aoe = false, type = "linear"},
  [_W] = { speed = math.huge, delay = 0.5, range = 800, width = 250, collision = false, aoe = false, type = "circular"},
  [_E] = { speed = math.huge, delay = 0.5, range = 650, type = "targeted"},
  [_R] = { speed = math.huge, delay = 0.5, range = 700, type = "targeted"}
}
local soldiers = {}
table.insert(soldiers, myHero)

function OnLoad()
  Config = scriptConfig("Top Kek Malzahar", "TKMalzahar")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  UPL:AddSpell(_Q, data[_Q])
  UPL:AddSpell(_W, data[_W])
  UPL:AddToMenu(Config.misc)
  
  Config:addSubMenu("Misc settings", "casual")
  Config.casual:addSubMenu("Zhonya's settings", "zhg")
  Config.casual.zhg:addParam("enabled", "Use Auto Zhonya's", SCRIPT_PARAM_ONOFF, true)
  Config.casual.zhg:addParam("zhonyapls", "Min. % health for Zhonya's", SCRIPT_PARAM_SLICE, 15, 1, 50, 0)

  Config:addSubMenu("Combo Settings", "comboConfig")
  Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)

  Config:addSubMenu("Harrass Settings", "harrConfig")
  Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
  
  Config:addSubMenu("Farm Settings", "farmConfig")
  Config.farmConfig:addSubMenu("Lane Clear", "lc")
  Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
  Config.farmConfig:addSubMenu("Last Hit", "lh")
  Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
      
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
  Config.Drawing:addParam("lfc", "Lagg Free Circles", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("lfcq", "LFC Quality", SCRIPT_PARAM_SLICE, 32, 8, 64, mlog(8))
  
  Config:addSubMenu("Key Settings", "kConfig")
  Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  
  Config:addSubMenu("Orbwalk Settings", "oConfig")
  Config.oConfig:addParam("move", "Move to mouse", SCRIPT_PARAM_ONOFF, true)
  Config.oConfig:addParam("attack", "Autoattack", SCRIPT_PARAM_ONOFF, true)

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
      enemyTable[enemyCount] = { player = champ, name = champ.charName, damageQ = 0, damageW = 0, damageE = 0, damageR = 0, indicatorText = "", damageGettingText = "", ready = true}
    end
  end
end

function OnTick()
  local target
  target = GetCustomTarget()
  
  zhg()

  DmgCalculations()

  if Config.oConfig.move and (Config.kConfig.har or Config.kConfig.harr or Config.kConfig.combo or Config.kConfig.lc) and ultOn < GetInGameTimer() and GetDistanceSqr(mousePos, myHero.pos) > 800 and heroCanMove() then
    myHero:MoveTo(mousePos.x, mousePos.z)
  end

  if Config.KS.enableKS then 
    Killsteal()
  end
  if target ~= nil then 
    if (Config.kConfig.har or Config.kConfig.harr) and not Config.kConfig.combo then
      Harrass(target)
    end

    if Config.kConfig.combo then
      Combo(target)
    end
  end

  if Config.kConfig.lh and Config.farmConfig.lh.mana then
    LastHit()
  end
  if Config.kConfig.lc and Config.farmConfig.lc.mana then
    LaneClear()
  end
end

function Combo(target)
  if Config.comboConfig.Q and QReady() then
    CastQ(target)
  end
  if Config.comboConfig.E and EReady() then
    CastE(target)
  end
  if Config.comboConfig.W and WReady() then
    CastW(target)
  end
  if Config.comboConfig.R and RReady() then
    CastR(target)
  end
  if Config.oConfig.attack and timeToShoot() and ultOn < GetInGameTimer() and GetDistance(target) < myHero.range+myHero.boundingRadius then
    lastAttack = GetInGameTimer()+0.25
    myHero:Attack(target)
  end
end

function Harrass(target)
  if Config.harrConfig.Q and QReady() then
    CastQ(target)
  end
  if Config.harrConfig.E and EReady() then
    CastE(target)
  end
  if Config.harrConfig.W and WReady() then
    CastW(target)
  end
  if Config.oConfig.attack and timeToShoot() and ultOn < GetInGameTimer() and GetDistance(target) < myHero.range+myHero.boundingRadius then
    lastAttack = GetInGameTimer()+0.25
    myHero:Attack(target)
  end
end

function OnProcessSpell(unit, spell)  
  if unit.isMe then
    if spell.name:lower():find("attack") and not string.find(spell.name, "summoner") then
      --print(spell.name.." "..spell.windUpTime)
      lastAttack = GetTickCount() - GetLatency()/2
      previousWindUp = spell.windUpTime*1000
      previousAttackCooldown = spell.animationTime*1000
    end
    if string.find(spell.name, "NetherGrasp") then
      ultOn = GetInGameTimer()+2.5
    end
  end
end
 
function timeToShoot()
  return (GetTickCount() + GetLatency()/2 > lastAttack + previousAttackCooldown)
end
 
function heroCanMove()
  return (GetTickCount() + GetLatency()/2 > lastAttack + previousWindUp + 50)
end

function LastHit()
  if QReady() and Config.farmConfig.lh.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion, myHero)
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
        CastQ(minion)
      end
    end
  end
  if WReady() and Config.farmConfig.lh.W then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local WMinionDmg = GetDmg("Wt", minion, myHero)      
      if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range) then
        CastW(minion)
      end      
    end    
  end  
  if EReady() and Config.farmConfig.lh.E then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local EMinionDmg = GetDmg("Et", minion, myHero)
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        CastE(minion)
      end
    end
  end
end

function LaneClear()
  --Check for lowlife: Lasthit = priority!
  if QReady() and Config.farmConfig.lc.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion, myHero)
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
        CastQ(minion)
      end
    end
  end
  if WReady() and Config.farmConfig.lc.W then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local WMinionDmg = GetDmg("Wt", minion, myHero)      
      if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range) then
        CastW(minion)
      end      
    end    
  end  
  if EReady() and Config.farmConfig.lc.E then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Et", minion, myHero)
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
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
  if WReady() and Config.farmConfig.lc.W then
    local pos, hit = GetWFarmPosition(data[1].range, data[1].width)
    if pos ~= nil then
      CastW(pos)
    end
  end  
  if EReady() and Config.farmConfig.lc.E then
    local minionTarget = GetLowestMinion(data[2].range)
    if minionTarget ~= nil then
      CastE(minionTarget)
    end
  end  
  if timeToShoot() and Config.oConfig.attack and ultOn < GetInGameTimer() then
    minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius)
    if minionTarget ~= nil and GetDistance(minionTarget)<myHero.range+myHero.boundingRadius then
      lastAttack = GetInGameTimer()+0.25
      myHero:Attack(minionTarget)
    end
  end
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

function GetWFarmPosition(range, radius)
  local BestPos 
  local BestHit = 0
  local objects = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects
  for i, object in ipairs(objects) do
    local hit = CountObjectsNearPos(object.pos or object, data[1].range, data[1].width, objects)
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

function CountObjectsNearPos(pos, range, radius, objects)
  local n = 0
  for i, object in ipairs(objects) do
    if GetDistance(pos, object) <= radius then
      n = n + 1
    end
  end
  return n
end

function EnemiesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function Killsteal()
  for i=1, heroManager.iCount do
    local enemy = heroManager:GetHero(i)
    local qDmg = ((GetDmg("Q", enemy, myHero)) or 0)  
    local wDmg = ((GetDmg("Wt", enemy, myHero)) or 0)  
    local eDmg = ((GetDmg("Et", enemy, myHero)) or 0)  
    local rDmg = ((GetDmg("Rt", enemy, myHero)) or 0)
    local iDmg = 10 + (4 * myHero.level)
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
        CastQ(enemy)
      elseif enemy.health < wDmg and Config.KS.killstealW and ValidTarget(enemy, data[1].range) then
        CastW(enemy)
      elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
        CastE(enemy)
      elseif enemy.health < rDmg and Config.KS.killstealR and ValidTarget(enemy, data[3].range) then
        CastR(enemy)
      elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady then
        CCastSpell(Ignite, enemy)
      end
    end
  end
end

function zhg()
  if Config.casual.zhg.enabled then
    if GetInventoryHaveItem(3157) and GetInventoryItemIsCastable(3157) then
      if myHero.health <=  myHero.maxHealth * (Config.casual.zhg.zhonyapls / 100) then
        CastItem(3157)
      end 
    end 
  end 
end

function CastQ(unit)
  if unit == nil or GetDistance(unit) > data[0].range then return end
  local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, unit)
  if HitChance and HitChance >= 1.2 and QReady() then
    CCastSpell(_Q, CastPosition.x, CastPosition.z)
  end
end
function CastW(unit)
  if unit == nil or GetDistance(unit) > data[1].range+data[1].width then return end
  local CastPosition, HitChance, Position = UPL:Predict(_W, myHero, unit)
  if HitChance and HitChance >= 1.2 and WReady() then
    CCastSpell(_W, CastPosition.x, CastPosition.z)
  end
end
function CastE(unit)
  if unit == nil or GetDistance(unit) > data[2].range then return end
  CCastSpell(_E, unit)
end
function CastR(unit)
  if unit == nil or GetDistance(unit) > data[3].range then return end
  CCastSpell(_R, unit)
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
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts.target
end

function OnDraw()
  if Config.Drawing.QRange then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[0].range, ARGB(255, 155, 155, 155))
  end
  if Config.Drawing.WRange then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[1].range+data[1].width/4, ARGB(255, 155, 155, 155))
  end
  if Config.Drawing.ERange then
    DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range, ARGB(255, 155, 155, 155))
  end
  if Config.Drawing.RRange then
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
        DrawText(enemyTable[i].indicatorText, 15, posX, posY, ARGB(255, 0, 255, 0))
       
        -- Taking damage
        DrawText(enemyTable[i].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 0, 0))
      end
    end
  end      
end

function DmgCalculations()
    if not Config.Drawing.dmgCalc then return end
    for i=1, enemyCount do
        local enemy = enemyTable[i].player
          if ValidTarget(enemy) and enemy.visible then
            local damageAA = GetDmg("AD", enemy, myHero)
            local damageQ  = GetDmg("Q", enemy, myHero)
            local damageW  = GetDmg("Wf", enemy, myHero)
            local damageE  = GetDmg("Ef", enemy, myHero)
            local damageR  = GetDmg("Rf", enemy, myHero)
            local damageI  = Ignite and (GetDmg("IGNITE", enemy, myHero)) or 0
            local damageT  = 0
            enemyTable[i].indicatorText = ""
            if QReady() then
              enemyTable[i].indicatorText=enemyTable[i].indicatorText.."Q"
              damageT = damageT + damageQ
            elseif WReady() then
              enemyTable[i].indicatorText=enemyTable[i].indicatorText.."W"
              damageT = damageT + damageW
            elseif EReady() then
              enemyTable[i].indicatorText=enemyTable[i].indicatorText.."E"
              damageT = damageT + damageE
            elseif RReady() then
              enemyTable[i].indicatorText=enemyTable[i].indicatorText.."R"
              damageT = damageT + damageR
            end
            if enemy.health < damageT then
                enemyTable[i].indicatorText=enemyTable[i].indicatorText.."Kill"
                enemyTable[i].ready = true
            else
                local healthLeft = math.round(enemy.health - damageT)
                local percentLeft = math.round(healthLeft / enemy.maxHealth * 100)
                enemyTable[i].indicatorText = percentLeft .. "%Harass"
                enemyTable[i].ready = QReady() or WReady() or EReady() or RReady()
            end

            local enemyDamageAA = GetDmg("AD", myHero, enemy)
            local enemyNeededAA = math.ceil(player.health / enemyDamageAA)            
            enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
    end
end

function GetDmg(spell, enemy, source)
  if enemy == nil then
    return
  end
  
  local ADDmg            = 0
  local APDmg            = 0
  local Level            = source.level
  local TotalDmg         = source.totalDamage
  local AP               = myHero.ap
  local ArmorPen         = math.floor(source.armorPen)
  local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
  local MagicPen         = math.floor(source.magicPen)
  local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

  local Armor            = math.max(0, enemy.armor*ArmorPenPercent-ArmorPen)
  local ArmorPercent     = Armor/(100+Armor)
  local MagicArmor       = math.max(0, enemy.magicArmor*MagicPenPercent-MagicPen)
  local MagicArmorPercent= MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = source:GetSpellData(_Q).level, source:GetSpellData(_W).level, source:GetSpellData(_E).level, source:GetSpellData(_R).level

  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    APDmg = 25+55*QLevel+0.8*AP
  elseif spell == "Wt" then
    APDmg = (0.04+0.01*WLevel)*enemy.maxHealth+AP/100
  elseif spell == "Wf" then
    APDmg = ((0.04+0.01*WLevel)*enemy.maxHealth+AP/100)*5
  elseif spell == "Et" then
    APDmg = (20+60*ELevel)/8+0.1*AP
  elseif spell == "Ef" then
    APDmg = 20+60*ELevel+0.8*AP
  elseif spell == "Rt" then
    APDmg = 20+30*RLevel+0.26*AP
  elseif spell == "Rf" then
    APDmg = 100+150*RLevel+1.3*AP
  end
  return ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
end

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