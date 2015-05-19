--[[
  _    _       _  __ _          _   _____              _ _      _   _               _      _ _                          
 | |  | |     (_)/ _(_)        | | |  __ \            | (_)    | | (_)             | |    (_) |                         
 | |  | |_ __  _| |_ _  ___  __| | | |__) | __ ___  __| |_  ___| |_ _  ___  _ __   | |     _| |__  _ __ __ _ _ __ _   _ 
 | |  | | '_ \| |  _| |/ _ \/ _` | |  ___/ '__/ _ \/ _` | |/ __| __| |/ _ \| '_ \  | |    | | '_ \| '__/ _` | '__| | | |
 | |__| | | | | | | | |  __/ (_| | | |   | | |  __/ (_| | | (__| |_| | (_) | | | | | |____| | |_) | | | (_| | |  | |_| |
  \____/|_| |_|_|_| |_|\___|\__,_| |_|   |_|  \___|\__,_|_|\___|\__|_|\___/|_| |_| |______|_|_.__/|_|  \__,_|_|   \__, |
                                                                                                                   __/ |
                                                                                                                  |___/ 
  By Nebelwolfi


  How To Use:

    require("UPL")
    UPL = UPL()

    UPL:AddToMenu(Menu)
    Will add prediction selector to the given scriptConfig

    UPL:AddSpell(_Q, { speed = 1800, delay = 0.25, range = 900, width = 70, collision = true, aoe = false, type = "linear" })
    Will add the spell to all predictions

    CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, Target)
    if HitChance >= X then
      CastSpell(_Q, CastPosition.x, CastPosition.y)
    end
  
  Supports and auto-detects: VPrediction, Prodiction, DivinePrediction, HPrediction, TKPrediction

]]--

class "UPL"

--[[ Auto updater start ]]--
local uplversion = 1.06
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."UPL.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\">[UnifiedPredictionLibrary] "..msg.."</font>") end
if AUTO_UPDATE then
  local uplServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/Common/UPL.version")
  if uplServerData then
    uplServerVersion = type(tonumber(uplServerData)) == "number" and tonumber(uplServerData) or nil
    if uplServerVersion then
      if tonumber(uplversion) < uplServerVersion then
        AutoupdaterMsg("New version available v"..uplServerVersion)
        AutoupdaterMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Updated. ("..uplversion.." => "..uplServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        AutoupdaterMsg("Loaded the latest version (v"..uplServerVersion..")")
      end
    end
  else
    AutoupdaterMsg("Error downloading version info")
  end
end
--[[ Auto updater end ]]--

function UPL:__init()
  self.ActiveP = 1
  self.LastRequest = 0
  self.LoadedToMenu = false
  self.Config = nil
  self.VP  = nil
  self.DP  = nil
  self.HP  = nil
  self.TKP = nil
  self.spellData = { 
    [_Q] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
    [_W] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
    [_E] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
    [_R] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0}
  }
  self.predTable = {}
  if FileExist(LIB_PATH .. "VPrediction.lua") then
    require("VPrediction")
    self.VP = VPrediction()
    table.insert(self.predTable, "VPrediction")
  end

  if FileExist(LIB_PATH .. "Prodiction.lua") then
    require("Prodiction")
    table.insert(self.predTable, "Prodiction")
  end

  if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
    require "DivinePred"
    self.DP = DivinePred() 
    table.insert(self.predTable, "DivinePred")
  end

  if FileExist(LIB_PATH .. "HPrediction.lua") then
    require("HPrediction")
    self.HP = HPrediction()
    table.insert(self.predTable, "HPrediction")
  end

  if FileExist(LIB_PATH .. "TKPrediction.lua") then
    require("TKPrediction")
    self.TKP = TKPrediction()
    table.insert(self.predTable, "TKPrediction")
  end

  return self
end

function UPL:Predict(spell, source, Target)
  if not self:ValidRequest() then return Vector(Target), 0, Vector(Target) end
  if self:ActivePred() == "VPrediction" then
      return self:VPredict(Target, self.spellData[spell], source)
  elseif self:ActivePred() == "Prodiction" then
      local Position, info = Prodiction.GetPrediction(Target, self.spellData[spell].range, self.spellData[spell].speed, self.spellData[spell].delay, self.spellData[spell].width, source)
      if Position ~= nil and not info.mCollision() then
        return Position, 2, Vector(Target)
      else
        return Vector(Target), 0, Vector(Target)
      end
  elseif self:ActivePred() == "DivinePred" then
      local State, Position, perc = self:DPredict(Target, self.spellData[spell], 1.2, source)
      return Position, perc ~= nil and perc*3/100 or 0, Vector(Target)
  elseif self:ActivePred() == "HPrediction" then
      local str = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }
      return self:HPredict(Target, str[spell], source)
  elseif self:ActivePred() == "TKPrediction" then
      return self.TKP:Predict(spell, source, Target)
  end
end

function UPL:AddToMenu(Config)
  if self.LoadedToMenu then return end
  Config:addParam("pred", "Prediction", SCRIPT_PARAM_LIST, self.ActiveP, self.predTable)
  self.Config = Config
  self.LoadedToMenu = true
end

function UPL:AddSpell(spell, array)
  self.spellData[spell] = array
  self:SetupHPred(spell)
end

function UPL:GetSpellData(spell)
  return self.spellData[spell]
end

function UPL:HPredict(Target, spell, source)
  local x1, x2, x3 = self.HP:GetPredict(spell, Target, source)
  return x1, x2*2, x3
end

function UPL:SetupHPred(spell)
  local str = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }
  if self.spellData[spell].type ~= "" then
    self:MakeHPred(str[spell], spell) 
  end
end

function UPL:MakeHPred(hspell, i)
  if self.spellData[i].type == "linear" then
      if self.spellData[i].speed ~= math.huge then 
          self.HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = self.spellData[i].range, speed = self.spellData[i].speed, width = 2*self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      else
          self.HP:AddSpell(hspell, myHero.charName, {type = "PromptLine", range = self.spellData[i].range, width = 2*self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      end
  elseif self.spellData[i].type == "circular" then
      if self.spellData[i].speed ~= math.huge then 
          self.HP:AddSpell(hspell, myHero.charName, {type = "DelayCircle", range = self.spellData[i].range, speed = self.spellData[i].speed, radius = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      else
          self.HP:AddSpell(hspell, myHero.charName, {type = "PromptCircle", range = self.spellData[i].range, radius = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      end
  else --Cone!
      self.HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = self.spellData[i].range, speed = self.spellData[i].speed, width = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
  end
end

function UPL:DPredict(Target, spell)
  local unit = DPTarget(Target)
  local col = spell.collision and 0 or math.huge
  if spell.type == "linear" then
  Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
  Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
  Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return self.DP:predict(unit, Spell)
end

function UPL:VPredict(Target, spell)
  if spell.type == "linear" then
  if spell.aoe then
    return self.VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
  else
    return self.VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
  end
  elseif spell.type == "circular" then
  if spell.aoe then
    return self.VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
  else
    return self.VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
  end
  elseif spell.type == "cone" then
  if spell.aoe then
    return self.VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
  else
    return self.VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
  end
  end
end

function UPL:ActivePred()
    local int = self.Config.pred and self.Config.pred or self.ActiveP
    return tostring(self.predTable[int])
end

function UPL:SetActive(pred)
  for i=1,#predTable do
    if predTable[i] == pred then
      self.ActiveP = i
    end
  end
end

function UPL:ValidRequest()
    if os.clock() - self.LastRequest < self:TimeRequest() then
        return false
    else
        self.LastRequest = os.clock()
        return true
    end
end

function UPL:TimeRequest()
    if self:ActivePred() == "VPrediction" or self:ActivePred() == "HPrediction" or self:ActivePred() == "TKPrediction" then
        return 0.001
    elseif self:ActivePred() == "DivinePred" then
        return 0.2
    end
end
