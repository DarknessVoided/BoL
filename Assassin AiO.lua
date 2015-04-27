--[[

                                  _                  _  ____  
      /\                         (_)           /\   (_)/ __ \ 
     /  \   ___ ___  __ _ ___ ___ _ _ __      /  \   _| |  | |
    / /\ \ / __/ __|/ _` / __/ __| | '_ \    / /\ \ | | |  | |
   / ____ \\__ \__ \ (_| \__ \__ \ | | | |  / ____ \| | |__| |
  /_/    \_\___/___/\__,_|___/___/_|_| |_| /_/    \_\_|\____/ 
 
 
]]--

--[[ Assassin list start ]]--
_G.Champs = {
	["Ahri"] = {
		[_Q] = { speed = 2500, delay = 0.25, range = 900, width = 100, collision = false, aoe = false, type = "linear"},
		[_W] = { range = 800, type = "notarget"},
		[_E] = { speed = 1000, delay = 0.25, range = 1000, width = 60, collision = true, aoe = false, type = "linear"},
		[_R] = { range = 100, type = "notarget"}
    },
	["Akali"] = {
		[_Q] = { range = 600, type = "targeted"},
		[_W] = { speed = math.huge, delay = 0.1, range = 700, width = 400, collision = false, aoe = true, type = "circular"},
		[_E] = { range = 325, type = "notarget"},
		[_R] = { range = 700, type = "targeted"}
    },
	["Evelynn"] = {
		[_Q] = { range = 500, type = "notarget"},
		[_W] = { range = 650, type = "notarget"},
		[_E] = { range = 275, type = "targeted"},
		[_R] = { speed = 1300, delay = 0.250, range = 650, width = 500, collision = false, aoe = true, type = "circular"}
    },
	["Fiora"] = {
    },
	["Fizz"] = {
        [_R] = { speed = 1350, delay = 0.250, range = 1275, width = 80, collision = false, aoe = false, type = "linear"}
    },
	["Irelia"] = {
        [_R] = { speed = 1700, delay = 0.250, range = 1200, width = 10, collision = false, aoe = false, type = "linear"}
    },
	["Jax"] = {
		[_Q] = { range = 6700, type = "targeted"},
		[_W] = { range = myHero.range, type = "notarget", aareset = true},
		[_E] = { range = 250, type = "notarget"},
		[_R] = { range = 700, type = "notarget"}
    },
	["Kassadin"] = {
		[_Q] = { range = 650, type = "targeted"},
		[_W] = { range = 250, type = "notarget", aareset = true},
        [_E] = { speed = 2200, delay = 0, range = 650, width = 80, collision = false, aoe = false, type = "cone"},
        [_R] = { speed = math.huge, delay = 0.5, range = 500, width = 150, collision = false, aoe = true, type = "circular"}
    },
	["Katarina"] = {
		[_Q] = { range = 675, type = "targeted"},
		[_W] = { range = 375, type = "notarget"},
		[_E] = { range = 700, type = "targeted"},
		[_R] = { range = 550, type = "notarget"}
    },
	["Khazix"] = {
		[_Q] = { range = 325, type = "targeted"},
        [_W] = { speed = 1700, delay = 0.25, range = 1025, width = 70, collision = true, aoe = false, type = "linear"},
		[_E] = { speed = 400, delay = 0.25, range = 600, width = 325, collision = false, aoe = true, type = "circular"},
		[_R] = { range = 0, type = "dontuse"}
    },
	["Leblanc"] = {
		[_Q] = { range = 700, type = "targeted"},
		[_W] = { speed = 2000, delay = 0.250, range =600, width = 300, collision = false, aoe = false, type = "circular"},
        [_E] = { speed = 1600, delay = 0.250, range = 950, width = 70, collision = true, aoe = false, type = "linear"},
		[_R] = { range = 0, type = "mimikri"}
    },
	["LeeSin"] = {
        [_Q] = { speed = 1800, delay = 0.250, range = 1100, width = 100, collision = true, aoe = false, type = "linear"}
    },
	["Malzahar"] = {
        [_Q] = { speed = 1170, delay = 0.600, range = 900, width = 50, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = math.huge, delay = 0.125, range = 800, width = 250, collision = false, aoe = true, type = "circular"}
    },
	["MasterYi"] = {
		[_Q] = { range = 600, type = "targeted"},
		[_W] = { range = 0, type = "dontuse"},
		[_E] = { range = 125, type = "notarget"},
		[_R] = { range = 125, type = "notarget"}
    },
	["Nocturne"] = {
        [_Q] = { speed = 1400, delay = 0.250, range = 1125, width = 60, collision = false, aoe = false, type = "linear"}
    },
	["Pantheon"] = {
    },
	["Poppy"] = {
    },
	["Rengar"] = {
		[_Q] = { range = 125, type = "notarget", aareset = true},
		[_W] = { speed = math.huge, delay = 0.5, range = 390, width = 55, collision = false, aoe = false, type = "circular"},
        [_E] = { speed = 1500, delay = 0.50, range = 1000, width = 80, collision = false, aoe = false, type = "linear"},
        [_R] = { range = 4000, type = "notarget"}
    },
	["Riven"] = {
        [_R] = { speed = 2200, delay = 0.5, range = 1100, width = 200, collision = false, aoe = false, type = "cone"}
    },
	["Ryze"] = {
		[_Q] = { range = 600, type = "targeted"},
		[_W] = { range = 600, type = "targeted"},
		[_E] = { range = 600, type = "targeted"},
		[_R] = { range = 125, type = "notarget"}
    },
	["Shaco"] = {
    },
	["Talon"] = {
        [_Q] = { range = 200, type = "notarget", aareset = true},
        [_W] = { speed = 900, delay = 0.7, range = 600, width = 200, collision = false, aoe = false, type = "cone"},
        [_E] = { range = 700, type = "targeted"},
        [_R] = { range = 650, type = "notarget"}
    },
	["Teemo"] = {
    },
	["Tryndamere"] = {
    },
	["XinZhao"] = {
    },
	["Yasuo"] = {
        [_Q] =  { speed = math.huge, delay = 250, range = 475, width = 40, collision = false, aoe = false, type = "linear"},
    },
	["Zed"] = {
        [_Q] = { speed = 1700, delay = 0.25, range = 900, width = 48, collision = false, aoe = false, type = "linear"},
        [_W] = { speed = 1600, delay = 0.5, range = 550, width = 40, collision = false, aoe = false, type = "dontuse"}, --aim yourself.. wut?
        [_E] = { speed = math.huge, delay = 0, range = 0, width = 300, collision = false, aoe = true, type = "circular"},
        [_R] = { range = 850, type = "targeted"}
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

--[[ Auto updater start ]]--
local version = 0.37
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/nebelwolfi/BoL/master/Assassin AiO.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."Assassin AiO.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH
local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>[Assassin AiO]:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
  local ServerData = GetWebResult(UPDATE_HOST, "/nebelwolfi/BoL/master/Assassin AiO.version")
  if ServerData then
    ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
    if ServerVersion then
      if tonumber(version) < ServerVersion then
        AutoupdaterMsg("New version available v"..ServerVersion)
        AutoupdaterMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
      else
        AutoupdaterMsg("Loaded the latest version (v"..ServerVersion..")")
      end
    end
  else
    AutoupdaterMsg("Error downloading version info")
  end
end
--[[ Auto updater end ]]--

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
local harr = {"Q", "W", "E"}
local orbDisabled
local orbLast
local enemyCount = 0
local enemyTable = {}

function OnLoad()
  orbDisabled = false
  orbLast = 0
  Config = scriptConfig("Assassin AiO", "Assassin AiO")
  
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
  
  Config:addSubMenu("Harrass Settings", "harrConfig")
  keys = {"Q","W"}
  shuffle(keys, #keys, harr)
  keys = {"Q","E"}
  shuffle(keys, #keys, harr)
  keys = {"W","E"}
  shuffle(keys, #keys, harr)
  keys = {"Q","W","E"}
  shuffle(keys, #keys, harr)
  Config.harrConfig:addParam("so",  "Skill Order", SCRIPT_PARAM_LIST, 1, harr)
  Config.harrConfig:addParam("aa",  "Autoattack in between skills", SCRIPT_PARAM_ONOFF, true)
  Config.harrConfig:addParam("move",  "Move to mouse", SCRIPT_PARAM_ONOFF, true)
  
	Config:addSubMenu("Killsteal Settings", "KS")
	Config.KS:addParam("enableKS", "Enable Killsteal", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealW", "Use W", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealE", "Use E", SCRIPT_PARAM_ONOFF, true)
	Config.KS:addParam("killstealR", "Use R", SCRIPT_PARAM_ONOFF, true)
	--Config.KS:addParam("killstealI", "Use Ignite", SCRIPT_PARAM_ONOFF, true)
			
    Config:addSubMenu("Draw Settings", "Drawing")
	Config.Drawing:addParam("QRange", "Q Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("WRange", "W Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("ERange", "E Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("RRange", "R Range", SCRIPT_PARAM_ONOFF, false)
	Config.Drawing:addParam("DmgCalcs", "Killable Text", SCRIPT_PARAM_ONOFF, true)
  
  Config:addParam("combo", "Combo (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  Config:addParam("har", "Harrass (HOLD)", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Config:addParam("harr", "Harrass (TOGGLE)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
  
  Config:permaShow("combo")
  Config:permaShow("har")
  Config:permaShow("harr")
  sts = TargetSelector(TARGET_LESS_CAST, 1500, DAMAGE_MAGIC, true)
  Config:addTS(sts)
  
    -- Create enemy table structure
    for i = 1, heroManager.iCount do
   
        local champ = heroManager:GetHero(i)
       
        if champ.team ~= player.team then
       
            enemyCount = enemyCount + 1
            enemyTable[enemyCount] = { player = champ, name = champ.charName, damageQ = 0, damageE = 0, damageR = 0, indicatorText = "", damageGettingText = "", ready = true}
 
        end
    end
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
	if orbDisabled then
		if (os.clock() - orbLast) > 2.5 then
			orbDisabled = false
			orbLast  = 0
		end
	else
	  if not myHero.dead and not recall then 
		Combo()
		Harrass()
		EveAntiSlow()
		if Config.KS.enableKS then
			killsteal()
		end
		if ((Config.comboConfig.move and Config.combo) or ((Config.har or Config.harr) and Config.harrConfig.move)) and not Config.comboConfig.aa then
			moveToCursor()
		end
	  end
	end
	DmgCalculations()
end   

function killsteal()
	for i=1, heroManager.iCount do
		local enemy = heroManager:GetHero(i)
		local qDmg = ((getDmg("Q", enemy, myHero)) or 0)	
		local wDmg = ((getDmg("W", enemy, myHero)) or 0)	
		local eDmg = ((getDmg("E", enemy, myHero)) or 0)	
		local rDmg = ((getDmg("R", enemy, myHero)) or 0)
		--local iDmg = 50 + (20 * myHero.level)
		if ValidTarget(enemy) and enemy ~= nil and Config.KS.enableKS and not enemy.dead and enemy.visible then
			if enemy.health < qDmg and Config.KS.killstealQ and ValidTarget(enemy, data[0].range) then
				CastSpell(_Q, enemy)
			elseif enemy.health < wDmg and Config.KS.killstealW and ValidTarget(enemy, data[1].range) then
				CastSpell(_W, enemy)
			elseif enemy.health < eDmg and Config.KS.killstealE and ValidTarget(enemy, data[2].range) then
				CastSpell(_E, enemy)
			elseif enemy.health < rDmg and Config.KS.killstealR and ValidTarget(enemy, data[3].range) then
				CastSpell(_R, enemy)
			--elseif enemy.health < iDmg and Config.KS.killstealI and ValidTarget(enemy, 600) and IReady then
			--	CastSpell(SSpells:GetSlot("summonerdot"), enemy)
			end
		end
	end
end

function Harrass()
	if orbDisabled or Config.combo then return end
	local skillOrder = {}
	table.insert(skillOrder, string.sub(harr[Config.harrConfig.so], 1, 1))
	table.insert(skillOrder, string.sub(harr[Config.harrConfig.so], 2, 2))
	table.insert(skillOrder, string.sub(harr[Config.harrConfig.so], 3, 3))
	--PrintChat("Executing combo: "..skillOrder[1]..skillOrder[2]..skillOrder[3]..skillOrder[4]) --combos[Config.comboConfig.so]
	if Config.harrConfig.so < 4 then
		for i=1,1 do
			if orbDisabled or recall or myHero.dead then return end
			if skillOrder[i] == "Q" then
				if (Target ~= nil) and QReady then
					if ValidTarget(Target, data[0].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _Q
						end
					end
				end
			elseif skillOrder[i] == "W" then
				if (Target ~= nil) and WReady then
					if ValidTarget(Target, data[1].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _W
						end
					end
				end
			elseif skillOrder[i] == "E" then
				if (Target ~= nil) and EReady then
					if ValidTarget(Target, data[2].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _E
						end
					end
				end
			end
			if Target ~=nil and Config.harrConfig.aa and (Config.harr or Config.har) and not orbDisabled then	
				iOrb:Orbwalk(mousePos, Target)
			elseif iOrb:GetStage() == STAGE_NONE and Config.harrConfig.move and (Config.harr or Config.har) then
				moveToCursor()
			end
		end
	elseif Config.harrConfig.so < 10 then
		for i=1,2 do
			if orbDisabled or recall or myHero.dead then return end
			if skillOrder[i] == "Q" then
				if (Target ~= nil) and QReady then
					if ValidTarget(Target, data[0].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _Q
						end
					end
				end
			elseif skillOrder[i] == "W" then
				if (Target ~= nil) and WReady then
					if ValidTarget(Target, data[1].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _W
						end
					end
				end
			elseif skillOrder[i] == "E" then
				if (Target ~= nil) and EReady then
					if ValidTarget(Target, data[2].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _E
						end
					end
				end
			end
			if Target ~=nil and Config.harrConfig.aa and (Config.harr or Config.har) and not orbDisabled then	
				iOrb:Orbwalk(mousePos, Target)
			elseif iOrb:GetStage() == STAGE_NONE and Config.harrConfig.move and (Config.harr or Config.har) then
				moveToCursor()
			end
		end
	else
		for i=1,3 do
			if orbDisabled or recall or myHero.dead then return end
			if skillOrder[i] == "Q" then
				if (Target ~= nil) and QReady then
					if ValidTarget(Target, data[0].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _Q
						end
					end
				end
			elseif skillOrder[i] == "W" then
				if (Target ~= nil) and WReady then
					if ValidTarget(Target, data[1].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _W
						end
					end
				end
			elseif skillOrder[i] == "E" then
				if (Target ~= nil) and EReady then
					if ValidTarget(Target, data[2].range) and (Config.harr or Config.har) then
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
							lastUsedSpell = _E
						end
					end
				end
			end
			if Target ~=nil and Config.harrConfig.aa and (Config.harr or Config.har) and not orbDisabled then	
				iOrb:Orbwalk(mousePos, Target)
			elseif iOrb:GetStage() == STAGE_NONE and Config.harrConfig.move and (Config.harr or Config.har) then
				moveToCursor()
			end
		end
	end
end

local lastUsedSpell = nil
function Combo()
	if orbDisabled or recall or myHero.dead then return end
	local skillOrder = {}
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 1, 1))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 2, 2))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 3, 3))
	table.insert(skillOrder, string.sub(combos[Config.comboConfig.so], 4, 4))
	--PrintChat("Executing combo: "..skillOrder[1]..skillOrder[2]..skillOrder[3]..skillOrder[4]) --combos[Config.comboConfig.so]
	if Config.comboConfig.so < 7 then
		for i=1,3 do
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
							lastUsedSpell = _Q
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
							lastUsedSpell = _W
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
							lastUsedSpell = _E
						end
					end
				end
			end
			if Config.comboConfig.items and Config.combo then
				UseItems(Target) --wtb logic
			end
			if Target ~=nil and Config.comboConfig.aa and Config.combo and not orbDisabled then	
				iOrb:Orbwalk(mousePos, Target)
			elseif iOrb:GetStage() == STAGE_NONE and Config.comboConfig.move and Config.combo then
				moveToCursor()
			end
		end
	else
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
							lastUsedSpell = _Q
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
							lastUsedSpell = _W
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
							lastUsedSpell = _E
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
			if Target ~=nil and Config.comboConfig.aa and Config.combo and not orbDisabled then	
				iOrb:Orbwalk(mousePos, Target)
			elseif iOrb:GetStage() == STAGE_NONE and Config.comboConfig.move and Config.combo then
				moveToCursor()
			end
		end
	end
	if Target ~=nil and Config.comboConfig.aa and Config.combo and not orbDisabled and not recall and not myHero.dead then	
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

function OnProcessSpell(object, spell)
	if object == myHero then
		iOrb:OnProcessSpell(object, spell)
		if spell.name:lower():find("katarinar") and Config.combo then
			orbDisabled = true
			orbLast = os.clock()
		end
	end
end

speed = myHero.ms
old_speed = myHero.ms
function EveAntiSlow()
	if myHero.charName == "Evelynn" then
		speed = myHero.ms
		if speed < old_speed and (100-(speed*100/old_speed)) > 15 then
				CastSpell(_W)
		end
		old_speed = speed
	end
end

local KillText = {}
local KillTextColor = ARGB(255, 216, 247, 8)
local KillTextList = {"Harass Him", "Combo Kill"}
function DmgCalculations()
 
    -- Don't calculate this if not wanted
    if not Config.Drawing.DmgCalcs then return end
 
    for i = 1, enemyCount do
 
        local enemy = enemyTable[i].player
 
                if ValidTarget(enemy) and enemy.visible then
 
            -- Auto attack damage
            local damageAA = getDmg("AD", enemy, player)
           
            -- Skills damage
            local damageQ  = getDmg("Q", enemy, player)
            local damageW  = getDmg("W", enemy, player)
            local damageE  = getDmg("E", enemy, player)
            local damageR  = getDmg("R", enemy, player)
       
            -- Update enemy table
            enemyTable[i].damageQ = damageQ
            enemyTable[i].damageW = damageW
            enemyTable[i].damageE = damageE
            enemyTable[i].damageR = damageR
           
            -- Make combos, highest range to lowest
            if enemy.health < damageR then
 
                enemyTable[i].indicatorText = "R Kill"
                enemyTable[i].ready = RReady
 
            elseif enemy.health < damageQ then
 
                enemyTable[i].indicatorText = "Q Kill"
                enemyTable[i].ready = QReady
 
            elseif enemy.health < damageE then
 
                enemyTable[i].indicatorText = "E Kill"
                enemyTable[i].ready = EReady
 
            elseif enemy.health < damageW then
 
                enemyTable[i].indicatorText = "W Kill"
                enemyTable[i].ready = WReady
 
            elseif enemy.health < damageE + damageQ then
 
                enemyTable[i].indicatorText = "Q + E Kill"
                enemyTable[i].ready = EReady and QReady
 
            elseif enemy.health < damageQ + damageW then
 
                enemyTable[i].indicatorText = "Q + W Kill"
                enemyTable[i].ready = QReady and WReady
 
            elseif enemy.health < damageW + damageE then
 
                enemyTable[i].indicatorText = "W + E Kill"
                enemyTable[i].ready = WReady and EReady
 
            elseif enemy.health < damageR + damageQ then
 
                enemyTable[i].indicatorText = "R + Q Kill"
                enemyTable[i].ready = RReady and QReady
 
            elseif enemy.health < damageR + damageE then
 
                enemyTable[i].indicatorText = "R + E Kill"
                enemyTable[i].ready = RReady and EReady
 
            elseif enemy.health < damageR + damageW then
 
                enemyTable[i].indicatorText = "R + W Kill"
                enemyTable[i].ready = RReady and WReady
 
            elseif enemy.health < damageQ + damageW + damageE then
 
                enemyTable[i].indicatorText = "Q + W + E Kill"
                enemyTable[i].ready = QReady and WReady and EReady
 
            elseif enemy.health < damageQ + damageE + damageR then
 
                enemyTable[i].indicatorText = "Q + E + R Kill"
                enemyTable[i].ready = QReady and EReady and EReady
 
            elseif enemy.health < damageQ + damageW + damageR then
 
                enemyTable[i].indicatorText = "Q + W + R Kill"
                enemyTable[i].ready = QReady and WReady and EReady
				
            elseif enemy.health < damageR + damageW + damageE then
 
                enemyTable[i].indicatorText = "W + E + R Kill"
                enemyTable[i].ready = RReady and WReady and EReady
 
            elseif enemy.health < damageQ + damageW + damageE + damageR then
 
                enemyTable[i].indicatorText = "All-In Kill"
                enemyTable[i].ready = QReady and WReady and EReady and RReady
 
            else
 
                local damageTotal = damageQ + damageE + damageR
                local healthLeft = math.round(enemy.health - damageTotal)
                local percentLeft = math.round(healthLeft / enemy.maxHealth * 100)
 
                enemyTable[i].indicatorText = percentLeft .. "% Harass"
                enemyTable[i].ready = QReady or EReady or RReady
 
            end
 
            -- Calculate damage we could receive
            local enemyDamageAA = getDmg("AD", player, enemy)
 
            -- Number of needed auto attacks for us to die
            local enemyNeededAA = math.ceil(player.health / enemyDamageAA)            
            enemyTable[i].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
 
        end
    end
 
end

local colorRangeReady        = ARGB(255, 200, 0,   200)
local colorRangeComboReady   = ARGB(255, 255, 128, 0)
local colorRangeNotReady     = ARGB(255, 50,  50,  50)
local colorIndicatorReady    = ARGB(255, 0,   255, 0)
local colorIndicatorNotReady = ARGB(255, 255, 220, 0)
local colorInfo              = ARGB(255, 255, 50,  0)
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