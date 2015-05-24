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

--[[ Script start ]]--
if myHero.charName ~= "Kalista" then return end

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

function OnLoad()
  Kali = nil
  if Update() then
    return
  else
    Kali = Kalista()
    DelayAction(function() TopKekMsg("Loaded the latest version (v"..ServerVersion..")") end, 5)
  end
end

function Update()
  local version = 1.52
  local AUTO_UPDATE = true
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/nebelwolfi/BoL/master/TKKalista.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH.."TKKalista.lua"
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  if AUTO_UPDATE then
    local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKKalista.version")
    if ServerData then
      ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
      if ServerVersion then
        if tonumber(version) < ServerVersion then
          TopKekMsg("New version available v"..ServerVersion)
          TopKekMsg("Updating, please don't press F9")
          DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () TopKekMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version") end) end, 3)
          return true
        end
      end
    else
      TopKekMsg("Error downloading version info")
    end
  end
  if FileExist(LIB_PATH .. "/UPL.lua") then
    require("UPL")
    _G.UPL = UPL()
  else 
    TopKekMsg("Downloading UPL, please don't press F9")
    DelayAction(function() DownloadFile("https://"..UPDATE_HOST.."/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () TopKekMsg("Successfully downloaded UPL. Press F9 twice.") end) end, 3) 
    return true
  end
  return false
end

class "Kalista"

function Kalista:__init()
  self:Vars()
  self:Menu()
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
  AddRemoveBuffCallback(function(unit, buff) self:RemoveBuff(unit, buff) end)
end

function Kalista:Vars()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then self.Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then self.Ignite = SUMMONER_2 end
  self.QReady, self.WReady, self.EReady, self.RReady, self.IReady, self.SReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end, function() if Ignite ~= nil then return myHero:CanUseSpell(Ignite) end end, function() if Smite ~= nil then return myHero:CanUseSpell(Smite) end end
  self.data = {
    [_Q] = { speed = 1750, delay = 0.25, range = 1450, width = 70, collision = true, aoe = false, type = "linear"},
    [_W] = { delay = 1.5, range = 5500},
    [_E] = { delay = 0.50, range = 1000},
    [_R] = { range = 4000}}
  self.Target = nil
  self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_PHYSICAL, false, true)
  self.Mobs = minionManager(MINION_ALL, 2500, myHero, MINION_SORT_HEALTH_ASC)
  self.stackTable = {}
  self.colorIndicatorReady    = ARGB(255, 0,   255, 0)
  self.colorIndicatorNotReady = ARGB(255, 255, 220, 0)
  self.colorInfo              = ARGB(255, 255, 50,  0)
  self.killTextTable = {}
  for k,enemy in pairs(GetEnemyHeroes()) do
    self.killTextTable[enemy.networkID] = { indicatorText = "", damageGettingText = "", ready = true}
  end
end

function Kalista:Menu()
  self.Config = scriptConfig("Top Kek Kalista", "TKKalista")
  
  self.Config:addSubMenu("Prediction Settings", "misc")
  UPL:AddSpell(_Q, self.data[_Q])
  UPL:AddToMenu(self.Config.misc)

  self.Config:addSubMenu("Combo Settings", "comboConfig")
  self.Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("Er", "Cast E when reset", SCRIPT_PARAM_ONOFF, true)
  --Config.comboConfig:addParam("R", "Use R to save ally", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("items", "Use Items", SCRIPT_PARAM_ONOFF, true)
  if Smite ~= nil then self.Config.comboConfig:addParam("S", "Use Smite", SCRIPT_PARAM_ONOFF, true) end

  self.Config:addSubMenu("Harrass Settings", "harrConfig")
  self.Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
  
  self.Config:addSubMenu("Farm Settings", "farmConfig")
  self.Config.farmConfig:addSubMenu("Lane Clear/Jungle Clear", "lc")
  self.Config.farmConfig:addSubMenu("Last Hit", "lh")
  self.Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
  self.Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
  self.Config.farmConfig:addParam("E", "Use E always", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig:addParam("Ea", "Min minions for E", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  self.Config.farmConfig:addParam("Ej", "Take big one in jungle with E", SCRIPT_PARAM_ONOFF, true)
      
  self.Config:addSubMenu("Killsteal Settings", "KS")
  self.Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then self.Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end
  if Smite ~= nil then self.Config.KS:addParam("killstealS", "Use Smite", SCRIPT_PARAM_ONOFF, true) end

  self.Config:addSubMenu("Draw Settings", "Drawing")
  self.Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("lfc", "Lagg Free Circles", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("lfcq", "LFC Quality", SCRIPT_PARAM_SLICE, 32, 8, 64, mlog(8))
  
  self.Config:addSubMenu("Key Settings", "kConfig")
  self.Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  self.Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  self.Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  self.Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  self.Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  self.Config:addParam("ragequit",  "Ragequit", SCRIPT_PARAM_ONOFF, false) 
  
  self.Config:addSubMenu("Orbwalk Settings", "oConfig")
  self:SetupOrbwalk()

  self.Config.kConfig:permaShow("combo")
  self.Config.kConfig:permaShow("harr")
  self.Config.kConfig:permaShow("har")
  self.Config.kConfig:permaShow("lh")
  self.Config.kConfig:permaShow("lc")
  self.Config:addSubMenu("Target Selector", "ts")
  self.Config.ts:addTS(self.ts)
end

function Kalista:UpdateBuff(unit, buff, stacks)
   if buff.name == "kalistaexpungemarker" then
      self.stackTable[unit.networkID] = stacks
   end
end
 
function Kalista:RemoveBuff(unit, buff)
   if buff.name == "kalistaexpungemarker" then
      self.stackTable[unit.networkID] = nil
   end
end

function Kalista:GetStacks(unit)
   return self.stackTable[unit.networkID] or 0
end

function Kalista:SetupOrbwalk()
  if _G.AutoCarry then
    if _G.Reborn_Initialised then
      TopKekMsg("Found SAC: Reborn")
      self.Config.oConfig:addParam("Info", "SAC: Reborn detected!", SCRIPT_PARAM_INFO, "")
    else
      TopKekMsg("Found SAC: Revamped")
      self.Config.oConfig:addParam("Info", "SAC: Revamped detected!", SCRIPT_PARAM_INFO, "")
    end
  elseif _G.Reborn_Loaded then
    DelayAction(function() self:SetupOrbwalk() end, 1)
  elseif _G.MMA_Loaded then
    TopKekMsg("Found MMA")
    self.Config.oConfig:addParam("Info", "MMA detected!", SCRIPT_PARAM_INFO, "")
  elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
    require 'SxOrbWalk'
    SxOrb = SxOrbWalk()
    SxOrb:LoadToMenu(self.Config.oConfig)
    TopKekMsg("Found SxOrb.")
  elseif FileExist(LIB_PATH .. "SOW.lua") then
    require 'SOW'
    require 'VPrediction'
    SOWVP = SOW(VP)
    self.Config.oConfig:addParam("Info", "SOW settings", SCRIPT_PARAM_INFO, "")
    self.Config.oConfig:addParam("Blank", "", SCRIPT_PARAM_INFO, "")
    SOWVP:LoadToMenu(self.Config.oConfig)
    TopKekMsg("Found SOW")
  else
    TopKekMsg("No valid Orbwalker found")
  end
end

function Kalista:Tick()
  self.Target = self:GetCustomTarget()
  self.Mobs:update()

  if self.Target ~= nil then
    if self.Config.KS.enableKS then 
      self:Killsteal()
    end

    if (self.Config.kConfig.har or self.Config.kConfig.harr) and not self.Config.kConfig.combo then
      self:Harrass()
    end

    if self.Config.kConfig.combo then
      self:Combo()
    end
  end

  self:KillSomethingWithE()

  if (self.Config.kConfig.lh and self.Config.farmConfig.lh.Q) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.Q) then
    self:LastHit()
  end

  if self.Config.kConfig.lc and self.Config.farmConfig.lc.Q then
    self:LaneClear()
  end

  self:DmgCalc()

  if self.Config.ragequit then self.Config.ragequit=false self.Target=myHero.isWindingUp end --trololo ty Hirschmilch
end

function Kalista:KillSomethingWithE()
  if myHero:CanUseSpell(_E) then
    local killableCounter = 0
    for minion,winion in pairs(self.Mobs.objects) do
      local EMinionDmg = self:GetDmg("E", winion, myHero)   
      if EMinionDmg > winion.health and GetDistance(winion) < self.data[2].range then
        if (string.find(winion.charName, "Baron") or string.find(winion.charName, "Dragon") or string.find(winion.charName, "Gromp") or ((string.find(winion.charName, "Krug") or string.find(winion.charName, "Murkwolf") or string.find(winion.charName, "Razorbeak")))) then
          if not string.find(winion.charName, "Mini") then       
            killableCounter = killableCounter +1
          end
        else      
          killableCounter = killableCounter +1
        end
      end
    end
    if (self.Config.farmConfig.E and killableCounter >= self.Config.farmConfig.Ea) or (self.Config.farmConfig.lc.E and killableCounter >= self.Config.farmConfig.lc.Ea) or (self.Config.farmConfig.lh.E and killableCounter >= self.Config.farmConfig.Ea ) or (self.Config.farmConfig.Ej and self.Config.kConfig.lc and killableCounter >= 1) then
      self:CastE()
    end
  end
end

function Kalista:GetCustomTarget()
    self.ts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return self.ts.target
end

function Kalista:LastHit()
  if myHero:CanUseSpell(_Q) then
    for minion,winion in pairs(self.Mobs.objects) do
      local QMinionDmg = self:GetDmg("Q", winion, myHero)
      if QMinionDmg and QMinionDmg >= winion.health and ValidTarget(winion, self.data[0].range) and GetDistance(winion) < self.data[0].range then
        self:CastQ(unit)
      end
    end
  end
end

function Kalista:LaneClear()
  if myHero:CanUseSpell(_Q) then
    local minionTarget = nil
    for minion,winion in pairs(self.Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, self.data[0].range) and GetDistance(winion) < self.data[0].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        self:CastQ(minionTarget)
      end
    end
  end
end

function Kalista:Combo()
  if self.Config.comboConfig.Q and GetDistance(self.Target, myHero) < self.data[0].range then
    self:CastQ(self.Target)
  end
  if self.Config.comboConfig.E and myHero:CanUseSpell(_E) and ValidTarget(self.Target, self.data[2].range) then
    if self:GetDmg("E", self.Target, myHero) >= self.Target.health then
      self:CastE()
    end
    local killableCounter = 0
    for minion,winion in pairs(self.Mobs.objects) do
      local EMinionDmg = self:GetDmg("E", winion, myHero)      
      if EMinionDmg and EMinionDmg >= winion.health and ValidTarget(winion, self.data[2].range) and GetDistance(winion) < self.data[2].range then
        killableCounter = killableCounter +1
      end   
    end   
    if killableCounter > 0 and self.Config.comboConfig.Er then
      self:CastE()
    end
  end
end

function Kalista:Harrass()
  if self.Config.harrConfig.Q and ValidTarget(self.Target, self.data[0].range) then
    self:CastQ(self.Target)
  end
  if self.Config.harrConfig.E and ValidTarget(self.Target, self.data[2].range) then
    if myHero:CanUseSpell(_E) and self.Config.farmConfig.lc.E then   
      local harrassUnit = nil
      local killableCounter = 0
      for minion,winion in pairs(self.Mobs.objects) do
        local EMinionDmg = self:GetDmg("E", winion, myHero)      
        if EMinionDmg and EMinionDmg >= winion.health and ValidTarget(winion, self.data[2].range) and GetDistance(winion) < self.data[2].range then
          killableCounter = killableCounter +1
        end   
      end 
      for i, unit in pairs(GetEnemyHeroes()) do    
        local EChampDmg = self:GetDmg("E", unit, myHero)      
        if EChampDmg and EChampDmg > 0 and ValidTarget(unit, self.data[2].range) and GetDistance(unit) < self.data[2].range then
          harrassUnit = unit
        end      
      end    
      if killableCounter >= self.Config.harrConfig.Ea and harrassUnit ~= nil then
        self:CastE()
      end
    end 
  end
end

function Kalista:CastQ(Targ) 
  if Targ == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Targ)
  if HitChance and HitChance >= 1 then
    self:CCastSpell(_Q)
  end
end
function Kalista:CastW(Targ) 
  if Targ == nil then return end
  self:CCastSpell(_W, Targ.x, Targ.z)
end
function Kalista:CastE() 
  self:CCastSpell(_E)
end
function Kalista:CastR(Targ) 
  self:CCastSpell(_R)
end

function Kalista:Killsteal()
  for k,v in pairs(GetEnemyHeroes()) do
    local enemy= v
    local qDmg = ((self:GetDmg("Q", enemy, myHero)) or 0)  
    local eDmg = ((self:GetDmg("E", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) and enemy.health < qDmg and self.Config.KS.killstealQ and ValidTarget(enemy, self.data[0].range) then
        self:CastQ(enemy)
      elseif myHero:CanUseSpell(_E) and enemy.health < eDmg and self.Config.KS.killstealE and ValidTarget(enemy, self.data[2].range) then
        self:CastE()
      elseif enemy.health < iDmg and self.Config.KS.killstealI and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
        self:CCastSpell(Ignite, enemy)
      end
    end
  end
end

function Kalista:Draw()
  if self.Config.Drawing.QRange and myHero:CanUseSpell(_Q) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[0].range, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.WRange and myHero:CanUseSpell(_W) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[1].range, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.ERange and myHero:CanUseSpell(_E) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[2].range, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.RRange and myHero:CanUseSpell(_R) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[3].range, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.dmgCalc then
    for i,k in pairs(GetEnemyHeroes()) do
      local enemy = k
      if ValidTarget(enemy) then
        local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
        local posX = barPos.x - 35
        local posY = barPos.y - 50
        -- Doing damage
        DrawText(self.killTextTable[enemy.networkID].indicatorText, 15, posX, posY, (self.killTextTable[enemy.networkID].ready and self.colorIndicatorReady or self.colorIndicatorNotReady))
       
        -- Taking damage
        DrawText(self.killTextTable[enemy.networkID].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 0, 0))
      end
    end
    if myHero:CanUseSpell(_E) then
      for minion,winion in pairs(self.Mobs.objects) do
        damageAA = self:GetDmg("AD", winion, myHero)
        damageE  = self:GetDmg("E", winion, myHero)
        damageEx  = self:GetDmg("Ex", winion, myHero)
      local damageEy  = self:GetDmg("Ey", winion, myHero)
        neededAA = math.ceil((winion.health-damageEy-damageEx) / (damageAA+damageEx))
        if self:GetStacks(winion) > 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
          if damageE and damageE ~= nil and damageE > winion.health then
            DrawText3D("E Kill", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
          else
            DrawText3D(math.floor(damageE/winion.health*100).."%", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
          end
        elseif self:GetStacks(winion) == 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
          DrawText3D(neededAA.." AA Kill", winion.x, winion.y-15, winion.z, 15, self.colorIndicatorNotReady, 0)
        end
      end
    end
  end 
end

function Kalista:DmgCalc()
  if not self.Config.Drawing.dmgCalc then return end
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy.visible then
      local damageAA = self:GetDmg("AD", enemy, myHero)
      local damageE  = self:GetDmg("E", enemy, myHero)
      local damageEx  = self:GetDmg("Ex", enemy, myHero)
      local damageEy  = self:GetDmg("Ey", enemy, myHero)
      local damageI  = self.Ignite and (self:GetDmg("IGNITE", enemy, myHero)) or 0
      local damageS  = self.Smite and (20 + 8 * myHero.level) or 0
      if enemy.health < damageE then
          self.killTextTable[enemy.networkID].indicatorText = "E Kill"
          self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_E)
      end
      if myHero:CanUseSpell(_E) and not (enemy.health > damageE) then
        local neededAA = math.ceil((enemy.health-damageEy-damageEx) / (damageAA+damageEx))
        self.killTextTable[enemy.networkID].indicatorText = neededAA.." AA Kill"
      end

      local enemyDamageAA = self:GetDmg("AD", myHero, enemy)
      local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
      if enemyNeededAA ~= 0 then         
        self.killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
      end
    end
  end
end
function Kalista:CCastSpell(Spell, xPos, zPos)
  if not xPos and not zPos then
    if VIP_USER and self.Config.misc.pc then
        Packet("S_CAST", {spellId = Spell}):send()
    else
        CastSpell(Spell)
    end
  elseif xPos and not zPos then
    target = xPos
    if VIP_USER and self.Config.misc.pc then
        Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
    else
        CastSpell(Spell, target)
    end
  elseif xPos and zPos then
    if VIP_USER and self.Config.misc.pc then
      Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
    else
      CastSpell(Spell, xPos, zPos)
    end
  end
end

function Kalista:GetDmg(spell, target, source)
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
  local MagicArmorPercent = MagicArmor/(100+MagicArmor)

  local QLevel, WLevel, ELevel, RLevel = myHero:GetSpellData(_Q).level, myHero:GetSpellData(_W).level, myHero:GetSpellData(_E).level, myHero:GetSpellData(_R).level
  if source ~= myHero then
    return TotalDmg*(1-ArmorPercent)
  end
  if spell == "IGNITE" then
    return 50+20*Level/2
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    ADDmg = 60*QLevel+10+TotalDmg
  elseif spell == "W" then
    return 0
  elseif spell == "E" then
    stacks = self:GetStacks(target)
    ADDmg = stacks > 0 and (10 + (10 * ELevel) + (TotalDmg * 0.6)) + (stacks-1) *(self:kalE(ELevel) + (0.2 + 0.03 * (ELevel-1))*TotalDmg) or 0
  elseif spell == "Ex" then
    stacks = self:GetStacks(target) > 0 and self:GetStacks(target) or 1
    ADDmg = stacks > 0 and (10 + (10 * ELevel) + (TotalDmg * 0.6)) or 0
  elseif spell == "Ey" then
    stacks = self:GetStacks(target) > 0 and self:GetStacks(target) or 1
    ADDmg = stacks > 0 and ((stacks) * (self:kalE(ELevel) + (0.2 + 0.03 * (ELevel-1))*TotalDmg)) or 0
  elseif spell == "R" then
    return 0
  end
  dmg = math.floor(ADDmg)*(1-ArmorPercent)
  return math.floor(dmg)
end

function Kalista:kalE(x)
  if x <= 1 then 
    return 10
  else 
    return self:kalE(x-1) + 2 + x
  end 
end
function Kalista:DrawLFC(x, y, z, radius, color)
    if self.Config.Drawing.lfc then
        LagFree(x, y, z, radius, 1, color, self.Config.Drawing.lfcq)
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
function TopKekMsg(msg) 
  print("<font color=\"#6699ff\"><b>[Top Kek Series]: Kalista - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end