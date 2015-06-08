--[[

  _______            _  __    _       ____       _                         
 |__   __|          | |/ /   | |     / __ \     (_)                        
    | | ___  _ __   | ' / ___| | __ | |  | |_ __ _  __ _ _ __  _ __   __ _ 
    | |/ _ \| '_ \  |  < / _ \ |/ / | |  | | '__| |/ _` | '_ \| '_ \ / _` |
    | | (_) | |_) | | . \  __/   <  | |__| | |  | | (_| | | | | | | | (_| |
    |_|\___/| .__/  |_|\_\___|_|\_\  \____/|_|  |_|\__,_|_| |_|_| |_|\__,_|
            | |                                                            
            |_|                                                            

    By Nebelwolfi

]]--

--[[ Auto updater start ]]--
local version = 0.2
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/TKOrianna.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."TKOrianna.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function TopKekMsg(msg) print("<font color=\"#6699ff\"><b>[Top Kek Series]: Orianna - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKOrianna.version")
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
if myHero.charName ~= "Orianna" then return end -- not supported :(

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
local enemyTable = {}
local enemyCount = 0
local data = {
	[_Q] = { speed = 1200, delay = 0.250, range = 825, width = 175, collision = false, aoe = false, type = "linear"},
	[_W] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular"},
	[_E] = { speed = 1800, delay = 0.250, range = 825, width = 80, collision = false, aoe = false, type = "targeted"},
	[_R] = { speed = math.huge, delay = 0.250, range = 0, width = 410, collision = false, aoe = true, type = "circular"}
}
local Ball = myHero

function OnLoad()
  Config = scriptConfig("Top Kek Orianna", "TKOrianna")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  if VIP_USER then Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"") end
  UPL:AddSpell(_Q, data[0])
  UPL:AddSpell(_W, data[1])
  UPL:AddSpell(_R, data[3])
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
  Config.farmConfig.lc:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lc:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
  Config.farmConfig:addSubMenu("Last Hit", "lh")
  Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.farmConfig.lh:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 40, 0, 100, 0)
			
  Config:addSubMenu("Killsteal Settings", "KS")
  Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

  Config:addSubMenu("Draw Settings", "Drawing")
  Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("Ball", "Ball", SCRIPT_PARAM_ONOFF, true)
  Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  
  Config:addSubMenu("Key Settings", "kConfig")
  Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  
  Config:addSubMenu("Orbwalk Settings", "oConfig")
  SetupOrbwalk()

  Config.kConfig:permaShow("combo")
  Config.kConfig:permaShow("harr")
  Config.kConfig:permaShow("har")
  Config.kConfig:permaShow("lh")
  Config.kConfig:permaShow("lc")
  sts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_MAGICAL, false, true)
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
  	local target
  	target = GetCustomTarget()
    
    if Ball and Ball ~= nil and (GetDistance(Ball) < 125 or GetDistance(Ball) > 1250) then
      Ball = myHero
    end

    zhg()

    if Config.rConfig.r then
  		local enemies = EnemiesAround(Ball, data[3].width)
  		if enemies >= Config.rConfig.toomanyenemies then
	    	CastR(CastPosition, target)
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

  if Config.kConfig.lh and not (Config.kConfig.har or Config.kConfig.harr) and not Config.kConfig.combo and Config.farmConfig.lh.mana <= myHero.mana then
    LastHit()
  end

  if Config.kConfig.lc and not (Config.kConfig.har or Config.kConfig.harr) and not Config.kConfig.combo and Config.farmConfig.lc.mana <= myHero.mana then
    LaneClear()
  end
end

function LastHit()
  if QReady() and Config.farmConfig.lh.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion, GetMyHero())
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
        CastQ(minion)
        return
      end
    end
  end
  if WReady() and Config.farmConfig.lh.W then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1250, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local WMinionDmg = GetDmg("W", minion, GetMyHero())
      if WMinionDmg >= minion.health and GetDistance(minion, Ball) < data[1].width then
        CastW(minion)
        return
      end
    end    
    if WReady() and QReady() and Config.farmConfig.lh.Q then
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg("Q", minion, GetMyHero())
        local WMinionDmg = GetDmg("W", minion, GetMyHero())
        if WMinionDmg+QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
          CastQ(minion)
          DelayAction(CastW, 0.25, {minion})
          return
        end
      end 
  end   
  end
  if EReady() and Config.farmConfig.lh.E then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local EMinionDmg = GetDmg("E", minion, GetMyHero())      
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        --CastE(minion)
      end      
    end    
  end  
end

function LaneClear()
  if QReady() and Config.farmConfig.lc.Q then
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local QMinionDmg = GetDmg("Q", minion, GetMyHero())
      if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
        CastQ(minion)
        return
      end
    end
  end
  if WReady() and Config.farmConfig.lc.W then
    for i, minion in pairs(minionManager(MINION_ENEMY, 1250, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local WMinionDmg = GetDmg("W", minion, GetMyHero())
      if WMinionDmg >= minion.health and GetDistance(minion, Ball) < data[1].width then
        CastW(minion)
        return
      end
    end    
    if WReady() and QReady() and Config.farmConfig.lc.Q then
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg("Q", minion, GetMyHero())
        local WMinionDmg = GetDmg("W", minion, GetMyHero())
        if WMinionDmg+QMinionDmg >= minion.health and ValidTarget(minion, data[0].range+data[0].width) then
          CastQ(minion)
          DelayAction(CastW, 0.25, {minion})
          return
        end
      end 
    end   
  end
  if EReady() and Config.farmConfig.lc.E then    
    for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
      local EMinionDmg = GetDmg("E", minion, GetMyHero())      
      if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
        --CastE(minion)
      end      
    end    
  end  
  if WReady() and QReady() and Config.farmConfig.lc.Q then
    local minionTarget = GetLowestMinion(data[0].range, myHero)
    if minionTarget ~= nil then
      CastQ(minionTarget)
      DelayAction(CastW, 0.25, {minionTarget})
      return
    end
  end   
  if QReady() and Config.farmConfig.lc.Q then
    local minionTarget = GetLowestMinion(data[0].range, myHero)
    if minionTarget ~= nil then
      CastQ(minionTarget)
      return
    end
  end
  if WReady() and Config.farmConfig.lc.W then
    local minionTarget = GetLowestMinion(data[1].width, Ball)
    if minionTarget ~= nil then
      CastW(minionTarget)
      return
    end
  end
end

function GetLowestMinion(range, unit)
  local minionTarget = nil
  for i, minion in pairs(minionManager(MINION_ENEMY, range, unit, MINION_SORT_HEALTH_ASC).objects) do
    if minionTarget == nil then 
      minionTarget = minion
    elseif minionTarget.health >= minion.health and ValidTarget(minion, range) then
      minionTarget = minion
    end
  end
  return minionTarget
end

function Combo()
  target = GetCustomTarget()
  if target == nil then return end
  if QReady() and Config.comboConfig.Q then
  	CastQ(target)
  end
  if WReady() and Config.comboConfig.W then
  	CastW(target)
  end
  if EReady() and Config.comboConfig.E and Ball ~= nil and GetDistance(Ball) > 100 and VectorPointProjectionOnLineSegment(Ball, myHero, target) then
  	CastE(myHero)
  end
  if RReady() and target.health < (GetDmg("R", target, myHero)+GetDmg("AD", target, myHero)) and Config.comboConfig.R then
  	CastR(target)
  end
end

function Harrass()
  target = GetCustomTarget()
  if QReady() and Config.harrConfig.Q and Config.harrConfig.mana <= myHero.mana then
  	CastQ(target)
  end
  if WReady() and Config.harrConfig.W and Config.harrConfig.mana <= myHero.mana then
  	CastW(target)
  end
  if EReady() and Config.harrConfig.E and Config.harrConfig.mana <= myHero.mana and Ball ~= nil and GetDistance(Ball) > 100 then
  	CastE(myHero)
  end
end

function EnemiesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function Killsteal()
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		local qDmg = ((GetDmg("Q", enemy, myHero)) or 0)	
		local wDmg = ((GetDmg("W", enemy, myHero)) or 0)	
		local eDmg = ((GetDmg("E", enemy, myHero)) or 0)	
		local rDmg = ((GetDmg("R", enemy, myHero)) or 0)
		local iDmg = 50 + (20 * myHero.level) / 5
		if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
			if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
				CastQ(enemy)
			elseif enemy.health < wDmg and Config.KS.killstealW and ValidTarget(enemy, data[1].range) then
				CastW(enemy)
			elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
				--CastE(enemy)
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
      if myHero.health <=  myHero.maxHealth * (Config.casual.zhg.zhonyapls / 100) then
        CastItem(3157)
      end 
    end 
  end 
end

function CastQ(unit)
  if not QReady() or unit == nil or myHero.dead or Ball == nil then return end  
  local CastPosition, HitChance, Position = UPL:Predict(_Q, Ball, unit)
  if HitChance >= 1.5 then  
    CCastSpell(_Q, CastPosition.x, CastPosition.z)
  end  
end

function CastW(unit)
  if not WReady() or unit == nil or myHero.dead or Ball == nil then return end
  --local CastPosition, HitChance, Position = UPL:Predict(_W, Ball, unit)
  if GetDistance(unit, Ball) < data[1].width-unit.boundingRadius then  
    CastSpell(_W)
  end  
end

function CastE(unit)
  if not EReady() or myHero.dead then return end
  CastSpell(_E, unit) -- soon(tm)
end

function CastR(unit)
  if not RReady() or unit == nil or myHero.dead or Ball == nil then return end
  --local CastPosition, HitChance, Position = UPL:Predict(_R, Ball, unit)
  if GetDistance(unit, Ball) < data[3].width-unit.boundingRadius then  
    CastSpell(_R)
  end  
end

function CCastSpell(Spell)
  if VIP_USER and Config.misc.pc then
      Packet("S_CAST", {spellId = Spell}):send()
  else
      CastSpell(Spell)
  end
end

function CCastSpell(Spell, target)
  if VIP_USER and Config.misc.pc then
      Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
  else
      CastSpell(Spell, target)
  end
end

function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end

function GetCustomTarget()
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts.target
end

function OnCreateObj(object)
  if object.team ~= myHero.team then
    return
  end  
  if object.name == "TheDoomBall" then
    Ball = object
  end  
end

function OnProcessSpell(unit, spell)  
  if not unit.isMe then
    return
  end
  if spell.name == "OrianaIzunaCommand" then
    Ball = nil
  end  
  if spell.name == "OrianaRedactCommand" then
    Ball = spell.target
  end  
end

function OnDraw()
	if Config.Drawing.QRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range+data[0].width/4, 0x111111)
	end
  	if Ball ~= nil then  
		if Config.Drawing.Ball and Ball ~= nil then
      if GetDistance(Ball) > 100 then
		    DrawCircle(Ball.x-8, Ball.y, Ball.z+87, data[0].width-50, 0x111111)
        DrawLFC(Ball.x-8, Ball.y, Ball.z+87, data[0].width-50, ARGB(255, 75, 0, 230), 4)
      end
		end
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
  local MagicArmor = math.max(0, enemy.magicArmor*MagicPenPercent-MagicPen)
  local MagicArmorPercent = MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level

  if spell == "IGNITE" then
    return 50+20*Level
  elseif spell == "AD" then
    ADDmg = TotalDmg+0.15*AP
  elseif spell == "Q" then
    APDmg = 30+30*QLevel+0.5*AP
  elseif spell == "W" then
    APDmg = 25+45*WLevel+0.7*AP
  elseif spell == "E" then
    APDmg = 30+30*ELevel+0.3*AP
  elseif spell == "R" then
    APDmg = 75+75*RLevel+0.7*AP
  end

  return ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
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
            local damageAA = GetDmg("AD", enemy, player)
            local damageQ  = GetDmg("Q", enemy, player)
            local damageW  = GetDmg("W", enemy, player)
            local damageE  = GetDmg("E", enemy, player)
            local damageR  = GetDmg("R", enemy, player)
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageW = damageW
            enemyTable[i].damageE = damageE
            enemyTable[i].damageR = damageR
            if enemy.health < damageR then
                enemyTable[i].indicatorText = "R Kill"
                enemyTable[i].ready = RReady()
            elseif enemy.health < damageQ then
                enemyTable[i].indicatorText = "Q Kill"
                enemyTable[i].ready = QReady()
            elseif enemy.health < damageE then
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady()
            elseif enemy.health < damageW then
                enemyTable[i].indicatorText = "W Kill"
                enemyTable[i].ready = WReady()
            elseif enemy.health < damageE + damageQ then
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady() and QReady()
            elseif enemy.health < damageQ + damageW then
                enemyTable[i].indicatorText = "Q + W Kill"
                enemyTable[i].ready = QReady() and WReady()
            elseif enemy.health < damageW + damageE then
                enemyTable[i].indicatorText = "W + E Kill"
                enemyTable[i].ready = WReady() and EReady()
            elseif enemy.health < damageR + damageQ then
                enemyTable[i].indicatorText = "R + Q Kill"
                enemyTable[i].ready = RReady() and QReady()
            elseif enemy.health < damageR + damageE then
                enemyTable[i].indicatorText = "R + E Kill"
                enemyTable[i].ready = RReady() and EReady()
            elseif enemy.health < damageR + damageW then
                enemyTable[i].indicatorText = "R + W Kill"
                enemyTable[i].ready = RReady() and WReady()
            elseif enemy.health < damageQ + damageW + damageE then
                enemyTable[i].indicatorText = "Q + W + E Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady()
            elseif enemy.health < damageQ + damageE + damageR then
                enemyTable[i].indicatorText = "Q + E + R Kill"
                enemyTable[i].ready = QReady() and EReady() and EReady()
            elseif enemy.health < damageQ + damageW + damageR then
                enemyTable[i].indicatorText = "Q + W + R Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady()
            elseif enemy.health < damageR + damageW + damageE then
                enemyTable[i].indicatorText = "W + E + R Kill"
                enemyTable[i].ready = RReady() and WReady() and EReady()
            elseif enemy.health < damageQ + damageW + damageE + damageR then
                enemyTable[i].indicatorText = "All-In Kill"
                enemyTable[i].ready = QReady() and WReady() and EReady() and RReady()
            else
                local damageTotal = damageQ + damageW + damageE + damageR
                local healthLeft = math.round(enemy.health - damageTotal)
                local percentLeft = math.round(healthLeft / enemy.maxHealth * 100)
                enemyTable[i].indicatorText = percentLeft .. "% Harass"
                enemyTable[i].ready = QReady() or EReady() or RReady()
            end
            local enemyDamageAA = getDmg("AD", player, enemy)
            local enemyNeededAA = math.ceil(player.health / enemyDamageAA)            
            enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
    end
end
function DrawLFC(x, y, z, radius, color, amount)
  for i=1, amount do
    LagFree(x, y, z, radius, 3, color, 3, (math.pi/(amount-1))*(i-1))
  end 
  LagFree(x, y, z, radius, 3, color, 3*amount, 0)
end
function LagFree(x, y, z, radius, width, color, quality, degree)
    local radius = radius or 300
    local screenMin = WorldToScreen(D3DXVECTOR3(x - radius, y, z + radius))
    if OnScreen({x = screenMin.x + 200, y = screenMin.y + 200}, {x = screenMin.x + 200, y = screenMin.y + 200}) then
        radius = radius*.92
        local quality = quality and 2 * math.pi / quality or 2 * math.pi / math.floor(radius / 10)
        local width = width and width or 1
        local a = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(degree), y, z - radius * math.sin(degree)))
        for theta = quality, 2 * math.pi + quality, quality do
            local b = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta+degree), y, z - radius * math.sin(theta+degree)))
            DrawLine(a.x, a.y, b.x, b.y, width, color)
            a = b
        end
    end
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end