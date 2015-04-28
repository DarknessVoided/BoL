--[[

  ____                      _ 
 |  _ \                    | |
 | |_) |_ __ __ _ _ __   __| |
 |  _ <| '__/ _` | '_ \ / _` |
 | |_) | | | (_| | | | | (_| |
 |____/|_|  \__,_|_| |_|\__,_|
                              
  By Nebelwolfi                             
 
]]--

--[[ Assassin list start ]]--
_G.Champs = {
	["Brand"] = {
    [_Q] = { speed = 1600, delay = 0.25, range = 900, width = 50, collision = true, aoe = false, type = "linear"},
    [_W] = { speed = math.huge, delay = 0.625, range = 900, width = 175, collision = false, aoe = true, type = "circular"},
    [_E] = { range = 625, type = "targeted"},
		[_R] = { range = 750, type = "targeted"}
    }
}

local CastableItems = {
Tiamat      = { Range = 400, Slot = function() return GetInventorySlotItem(3077) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3077) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3077)) == READY) end, Damage = function(target) return getDmg("TIAMAT", Target, myHero) end},
Hydra       = { Range = 400, Slot = function() return GetInventorySlotItem(3074) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3074) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3074)) == READY) end, Damage = function(target) return getDmg("HYDRA", Target, myHero) end},
Bork        = { Range = 450, Slot = function() return GetInventorySlotItem(3153) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3153) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3153)) == READY) end, Damage = function(target) return getDmg("RUINEDKING", Target, myHero) end},
Bwc         = { Range = 400, Slot = function() return GetInventorySlotItem(3144) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3144) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3144)) == READY) end, Damage = function(target) return getDmg("BWC", Target, myHero) end},
Hextech     = { Range = 400, Slot = function() return GetInventorySlotItem(3146) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3146) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3146)) == READY) end, Damage = function(target) return getDmg("HXG", Target, myHero) end},
Blackfire   = { Range = 750, Slot = function() return GetInventorySlotItem(3188) end,  reqTarget = true, IsReady = function() return (GetInventorySlotItem(3188) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3188)) == READY) end, Damage = function(target) return getDmg("BLACKFIRE", Target, myHero) end},
Youmuu      = { Range = 350, Slot = function() return GetInventorySlotItem(3142) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3142) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3142)) == READY) end, Damage = function(target) return 0 end},
Randuin     = { Range = 500, Slot = function() return GetInventorySlotItem(3143) end,  reqTarget = false, IsReady = function() return (GetInventorySlotItem(3143) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3143)) == READY) end, Damage = function(target) return 0 end},
TwinShadows = { Range = 1000, Slot = function() return GetInventorySlotItem(3023) end, reqTarget = false, IsReady = function() return (GetInventorySlotItem(3023) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3023)) == READY) end, Damage = function(target) return 0 end},
}

--[[ Libraries start ]]--
local predToUse = {}
VP = nil
DP = nil
HP = nil
if FileExist(LIB_PATH .. "/VPrediction.lua") then
  require("VPrediction")
  VP = VPrediction()
  table.insert(predToUse, "VPrediction")
end

if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
  require "DivinePred"
  DP = DivinePred() 
  table.insert(predToUse, "DivinePred")
end

if FileExist(LIB_PATH .. "/HPrediction.lua") then
  require("HPrediction")
  HP = HPrediction()
  table.insert(predToUse, "HPrediction")
end

iOrb = nil
if FileExist(LIB_PATH.."iSAC.lua") then
  require "iSAC"
  iOrb = iOrbWalker(myHero.range) 
  iOrb:addAA()
end
--[[ Libraries end ]]--

--[[ Script start ]]--
if not Champs[myHero.charName] then return end -- not supported :(
if VIP_USER then HookPackets() end
local data = Champs[myHero.charName] -- load skills
local QReady, WReady, EReady, RReady = function() return myHero:CanUseSpell(_Q) end, function() return myHero:CanUseSpell(_W) end, function() return myHero:CanUseSpell(_E) end, function() return myHero:CanUseSpell(_R) end
local Target 
local sts
local predictions = {}
local combos = {}

function OnLoad()
  orbDisabled = false
  orbLast = 0
  Config = scriptConfig("Brand", "Brand")
  
  Config:addSubMenu("Pred/Skill Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  if predToUse == {} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config.misc:addParam("qqq", " ", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("qqq", "RELOAD AFTER CHANGING PREDICTIONS! (2x F9)", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("pro",  "Type of prediction", SCRIPT_PARAM_LIST, 1, predToUse)
  if ActivePred() == "VPrediction" or ActivePred() == "HPrediction" then 
	Config.misc:addParam("hitchance", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
  elseif ActivePred() == "DivinePred" then
    if Config.misc.hitchance > 1.5 then Config.misc.hitchance = 1.2 end
	Config.misc:addParam("hitchance", "Accuracy (Default: 1.2)", SCRIPT_PARAM_SLICE, 1.2, 0, 1.5, 1)
	Config.misc:addParam("time","DPred Extra Time", SCRIPT_PARAM_SLICE, 0.13, 0, 1, 1)
  end

  if ActivePred() == "HPrediction" then SetupHPred() end
  
  Config:addSubMenu("Combo Settings", "comboConfig")
  
  local keys = {"Q","W","E"}
  shuffle(keys, #keys, combos)
  keys = {"Q","W","E","R"}
  shuffle(keys, #keys, combos)
  Config.comboConfig:addParam("so",  "Skill Order", SCRIPT_PARAM_LIST, 1, combos)
  Config.comboConfig:addParam("aa",  "Autoattack in between skills", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("move",  "Move to mouse", SCRIPT_PARAM_ONOFF, true)
  Config.comboConfig:addParam("items",  "Use items in combo", SCRIPT_PARAM_ONOFF, true)
			
  Config:addSubMenu("Draw Settings", "Drawing")
	Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, false)
  
  Config:addParam("combo", "Combo (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  
  Config:permaShow("combo")
  sts = TargetSelector(TARGET_LESS_CAST, 1500, DAMAGE_MAGIC, true)
  Config:addTS(sts)
end

function ActivePred()
    local int = Config.misc.pro
    return tostring(predToUse[int])
end

function SetupHPred()
  for i = 0, 3 do
    if i == 0 then 
        Spell_Q = MakeHPred(Spell_Q, i) 
    elseif i == 0 then 
        Spell_W = MakeHPred(Spell_W, i) 
    elseif i == 0 then 
        Spell_E = MakeHPred(Spell_E, i) 
    elseif i == 0 then 
        Spell_R = MakeHPred(Spell_R, i) 
    end
  end
end

function MakeHPred(hspell, i)
 if hspell == nil and data[i].type ~= "dontuse" and data[i].type ~= "targeted" and data[i].type ~= "notarget" then 
  hspell.collisionM[myHero.charName] = data[i].collision
  hspell.collisionH[myHero.charName] = data[i].collision
  hspell.delay[myHero.charName] = data[i].delay
  hspell.range[myHero.charName] = data[i].range
  if data[i].type == "linear" then
    hspell.width[myHero.charName] = 2*data[i].width
    if data[i].speed ~= math.huge then 
        hspell.type[myHero.charName] = "DelayLine"
        hspell.speed[myHero.charName] = data[i].speed
    else
        hspell.type[myHero.charName] = "PromptLine"
    end
  elseif data[i].type == "circular" then
    hspell.radius[myHero.charName] = data[i].width
    if data[i].speed ~= math.huge then 
        hspell.type[myHero.charName] = "DelayCircle"
        hspell.speed[myHero.charName] = data[i].speed
    else
        hspell.type[myHero.charName] = "PromptCircle"
    end
  else --Cone!
    hspell.type[myHero.charName] = "DelayLine"
    hspell.width[myHero.charName] = data[i].width
    hspell.speed[myHero.charName] = data[i].speed
  end
 end
 return hspell
end

function shuffle(a, n, whur)
	if n == 0 then
	  local c = ""
	  for i,v in ipairs(a) do
		c = v..c
	  end
	  whur[#whur+1] = c
	else
		for i=1,n do
			a[n], a[i] = a[i], a[n]
			shuffle(a, n-1, whur)
			a[n], a[i] = a[i], a[n]
		end
	end
end

function OnTick()
	Target = GetCustomTarget()
  if not myHero.dead and not recall then 
  	Combo()
  	if (Config.comboConfig.move and Config.combo) and not Config.comboConfig.aa then
  		moveToCursor()
  	end
  end
end   

function Combo()
	if recall or myHero.dead then return end
	local skillOrder = {}
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 1, 1))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 2, 2))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 3, 3))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 4, 4))
	for i=1,4 do
		if orbDisabled or recall or myHero.dead then return end
		if skillOrder[i] == "Q" then
			if (Target ~= nil) and QReady then
				if ValidTarget(Target, data[0].range) and Config.combo then
					if GetDistance(Target, myHero) <= data[0].range then
						if data[0].aareset then
							CastSpell(_Q, myHero:Attack(Target))
						elseif data[0].type == "notarget" then 
							CastSpell(_Q)
						elseif data[0].type == "dontuse" then 
							return
						else
						  if ActivePred() == "VPrediction" then 
							local CastPosition, HitChance, Position = VPredict(Target, data[0])
							if HitChance >= Config.misc.hitchance and HitChance < 4 then
								CCastSpell(_Q, CastPosition.x, CastPosition.z)
							elseif HitChance == 4 then
								CastSpell(_Q, Target)
							end
						  elseif ActivePred() == "DivinePred" then
							local State, Position, perc = DPredict(Target, data[0])
							if State == SkillShot.STATUS.SUCCESS_HIT and perc <= 100 then 
								CCastSpell(_Q, Position.x, Position.z)
							elseif perc == 125 then
								CastSpell(_Q, Target)
							end
						  elseif ActivePred() == "HPrediction" then
							local Position, HitChance = HPredict(Target, "Q")
							if HitChance >= Config.misc.hitchance and HitChance <4 then 
								CCastSpell(_Q, Position.x, Position.z)
							elseif HitChance == 4 then
								CastSpell(_Q, Target)
							end
						  end
						end
					end
				end
			end
		elseif skillOrder[i] == "W" then
			if (Target ~= nil) and WReady then
				if ValidTarget(Target, data[1].range) and Config.combo then
					if GetDistance(Target, myHero) <= data[1].range then
						if data[1].aareset then
							CastSpell(_W, myHero:Attack(Target))
						elseif data[1].type == "notarget" then 
							CastSpell(_W)
						elseif data[1].type == "dontuse" then 
							return
						else
						  if ActivePred() == "VPrediction" then
							local CastPosition, HitChance, Position = VPredict(Target, data[1])
							if HitChance >= Config.misc.hitchance and HitChance < 4 then
								CCastSpell(_W, CastPosition.x, CastPosition.z)
							elseif HitChance == 4 then
								CastSpell(_W, Target)
							end
						  elseif ActivePred() == "DivinePred" then
							local State, Position, perc = DPredict(Target, data[1])
							if State == SkillShot.STATUS.SUCCESS_HIT and perc <= 100 then 
								CCastSpell(_W, Position.x, Position.z)
							elseif perc == 125 then
								CastSpell(_W, Target)
							end
						  elseif ActivePred() == "HPrediction" then
							local Position, HitChance = HPredict(Target, "W")
							if HitChance >= Config.misc.hitchance and HitChance <4 then 
								CCastSpell(_W, Position.x, Position.z)
							elseif HitChance == 4 then
								CastSpell(_W, Target)
							end
						  end
						end
					end
				end
			end
		elseif skillOrder[i] == "E" then
			if (Target ~= nil) and EReady then
				if ValidTarget(Target, data[2].range) and Config.combo then
					if GetDistance(Target, myHero) <= data[2].range then
						if data[2].aareset then
							CastSpell(_E, myHero:Attack(Target))
						elseif data[2].type == "notarget" then 
							CastSpell(_E)
						elseif data[2].type == "dontuse" then 
							return
						else
						  if ActivePred() == "VPrediction" then
							local CastPosition, HitChance, Position = VPredict(Target, data[2])
							if HitChance >= Config.misc.hitchance and HitChance < 4 then
								CCastSpell(_E, CastPosition.x, CastPosition.z)
							elseif HitChance == 4 then
								CastSpell(_E, Target)
							end
						  elseif ActivePred() == "DivinePred" then
							local State, Position, perc = DPredict(Target, data[2])
							if State == SkillShot.STATUS.SUCCESS_HIT and perc <= 100 then 
								CCastSpell(_E, Position.x, Position.z)
							elseif perc == 125 then
								CastSpell(_E, Target)
							end
						  elseif ActivePred() == "HPrediction" then
							local Position, HitChance = HPredict(Target, "E")
							if HitChance >= Config.misc.hitchance and HitChance <4 then 
								CCastSpell(_E, Position.x, Position.z)
							elseif HitChance == 4 then
								CastSpell(_E, Target)
							end
						  end
						end
					end
				end
			end
		elseif skillOrder[i] == "R" then
			if (Target ~= nil) and RReady then
				if myHero.charName:lower() == "leblanc" then
					if lastUsedSpell == _Q then
						data[3] = data[0]
					elseif lastUsedSpell == _W then
						data[3] = data[1]
					elseif lastUsedSpell == _E then
						data[3] = data[2]
					end
				end
				if ValidTarget(Target, data[3].range) and Config.combo then
					if GetDistance(Target, myHero) <= data[3].range then
						if data[3].aareset then
							CastSpell(_R, myHero:Attack(Target))
						elseif data[3].type == "notarget" then 
							CastSpell(_R)
						elseif data[3].type == "dontuse" then 
							return
						else
						  if ActivePred() == "VPrediction" then
							local CastPosition, HitChance, Position = VPredict(Target, data[3])
							if HitChance >= Config.misc.hitchance and HitChance < 4 then
								CCastSpell(_R, CastPosition.x, CastPosition.z)
							elseif HitChance == 4 then
								CastSpell(_R, Target)
							end
						  elseif ActivePred() == "DivinePred" then
							local State, Position, perc = DPredict(Target, data[3])
							if State == SkillShot.STATUS.SUCCESS_HIT and perc <= 100 then 
								CCastSpell(_R, Position.x, Position.z)
							elseif perc == 125 then
								CastSpell(_R, Target)
							end
						  elseif ActivePred() == "HPrediction" then
							local Position, HitChance = HPredict(Target, "R")
							if HitChance >= Config.misc.hitchance and HitChance <4 then 
								CCastSpell(_R, Position.x, Position.z)
							elseif HitChance == 4 then
								CastSpell(_R, Target)
							end
						  end
						end
					end
				end
			end
		end
		if Config.comboConfig.items and Config.combo then
			UseItems(Target) --wtb logic
		end
		if Target ~=nil and Config.comboConfig.aa and Config.combo then	
			iOrb:Orbwalk(mousePos, Target)
		elseif iOrb:GetStage() == STAGE_NONE and Config.comboConfig.move and Config.combo then
			moveToCursor()
		end
	end
	if Target ~=nil and Config.comboConfig.aa and Config.combo and not recall and not myHero.dead then	
		iOrb:Orbwalk(mousePos, Target)
	elseif iOrb:GetStage() == STAGE_NONE and Config.comboConfig.move and Config.combo then
		moveToCursor()
	end
end

function moveToCursor()
	if GetDistance(mousePos) > 1 and not orbDisabled and not recall and not myHero.dead then
		iOrb:Move(mousePos)
	end
end

function OnDraw()
	if Config.Drawing.QRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[0].range, 0x111111)
	end
	if Config.Drawing.WRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[1].range, 0x111111)
	end
	if Config.Drawing.ERange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[2].range, 0x111111)
	end
	if Config.Drawing.RRange then
		DrawCircle(myHero.x, myHero.y, myHero.z, data[3].range, 0x111111)
	end
end

function HPredict(Target, spell)
	if spell == "Q" and data[0].type == "targeted" then
		return Target, 4
	elseif spell == "W" and data[1].type == "targeted" then
		return Target, 4
	elseif spell == "E" and data[2].type == "targeted" then
		return Target, 4
	elseif spell == "R" and data[3].type == "targeted" then
		return Target, 4
	end
	return HP:GetPredict(spell, Target, myHero)
end

function DPredict(Target, spell)
  if spell.type == "targeted" then
   return SkillShot.STATUS.SUCCESS_HIT, Target, 125
  end
  local unit = DPTarget(Target)
  local col = spell.collision and 0 or math.huge
  local Spell = nil
  if spell.type == "linear" then
	 Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "circular" then
	 Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  elseif spell.type == "cone" then
	 Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
  end
  return DP:predict(unit, Spell)
end

function VPredict(Target, spell)
  if spell.type == "linear" then
	if spell.aoe then
		return VP:GetLineAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "circular" then
	if spell.aoe then
		return VP:GetCircularAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetCircularCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "cone" then
	if spell.aoe then
		return VP:GetConeAOECastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero)
	else
		return VP:GetLineCastPosition(Target, spell.delay, spell.width, spell.range, spell.speed, myHero, spell.collision)
	end
  elseif spell.type == "targeted" then
		return Target, 4, myHero --CastPosition, HitChance, Position
  end
end

function GetCustomTarget()
    sts:update()
    if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    return sts.target
end

--[[ Packet Cast Helper ]]--
function CCastSpell(Spell, xPos, zPos)
  if VIP_USER and Config.misc.pc then
    Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
  else
    CastSpell(Spell, xPos, zPos)
  end
end

-- Credits: Da Vinci
function UseItems(unit)
    if unit ~= nil then
        for _, item in pairs(CastableItems) do
            if item.IsReady() and GetDistance(myHero, unit) < item.Range then
                if item.reqTarget then
                    CastSpell(item.Slot(), unit)
                else
                    CastSpell(item.Slot())
                end
            end
        end
    end
end