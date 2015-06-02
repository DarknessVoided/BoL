--[[

  _______            _  __    _      ______ _    _         
 |__   __|          | |/ /   | |    |  ____| |  | |        
    | | ___  _ __   | ' / ___| | __ | |__  | | _| | _____  
    | |/ _ \| '_ \  |  < / _ \ |/ / |  __| | |/ / |/ / _ \ 
    | | (_) | |_) | | . \  __/   <  | |____|   <|   < (_) |
    |_|\___/| .__/  |_|\_\___|_|\_\ |______|_|\_\_|\_\___/ 
            | |                                            
            |_|                                                                                             
            
    By Nebelwolfi

]]--

--[[ Script start ]]--
if myHero.charName ~= "Ekko" then return end

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker
TKEkkoVersion = 0.1

function OnLoad()
  Ek = nil
  if Update() then
    return
  else
    Ek = Ekko()
    DelayAction(function() TopKekMsg("Loaded the latest version (v"..TKEkkoVersion..")") end, 5)
  end
end

function Update()
  local version = TKEkkoVersion
  local AUTO_UPDATE = true
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/nebelwolfi/BoL/master/TKEkko.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH.."TKEkko.lua"
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  if AUTO_UPDATE then
    local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKEkko.version")
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

class "Ekko"

function Ekko:__init()
  self:Vars()
  self:Menu()
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
end

function Ekko:Vars()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then self.Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then self.Ignite = SUMMONER_2 end
  self.QReady, self.WReady, self.EReady, self.RReady, self.IReady, self.SReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end, function() if Ignite ~= nil then return myHero:CanUseSpell(Ignite) end end, function() if Smite ~= nil then return myHero:CanUseSpell(Smite) end end
  self.data = {
    [_Q] = { speed = 1050, delay = 0.25, range = 825, width = 70, collision = false, aoe = false, type = "linear"},
    [_W] = { speed = math.huge, delay = 1, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
    [_E] = { delay = 0.50, range = 600}}
  self.Target = nil
  self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_MAGICAL, false, true)
  self.Mobs = minionManager(MINION_ALL, 2500, myHero, MINION_SORT_HEALTH_ASC)
  self.colorIndicatorReady    = ARGB(255, 0,   255, 0)
  self.colorIndicatorNotReady = ARGB(255, 255, 220, 0)
  self.colorInfo              = ARGB(255, 255, 50,  0)
  self.killTextTable = {}
  self.myEvilTwin = nil
  for k,enemy in pairs(GetEnemyHeroes()) do
    self.killTextTable[enemy.networkID] = { indicatorText = "", damageGettingText = "", ready = true}
  end
end

function Ekko:Menu()
  self.Config = scriptConfig("Top Kek Ekko", "TKEkko")
  
  self.Config:addSubMenu("Prediction Settings", "misc")
  UPL:AddSpell(_Q, self.data[_Q])
  UPL:AddSpell(_W, self.data[_W])
  UPL:AddToMenu(self.Config.misc)

  self.Config:addSubMenu("Combo Settings", "comboConfig")
  self.Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)

  self.Config:addSubMenu("Harrass Settings", "harrConfig")
  self.Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  
  self.Config:addSubMenu("Farm Settings", "farmConfig")
  self.Config.farmConfig:addSubMenu("Lane Clear/Jungle Clear", "lc")
  self.Config.farmConfig:addSubMenu("Last Hit", "lh")
  self.Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
  self.Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("mana", "Min. mana %", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
      
  self.Config:addSubMenu("Killsteal Settings", "KS")
  self.Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then self.Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

  self.Config:addSubMenu("Draw Settings", "Drawing")
  self.Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("R", "R", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("dmgCalc", "Damage", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("lfc", "Lagg Free Circles", SCRIPT_PARAM_ONOFF, true)
  self.Config.Drawing:addParam("lfcq", "LFC Quality", SCRIPT_PARAM_SLICE, 32, 8, 64, mlog(8))
  
  self.Config:addSubMenu("Key Settings", "kConfig")
  self.Config.kConfig:addParam("combo", "SBTW (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  self.Config.kConfig:addParam("harr", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  self.Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("G"))
  self.Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  self.Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  
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

function Ekko:SetupOrbwalk()
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
  elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
    require "Big Fat Orbwalker"
    self.Config.oConfig:addParam("Info", "Big Fat Orbwalker detected!", SCRIPT_PARAM_INFO, "")
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

function Ekko:Tick()
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

  self:LastHit()

  if self.Config.kConfig.lc and self.Config.farmConfig.lc.Q then
    self:LaneClear()
  end

  self:DmgCalc()
end

function Ekko:CreateObj(obj)
  if obj ~= nil and obj.valid then
    if obj.name == "Ekko" then
      self.myEvilTwin = obj
    end
  end
end

function Ekko:GetCustomTarget()
    self.ts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return self.ts.target
end

function Ekko:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((self.Config.kConfig.lh and self.Config.farmConfig.lh.Q) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.Q)) then
    for minion,winion in pairs(self.Mobs.objects) do
      local QMinionDmg = self:GetDmg("Q", winion, myHero)
      if QMinionDmg and QMinionDmg >= winion.health and ValidTarget(winion, self.data[0].range) and GetDistance(winion) < self.data[0].range then
        self:CastQ(unit)
      end
    end
  end
  if myHero:CanUseSpell(_E) == READY and ((self.Config.kConfig.lh and self.Config.farmConfig.lh.E) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.E)) then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg = self:GetDmg("E", winion, myHero)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, self.data[2].range+myHero.range+myHero.boundingRadius) and GetDistance(winion) < self.data[2].range+myHero.range+myHero.boundingRadius then
        self:CastE(unit)
      end
    end
  end
end

function Ekko:LaneClear()
  if myHero:CanUseSpell(_Q) then
    pos, hit = GetQFarmPosition()
    if hit >= 1 then
      self:CastQ(pos)
    end
  end
end

function GetQFarmPosition()
  local BestPos 
  local BestHit = 0
  local objects = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects
  for i, object in ipairs(objects) do
    local hit = CountObjectsNearPos(object.pos or object, 1050, 150, objects)
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

function Ekko:Combo()
  if self.Config.comboConfig.Q and ValidTarget(self.Target, self.data[0].range) then
    self:CastQ(self.Target)
  end
  if self.Config.comboConfig.W and ValidTarget(self.Target, self.data[1].range) then
    local CastPosition, HitChance, Position = UPL:Predict(_W, myHero, self.Target)
    local castPos = Vector(self.Target)-(GetDistance(self.Target)/2)*(Vector(CastPosition)-Vector(self.Target)):normalized() --Vector(self.Target.x-myHero.x, self.Target.y-myHero.y, self.Target.z-myHero.z):normalized()
    self:CastW(castPos)
  end
  if self.Config.comboConfig.E and ValidTarget(self.Target, self.data[2].range+(myHero.range+myHero.boundingRadius)*2) then
    self:CastE(self.Target)
  end
end

function Ekko:Harrass()
  if self.Config.harrConfig.Q and ValidTarget(self.Target, self.data[0].range) then
    self:CastQ(self.Target)
  end
end

function Ekko:CastQ(Targ) 
  if Targ == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Targ)
  if HitChance and HitChance >= 1 then
    self:CCastSpell(_Q, CastPosition.x, CastPosition.z)
  end
end
function Ekko:CastW(Targ) 
  if Targ == nil then return end
  self:CCastSpell(_W, Targ.x, Targ.z)
end
function Ekko:CastE(Targ) 
  if Targ == nil then return end
  self:CCastSpell(_E, Targ.x, Targ.z)
end
function Ekko:CastR() 
  self:CCastSpell(_R)
end

function Ekko:Killsteal()
  for k,v in pairs(GetEnemyHeroes()) do
    local enemy= v
    local qDmg = ((self:GetDmg("Q", enemy, myHero)) or 0)  
    local eDmg = ((self:GetDmg("E", enemy, myHero)) or 0)  
    local rDmg = ((self:GetDmg("R", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) and enemy.health < qDmg and self.Config.KS.killstealQ and ValidTarget(enemy, self.data[0].range) then
        self:CastQ(enemy)
      elseif myHero:CanUseSpell(_E) and enemy.health < eDmg and self.Config.KS.killstealE and ValidTarget(enemy, self.data[2].range+myHero.range+myHero.boundingRadius) then
        self:CastE(enemy)
      elseif myHero:CanUseSpell(_R) and enemy.health < rDmg and self.Config.KS.killstealR and GetDistance(enemy, self.myEvilTwin) < myHero.range+myHero.boundingRadius then
        self:CastR()
      elseif enemy.health < iDmg and self.Config.KS.killstealI and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
        self:CCastSpell(Ignite, enemy)
      end
    end
  end
end

function Ekko:Draw()
  if self.Config.Drawing.QRange and myHero:CanUseSpell(_Q) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[0].range+self.data[1].width/4, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.WRange and myHero:CanUseSpell(_W) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[1].range+self.data[1].width/2, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.ERange and myHero:CanUseSpell(_E) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, self.data[2].range, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.R and self.myEvilTwin ~= nil then
    for i=1,3 do
      LagFree(self.myEvilTwin.x, self.myEvilTwin.y, self.myEvilTwin.z, 250, 5, ARGB(255, 0, 155, 155), 3, (math.pi/(amount-1))*(i-1))
    end 
    LagFree(self.myEvilTwin.x, self.myEvilTwin.y, self.myEvilTwin.z, 250, 5, ARGB(255, 0, 155, 155), 9, 0)
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
  end 
end

function Ekko:DmgCalc()
  if not self.Config.Drawing.dmgCalc then return end
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy.visible then
      self.killTextTable[enemy.networkID].indicatorText = ""
      local damageAA = self:GetDmg("AD", enemy, myHero)
      local damageP  = self:GetDmg("P", enemy, myHero)
      local damageQ  = self:GetDmg("Q", enemy, myHero)
      local damageW  = self:GetDmg("W", enemy, myHero)
      local damageE  = self:GetDmg("E", enemy, myHero)
      local damageR  = self:GetDmg("R", enemy, myHero)
      local damageI  = self.Ignite and (self:GetDmg("IGNITE", enemy, myHero)) or 0
      local damageS  = self.Smite and (20 + 8 * myHero.level) or 0
      if self.QReady() then
        self.killTextTable[enemy.networkID].indicatorText = self.killTextTable[enemy.networkID].indicatorText.."Q"
        self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_Q)
      end
      if self.EReady() then
        self.killTextTable[enemy.networkID].indicatorText = self.killTextTable[enemy.networkID].indicatorText.."E"
        self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_E)
      end
      if self.RReady() then
        self.killTextTable[enemy.networkID].indicatorText = self.killTextTable[enemy.networkID].indicatorText.."R"
        self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_R)
      end
      if enemy.health < damageQ+damageE+damageR then
        self.killTextTable[enemy.networkID].indicatorText = self.killTextTable[enemy.networkID].indicatorText.." Kill"
        self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_R)
      end
      if enemy.health > damageQ+damageE+damageR then
        local neededAA = math.ceil((enemy.health-damageQ-damageE-damageR) / (damageAA+damageP/3+damageW))
        self.killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
      end

      local enemyDamageAA = self:GetDmg("AD", myHero, enemy)
      local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
      if enemyNeededAA ~= 0 then         
        self.killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
      end
    end
  end
end
function Ekko:CCastSpell(Spell, xPos, zPos)
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

function Ekko:GetDmg(spell, target, source)
  if target == nil or source == nil then
    return
  end
  local ADDmg            = 0
  local APDmg            = 0
  local AP               = source.ap
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
  elseif spell == "P" then
    APDmg = 15 + 12 * Level + 0.7*AP
  elseif spell == "AD" then
    ADDmg = TotalDmg
  elseif spell == "Q" then
    APDmg = 45 + 15 * QLevel + 0.2*AP
  elseif spell == "Q2" then
    APDmg = 45 + 15 * QLevel + ((QLevel%2==0 and QLevel>0) and 10 or 0) + 0.6*AP
  elseif spell == "W" then
    APDmg = WLevel > 0 and (target.maxHealth-target.health)*(0.05+math.floor(AP/45)/100)
  elseif spell == "E" then
    APDmg = 20 + 30 * ELevel + 0.2*AP
  elseif spell == "R" then
    APDmg = 50 + 150 * RLevel + 1.3*AP
  end
  dmg = math.floor(ADDmg)*(1-ArmorPercent)+math.floor(APDmg)*(1-MagicArmorPercent)
  return math.floor(dmg)
end
function Ekko:DrawLFC(x, y, z, radius, color)
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
  print("<font color=\"#6699ff\"><b>[Top Kek Series]: Ekko - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end