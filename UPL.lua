class "UPL"

function UPL:__init()
self.ActiveP = 1
self.LastRequest = 0
self.VP  = nil
self.DP  = nil
self.HP  = nil
self.TKP = nil
self.spellData = { 
[_Q] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
[_W] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
[_E] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
[_R] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
[_D] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
[_F] = {range = 0, delay = 0, type = "", width = 0, speed = 0, collision = 0},
}
self.predTable = {}
if FileExist(LIB_PATH .. "VPrediction.lua") then
  require("VPrediction")
  self.VP = VPrediction()
  table.insert(self.predTable, "VPrediction")
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
if not self.ValidRequest() then return Target, 0, Target end
if self.ActivePred() == "VPrediction" then
        return VPredict(Target, spellData[spell], source)
    elseif self.ActivePred() == "Prodiction" then
        return nil
    elseif self.ActivePred() == "DivinePred" then
        local State, Position, perc = DPredict(Target, spellData[spell])
        return Position, perc*3/100, Position
    elseif self.ActivePred() == "HPrediction" then
local str = { [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R" }
        return self.HPredict(Target, str[spell], source)
    elseif self.ActivePred() == "TKPrediction" then
        return self.TKP:Predict(spell, source, Target)
    end
end

function UPL:AddSpell(spell, range, delay, type, width, speed, aoe, collision)
self.spellData[spell].range = range
self.spellData[spell].delay = delay
self.spellData[spell].type  = type
self.spellData[spell].width = width
self.spellData[spell].speed = speed
self.spellData[spell].aoe   = aoe and aoe or false
self.spellData[spell].collision = collision and true or false
self.SetupHPred()
end

function self.HPredict(Target, spell, source)
	return self.HP:GetPredict(spell, Target, source)
end

function UPL:SetupHPred()
if spellData[0] ~= nil then
  self.MakeHPred("Q", 0) 
end
if spellData[1] ~= nil then
  self.MakeHPred("W", 1) 
end
if spellData[2] ~= nil then
  self.MakeHPred("E", 2) 
end
if spellData[3] ~= nil then
  self.MakeHPred("R", 3) 
end
end

function UPL:MakeHPred(hspell, i)
  if self.spellData[i].type == "linear" then
      if self.spellData[i].speed ~= math.huge then 
          self.HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = self.spellData[i].range, speed = self.spellData[i].speed, width = 2*self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      else
          self.HP:AddSpell(hspell, myHero.charName, {type = "PromptLine", range = self.spellData[i].range, width = 2*self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      end
  elseif data[i].type == "circular" then
      if data[i].speed ~= math.huge then 
          self.HP:AddSpell(hspell, myHero.charName, {type = "DelayCircle", range = self.spellData[i].range, speed = self.spellData[i].speed, radius = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      else
          self.HP:AddSpell(hspell, myHero.charName, {type = "PromptCircle", range = self.spellData[i].range, radius = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
      end
  else --Cone!
      self.HP:AddSpell(hspell, myHero.charName, {type = "DelayLine", range = self.spellData[i].range, speed = self.spellData[i].speed, width = self.spellData[i].width, delay = self.spellData[i].delay, collisionM = self.spellData[i].collision, collisionH = self.spellData[i].collision})
  end
end

function self.DPredict(Target, spell)
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

function self.VPredict(Target, spell)
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
    local int = self.ActiveP
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
    if os.clock() - self.LastRequest < self.TimeRequest() then
        return false
    else
        self.LastRequest = os.clock()
        return true
    end
end

function UPL:TimeRequest()
    if self.ActivePred() == "VPrediction" or self.ActivePred() == "HPrediction" then
        return 0.001
    elseif self.ActivePred() == "DivinePred" then
        return 0.2
    end
end