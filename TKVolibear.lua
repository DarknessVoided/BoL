--[[

  _______            _  __    _     __      __   _ _ _                     
 |__   __|          | |/ /   | |    \ \    / /  | (_) |                    
    | | ___  _ __   | ' / ___| | __  \ \  / /__ | |_| |__   ___  __ _ _ __ 
    | |/ _ \| '_ \  |  < / _ \ |/ /   \ \/ / _ \| | | '_ \ / _ \/ _` | '__|
    | | (_) | |_) | | . \  __/   <     \  / (_) | | | |_) |  __/ (_| | |   
    |_|\___/| .__/  |_|\_\___|_|\_\     \/ \___/|_|_|_.__/ \___|\__,_|_|   
            | |                                                            
            |_|                                                                                            
            
    By Nebelwolfi

]]--

--[[ Script start ]]--
if myHero.charName ~= "Volibear" then return end

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

function OnLoad()
  Voli = nil
  if Update() then
    return
  else
    Voli = Volibear()
    DelayAction(function() TopKekMsg("Loaded the latest version (v"..ServerVersion..")") end, 5)
  end
end

function Update()
  local version = 0.12
  local AUTO_UPDATE = true
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/nebelwolfi/BoL/master/TKVolibear.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH.."TKVolibear.lua"
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  if AUTO_UPDATE then
    local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKVolibear.version")
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
  return false
end

class "Volibear"

function Volibear:__init()
  self:Vars()
  self:Menu()
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
end

function Volibear:Vars()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then self.Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then self.Ignite = SUMMONER_2 end
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

function Volibear:Menu()
  self.Config = scriptConfig("Top Kek Voli", "TKVoli")

  self.Config:addSubMenu("Combo Settings", "comboConfig")
  self.Config.comboConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.comboConfig:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)

  self.Config:addSubMenu("Harrass Settings", "harrConfig")
  self.Config.harrConfig:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.harrConfig:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  
  self.Config:addSubMenu("Farm Settings", "farmConfig")
  self.Config.farmConfig:addSubMenu("Lane Clear/Jungle Clear", "lc")
  self.Config.farmConfig:addSubMenu("Last Hit", "lh")
  self.Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
      
  self.Config:addSubMenu("Killsteal Settings", "KS")
  self.Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then self.Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

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

function Volibear:SetupOrbwalk()
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

function Volibear:Tick()
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

  if (self.Config.kConfig.lh and self.Config.farmConfig.lh.Q) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.Q) then
    self:LastHit()
  end

  if self.Config.kConfig.lc and self.Config.farmConfig.lc.Q then
    self:LaneClear()
  end

  self:DmgCalc()
end

function Volibear:GetCustomTarget()
    self.ts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return self.ts.target
end

function Volibear:LastHit()
  if myHero:CanUseSpell(_Q) then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg = self:GetDmg("Q", winion, myHero)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, self.data[0].range) and GetDistance(winion) < self.data[0].range then
        self:CastQ()
      end
    end
  end
  if myHero:CanUseSpell(_W) then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg = self:GetDmg("W", winion, myHero)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, self.data[1].range) and GetDistance(winion) < self.data[1].range then
        self:CastW()
      end
    end
  end
  if myHero:CanUseSpell(_E) then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg = self:GetDmg("E", winion, myHero)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, self.data[2].range) and GetDistance(winion) < self.data[2].range then
        self:CastE()
      end
    end
  end
end

function Volibear:LaneClear()
  if myHero:CanUseSpell(_Q) then
    local minionTarget = nil
    for minion,winion in pairs(self.Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, self.data[0].range) and GetDistance(winion) < self.data[0].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        self:CastQ()
      end
    end
  end
  if myHero:CanUseSpell(_W) then
    local minionTarget = nil
    for minion,winion in pairs(self.Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, self.data[1].range) and GetDistance(winion) < self.data[1].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        self:CastW(minionTarget)
      end
    end
  end
  if myHero:CanUseSpell(_E) then
    local minionTarget = nil
    for minion,winion in pairs(self.Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, self.data[2].range) and GetDistance(winion) < self.data[2].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        self:CastE()
      end
    end
  end
end

function Volibear:Combo()
  if self.Config.comboConfig.Q and myHero:CanUseSpell(_Q) and ValidTarget(self.Target, self.data[0].range) then
    self:CastQ(self.Target)
  end
  if self.Config.comboConfig.W and myHero:CanUseSpell(_W) and ValidTarget(self.Target, self.data[1].range) then
    if self:GetDmg("W", self.Target, myHero) >= self.Target.health then
      self:CastW(self.Target)
    end
  end
  if self.Config.comboConfig.E and myHero:CanUseSpell(_E) and ValidTarget(self.Target, self.data[2].range) then
    self:CastE(self.Target)
  end
end

function Volibear:Harrass()
  if self.Config.comboConfig.Q and myHero:CanUseSpell(_Q) and ValidTarget(self.Target, self.data[0].range) then
    self:CastQ(self.Target)
  end
  if self.Config.comboConfig.W and myHero:CanUseSpell(_W) and ValidTarget(self.Target, self.data[1].range) then
    self:CastW(self.Target)
  end
  if self.Config.comboConfig.E and myHero:CanUseSpell(_E) and ValidTarget(self.Target, self.data[2].range) then
    self:CastE(self.Target)
  end
end

function Volibear:Killsteal()
  for k,v in pairs(GetEnemyHeroes()) do
    local enemy= v
    local qDmg = ((self:GetDmg("Q", enemy, myHero)) or 0)  
    local wDmg = ((self:GetDmg("W", enemy, myHero)) or 0)  
    local eDmg = ((self:GetDmg("E", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 5
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) and enemy.health < qDmg and self.Config.KS.killstealQ and ValidTarget(enemy, self.data[0].range) then
        self:CastQ(enemy)
      elseif myHero:CanUseSpell(_W) and enemy.health < wDmg and self.Config.KS.killstealW and ValidTarget(enemy, self.data[1].range) then
        self:CastW(enemy)
      elseif myHero:CanUseSpell(_E) and enemy.health < eDmg and self.Config.KS.killstealE and ValidTarget(enemy, self.data[2].range) then
        self:CastE()
      elseif enemy.health < iDmg and self.Config.KS.killstealI and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
        self:CCastSpell(Ignite, enemy)
      end
    end
  end
end

function Volibear:CastQ(Targ) 
  self:CCastSpell(_Q)
end
function Volibear:CastW(Targ) 
  if Targ == nil then return end
  self:CCastSpell(_W, Targ)
end
function Volibear:CastE() 
  self:CCastSpell(_E)
end
function Volibear:CastR(Targ) 
  self:CCastSpell(_R)
end
function Volibear:Draw()
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
        damageW  = self:GetDmg("W", winion, myHero)
        neededAA = math.ceil((winion.health-damageW) / damageAA ) --(winion.health/(damageAA)))
        if GetDistance(winion) <= 1500 and not winion.dead then
          if damageW and damageW ~= nil and damageW > winion.health then
            DrawText3D("W Kill", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
          else
            DrawText3D(neededAA.." AA Kill", winion.x, winion.y-15, winion.z, 15, self.colorIndicatorNotReady, 0)
          end
        end
      end
    end
  end 
end

function Volibear:DmgCalc()
  if not self.Config.Drawing.dmgCalc then return end
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy.visible then
      local damageAA = self:GetDmg("AD", enemy, myHero)
      local damageQ  = self:GetDmg("Q", enemy, myHero)
      local damageW  = self:GetDmg("W", enemy, myHero)
      local damageE  = self:GetDmg("E", enemy, myHero)
      local damageI  = self.Ignite and (GetDmg("IGNITE", enemy, myHero)) or 0
      local damageS  = self.Smite and (20 + 8 * myHero.level) or 0
      if enemy.health < damageW then
          self.killTextTable[enemy.networkID].indicatorText = "W Kill"
          self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_W)
      end
      if enemy.health < damageE then
          self.killTextTable[enemy.networkID].indicatorText = "W Kill"
          self.killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_E)
      end
      if myHero:CanUseSpell(_W) and (enemy.health > damageW) then
        local neededAA = math.ceil((enemy.health-damageW) / (damageAA))
        if neededAA > 0 then
          self.killTextTable[enemy.networkID].indicatorText = neededAA.." AA Kill"
        end
      end

      local enemyDamageAA = self:GetDmg("AD", myHero, enemy)
      local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
      if enemyNeededAA ~= 0 then         
        self.killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
      end
    end
  end
end

function Volibear:CCastSpell(Spell, xPos, zPos)
  if not xPos and not zPos then
    if VIP_USER then
        Packet("S_CAST", {spellId = Spell}):send()
    else
        CastSpell(Spell)
    end
  elseif xPos and not zPos then
    target = xPos
    if VIP_USER then
        Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
    else
        CastSpell(Spell, target)
    end
  elseif xPos and zPos then
    if VIP_USER then
      Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
    else
      CastSpell(Spell, xPos, zPos)
    end
  end
end

function Volibear:GetDmg(spell, target, source)
  if target == nil or source == nil then
    return
  end
  local ADDmg            = 0
  local APDmg            = 0
  local AP               = myHero.ap
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
    ADDmg = 30*QLevel+TotalDmg
  elseif spell == "W" then
    ADDmg = (1+(1-target.health/target.maxHealth))*(45*WLevel+35+(source.health-(440+86*Level)))
  elseif spell == "E" then
    APDmg = 45*ELevel+15+0.6*AP
  elseif spell == "R" then
    APDmg = 40*RLevel+35+0.3*AP
  end
  dmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  return math.floor(dmg)
end
function Volibear:DrawLFC(x, y, z, radius, color)
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
  print("<font color=\"#6699ff\"><b>[Top Kek Series]: Volibear - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end