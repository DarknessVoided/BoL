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

_G.UPLversion = 1.6
_G.UPLautoupdate = true

--Scriptstatus tracker (usercounter)
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("PCFEDDEJJKJ") 
--Scriptstatus tracker (usercounter)


function UPL:__init()
  if self:Update() then
    DelayAction(function() self:realInit() end, 5)
  else
    self:realInit()
  end
  return self
end

function UPL:Update()
  local UPDATE_HOST = "raw.github.com"
  local UPDATE_PATH = "/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000)
  local UPDATE_FILE_PATH = SCRIPT_PATH.."UPL.lua"
  local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
  if UPLautoupdate then
    local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/Common/UPL.version")
    if ServerData then
      ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
      if ServerVersion then
        if tonumber(UPLversion) < ServerVersion then
          TopKekMsg("New version available v"..ServerVersion)
          TopKekMsg("Updating, please don't press F9")
          DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () TopKekMsg("Successfully updated. ("..UPLversion.." => "..ServerVersion.."), press F9 twice to load the updated version") end) end, 3)
          return true
        else
          TopKekMsg("Loaded the latest version (v"..ServerVersion..")")
        end
      end
    else
      TopKekMsg("Error downloading version info")
    end
  end
  if FileExist(LIB_PATH .. "/UPL.lua") then
    require("UPL")
  else 
    TopKekMsg("Downloading UPL, please don't press F9")
    DelayAction(function() DownloadFile("https://"..UPDATE_HOST.."/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () TopKekMsg("Successfully downloaded UPL. Press F9 twice.") end) end, 3) 
    return true
  end
  return false
end

function UPL:realInit()
  self.ActiveP = 1
  self.LastRequest = 0
  self.LoadedToMenu = false
  self.Config = nil
  self.VP  = nil
  self.DP  = nil
  self.HP  = nil
  self.TKP = nil
  self.HPSpells = {}
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
    --require("Prodiction")
    --table.insert(self.predTable, "Prodiction")
  end

  if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
    require "DivinePred"
    self.DP = DivinePred() 
    table.insert(self.predTable, "DivinePrediction")
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

  DelayAction(function() self:Loaded() end, 2)
end

function UPL:Loaded()
  local preds = ""
  for k,v in pairs(self.predTable) do
    preds=preds.." "..v
    if k ~= #self.predTable then preds=preds.."," end
  end
  self:Msg("Loaded the latest version (v"..UPLversion..")")
  self:Msg("Detected predictions: "..preds)
end

function UPL:Msg(msg)
  print("<font color=\"#6699ff\">[UnifiedPredictionLibrary]</b></font> <font color=\"#FFFFFF\">"..msg.."</font>") 
end

function UPL:Predict(spell, source, Target)
  if Target == nil then 
    Target = source 
    source = myHero
  end
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
  elseif self:ActivePred() == "DivinePrediction" then
      local State, Position, perc = self:DPredict(Target, self.spellData[spell], source)
      if perc ~= nil and Position ~= nil then
        return Position, 2, Vector(Target)
      else
        return Vector(Target), 0, Vector(Target)
      end
  elseif self:ActivePred() == "HPrediction" then
      return self:HPredict(Target, spell, source)
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
  if HP and HP ~= nil then self:SetupHPredSpell(spell) end
end

function UPL:GetSpellData(spell)
  return self.spellData[spell]
end

function UPL:HPredict(Target, spell, source)
  local col = self:GetSpellData(spell).collision and ((myHero.charName=="Lux" or myHero.charName=="Veigar") and 1 or 0) or math.huge
  local x1, x2, x3 = self.HP:GetPredict(self.HPSpells[spell], Target, source, col)
  return x1, x2*2, x3
end

function UPL:SetupHPredSpell(spell)
  if self.spellData[spell].type == "linear" then
      if self.spellData[spell].speed ~= math.huge then 
        if self.spellData[spell].collision then
          self.HPSpells[spell] = HPSkillshot({type = "DelayLine", range = self.spellData[spell].range, speed = self.spellData[spell].speed, width = 2*self.spellData[spell].width, delay = self.spellData[spell].delay, collisionM = self.spellData[spell].collision, collisionH = self.spellData[spell].collision})
        else
          self.HPSpells[spell] = HPSkillshot({type = "DelayLine", range = self.spellData[spell].range, speed = self.spellData[spell].speed, width = 2*self.spellData[spell].width, delay = self.spellData[spell].delay})
        end
      else
        self.HPSpells[spell] = HPSkillshot({type = "PromptLine", range = self.spellData[spell].range, width = 2*self.spellData[spell].width, delay = self.spellData[spell].delay})
      end
  elseif self.spellData[spell].type == "circular" then
      if self.spellData[spell].speed ~= math.huge then 
        self.HPSpells[spell] = HPSkillshot({type = "DelayCircle", range = self.spellData[spell].range, speed = self.spellData[spell].speed, radius = self.spellData[spell].width, delay = self.spellData[spell].delay})
      else
        self.HPSpells[spell] = HPSkillshot({type = "PromptCircle", range = self.spellData[spell].range, radius = self.spellData[spell].width, delay = self.spellData[spell].delay})
      end
  else --Cone!
    self.HPSpells[spell] = HPSkillshot({type = "DelayLine", range = self.spellData[spell].range, speed = self.spellData[spell].speed, width = 2*self.spellData[spell].width, delay = self.spellData[spell].delay, collisionM = self.spellData[spell].collision, collisionH = self.spellData[spell].collision})
  end
end

function UPL:DPredict(Target, spell, source)
  local unit = DPTarget(Target)
  local col = spell.collision and ((myHero.charName=="Lux" or myHero.charName=="Veigar") and 1 or 0) or math.huge
  if spell.type == "linear" then
    Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
    Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
    Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return self.DP:predict(unit, Spell, 1.2, Vector(source))
end

function UPL:VPredict(Target, spell, source)
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

function UPL:ReturnPred()
    if self:ActivePred() == "VPrediction" then
      return self.VP
    elseif self:ActivePred() == "HPrediction" then
      return self.HP
    elseif self:ActivePred() == "TKPrediction" then
      return self.TKP
    elseif self:ActivePred() == "DivinePrediction" then
      return self.DP
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
    elseif self:ActivePred() == "DivinePrediction" then
        return 0.2
    end
end