--[[

  _______            _  __    _      _                _____ _       
 |__   __|          | |/ /   | |    | |              / ____(_)      
    | | ___  _ __   | ' / ___| | __ | |     ___  ___| (___  _ _ __  
    | |/ _ \| '_ \  |  < / _ \ |/ / | |    / _ \/ _ \\___ \| | '_ \ 
    | | (_) | |_) | | . \  __/   <  | |___|  __/  __/____) | | | | |
    |_|\___/| .__/  |_|\_\___|_|\_\ |______\___|\___|_____/|_|_| |_|
            | |                                                     
            |_|                                                     

    By Nebelwolfi

]]--

--[[ Script start ]]--
if myHero.charName ~= "LeeSin" then return end

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

function OnLoad()
  Dari = nil
  if Update() then
    return
  else
    Dari = LeeSin()
    DelayAction(function() TopKekMsg("Loaded the latest version (v"..ServerVersion..")") end, 5)
  end
end

function Update()
  local version = 0.02
  local AUTO_UPDATE = true
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/nebelwolfi/BoL/master/TKLeeSin.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH.."TKLeeSin.lua"
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  if AUTO_UPDATE then
    local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/TKLeeSin.version")
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

class "LeeSin"

function LeeSin:__init()
  require "Collision"
  self:Vars()
  self:Menu()
  AddTickCallback(function() self:Tick() end)
  AddDrawCallback(function() self:Draw() end)
  AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
  AddApplyBuffCallback(function(source, unit, buff) self:ApplyBuff(source, unit, buff) end)
  AddRemoveBuffCallback(function(unit, buff) self:RemoveBuff(unit, buff) end)
end

function LeeSin:Vars()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then self.Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then self.Ignite = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("flash") then self.Flash = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("flash") then self.Flash = SUMMONER_2 end
  self.QReady, self.WReady, self.EReady, self.RReady, self.IReady = function() return myHero:CanUseSpell(_Q) == READY end, function() return myHero:CanUseSpell(_W) == READY end, function() return myHero:CanUseSpell(_E) == READY end, function() return myHero:CanUseSpell(_R) == READY end, function() if Ignite ~= nil then return myHero:CanUseSpell(Ignite) == READY end end
  self.Target = nil
  self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_PHYSICAL, false, true)
  self.Mobs = minionManager(MINION_ALL, 2500, myHero, MINION_SORT_HEALTH_ASC)
  self.stackTable = {}
  self.colorIndicatorReady    = ARGB(255, 0,   255, 0)
  self.colorIndicatorNotReady = ARGB(255, 255, 220, 0)
  self.colorInfo              = ARGB(255, 255, 50,  0)
  self.killTextTable = {}
  self.lastWindup = 0
  self.Wards = {}
  self.casted, self.jumped = false, false
  self.oldPos = nil
  self.qTable = {}
  self.Col = Collision(1100, 1800, 0.25, 70)
  for k,enemy in pairs(GetEnemyHeroes()) do
    self.killTextTable[enemy.networkID] = { indicatorText = "", damageGettingText = "", ready = true}
  end
  for i = 1, objManager.maxObjects do
    local object = objManager:GetObject(i)
    if object ~= nil and object.valid and string.find(string.lower(object.name), "ward") then
      table.insert(self.Wards, object)
    end
  end
end

function LeeSin:Menu()
  self.Config = scriptConfig("Top Kek Lee Sin", "TKLeeSin")
  
  self.Config:addSubMenu("Prediction Settings", "misc")
  UPL:AddSpell(_Q, {range = 1100, width = 50, delay = 0.25, speed = 1800, collision = true, aoe = false, type = "linear"})
  UPL:AddSpell(_R, {range = 2000, width = 150, delay = 0.25, speed = 2000, collision = false, aoe = false, type = "linear"})
  UPL:AddToMenu(self.Config.misc)
  
  self.Config:addSubMenu("Farm Settings", "farmConfig")
  self.Config.farmConfig:addSubMenu("Lane Clear/Jungle Clear", "lc")
  self.Config.farmConfig:addSubMenu("Last Hit", "lh")
  self.Config.farmConfig.lc:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lc:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.farmConfig.lh:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
      
  self.Config:addSubMenu("Killsteal Settings", "KS")
  self.Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
  self.Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
  if Ignite ~= nil then self.Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true) end

  self.Config:addSubMenu("Insec Settings", "Inschallah") 
  for _,ally in pairs(GetAllyHeroes()) do
    self.Config.Inschallah:addParam("I"..i, "Insec towards "..ally.charName, SCRIPT_PARAM_ONOFF, false)
  end
  self.Config.Inschallah:addParam("mouse", "Insec towards mouse on leftclick", SCRIPT_PARAM_ONOFF, false)

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
  self.Config.kConfig:addParam("har", "Harrass (Toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("J"))
  self.Config.kConfig:addParam("lh", "Last hit (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  self.Config.kConfig:addParam("lc", "Lane Clear (Hold)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  self.Config.kConfig:addParam("Inschallah", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
  self.Config.kConfig:addParam("wj", "Wardjump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  
  self.Config:addSubMenu("Orbwalk Settings", "oConfig")
  self:SetupOrbwalk()

  self.Config.kConfig:permaShow("combo")
  self.Config.kConfig:permaShow("harr")
  self.Config.kConfig:permaShow("har")
  self.Config.kConfig:permaShow("lh")
  self.Config.kConfig:permaShow("lc")
  self.Config.kConfig:permaShow("Inschallah")
  self.Config.kConfig:permaShow("wj")
  self.Config:addSubMenu("Target Selector", "ts")
  self.Config.ts:addTS(self.ts)
end

function LeeSin:ProcessSpell(unit, spell)  
  if unit == myHero then
    if string.find(string.lower(spell.name), "attack") then
      self.lastWindup = GetInGameTimer()+spell.windUpTime
    end
  end
end

function LeeSin:SetupOrbwalk()
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

function LeeSin:Tick()
  self.Target = self:GetCustomTarget()
  self.Mobs:update()

  if self.Config.kConfig.wj or (self.casted and not self.jumped) then
    self:WardJump()
  end

  if self.Target ~= nil then
    if self.Config.KS.enableKS then 
      self:Killsteal()
    end

    if self.Config.kConfig.har and not self.Config.kConfig.combo then
      self:HarrassT()
    end
    if self.Config.kConfig.harr and not self.Config.kConfig.combo then
      self:HarrassH()
    end

    if self.Config.kConfig.combo then
      self:Combo()
    end

    if self.Config.kConfig.Inschallah then
      self:Insec()
    end
  end

  if self.Config.kConfig.lh or self.Config.kConfig.lc then
    self:LastHit()
  end

  if self.Config.kConfig.lc then
    self:LaneClear()
  end

  self:DmgCalc()
end

function LeeSin:Insec()
  if myHero:GetSpellData(_R).currentCd ~= 0 or not self.Target then return end
  local insecTowards = nil
  if #GetAllyHeroes() > 0 then
    for _,unit in pairs(GetAllyHeroes()) do
      if GetDistance(unit,self.Target) < 2000 and self.Config.Inschallah['I'..i] then
        insecTowards = unit
      end
    end
  end
  if insecTowards == nil then
    if _G.LeftMousDown and self.Config.Inschallah.mouse then
      insecTowards = mousePos
    else
      return
    end
  end
  CastPosition = insecTowards
  if GetDistance(insecTowards, mousePos) > 50 then
    CastPosition, HitChance, Position = UPL:Predict(_R, myHero, insecTowards)
  end
  CastPosition1 = Vector(self.Target)-300*(Vector(CastPosition)-Vector(self.Target)):normalized()
  myHero:MoveTo(CastPosition1.x, CastPosition1.z)
  if GetDistance(myHero, CastPosition1) < 25 and VectorPointProjectionOnLineSegment(myHero, CastPosition, self.Target) then
    self:CastR(self.Target)
  end
  if GetDistance(CastPosition1) > 800 and not self:GetWardSlot() then
    CastSpell(self.Flash, CastPosition1.x, CastPosition1.z)
    DelayAction(function() self:Jump(CastPosition1, 50, true) end, 0.25)
  elseif GetDistance(CastPosition1) > 300 and GetDistance(CastPosition1) < 600 then
    if self:Jump(CastPosition1, 50, true) then return end
    slot = self:GetWardSlot()
    if not slot then return end
    CastSpell(slot, CastPosition1.x, CastPosition1.z)
  end
end

function OnWndMsg(Msg, Key)
  if Msg == WM_LBUTTONDOWN then 
    _G.LeftMousDown = true
  elseif Msg == WM_LBUTTONUP then
    _G.LeftMousDown = false
  end
end

function LeeSin:WardJump()
  if self.casted and self.jumped then self.casted, self.jumped = false, false
  elseif myHero:CanUseSpell(_W) == READY and myHero:GetSpellData(_W).name == "BlindMonkWOne" then
    local pos = self:getMousePos()
    if self:Jump(pos, 150, true) then return end
    slot = self:GetWardSlot()
    if not slot then return end
    CastSpell(slot, pos.x, pos.z)
  end
end

function LeeSin:Jump(pos, range, useWard)
  for _,ally in pairs(GetAllyHeroes()) do
    if (GetDistance(ally, pos) <= range) then
      CastSpell(_W, ally)
      self.jumped = true
      return true
    end
  end
  for minion,winion in pairs(minionManager(MINION_ALLY, range, pos, MINION_SORT_HEALTH_ASC).objects) do
    if (GetDistance(winion, pos) <= range) then
      CastSpell(_W, winion)
      self.jumped = true
      return true
    end
  end
  table.sort(self.Wards, function(x,y) return GetDistance(x) < GetDistance(y) end)
  for i, ward in ipairs(self.Wards) do
    if (GetDistance(ward, pos) <= range) then
      CastSpell(_W, ward)
      self.jumped = true
      return true
    end
  end
end

function LeeSin:CreateObj(obj)
  if obj ~= nil and obj.valid then
    if string.find(string.lower(obj.name), "ward") then
      table.insert(self.Wards, obj)
    end
  end
end

function LeeSin:getMousePos(range)
  local MyPos = Vector(myHero.x, myHero.y, myHero.z)
  local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
  return MyPos - (MyPos - MousePos):normalized() * 600
end

function LeeSin:GetWardSlot()
  for slot = ITEM_7, ITEM_1, -1 do
    if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (string.find(string.lower(myHero:GetSpellData(slot).name), "ward") or string.find(string.lower(myHero:GetSpellData(slot).name), "trinkettotem")) then
      return slot
    end
  end
  return nil
end

function LeeSin:GetCustomTarget()
    self.ts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return self.ts.target
end

function LeeSin:LastHit()
  if ((self.Config.kConfig.lh and self.Config.farmConfig.lh.Q) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.Q)) and myHero:CanUseSpell(_Q) == READY then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg1 = self:GetDmg("Q1", winion, myHero)
      local MinionDmg2 = self:GetDmg("Q2", winion, myHero)
      if MinionDmg1 and MinionDmg1 >= winion.health+winion.shield and ValidTarget(winion, 1100) then
        self:CastQ1(target)
      elseif MinionDmg2 and MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
        self:CastQ2()
      end
    end
  end
  if ((self.Config.kConfig.lh and self.Config.farmConfig.lh.E) or (self.Config.kConfig.lc and self.Config.farmConfig.lc.E)) and myHero:CanUseSpell(_W) == READY then
    for minion,winion in pairs(self.Mobs.objects) do
      local MinionDmg = self:GetDmg("E", winion, myHero)
      if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, 300) then
        self:CastE()
      end
    end
  end
end

function LeeSin:LaneClear()
  if self.Config.farmConfig.lc.Q and myHero:CanUseSpell(_Q) == READY then
    local minionTarget = nil
    for i, minion in pairs(minionManager(MINION_ENEMY, 1100, myHero, MINION_SORT_HEALTH_ASC).objects) do
      if minionTarget == nil then 
        minionTarget = minion
      elseif minionTarget.health+minionTarget.shield >= minion.health+minion.shield and ValidTarget(minion, 1100) then
        minionTarget = minion
      end
    end
    if minionTarget ~= nil then
      self:CastQ1(minionTarget)
    end
  end
  if self.Config.farmConfig.lc.W and myHero:CanUseSpell(_W) == READY then
    BestPos, BestHit = GetEFarmPosition()
    if BestHit > 1 and GetDistance(BestPos) < 150 then 
      self:CastE()
    end
  end
end

function GetEFarmPosition()
  local BestPos 
  local BestHit = 0
  local objects = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects
  for i, object in ipairs(objects) do
    local hit = CountObjectsNearPos(object.pos or object, 150, 350, objects)
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

function LeeSin:Combo()
  if myHero:CanUseSpell(_E) == READY and ValidTarget(self.Target, 400) and self:IsFirstCast(_E) then
    self:CastE(self.Target)
  end
  if self.Target.health < self:GetDmg("Q", self.Target, myHero)+self:GetDmg("R", self.Target, myHero)+(self.Target.maxHealth-(self.Target.health-self:GetDmg("R", self.Target, myHero)*0.08)) then
    if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
      self:CastQ1(self.Target)
    elseif myHero:CanUseSpell(_Q) == READY and self:hasQ(self.Target) then
      self:CastR(self.Target)
      DelayAction(function() self:CastQ2() end, 0.33)
    end
  elseif myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
    self:CastQ1(self.Target)
  elseif (self:hasQ(self.Target) and GetDistance(self.Target) > myHero.range+myHero.boundingRange*2) or self.qTable[self.Target.networkID]+2.5<GetInGameTimer() then
    self:CastQ2()
  end
end

function LeeSin:IsFirstCast(x)
  if string.find(myHero:GetSpellData(x).name, 'One') then
      return true
  else
      return false
  end
end

function LeeSin:HarrassH()
  if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
    self:CastQ1(self.Target)
  end
  if not self.oldPos and self:hasQ(self.Target) and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
    self.oldPos = myHero
    self:CastQ2()
  end
  if self.oldPos and GetDistance(self.Target) < 250 and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
    for _,winion in pairs(minionManager(MINION_ALLY, 450, self.oldPos, MINION_SORT_HEALTH_ASC).objects) do
      if GetDistance(self.oldPos) < GetDistance(winion) and GetDistance(winion) < 600 then
        self.oldPos = winion
      end
    end
    DelayAction(function() self:Jump(self.oldPos, 400, false) self.oldPos = nil end, 0.33)
  end
  if myHero:CanUseSpell(_E) == READY and ValidTarget(self.Target, 415) then
    self:CastE(self.Target)
  end
end

function LeeSin:hasQ(unit)
  return self.qTable[unit.networkID] and self.qTable[unit.networkID]+3>GetInGameTimer() or false
end

function LeeSin:ApplyBuff(source, unit, buff)
   if buff.name == "BlindMonkQOne" then
      self.qTable[unit.networkID] = GetInGameTimer()
   end
end
 
function LeeSin:RemoveBuff(unit, buff)
   if buff.name == "BlindMonkQOne" then
      self.qTable[unit.networkID] = nil
   end
end

function LeeSin:HarrassT()
  if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast() then
    self:CastQ1(self.Target)
  end
  if myHero:CanUseSpell(_E) == READY and ValidTarget(self.Target, 425) then
    self:CastE(self.Target)
  end
end

function LeeSin:CastQ1(target) 
  if target == nil then return end
  local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, target)
  if HitChance >= 2 and self.QReady() then
    local Mcol = self.Col:GetMinionCollision(myHero, CastPosition)
    local Mcol2 = self.Col:GetMinionCollision(myHero, target)
    if not Mcol and not Mcol2 then
      self:CCastSpell(_Q, CastPosition.x,  CastPosition.z)
    end
  end
end
function LeeSin:CastQ2() 
  self:CCastSpell(_Q)
end
function LeeSin:CastW(target) 
  if target == nil then return end
  if GetDistance(target) < 750+myHero.boundingRadius then
    self:CCastSpell(_W, target)
  end
end
function LeeSin:CastE() 
  self:CCastSpell(_E)
end
function LeeSin:CastR(target) 
  if target == nil then return end
  self:CCastSpell(_R, target)
end

function LeeSin:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    local qDmg = ((self:GetDmg("Q", enemy, myHero)) or 0) 
    local q1Dmg = ((self:GetDmg("Q1", enemy, myHero)) or 0) 
    local q2Dmg = ((self:GetDmg("Q2", enemy, myHero)) or 0)  
    local eDmg = ((self:GetDmg("E", enemy, myHero)) or 0)   
    local rDmg = ((self:GetDmg("R", enemy, myHero)) or 0)  
    local iDmg = (50 + 20 * myHero.level) / 2
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < qDmg and self.Config.KS.killstealQ and ValidTarget(enemy, 1100) then
        self:CastQ1(enemy)
        self:CastQ2()
      elseif myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < q1Dmg and self.Config.KS.killstealQ and ValidTarget(enemy, 1100) then
        self:CastQ1(enemy)
      elseif myHero:CanUseSpell(_Q) and self:hasQ(enemy) and enemy.health+enemy.shield < q2Dmg and self.Config.KS.killstealQ and ValidTarget(enemy, 1100) then
        self:CastQ2()
      elseif myHero:CanUseSpell(_E) and enemy.health+enemy.shield < eDmg and self.Config.KS.killstealE then
        self:CastE(enemy)
      elseif myHero:CanUseSpell(_R) and enemy.health+enemy.shield < rDmg and self.Config.KS.killstealR and ValidTarget(enemy, 425) then
        self:CastR(enemy)
      elseif enemy.health < iDmg and self.Config.KS.killstealI and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

function LeeSin:Draw()
  if self.Config.Drawing.QRange and myHero:CanUseSpell(_Q) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, 1100, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.WRange and myHero:CanUseSpell(_W) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, 700, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.ERange and myHero:CanUseSpell(_E) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, 425, ARGB(255, 155, 155, 155))
  end
  if self.Config.Drawing.RRange and myHero:CanUseSpell(_R) then
    self:DrawLFC(myHero.x, myHero.y, myHero.z, 375, ARGB(255, 155, 155, 155))
  end
  if self.Config.kConfig.Inschallah and _G.LeftMousDown and self.Config.Inschallah.mouse then
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 30, ARGB(255, 155, 0, 0))
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 32, ARGB(255, 155, 0, 0))
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 34, ARGB(255, 155, 0, 0))
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 36, ARGB(255, 155, 0, 0))
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 38, ARGB(255, 155, 0, 0))
    self:DrawLFC(mousePos.x, mousePos.y, mousePos.z, 40, ARGB(255, 155, 0, 0))
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

function LeeSin:DmgCalc()
  if not self.Config.Drawing.dmgCalc then return end
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy.visible then
      self.killTextTable[enemy.networkID].indicatorText = ""
      local damageAA = self:GetDmg("AD", enemy, myHero)
      local damageQ  = self:GetDmg("Q", enemy, myHero)
      local damageE  = self:GetDmg("E", enemy, myHero)
      local damageR  = self:GetDmg("R", enemy, myHero)
      local damageI  = self.Ignite and (self:GetDmg("IGNITE", enemy, myHero)) or 0
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
        self.killTextTable[enemy.networkID].ready = true
      end
      if enemy.health > damageQ+damageE+damageR then
        local neededAA = math.ceil((enemy.health-damageQ-damageE-damageR) / (damageAA))
        self.killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
      end

      local enemyDamageAA = self:GetDmg("AD", myHero, enemy)
      local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health+enemy.shield / enemyDamageAA)   
      if enemyNeededAA ~= 0 then         
        self.killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
      end
    end
  end
end
function LeeSin:CCastSpell(Spell, xPos, zPos)
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

function LeeSin:GetDmg(spell, target, source)
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
    ADDmg = (20 + 30 * QLevel + 0.9 * source.addDamage)*2 + (target.maxHealth-target.health)*0.08
  elseif spell == "Q1" then
    ADDmg = 20 + 30 * QLevel + 0.9 * source.addDamage
  elseif spell == "Q2" then
    ADDmg = 20 + 30 * QLevel + 0.9 * source.addDamage + (target.maxHealth-target.health)*0.08
  elseif spell == "W" then
    return 0
  elseif spell == "E" then
    APDmg = 25 + 35 * ELevel + source.addDamage
  elseif spell == "R" then
    ADDmg = 200 * RLevel + 2 * source.addDamage
  end
  dmg = ADDmg*(1-ArmorPercent)+APDmg*(1-MagicArmorPercent)
  return math.floor(dmg)
end
function LeeSin:DrawLFC(x, y, z, radius, color)
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
  print("<font color=\"#6699ff\"><b>[Top Kek Series]: LeeSin - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end
---------------------------------------

function mlog(x)
  return -math.log(x)/math.log(10)
end
function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end