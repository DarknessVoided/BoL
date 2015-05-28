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

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("WJMLKKLQPNL") 
--Scriptstatus Tracker

UPL = nil
if FileExist(LIB_PATH .. "/UPL.lua") then
  require("UPL")
  UPL = UPL()
else 
  print("Downloading UPL, please don't press F9")
  DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () print("Successfully downloaded UPL. Press F9 twice.") end) end, 3) 
  return
end

local Q = {name = "Javelin Toss", speed = 1337, delay = 0.125, range = 1525, width = 25, collision = true, aoe = false, type = "linear", Ready = function() return myHero:CanUseSpell(_Q) == READY end}
local QTargetSelector = TargetSelector(TARGET_NEAR_MOUSE, Q.range, DAMAGE_MAGIC)

function OnLoad()
  Config = scriptConfig("Nida Q Helper ", " Nida Q Helper ")
  Config:addSubMenu("[Misc]: Settings", "misc")
  Config.misc:addParam("pc", "Use Packets To Cast Spells(VIP)", SCRIPT_PARAM_ONOFF, false)
  Config.misc:addParam("qqq", "--------------------------------------------------------", SCRIPT_PARAM_INFO,"")
	UPL:AddSpell(_Q, Q)
  UPL:AddToMenu(Config.misc)
  Config.misc:addParam("hc", "Accuracy (Default: 2)", SCRIPT_PARAM_SLICE, 2, 0, 3, 1)
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
  if Config.throwQ or (Config.throwQh and myHero.mana >= Config.misc.mana) and not myHero.dead and not recall and QCel ~= nil and Q.Ready() then
    ThrowQ(QCel)
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