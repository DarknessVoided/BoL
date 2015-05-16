--[[
 _   _  _      _           _____    _   _        _                    
| \ | |(_)    | |         |  _  |  | | | |      | |                   
|  \| | _   __| |  __ _   | | | |  | |_| |  ___ | | _ __    ___  _ __ 
| . ` || | / _` | / _` |  | | | |  |  _  | / _ \| || '_ \  / _ \| '__|
| |\  || || (_| || (_| |  \ \/' /  | | | ||  __/| || |_) ||  __/| |   
\_| \_/|_| \__,_| \__,_|   \_/\_\  \_| |_/ \___||_|| .__/  \___||_|   
                                                   | |                
                                                   |_|                
]]--
if myHero.charName ~= "Nidalee" then return end
UPL = nil
if FileExist(LIB_PATH .. "/UPL.lua") then
  require("UPL")
  UPL = UPL()
end

if UPL == nil then 
  PrintChat("Please download the UPLib.") 
  return 
end

local Q = {name = "Javelin Toss", range = 1500, speed = 1300, delay = 0.125, width = 30, collision = true, aoe = false, type = "linear", Ready = function() return myHero:CanUseSpell(_Q) == READY end}
local QTargetSelector = TargetSelector(TARGET_NEAR_MOUSE, Q.range, DAMAGE_MAGIC)

function OnLoad()
  Config = scriptConfig("Nida Q Helper ", " Nida Q Helper ")
  if predToUse == {} then PrintChat("PLEASE DOWNLOAD A PREDICTION!") return end
  Config:addSubMenu("[Misc]: Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells(VIP)", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", "--------------------------------------------------------", SCRIPT_PARAM_INFO,"")
  UPL:AddToMenu(Config.misc)
    if UPL:ActivePred() == "VPrediction" or UPL:ActivePred() == "HPrediction" then 
     Config.misc:addParam("hc", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
    elseif UPL:ActivePred() == "DivinePred" then
     Config.misc:addParam("hc", "Accuracy (Default: 1.2)", SCRIPT_PARAM_SLICE, 1.2, 0, 1.5, 1)
     if Config.misc.hc > 1.5 then Config.misc.hc = 1.2 end
    end
  Config.misc:addParam("qqq", "--------------------------------------------------------", SCRIPT_PARAM_INFO,"")
  Config.misc:addParam("mana", "Min mana for harass:", SCRIPT_PARAM_SLICE, 30, 0, 101, 0)
  Config:addParam("throwQh", "Harass with Q (toggle)", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
  Config:addParam("throwQ", "Throw Q", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
  Config:permaShow("throwQh")
  Config:addTS(QTargetSelector)
  print("Nida Q Helper loaded!")
end

function OnTick()
  QTargetSelector:update()
  QCel = QTargetSelector.target
  if Config.throwQ or (Config.throwQh and myHero.mana >= Config.misc.mana) and not myHero.dead and not recall then
    if QCel ~= nil then
      ThrowQ(QCel)
    end
  end
end

function ThrowQ(unit)
  if unit and Q.Ready() and ValidTarget(unit) then
    local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, unit)
    if HitChance >= Config.misc.hc then
      if VIP_USER and Config.misc.pc then
        Packet("S_CAST", {spellId = _Q, fromX = CastPosition.x, fromY = CastPosition.z, toX = CastPosition.x, toY = CastPosition.z}):send()
      else
        CastSpell(_Q, CastPosition.x, CastPosition.z)
      end
    end
  end
end