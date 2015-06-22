--[[

     ____           _       __         __                
    / __/____ ____ (_)___  / /_ ___   / /___  ___ _ __ __
   _\ \ / __// __// // _ \/ __// _ \ / // _ \/ _ `// // /
  /___/ \__//_/  /_// .__/\__/ \___//_/ \___/\_, / \_, / 
                   /_/                      /___/ /___/  

    By Scriptologe a.k.a Nebelwolfi

    Credits and thanks to: DefinitelyRiot

]]--

--[[
  SAhriVersion          = 1.1 -- small catchq fix
  SAsheVersion          = 1.4 -- removed ult over whole map
  SAzirVersion          = 0
  SBlitzcrankVersion    = 1
  SBrandVersion         = 1
  SCassiopeiaVersion    = 1.4 -- facingme fixed
  SDariusVersion        = 1.2 -- auto Q harrass added
  SEkkoVersion          = 1
  SGnarVersion          = 0
  SJarvanVersion        = 0
  SKalistaVersion       = 1
  SKogmawVersion        = 0
  SLeBlancVersion       = 0.1 -- soon(tm)
  SLeeSinVersion        = 1.2 -- is now live
  SLuxVersion           = 1.4 -- fixes
  SMalzaharVersion      = 1
  SNidaleeVersion       = 1.7 -- fixed farming
  SOlafVersion          = 0
  SOriannaVersion       = 1.3 -- better ult calculation
  SQuinnVersion         = 0
  SRengarVersion        = 1.6 -- fixed combo stuck bug
  SRivenVersion         = 1   -- release
  SRumbleVersion        = 1
  SSejuaniVersion       = 0
  SShyvanaVersion       = 0
  STeemoVersion         = 1
  SVayneVersion         = 0
  SViktorVersion        = 0
  SVolibearVersion      = 1
  SYasuoVersion         = 0
  SYorickVersion        = 0
]]--

--Scriptstatus Tracker
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion    = 1.56
_G.ScriptologyAutoUpdate = true
_G.ScriptologyLoaded     = false
_G.ScriptologyDebug      = false

function OnLoad()
  require("sScriptConfig")
  champList = { "Ahri", "Ashe", "Blitzcrank", "Brand", "Cassiopeia", 
                "Darius", "Ekko", 
                "Kalista", "LeeSin", "Lux", "Malzahar", 
                "Nidalee", "Orianna", "Rengar", "Riven",
                "Rumble", "Teemo", 
                "Volibear" }
                --[[
                TODO:
                "Azir",
                "Gnar", "Hecarim", "Jarvan", "Jinx",
                "KogMaw", "LeeSin",
                "Nidalee", "Olaf", "Quinn", "RekSai", 
                "Riven", "Sejuani", "Shyvana", "Thresh", "Tristana"
                "Vayne", "Viktor", "Yasuo", "Yorick"

                Total List:
                "Ashe", "Azir", "Blitzcrank", "Brand", "Cassiopeia", 
                "Darius", "Ekko", "Gnar", "Hecarim", "Jarvan", "Jinx",
                "Kalista", "KogMaw", "LeeSin", "Lux", "Malzahar", 
                "Nidalee", "Olaf", "Orianna", "Quinn", "RekSai", "Rengar", 
                "Riven", "Rumble", "Sejuani", "Shyvana", "Teemo", "Thresh", 
                "Tristana", "Vayne", "Viktor", "Volibear", "Yasuo", "Yorick" }]]--
  supported = {}
  for _,champ in pairs(champList) do
    supported[champ] = true
  end
  if supported[myHero.charName] then
    if ScriptologyAutoUpdate and Update() then
      return
    else
      Auth()
    end
  else
    ScriptologyMsg("Your Champion is not supported (yet)!")
  end
end

function Load()
  Menu()
  Vars()
  loadedClass = _G[myHero.charName]()
  AddTickCallback(function() Tick() end)
  AddDrawCallback(function() Draw() end)
  if objTrackList[myHero.charName] then
    AddCreateObjCallback(function(x) CreateObj(x) end)
    AddDeleteObjCallback(function(x) DeleteObj(x) end)
  end
  if trackList[myHero.charName] then
    AddApplyBuffCallback(function(x,y,z) ApplyBuff(x,y,z) end)
    AddUpdateBuffCallback(function(x,y,z) UpdateBuff(x,y,z) end)
    AddRemoveBuffCallback(function(x,y) RemoveBuff(x,y) end)
  end
  AddProcessSpellCallback(function(x,y) ProcessSpell(x,y) end)
  DelayAction(function() ScriptologyMsg("Loaded the latest version (v"..ScriptologyVersion..")") end, 3)
end

function Auth()
  if authAttempt then authAttempt = authAttempt + 1 else authAttempt = 1 end
  authList = { }
  auth     = {}
  for _,champ in pairs(authList) do
    auth[champ] = true
  end
  if not auth[myHero.charName] then
    Load()
    ScriptologyMsg("No auth needed")
    return true 
  end
  local authdata = GetWebResult("scriptology.tk", "/users/"..GetUser():lower().."."..myHero.charName:lower())
  if authdata and authAttempt < 9 then
    if type(tonumber(authdata)) == "number" and tonumber(authdata) == -1 then
      ScriptologyMsg("Authed! Hello "..GetUser())
      Load()
      return true
    elseif type(tonumber(authdata)) == "number" and tonumber(authdata) > 0 then
      ScriptologyMsg("Trial mode active! Hello "..GetUser())
      Load()
      return true
    else
      ScriptologyMsg("User: "..GetUser().." not found. Auth failed..")
      return false
    end
  elseif authAttempt < 9 then
    ScriptologyMsg("Auth failed, retrying. Attempt "..authAttempt.."/8")
    DelayAction(Auth, 2)
  else
    ScriptologyMsg("Auth failed. Please try again later..")
  end
end

function Update()
  local ScriptologyServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Scriptology.version")
  if ScriptologyServerData then
    ScriptologyServerVersion = type(tonumber(ScriptologyServerData)) == "number" and tonumber(ScriptologyServerData) or nil
    if ScriptologyServerVersion then
      if tonumber(ScriptologyVersion) < ScriptologyServerVersion then
        ScriptologyMsg("New version available v"..ScriptologyServerVersion)
        ScriptologyMsg("Updating, please don't press F9")
        DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Scriptology.lua".."?rand="..math.random(1,10000), SCRIPT_PATH.."Scriptology.lua", function () ScriptologyMsg("Successfully updated. ("..ScriptologyVersion.." => "..ScriptologyServerVersion.."), press F9 twice to load the updated version") end) DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/sScriptConfig.lua".."?rand="..math.random(1,10000), LIB_PATH.."sScriptConfig.lua", function () end) end, 3)
        return true
      end
    end
  else
    ScriptologyMsg("Error downloading version info")
  end
  if myHero.charName ~= "Darius" and myHero.charName ~= "Riven" and myHero.charName ~= "Teemo" and myHero.charName ~= "Volibear" and not _G.UPLloaded then
    if FileExist(LIB_PATH .. "/UPL.lua") then
      require("UPL")
      _G.UPL = UPL()
    else 
      ScriptologyMsg("Downloading UPL, please don't press F9")
      DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () ScriptologyMsg("Successfully downloaded UPL. Press F9 twice.") end) end, 3) 
      return true
    end
  end
  return false
end

function Menu()
  Config = sScriptConfig("Scriptology "..myHero.charName, "Scriptology") -- <- u mad?
  Config:addState("Combo")
  Config:addState("Harrass")
  if myHero.charName ~= "Blitzcrank" then Config:addState("Farm")
  if myHero.charName ~= "Teemo" then Config:addSubStates("Farm", {"LaneClear", "LastHit"}) end end
  if myHero.charName ~= "Riven" then Config:addState("Killsteal") end
  Config:addState("Draws")
  if myHero.charName ~= "Volibear" and myHero.charName ~= "Teemo" then 
    Config:addState("Misc")
    if myHero.charName == "Lux" then Config:addParam({state = "Misc", name = "Wa", code = SCRIPT_PARAM_ONOFF, value = true})
                                     Config:addParam({state = "Misc", name = "Ea", code = SCRIPT_PARAM_ONOFF, value = true}) end
    if myHero.charName == "Kalista" then Config:addParam({state = "Misc", name = "Ej", code = SCRIPT_PARAM_ONOFF, value = true}) end 
    if myHero.charName == "Rumble" then Config:addParam({state = "Misc", name = "Wa", code = SCRIPT_PARAM_ONOFF, value = true})
                                        Config:addParam({state = "Misc", name = "Ra", code = SCRIPT_PARAM_ONOFF, value = true}) end 
    if myHero.charName == "Lux" then Config:addParam({state = "Misc", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"W"}, slider = {50}}) end 
    if myHero.charName == "Nidalee" then Config:addParam({state = "Misc", name = "Ea", code = SCRIPT_PARAM_ONOFF, value = true})
                                         Config:addParam({state = "Misc", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"E"}, slider = {50}}) end
    if myHero.charName == "Orianna" then Config:addParam({state = "Misc", name = "Ra", code = SCRIPT_PARAM_ONOFF, value = true}) end
    if myHero.charName ~= "Darius" and myHero.charName ~= "Riven" then UPL:AddToMenu2(Config, "Misc") end 
  end
  Config:addParam({state = "Draws", name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
  if myHero.charName ~= "Orianna" then
    Config:addParam({state = "Draws", name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Draws", name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Draws", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  Config:addParam({state = "Draws", name = "DMG", code = SCRIPT_PARAM_ONOFF, value = true})
  Config:addParam({state = "Draws", name = "LFC", code = SCRIPT_PARAM_ONOFF, value = true})
  SetupOrbwalk()
end

function Vars()
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonersmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonersmite") then Smite = SUMMONER_2 end
  killTextTable = {}
  for k,enemy in pairs(GetEnemyHeroes()) do
    killTextTable[enemy.networkID] = { indicatorText = "", damageGettingText = ""}
  end
  stackTable = {}
  championData = {
      ["Ahri"] = {
        [_Q] = { range = 880, delay = 0.25, speed = 1600, width = 100, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
        [_W] = { range = 600, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
        [_E] = { range = 950, delay = 0.25, speed = 1550, width = 60, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
        [_R] = { range = 800, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+30+0.3*AP end}
      },
      ["Ashe"] = {
        [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.05*level+1.1)*TotalDmg end},
        [_W] = { speed = 902, delay = 0.5, range = 1200, width = 100, collision = true, aoe = false, type = "cone", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 10*level+30+TotalDmg end},
        [_E] = { speed = 1500, delay = 0.25, range = 25000, width = 80, collision = false, aoe = false, type = "linear"},
        [_R] = { speed = 1600, delay = 0.5, range = 25000, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 175*level+75+AP end}
      },
      ["Azir"] = {
        [_Q] = { speed = 500, delay = 0.250, range = 800, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45+20*level+0.05*AP end},
        [_W] = { speed = math.huge, delay = 0, range = 450, width = 350, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return (Level < 11 and 45+5*Level or Level*10)+0.6*AP end},
        [_E] = { range = 1300, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.4*AP end},
        [_R] = { speed = 1300, delay = 0.2, range = 500, width = 200, collision = false, aoe = true, type = "cone", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+75*level+0.5*AP end}
      },
      ["Blitzcrank"] = {
        [_Q] = { speed = 1800, delay = 0.25, range = 900, width = 70, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 55*level+25+AP end},
        [_W] = { range = 25000},
        [_E] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*TotalDmg end},
        [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 500, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 125*level+125+AP end}
      },
      ["Brand"] = {
        [_Q] = { speed = 1200, delay = 0.5, range = 1050, width = 80, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+40+0.65*AP end},
        [_W] = { speed = 900, delay = 0.25, range = 1050, width = 275, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45*level+30+0.6*AP end},
        [_E] = { range = 625, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25*level+30+0.55*AP end},
        [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 100*level+50+0.5*AP end}
      },
      ["Cassiopeia"] = {
        [_Q] = { speed = math.huge, delay = 0.25, range = 850, width = 100, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45+30*level+0.45*AP end},
        [_W] = { speed = 2500, delay = 0.5, range = 925, width = 90, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+5*level+0.1*AP end},
        [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+25*level+0.55*AP end},
        [_R] = { speed = math.huge, delay = 0.5, range = 825, width = 410, collision = false, aoe = true, type = "cone", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+10*level+0.5*AP end}
      },
      ["Darius"] = {
        [_Q] = { range = 0, width = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 35*level+35+0.7*TotalDmg end},
        [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+0.2*level*TotalDmg end},
        [_E] = { range = 550},
        [_R] = { range = 450, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return math.floor(70+90*level+0.75*myHero.addDamage+0.2*GetStacks(target)*(70+90*level+0.75*myHero.addDamage)) end}
      },
      ["Ekko"] = {
        [_Q] = { speed = 1050, delay = 0.25, range = 825, width = 140, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15*level+45+0.2*AP end},
        [_W] = { speed = math.huge, delay = 3, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
        [_E] = { delay = 0.50, range = 350, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30*level+20+0.2*AP+TotalDmg end},
        [_R] = { speed = math.huge, delay = 0.5, range = 0, width = 400, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 150*level+50+1.3*AP end}
      },
      ["Gnar"] = {
        [_Q] = { range = 0},
        [_W] = { range = 0},
        [_E] = { range = 0},
        [_R] = { range = 0}
      },
      ["Hecarim"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.6*TotalDmg end},
        [_W] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 8.75+11.25*level+0.2*AP end},
        [_E] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.5*TotalDmg end},
        [_R] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 50+100*level+AP end}
      },
      ["Jarvan"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+1.2*TotalDmg end},
        [_W] = { },
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+45*level+0.8*AP end},
        [_R] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 75+125*level+1.5*TotalDmg end}
      },
      ["Kalista"] = {
        [_Q] = { speed = 1750, delay = 0.25, range = 1275, width = 70, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-50+60*level+TotalDmg end},
        [_W] = { delay = 1.5, range = 5500},
        [_E] = { delay = 0.50, range = 1000, dmgAD = function(AP, level, Level, TotalDmg, source, target) return GetStacks(target) > 0 and (10 + (10 * level) + (TotalDmg * 0.6)) + (GetStacks(target)-1) * (kalE(level) + (0.2 + 0.03 * (level-1))*TotalDmg) or 0 end},
        [_R] = { range = 4000}
      },
      ["KogMaw"] = {
        [_Q] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+50*level+0.5*AP end},
        [_W] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return target.maxHealth*0.01*(level+1)+0.01*Ap+TotalDmg end},
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
        [_R] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.3*AP+0.5*TotalDmg end}
      },
      ["LeBlanc"] = {
        [_Q] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+25*level+0.4*AP end},
        [_W] = { speed = 1300, delay = 0.250, range = 600, width = 250, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45+40*level+0.6*AP end},
        [_E] = { speed = 1300, delay = 0.250, range = 950, width = 55, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.5*AP end},
        [_R] = { range = 0}
      },
      ["LeeSin"] = {
        [_Q] = { range = 1100, width = 50, delay = 0.25, speed = 1800, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.9*source.addDamage end},
        [_W] = { range = 600},
        [_E] = { range = 0, width = 450, delay = 0.25, speed = math.huge, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+source.addDamage end},
        [_R] = { range = 2000, width = 150, delay = 0.25, speed = 2000, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 200*level+2*source.addDamage end}
      },
      ["Lux"] = {
        [_Q] = { speed = 1025, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
        [_W] = { speed = 1630, delay = 0.25, range = 1250, width = 210, collision = false, type = "linear"},
        [_E] = { speed = 1275, delay = 0.25, range = 1100, width = 250, collision = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+45*level+0.6*AP end},
        [_R] = { speed = math.huge, delay = 1, range = 3340, width = 200, collision = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 200+100*level+0.75*AP end}
      },
      ["Malzahar"] = {
        [_Q] = { speed = math.huge, delay = 0.5, range = 900, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+55*level+0.8*AP end},
        [_W] = { speed = math.huge, delay = 0.5, range = 800, width = 250, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return (0.04+0.01*level)*target.maxHealth+AP/100 end},
        [_E] = { speed = math.huge, delay = 0.5, range = 650, dmgAP = function(AP, level, Level, TotalDmg, source, target) return (20+60*level)/8+0.1*AP end},
        [_R] = { speed = math.huge, delay = 0.5, range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.26*AP end}
      },
      ["Nidalee"] = {
        [_Q] = { speed = 1337, delay = 0.125, range = 1525, width = 25, collision = true, aoe = false, type = "linear"},
        [_W] = { range = 0},
        [_E] = { range = 0},
        [_R] = { range = 0}
      },
      ["Olaf"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+TotalDmg end},
        [_W] = { },
        [_E] = { range = 0, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+0.4*TotalDmg end},
        [_R] = { }
      },
      ["Orianna"] = {
        [_Q] = { speed = 1200, delay = 0.250, range = 825, width = 175, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.5*AP end},
        [_W] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+0.7*AP end},
        [_E] = { speed = 1800, delay = 0.250, range = 825, width = 80, collision = false, aoe = false, type = "targeted", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.3*AP end},
        [_R] = { speed = math.huge, delay = 0.250, range = 0, width = 410, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+75*level+0.7*AP end}
      },
      ["Quinn"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30+40*level+0.65*source.addDamage+0.5*AP end},
        [_W] = { },
        [_E] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 10+30*level+0.2*source.addDamage end},
        [_R] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (70+50*level+0.5*source.addDamage)*(1+((target.maxHealth-target.health)/target.maxHealth)) end}
      },
      ["Rengar"] = {
        [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+(0.95+0.05*level)*TotalDmg end},
        [_W] = { speed = math.huge, delay = 0.5, range = 490, width = 490, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.8*AP end},
        [_E] = { speed = 1375, delay = 0.25, range = 1000, width = 80, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 50*level+0.7*TotalDmg end},
        [_R] = { range = 4000}
      },
      ["Riven"] = {
        [_Q] = { range = 310, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+(0.35+0.05*level)*TotalDmg end},
        [_W] = { range = 265, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+TotalDmg end},
        [_E] = { range = 390},
        [_R] = { range = 930, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (40+40*level+0.6*source.addDamage)*(math.min(3,math.max(1,4*(target.maxHealth-target.health)/target.maxHealth))) end},
      },
      ["Rumble"] = {
        [_Q] = { speed = math.huge, delay = 0.250, range = 600, width = 500, collision = false, aoe = false, type = "cone", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+20*level+0.33*AP end},
        [_W] = { range = myHero.boundingRadius},
        [_E] = { speed = 1200, delay = 0.250, range = 850, width = 90, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+25*level+0.4*AP end},
        [_R] = { speed = 1200, delay = 0.250, range = 1700, width = 90, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+55*level+0.3*AP end}
      },
      ["Sejuani"] = {
        [_Q] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.4*AP end},
        [_W] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return end},
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level*0.5*AP end},
        [_R] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+100*level*0.8*AP end}
      },
      ["Shyvana"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.75+0.05*level)*TotalDmg end},
        [_W] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+15*level+0.2*TotalDmg end},
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+40*level+0.6*TotalDmg end},
        [_R] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+125*level+0.7*AP end}
      },
      ["Teemo"] = {
        [_Q] = { range = myHero.range+myHero.boundingRadius*3, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*Level+0.8*AP end},
        [_W] = { range = 25000},
        [_E] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 9*level+0.3*AP end},
        [_R] = { range = myHero.range, width = 250}
      },
      ["Vayne"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.25+0.05*level)*TotalDmg+TotalDmg end},
        [_W] = { range = 0, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return 10+10*level+((0.03+0.01*level)*target.maxHealth) end},
        [_E] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.5*TotalDmg end},
        [_R] = { }
      },
      ["Viktor"] = {
        [_Q] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+20*level+0.2*AP end},
        [_W] = { },
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+0.7*AP end},
        [_R] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+100*level+0.55*AP end}
      },
      ["Volibear"] = {
        [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+TotalDmg end},
        [_W] = { range = myHero.range*2+myHero.boundingRadius+25, dmgAD = function(AP, level, Level, TotalDmg, source, target) return ((1+(target.maxHealth-target.health)/target.maxHealth))*(45*level+35+0.15*(source.maxHealth-(440+86*Level))) end},
        [_E] = { range = myHero.range*2+myHero.boundingRadius*2+10, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45*level+15+0.6*AP end},
        [_R] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+35+0.3*AP end}
      },
      ["Yasuo"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+TotalDmg end},
        [_W] = { },
        [_E] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+20*level+AP end},
        [_R] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 100+100*level+1.5*TotalDmg end}
      },
      ["Yorick"] = {
        [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+1.2*TotalDmg+TotalDmg end},
        [_W] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+AP end},
        [_E] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30+25*level+TotalDmg end},
        [_R] = { }
      }
  }
  lastAttack = 0
  lastWindup = 0
  previousWindUp = 0
  previousAttackCooldown = 0
  ultOn = 0
  trackList = {
      ["Ahri"] = {
        "AhriSeduce"
      },
      ["Brand"] = {
        "brandablaze"
      },
      ["Cassiopeia"] = {
        "blastpoison", "miasmapoison"
      },
      ["Darius"] = {
        "dariushemo"
      },
      ["Kalista"] = {
        "kalistaexpungemarker"
      },
      ["LeeSin"] = {
        "BlindMonkQOne"
      },
      ["Lux"] = {
        "luxilluminati"
      },
      ["Nidalee"] = {
        "nidaleepassivehunted"
      }
  }
  objTrackList = {
      ["Ashe"] = { "Ashe_Base_Q_Ready.troy" },
      ["Azir"] = { "AzirSoldier" },
      ["Ekko"] = { "Ekko", "Ekko_Base_Q_Aoe_Dilation.troy", "Ekko_Base_W_Detonate_Slow.troy", "Ekko_Base_W_Indicator.troy", "Ekko_Base_W_Cas.troy" },
      ["Orianna"] = { "TheDoomBall" }
  }
  objTimeTrackList = {
      ["Ashe"] = { 4 },
      ["Azir"] = { 9 },
      ["Ekko"] = { math.huge, 1.565, 1.70, 3, 1 },
      ["Orianna"] = { math.huge }
  }
  if objTrackList[myHero.charName] then
    objHolder = {}
    objTimeHolder = {}
    table.insert(objHolder, myHero)
    for k=1,objManager.maxObjects,1 do
      local object = objManager:getObject(k)
      for _,name in pairs(objTrackList[myHero.charName]) do
        if object and object.valid and object.name and object.team == myHero.team and object.name == name then
          --table.insert(objTimeHolder, GetInGameTimer() + objTimeTrackList[myHero.charName][_])
          objHolder[name] = object
          --objTimeHolder[name] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
          if ScriptologyDebug then print("Object "..object.name.." already created. Now tracking!") end
        end
      end
    end
  end
  data = championData[myHero.charName]
  for k,v in pairs(data) do
    if v.type then UPL:AddSpell(k, v) end
  end
  Target = nil
  Mobs = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC)
  JMobs = minionManager(MINION_JUNGLE, 750, myHero, MINION_SORT_HEALTH_ASC)
  sReady = {[_Q] = false, [_W] = false, [_E] = false, [_R] = false}
end

function SetupOrbwalk()
  if myHero.charName == "Malzahar" or myHero.charName == "Katarina" or myHero.charName == "Riven" then
    ScriptologyMsg("Inbuilt OrbWalker activated! Do not use any other")
  else
    if _G.AutoCarry then
      if _G.Reborn_Initialised then
        ScriptologyMsg("Found SAC: Reborn")
      else
        ScriptologyMsg("Found SAC: Revamped")
      end
    elseif _G.Reborn_Loaded then
      DelayAction(function() SetupOrbwalk() end, 1)
    elseif _G.MMA_Loaded then
      ScriptologyMsg("Found MMA")
    elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
      require "Big Fat Orbwalker"
    elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
      require 'SxOrbWalk'
      SxOrb:LoadToMenu(scriptConfig("SxOrbWalk", "ScriptologySxOrbWalk"))
      ScriptologyMsg("Found SxOrb.")
    elseif FileExist(LIB_PATH .. "SOW.lua") then
      require 'SOW'
      require 'VPrediction'
      SOWVP = SOW(VP)
      SOWVP:LoadToMenu(scriptConfig("SOW", "ScriptologySOW"))
      ScriptologyMsg("Found SOW")
    else
      ScriptologyMsg("No valid Orbwalker found")
    end
  end
end

function DisableOrbwalkerMovement()
  if _G.Reborn_Loaded then
    _G.AutoCarry.MyHero:MovementEnabled(false)
  elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
    _G["BigFatOrb_DisableMove"] = true
  elseif self.OrbLoaded == "SxOrbWalk" then
    SxOrb:DisableMove()
  elseif FileExist(LIB_PATH .. "SOW.lua") then
    SOWVP.Move = false
  end
end

function EnableOrbwalkerMovement()
  if _G.Reborn_Loaded then
    _G.AutoCarry.MyHero:MovementEnabled(true)
  elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
    _G["BigFatOrb_DisableMove"] = false
  elseif self.OrbLoaded == "SxOrbWalk" then
    SxOrb:EnableMove()
  elseif FileExist(LIB_PATH .. "SOW.lua") then
    SOWi.Move = true
  end
end

function Tick()
  if myHero.charName ~= "Blitzcrank" then Target = GetCustomTarget() end
  Mobs:update()
  JMobs:update()

  for _=0,3 do
    sReady[_] = myHero:CanUseSpell(_) == READY
  end

  if myHero.charName ~= "Riven" then loadedClass:Killsteal() end

  if Target ~= nil or myHero.charName == "Blitzcrank" then 
    if Config:getParam("Harrass", "Harrass") and not Config:getParam("Combo", "Combo") then
      loadedClass:Harrass()
    end

    if Config:getParam("Combo", "Combo") then
      loadedClass:Combo()
    end
  end

  if myHero.charName ~= "Riven" then
    if Config:getParam("LastHit", "LastHit") or Config:getParam("LaneClear", "LaneClear") then
      loadedClass:LastHit()
    end
  end

    if Config:getParam("LaneClear", "LaneClear") then
      loadedClass:LaneClear()
    end

  if myHero.charName ~= "Nidalee" and myHero.charName ~= "Riven" then DmgCalc() end
end

function Draw()
  if myHero.charName == "Nidalee" or myHero.charName == "Riven" then return end
  if Config:getParam("Draws", "Q") and myHero:CanUseSpell(_Q) == READY then
    DrawLFC(myHero.x, myHero.y, myHero.z, myHero.charName == "Rengar" and myHero.range+myHero.boundingRadius*2 or data[0].range > 0 and data[0].range or data[0].width, ARGB(255, 155, 155, 155))
  end
  if myHero.charName ~= "Orianna" then
    if Config:getParam("Draws", "W") and myHero:CanUseSpell(_W) == READY then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[1].range > 0 and data[1].range or data[1].width, ARGB(255, 155, 155, 155))
    end
    if Config:getParam("Draws", "E") and myHero:CanUseSpell(_E) == READY then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range > 0 and data[2].range or data[2].width, ARGB(255, 155, 155, 155))
    end
    if Config:getParam("Draws", "R") and myHero:CanUseSpell(_R) == READY then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[3].range > 0 and data[3].range or data[3].width, ARGB(255, 155, 155, 155))
    end
  end
  --print(#objHolder)
  if objTrackList[myHero.charName] then
    if #objHolder > 0 then
      for _,obj in pairs(objHolder) do
        if obj ~= myHero then
          if objTimeHolder[obj.name] and objTimeHolder[obj.name] < math.huge and objTimeHolder[obj.name]>GetInGameTimer() then 
            local barPos = WorldToScreen(D3DXVECTOR3(obj.x, obj.y, obj.z))
            local posX = barPos.x - 35
            local posY = barPos.y - 50
            DrawText((math.floor((objTimeHolder[obj.name]-GetInGameTimer())*100)/100).."s", 25, posX, posY, ARGB(255, 255, 0, 0)) 
          end
          width = myHero.charName == "Ekko" and obj.name == "Ekko" and data[3].width or (((myHero.charName == "Ekko" and obj.name:find("Ekko_Base_W")) or myHero.charName == "Azir") and data[1].width or data[0].width)
          if myHero.charName == "Ekko" then
            if obj.name == "Ekko" and Config:getParam("Draws", "R") then 
              DrawLFT(obj.x, obj.y, obj.z, width, ARGB(155, 155, 150, 250)) 
              DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
            elseif obj.name:find("Ekko_Base_Q") and Config:getParam("Draws", "Q") then 
              DrawLine3D(myHero.x, myHero.y, myHero.z, obj.x, obj.y, obj.z, 1, ARGB(255, 155, 150, 250)) 
              DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
            elseif Config:getParam("Draws", "W") then
              DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
            end
          elseif myHero.charName == "Orianna" then
            DrawCircle(obj.x-8, obj.y, obj.z+87, data[0].width-50, 0x111111)
            for i=0,2 do
              LagFree(obj.x-8, obj.y, obj.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (math.pi/4.5)*(i))
            end 
            LagFree(obj.x-8, obj.y, obj.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
          else
            DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
          end
        end
      end
    end
  end
  if Config:getParam("Draws", "DMG") then
    for i,k in pairs(GetEnemyHeroes()) do
      local enemy = k
      if ValidTarget(enemy) then
        local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
        local posX = barPos.x - 35
        local posY = barPos.y - 50
        -- Doing damage
        if myHero.charName == "Kalista" then
          DrawText(killTextTable[enemy.networkID].indicatorText, 20, posX, posY-5, ARGB(255,250,250,250))
        else
          DrawText(killTextTable[enemy.networkID].indicatorText, 18, posX, posY, ARGB(255, 50, 255, 50))
        end
       
        -- Taking damage
        DrawText(killTextTable[enemy.networkID].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 50, 50))
      end
    end
    if myHero.charName == "Kalista" and myHero:CanUseSpell(_E) then
      for minion,winion in pairs(Mobs.objects) do
        damageE = GetDmg(_E, myHero, winion)
        if winion ~= nil and GetStacks(winion) > 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
          if damageE > winion.health then
            DrawText3D("E Kill", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
          else
            DrawText3D(math.floor(damageE/winion.health*100).."%", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
          end
        end
      end
      if Config:getParam("Misc", "Ej") then
        for minion,winion in pairs(JMobs.objects) do
          damageE = GetDmg(_E, myHero, winion)
          if winion ~= nil and GetStacks(winion) > 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
            if damageE > winion.health then
              DrawText3D("E Kill", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
            else
              DrawText3D(math.floor(damageE/winion.health*100).."%", winion.x-45, winion.y-45, winion.z+45, 20, TARGB({255,250,250,250}), 0)
            end
          end
        end
      end
    end
  end 
end

function CreateObj(object)
  if object and object.valid and object.name then
    for _,name in pairs(objTrackList[myHero.charName]) do
      if object.name == name then
        if myHero.charName == "Ahri" and GetDistance(obj) < 500 then
          objHolder[object.name] = object
          objTimeHolder[object.name] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
        elseif myHero.charName ~= "Ahri" then
          objHolder[object.name] = object
          objTimeHolder[object.name] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
        end
        --table.insert(objHolder, object)
        --table.insert(objTimeHolder, GetInGameTimer() + objTimeTrackList[myHero.charName][_])
        if ScriptologyDebug then print("Object "..object.name.." created. Now tracking!") end
      end
    end
  end
end
 
function DeleteObj(object)
  if object and object.name then 
    for _,name in pairs(objTrackList[myHero.charName]) do
      if object.name == name and name ~= "TheDoomBall" then
        objHolder[object.name] = nil
        if ScriptologyDebug then print("Object "..object.name.." destroyed. No longer tracking! "..#objHolder) end
      end
    end
  end
end

function ApplyBuff(source, unit, buff)
  if source and source.isMe and buff and unit then
    for _,name in pairs(trackList[myHero.charName]) do
      if buff.name:find(name) then
        stackTable[unit.networkID] = 1
        if ScriptologyDebug then print(source.charName.." applied "..name.." on "..unit.charName) end
      end
    end
  end
end

function UpdateBuff(unit, buff, stacks)
  if buff and unit then
    for _,name in pairs(trackList[myHero.charName]) do
      if buff.name:find(name) and stackTable[unit.networkID] then
        stackTable[unit.networkID] = stacks
        if ScriptologyDebug then print("Updated "..name.." on "..unit.charName.." with "..stacks.." stacks") end
      end
    end
  end
end

function RemoveBuff(unit, buff)
  if buff and unit then
    for _,name in pairs(trackList[myHero.charName]) do
      if buff.name:find(name) then
        stackTable[unit.networkID] = nil
        if ScriptologyDebug then print("Removed "..name.." from "..unit.charName) end
      end
    end
  end
end

function GetStacks(unit)
  if not unit then return 0 end
  return stackTable[unit.networkID] or 0
end

function ProcessSpell(unit, spell)
  if unit and unit.isMe and spell then
    lastAttack = GetTickCount() - GetLatency()/2
    previousWindUp = spell.windUpTime*1000
    previousAttackCooldown = spell.animationTime*1000
    if string.find(string.lower(spell.name), "attack") then
      lastWindup = GetInGameTimer()+spell.windUpTime
    elseif spell.name == "EkkoR" then
      objHolder["Ekko"] = nil
    elseif spell.name == "OrianaIzunaCommand" then
      objHolder["TheDoomBall"] = nil
    elseif spell.name == "OrianaRedactCommand" then
      objHolder["TheDoomBall"] = spell.target
    elseif string.find(spell.name, "NetherGrasp") or spell.name:lower():find("katarinar") then
      ultOn = GetInGameTimer()+2.5
    end
  end
end
 
function timeToShoot()
  return (GetTickCount() + GetLatency()/2 > lastAttack + previousAttackCooldown) and ultOn < GetInGameTimer()
end
 
function heroCanMove()
  return (GetTickCount() + GetLatency()/2 > lastAttack + previousWindUp + 75) and ultOn < GetInGameTimer()
end

function GetCustomTarget()
  loadedClass.ts:update()
  if _G.MMA_Target and _G.MMA_Target.type == myHero.type then return _G.MMA_Target end
  if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
  return loadedClass.ts.target
end

function GetFarmPosition(range, width)
  local BestPos 
  local BestHit = 0
  local objects = minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects
  for i, object in ipairs(objects) do
    local hit = CountObjectsNearPos(object.pos or object, range, width, objects)
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

function GetJFarmPosition(range, width)
  local BestPos 
  local BestHit = 0
  local objects = minionManager(MINION_JUNGLE, range, myHero, MINION_SORT_HEALTH_ASC).objects
  for i, object in ipairs(objects) do
    local hit = CountObjectsNearPos(object.pos or object, range, width, objects)
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

function GetLichSlot()
  for slot = ITEM_1, ITEM_7, 1 do
    if myHero:GetSpellData(slot).name and (string.find(string.lower(myHero:GetSpellData(slot).name), "atmasimpalerdummyspell")) then
      return slot
    end
  end
  return nil
end

function IsInvinc(unit)
  if unit == nil then if self == nil then return else unit = self end end
  for i=1, unit.buffCount do
   local buff = unit:getBuff(i)
   if buff and buff.valid and buff.name then 
    if buff.name == "JudicatorIntervention" or buff.name == "UndyingRage" then return true end
   end
  end
  return false
end

function IsRecalling(unit)
  if unit == nil then if self == nil then return else unit = self end end
  for i=1, unit.buffCount do
   local buff = unit:getBuff(i)
   if buff and buff.valid and buff.name then 
    if string.find(buff.name, "recall") or string.find(buff.name, "Recall") or string.find(buff.name, "teleport") or string.find(buff.name, "Teleport") then return true end
   end
  end
  return false
end

function DrawLFC(x, y, z, radius, color)
    if Config:getParam("Draws", "LFC") then
        LagFree(x, y, z, radius, 1, color, 32, 0)
    else
        local radius = radius or 300
        DrawCircle(x, y, z, radius, color)
    end
end

function DrawLFT(x, y, z, radius, color)
  LagFree(x, y, z, radius, 1, color, 3, 0)
end

function LagFree(x, y, z, radius, width, color, quality, degree)
    local radius = radius or 300
    local screenMin = WorldToScreen(D3DXVECTOR3(x - radius, y, z + radius))
    if OnScreen({x = screenMin.x + 200, y = screenMin.y + 200}, {x = screenMin.x + 200, y = screenMin.y + 200}) then
        radius = radius*.92
        local quality = quality and 2 * math.pi / quality or 2 * math.pi / math.floor(radius / 10)
        local width = width and width or 1
        local a = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(degree), y, z - radius * math.sin(degree)))
        for theta = quality, 2 * math.pi + quality, quality do
            local b = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta+degree), y, z - radius * math.sin(theta+degree)))
            DrawLine(a.x, a.y, b.x, b.y, width, color)
            a = b
        end
    end
end

function ScriptologyMsg(msg) 
  print("<font color=\"#6699ff\"><b>[Scriptology Loader]: "..myHero.charName.." - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
end

function TARGB(colorTable)
  return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
end

function DmgCalc()
  if not Config:getParam("Draws", "DMG") then return end
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy.visible then
      killTextTable[enemy.networkID].indicatorText = ""
      if myHero.charName == "Kalista" then
        local damageAA = GetDmg("AD", myHero, enemy)
        local damageE  = GetDmg(_E, myHero, enemy)
        if enemy.health < damageE then
            killTextTable[enemy.networkID].indicatorText = "E Kill"
            killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_E)
        end
        if myHero:CanUseSpell(_E) == READY and enemy.health > damageE and damageE > 0 then
          killTextTable[enemy.networkID].indicatorText = math.floor(damageE/enemy.health*100).."% E"
        else
          killTextTable[enemy.networkID].indicatorText = ""
        end
      else
        local damageAA = GetDmg("AD", myHero, enemy)
        local damageQ  = GetDmg(_Q, myHero, enemy)
        local damageW  = GetDmg(_W, myHero, enemy)
        local damageE  = GetDmg(_E, myHero, enemy)
        local damageR  = GetDmg(_R, myHero, enemy)
        local damageRC  = (myHero.charName == "Orianna" and loadedClass:CalcRComboDmg(enemy) or 0)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        damageQ = myHero:CanUseSpell(_Q) == READY and damageQ or 0
        damageW = myHero:CanUseSpell(_W) == READY and damageW or 0
        damageE = myHero:CanUseSpell(_E) == READY and damageE or 0
        damageR = myHero:CanUseSpell(_R) == READY and damageR or 0
        if myHero:CanUseSpell(_Q) == READY and damageQ > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
        end
        if myHero:CanUseSpell(_W) == READY and damageW > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."W"
        end
        if myHero:CanUseSpell(_E) == READY and damageE > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."E"
        end
        if myHero:CanUseSpell(_R) == READY and damageR > 0 and myHero.charName ~= "Orianna" then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."R"
        end
        if myHero:CanUseSpell(_R) == READY and damageRC > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."RQ"
        end
        if enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy)+damageRC then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Killable"
        end
        if myHero.charName == "Teemo" and enemy.health > damageQ+damageE+damageAA then
          local neededAA = math.ceil((enemy.health) / (damageAA+damageE))
          killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
        elseif myHero.charName == "Ashe" then
          local neededAA = math.ceil((enemy.health-damageQ-damageW) / (damageAA))
          killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
        elseif enemy.health > damageQ+damageW+damageE+damageR then
          local neededAA = math.ceil(100*(damageQ+damageW+damageE+damageR)/(enemy.health))
          killTextTable[enemy.networkID].indicatorText = neededAA.." % Combodmg"
        end
      end
      local enemyDamageAA = GetDmg("AD", enemy, myHero)
      local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
      if enemyNeededAA ~= 0 then         
        killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
      end
    end
  end
end

function GetDmg(spell, source, target)
  if target == nil or source == nil then
    return
  end
  local ADDmg            = 0
  local APDmg            = 0
  local AP               = source.ap
  local Level            = source.level
  local TotalDmg         = source.totalDamage
  local crit = myHero.critChance
  local crdm = myHero.critDmg
  local ArmorPen         = math.floor(source.armorPen)
  local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
  local MagicPen         = math.floor(source.magicPen)
  local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

  local Armor        = target.armor*ArmorPenPercent-ArmorPen
  local ArmorPercent = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or math.ceil(Armor*100/(100-Armor))/100
  local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
  local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

  if source ~= myHero then
    return TotalDmg*(1-ArmorPercent)
  end
  if spell == "IGNITE" then
    return 50+20*Level/2
  elseif spell == "Tiamat" then
    ADDmg = (GetHydraSlot() and myHero:CanUseSpell(GetHydraSlot()) == READY) and TotalDmg*0.8 or 0 
  elseif spell == "AD" then
    if myHero.charName == "Ashe" then
      ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
    else
      ADDmg = TotalDmg
    end
  elseif type(spell) == "number" then
    if data[spell].dmgAD then ADDmg = data[spell].dmgAD(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
    if data[spell].dmgAP then APDmg = data[spell].dmgAP(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
    if data[spell].dmgTRUE then return data[spell].dmgTRUE(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
  end
  dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))
  return math.floor(dmg)
end

function GetHydraSlot()
  for slot = ITEM_1, ITEM_7, 1 do
    if myHero:GetSpellData(slot).name and (string.find(string.lower(myHero:GetSpellData(slot).name), "tiamat")) then
      return slot
    end
  end
  return nil
end

function Cast(Spell, target, targeted, predict, hitchance, source) -- maybe the packetcast gets some functionality somewhen?
  if not target and not targeted then
    if VIP_USER then
        Packet("S_CAST", {spellId = Spell}):send()
    else
        CastSpell(Spell)
    end
  elseif target and targeted then
    if VIP_USER then
        Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
    else
        CastSpell(Spell, target)
    end
  elseif target and not targeted and not predict then
    xPos = target.x
    zPos = target.z
    if VIP_USER then
      Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
    else
      CastSpell(Spell, xPos, zPos)
    end
  elseif target and not targeted and predict then
    if not source then source = myHero end
    if not hitchance then hitchance = 2 end
    local CastPosition, HitChance, Position = UPL:Predict(Spell, source, target)
    if HitChance >= hitchance then
      xPos = CastPosition.x
      zPos = CastPosition.z
      if VIP_USER then
        Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
      else
        CastSpell(Spell, xPos, zPos)
      end
      CastSpell(Spell)
    end
  end
end

function EnemiesAround(Unit, range)
  local c=0
  if Unit == nil then return 0 end
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function EnemiesAroundAndFacingMe(Unit, range)
  local c=0
  if Unit == nil then return 0 end
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range and GetDistance(PredictPos(hero), myHero) < GetDistance(hero, myHero) then c=c+1 end end return c
end

function PredictPos(target)
  speed = target.ms
  dir = GetTargetDirection(target)
  if dir and target.isMoving then
    return Vector(target)+Vector(dir.x, dir.y, dir.z):normalized()*speed/8, GetDistance(target.minBBox, target.pos)
  elseif not target.isMoving then
    return Vector(target), GetDistance(target.minBBox, target.pos)
  end
end

function GetTargetDirection(target)
  local wp = GetWayPoints(target)
  if #wp == 1 then
    return Vector(target.x, target.y, target.z)
  elseif #wp >= 2 then
    return Vector(wp[2].x-target.x, wp[2].y-target.y, wp[2].z-target.z)
  end
end

function GetWayPoints(target)
  local result = {}
  if target.hasMovePath then
    table.insert(result, Vector(target))
    for i = target.pathIndex, target.pathCount do
      path = target:GetPath(i)
      table.insert(result, Vector(path))
    end
  else
    table.insert(result, Vector(target))
  end
  return result
end

function AlliesAround(Unit, range)
  local c=0
  for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team == myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
end

function GetLowestMinion(range)
  local minionTarget = nil
  for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if minionTarget == nil then 
      minionTarget = minion
    elseif minionTarget.health >= minion.health and ValidTarget(minion, range) then
      minionTarget = minion
    end
  end
  return minionTarget
end

function GetClosestMinion(range)
  local minionTarget = nil
  for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if minionTarget == nil then 
      minionTarget = minion
    elseif GetDistance(minionTarget) > GetDistance(minion) and ValidTarget(minion, range) then
      minionTarget = minion
    end
  end
  return minionTarget
end

function GetJMinion(range)
  local minionTarget = nil
  for i, minion in pairs(minionManager(MINION_JUNGLE, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if minionTarget == nil then 
      minionTarget = minion
    elseif minionTarget.maxHealth < minion.maxHealth and ValidTarget(minion, range) then
      minionTarget = minion
    end
  end
  return minionTarget
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ Champion specific parts from here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Ahri"

  function Ahri:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    self:Menu()
    self.Orb = nil
    self.ultOn = 0
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    AddTickCallback(function() self:Tick() end)
    AddDrawCallback(function() self:Draw() end)
  end

  function Ahri:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Ahri:ProcessSpell(unit, spell)
    if unit and unit.isMe and not self.Orb then
      if spell.name == "AhriOrbofDeception" then
        self.Orb = {time = GetInGameTimer(), dir = Vector(spell.endPos)}
      end
      if spell.name == "AhriTumble" then
        if self.ultOn < GetInGameTimer()-10 then self.ultOn = GetInGameTimer() end
      end
    end
  end

  function Ahri:Tick()
    if Config:getParam("Misc", "Qc") then self:CatchQ() end
  end

  function Ahri:Draw()
    if self.Orb and self.Orb.time > GetInGameTimer()-2 then
      local draw = Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir))
      DrawLine3D(myHero.x, myHero.y, myHero.z, draw.x, draw.y, draw.z, data[0].width, ARGB(35, 255, 255, 255))
    else
      self.Orb = nil
    end
  end

  function Ahri:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_Q].range)
      if minion and minion < GetDmg(_Q, myHero, minion) then 
        Cast(_Q, minion)
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetLineFarmPosition(data[_Q].range, data[_Q].width)
      if BestPos and BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_E] and Config:getParam("Combo", "E") and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if GetStacks(Target) > 0 then
      if sReady[_Q] and Config:getParam("Combo", "Q") and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config:getParam("Combo", "W") and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config:getParam("Combo", "Q") and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config:getParam("Combo", "W") and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      self:CatchQ()
    end
    if Target.health < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < data[3].range then
      Cast(_R, Target)
    elseif self.ultOn > GetInGameTimer()-10 and (not self.Orb or self.Orb.time < GetInGameTimer()-1.5) and GetDistance(Target) < data[3].range then
      Cast(_R, Target)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb and self.Orb.dir and self.Orb.time > GetInGameTimer()-1.5 then
      DisableOrbwalkerMovement()
      local x,y,z = UPL:Predict(_Q,Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir)),Target)
      local x = Vector(self.Orb.dir)+(x-Vector(self.Orb.dir)):normalized()*(data[0].range)
      if self.ultOn > GetInGameTimer()-10 then
        local x = Vector(x)-(Vector(Target)-myHero):normalized()*data[3].range
        Cast(_R,x)
      else
        myHero:MoveTo(x.x,x.z)
      end
      if GetDistance(x) < 50  then
        EnableOrbwalkerMovement()   
      end 
    else
      EnableOrbwalkerMovement() 
    end
  end

  function Ahri:Harrass()
    if not Target then return end
    if sReady[_E] and Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if GetStacks(Target) > 0 then
      if sReady[_Q] and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      self:CatchQ()
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q")*2 and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[3].range) then
          Cast(_W)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_R, enemy) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_W)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) Cast(_W) Cast(_R, enemy) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        end
      end
    end
  end
  
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Ashe"

  function Ashe:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL)
    self:Menu()
    AddTickCallback(function() self:AimR() end)
  end

  function Ashe:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W"}, slider = {50,50}})
    end
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    Config:addParam({state = "Misc", name = "AimR", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  end

  function Ashe:AimR()
    if Config:getParam("Misc", "AimR") then
      for _,k in pairs(GetEnemyHeroes()) do
        if not k.dead and GetDistance(k,mousePos) < 750 then
          Cast(_R, k, false, true, 2)
        end
      end
    end
  end

  function Ashe:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, data[0].range, player, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
          if self:QReady() then
            Cast(_Q) 
            myHero:Attack(minion)
          end
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, data[1].range, player, MINION_SORT_HEALTH_ASC).objects) do
        local WMinionDmg = GetDmg(_W, myHero, minion)
        if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range+data[1].width) then
          Cast(_W, minion)
        end
      end    
    end  
  end

  function Ashe:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      if self:QReady() then
        Cast(_Q)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for i, minion in pairs(minionManager(MINION_ENEMY, data[1].range, player, MINION_SORT_HEALTH_ASC).objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.health >= minion.health and ValidTarget(minion, data[1].range) then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        Cast(_W, minionTarget)
      end
    end 
  end

  function Ashe:Combo()
    if Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      if self:QReady() then
        Cast(_Q)
      end
    end
    if Config:getParam("Combo", "W") and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
    if Config:getParam("Combo", "R") and GetDistance(Target) < myHero.range*2+myHero.boundingRadius*4 and GetDmg(_R, myHero, Target)+GetDmg("AD", myHero, Target)+GetDmg(_W, myHero, Target) < Target.health then
      Cast(_R, Target, false, true, 1.5)
    end
  end

  function Ashe:Harrass()
    if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      if self:QReady() then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
    if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
  end

  function Ashe:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and self:QReady() and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and GetDistance(enemy) < 2500 then
          Cast(_R, enemy, false, true, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Ashe:QReady()
    for i = 1, myHero.buffCount do
      local buff = myHero:getBuff(i)
      if buff and buff.valid and buff.name ~= nil and buff.name == "asheqcastready" and buff.endT > GetInGameTimer() then 
        return true 
      end
    end
    return false
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Blitzcrank"

  function Blitzcrank:__init()
    require "Collision"
    self.Col = Collision(data[0].range, data[0].speed, data[0].delay, data[0].width+30)
    self.Forcetarget = nil
    self:Menu()
    AddDrawCallback(function() self:Draw() end)
    AddMsgCallback(function(x,y) self:WndMsg(x,y) end)
  end

  function Blitzcrank:Menu()
    for _,s in pairs({"Combo", "Harrass", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Harrass", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","E"}, slider = {50,50}})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Blitzcrank:GetBestTarget(Range)
    local LessToKill = 100
    local LessToKilli = 0
    local target = nil
    for i=1, heroManager.iCount do
      local enemy = heroManager:GetHero(i)
      if ValidTarget(enemy, Range) then
        DamageToHero = GetDmg(_Q, myHero, enemy)
        ToKill = enemy.health / DamageToHero
        if ((ToKill < LessToKill) or (LessToKilli == 0)) then
          LessToKill = ToKill
          LessToKilli = i
          target = enemy
        end
      end
    end
    return target
  end

  function Blitzcrank:Combo()
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius  then
        CastSpell(_E, myHero:Attack(target))
      end
    end

    if target and myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.2 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        local Mcol2 = self.Col:GetMinionCollision(myHero, target)
        if not Mcol and not Mcol2 then
          CastSpell(_Q, CastPosition.x,  CastPosition.z)
        end
      end
    end
  end

  function Blitzcrank:Harrass()
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius  then
        CastSpell(_E, myHero:Attack(target))
      end
    end
    
    if target and myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.5 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        local Mcol2 = self.Col:GetMinionCollision(myHero, target)
        if not Mcol and not Mcol2 then
          CastSpell(_Q, CastPosition.x,  CastPosition.z)
        end
      end
    end
  end

  function Blitzcrank:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and myHero:CanUseSpell(_R) == READY and Config:getParam("Killsteal", "Ignite") and enemy.health < GetDmg(_R, myHero, enemy)+(50 + 20 * myHero.level) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Blitzcrank:Draw()
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end
    
    if self.Forcetarget ~= nil then
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, data[0].width, ARGB(255, 0, 255, 0))
    end
    
    if Config:getParam("Draws", "Q") and myHero:CanUseSpell(_Q) and target ~= nil then
      local CastPosition, HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if CastPosition then
        DrawLFC(CastPosition.x, CastPosition.y, CastPosition.z, data[0].range, ARGB(255, 255, 0, 0))
        DrawLine3D(myHero.x, myHero.y, myHero.z, CastPosition.x, CastPosition.y, CastPosition.z, 1, ARGB(155,55,255,55))
        DrawLine3D(myHero.x, myHero.y, myHero.z, target.x,       target.y,       target.z,       1, ARGB(255,55,55,255))
      end
    end
  end

  function Blitzcrank:WndMsg(Msg, Key)
    if Msg == WM_LBUTTONDOWN then
      local minD = 0
      local starget = nil
      for i, enemy in ipairs(GetEnemyHeroes()) do
        if ValidTarget(enemy) then
          if GetDistance(enemy, mousePos) <= minD or starget == nil then
            minD = GetDistance(enemy, mousePos)
            starget = enemy
          end
        end
      end
      
      if starget and minD < 500 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Brand"

  function Brand:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    self:Menu()
  end

  function Brand:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Brand:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion, true)
        end
      end
    end
  end

  function Brand:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) <= 100*data[0].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil then
        Cast(_Q, minionTarget, false, true, 1.2)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif minionTarget.health < winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil and (stackTable[minionTarget.networkID] and stackTable[minionTarget.networkID] > 0) then
        Cast(_E, winion, true)
      end
    end
  end

  function Brand:Combo()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Combo", "E") then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
        Cast(_E, Target, true)
      end
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config:getParam("Combo", "W") and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Combo", "W") then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
        Cast(_W, Target, false, true, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
        Cast(_Q, Target, false, true, 1.5)
      end
    end
    if Config:getParam("Combo", "R") and (GetDmg(_R, myHero, Target) >= Target.health or (EnemiesAround(Target, 500) > 1 and stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target, true)
    end
  end

  function Brand:Harrass()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Harrass", "E") then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target, true)
      end
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Harrass", "W") then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
        Cast(_W, Target, false, true, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, false, true, 2)
      end
    end
  end

  function Brand:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Cassiopeia"

  function Cassiopeia:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST, 900, DAMAGE_MAGICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:LastHitSomethingPoisonedWithE() end)
  end

  function Cassiopeia:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "LastHit", name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,65,30}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Cassiopeia:LastHitSomethingPoisonedWithE()
    if Config:getParam("LastHit", "E") and not Config:getParam("Combo", "Combo") and not Config:getParam("Harrass", "Harrass") then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and GetStacks(minion) > 0 and ValidTarget(minion, data[2].range) then
          Cast(_E, minion, true)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and GetStacks(minion) > 0 and ValidTarget(minion, data[2].range) then
          Cast(_E, minion, true)
        end      
      end    
    end  
  end

  function Cassiopeia:LastHit()
    if Config:getParam("LastHit", "E") then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, minion, true)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, minion, true)
        end      
      end    
    end  
  end

  function Cassiopeia:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        Cast(_Q, BestPos)
      else
        local minionTarget = nil
        for minion,winion in pairs(Mobs.objects) do
          if minionTarget == nil then 
            minionTarget = winion
          elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
            minionTarget = winion
          end
        end
        for minion,winion in pairs(JMobs.objects) do
          if minionTarget == nil then 
            minionTarget = winion
          elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
            minionTarget = winion
          end
        end
        if minionTarget ~= nil then
          Cast(_Q, minionTarget)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        if winion ~= nil and GetStacks(winion) > 0 then
          Cast(_E, winion, true)
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        if winion ~= nil and GetStacks(winion) > 0 then
          Cast(_E, winion, true)
        end
      end
    end
  end

  function Cassiopeia:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("Combo", "W") and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") and ValidTarget(Target, data[2].range) then
      if GetStacks(Target) > 0 then
        Cast(_E, Target, true)
      end
    end
    if Config:getParam("Combo", "R") and (GetDmg(_R, myHero, Target) + 2*GetDmg(_E, myHero, Target) >= Target.health or (EnemiesAroundAndFacingMe(Target, 500) > 1 and GetStacks(Target) > 0)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target, true)
    end
  end

  function Cassiopeia:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("Harrass", "W") and ValidTarget(Target, data[1].range) and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and ValidTarget(Target, data[2].range) and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      if GetStacks(Target) > 0 then
        Cast(_E, Target, true)
      end
    end
  end

  function Cassiopeia:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif enemy.health < GetDmg(_E, myHero, enemy)*2 and GetStacks(enemy) > 0 and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
          DelayAction(Cast, 0.55, {_E, enemy, true})
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Darius"

  function Darius:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:Harrass2() end)
  end

  function Darius:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W"}, slider = {30,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Toggle", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYTOGGLE, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    Config:addParam({state = "Misc", name = "offset", code = SCRIPT_PARAM_SLICE, text = {"Q","E"}, slider = {100,100}})
  end

  function Darius:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") < myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = self:GetDmg("Q1", myHero, winion)
        local MinionDmg2 = self:GetDmg("Q", myHero, winion)
        if MinionDmg1 and MinionDmg1 >= winion.health+winion.shield and ValidTarget(winion, 450) then
          CastQ(winion)
        elseif MinionDmg2 and MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          Cast(_Q)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") < myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = self:GetDmg("W", myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, myHero.range+myHero.boundingRadius) then
          CastSpell(_W, myHero:Attack(winion))
        end
      end
    end
  end

  function Darius:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(0, data[0].width)
      if BestHit > 1 and GetDistance(BestPos) < 150 then 
        Cast(_Q)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") < myHero.mana/myHero.maxMana*100 then
      local minionTarget = nil
      for i, minion in pairs(minionManager(MINION_ENEMY, 250, myHero, MINION_SORT_HEALTH_ASC).objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.health+minionTarget.shield >= minion.health+minion.shield and ValidTarget(minion, 250) then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        CastSpell(_W, myHero:Attack(minionTarget))
      end
    end
  end

  function Darius:Combo()
    if lastWindup+0.25 > GetInGameTimer() then 
      if myHero:CanUseSpell(_W) == READY then
        CastSpell(_W, myHero:Attack(Target))
      end
    else
      if myHero:CanUseSpell(_Q) == READY and GetDistance(Target) >= 250 then
        self:CastQ(Target)
      elseif myHero:CanUseSpell(_Q) == READY and GetDistance(Target) < 250 then
        Cast(_Q)
      end
      if myHero:CanUseSpell(_E) == READY then
        self:CastE(Target)
      end
      if myHero:CanUseSpell(_R) == READY and not IsInvinc(Target) and GetDmg(_R, myHero, Target) > Target.health+Target.shield and Config:getParam("Combo", "R") then
        Cast(_R, enemy, true)
      end
    end
  end

  function Darius:Harrass()
    if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY then
      self:CastQ(Target)
    end
    if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY then
      self:CastW(Target)
    end
  end

  function Darius:Harrass2()
    if Config:getParam("Harrass", "Toggle") then
      if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY then
        self:CastQ(Target)
      end
      if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY then
        self:CastW(Target)
      end
    end
  end

  function Darius:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      local qDmg = ((GetDmg(_Q, myHero, enemy)*1.5) or 0) 
      local q1Dmg = ((GetDmg(_Q, myHero, enemy)) or 0)  
      local wDmg = ((GetDmg(_W, myHero, enemy)) or 0)   
      local rDmg = ((GetDmg(_R, myHero, enemy)) or 0)
      local iDmg = (50 + 20 * myHero.level) / 5
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if not IsInvinc(enemy) and myHero:GetSpellData(_R).level == 3 and myHero:CanUseSpell(_R) and enemy.health+enemy.shield < rDmg and Config:getParam("Killsteal", "R") and ValidTarget(enemy, 450) then
          Cast(_R, enemy, true)
        elseif myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < qDmg and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, 450) then
          self:CastQ(enemy)
        elseif myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < q1Dmg and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) and enemy.health+enemy.shield < wDmg and Config:getParam("Killsteal", "W") then
          if ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
            CastSpell(_W, myHero:Attack(enemy))
          elseif ValidTarget(enemy, data[2].range*(Config:getParam("Misc", "offset", "E")/100)) then
            self:CastE(enemy)
            DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif not IsInvinc(enemy) and myHero:CanUseSpell(_R) and enemy.health+enemy.shield < rDmg and Config:getParam("Killsteal", "R") and ValidTarget(enemy, 450) then
      if ScriptologyDebug then print(rDmg)  end
          Cast(_R, enemy, true)
        elseif enemy.health+enemy.shield < iDmg and Config:getParam("Killsteal", "I") and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Darius:CastQ(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[0].width*(Config:getParam("Misc", "offset", "Q")/100)-dist and GetDistance(target) >= 250 then
      Cast(_Q)
    end
  end

  function Darius:CastE(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[2].range*(Config:getParam("Misc", "offset", "E")/100)-dist then
      Cast(_E, target)
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Ekko"

  function Ekko:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    self:Menu()
  end

  function Ekko:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Combo", name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Ekko:GetTwin()
    local twin = nil
    for _,k in pairs(objHolder) do
      if k and k.name == "Ekko" and k.valid then
        twin = k
      end
    end
    return twin
  end

  function Ekko:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, winion)
        if QMinionDmg and QMinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range+myHero.range+myHero.boundingRadius) and GetDistance(winion) < data[2].range+myHero.range+myHero.boundingRadius then
          Cast(_E, winion)
        end
      end
    end
  end

  function Ekko:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then
      pos, hit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if hit > 1 then
        Cast(_Q, pos)
      end
    end
  end

  function Ekko:Combo()
    if Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.2)
    end
    if Config:getParam("Combo", "W") and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 2.4)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config:getParam("Combo", "E") and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    else
      if Config:getParam("Combo", "E") and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    end
  end

  function Ekko:Harrass()
    if Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
  end

  function Ekko:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 1.5, self:GetTwin())
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Kalista"

  function Kalista:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:Tick() end)
  end

  function Kalista:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q"}, slider = {50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    Config:addParam({state = "Misc", name = "WallJump", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  end

  function Kalista:Tick()
    if Config:getParam("Misc", "WallJump") then
      CastSpell(_Q, mousePos.x, mousePos.z)
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
    if myHero:CanUseSpell(_E) and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E")) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E")) or Config:getParam("Misc", "Ej")) then
      local killableCounter = 0
      local killableCounterJ = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)  
        if winion ~= nil and EMinionDmg > winion.health and GetDistance(winion) < data[2].range then    
          killableCounter = killableCounter + 1
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)  
        if winion ~= nil and EMinionDmg > winion.health and GetDistance(winion) < data[2].range then
          if (string.find(winion.charName, "Baron") or string.find(winion.charName, "Dragon") or string.find(winion.charName, "Gromp") or ((string.find(winion.charName, "Krug") or string.find(winion.charName, "Murkwolf") or string.find(winion.charName, "Razorbeak") or string.find(winion.charName, "Red") or string.find(winion.charName, "Blue")))) then
            if not string.find(winion.charName, "Mini") then       
              killableCounterJ = killableCounterJ + 1
            end
          end
        end
      end
      if (Config:getParam("LaneClear", "LaneClear") and killableCounter >= 2) or (Config:getParam("LastHit", "LastHit") and killableCounter >= 2) or (Config:getParam("Misc", "Ej") and killableCounterJ >= 1) then
        Cast(_E)
      end
    end
  end

  function kalE(x)
    if x <= 1 then 
      return 10
    else 
      return kalE(x-1) + 2 + x
    end 
  end

  function Kalista:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
  end

  function Kalista:LaneClear()
    -- soon
  end

  function Kalista:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") and ValidTarget(Target, data[2].range) then
      if GetDmg(_E, myHero, Target) >= Target.health then
        Cast(_E)
      end
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and EMinionDmg and EMinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          killableCounter = killableCounter +1
        end   
      end   
      if killableCounter > 0 then
        Cast(_E)
      end
    end
  end

  function Kalista:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.2)
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and ValidTarget(Target, data[2].range) then
      local harrassUnit = nil
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and EMinionDmg and EMinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          killableCounter = killableCounter +1
        end   
      end 
      for i, unit in pairs(GetEnemyHeroes()) do    
        local EChampDmg = GetDmg(_E, myHero, unit)      
        if unit ~= nil and EChampDmg and EChampDmg > 0 and ValidTarget(unit, data[2].range) and GetDistance(unit) < data[2].range then
          harrassUnit = unit
        end      
      end    
      if killableCounter >= 1 and harrassUnit ~= nil then
        Cast(_E)
      end
    end
  end

  function Kalista:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "LeBlanc"

  function LeBlanc:__init()
    if not Auth() then return end
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    self:Menu()
  end

  function LeBlanc:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function LeBlanc:LastHit()
  end

  function LeBlanc:LaneClear()
  end

  function LeBlanc:Combo()
  end

  function LeBlanc:Harrass()
  end

  function LeBlanc:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "LeeSin"

  function LeeSin:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    self:Menu()
    self.Forcetarget = nil
    self.insecTarget = nil
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and string.find(string.lower(object.name), "ward") then
        table.insert(self.Wards, object)
      end
    end
    AddTickCallback(function() self:InsecTicker() end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
    AddMsgCallback(function(x,y) self:Msg(x,y) end)
  end

  function LeeSin:Menu()
    for _,s in pairs({"Combo", "Harrass", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    for _,s in pairs({"LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    --for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
    --  Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
    --end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Misc", name = "Insec", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Misc", name = "Jump", key = string.byte("G"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function LeeSin:InsecTicker()
    if Config:getParam("Misc", "Insec") then
      self:Insec()
    end
    if Config:getParam("Misc", "Jump") then
      self:WardJump()
    end
  end

  function LeeSin:Insec()
    if myHero:GetSpellData(_R).currentCd ~= 0 then return end
    self.insecTarget = self.Forcetarget or Target
    if self.insecTarget == nil then if GetDistance(mousePos,myHero.pos) > myHero.boundingRadius then myHero:MoveTo(mousePos.x, mousePos.z) end return end
    local insecTowards = nil
    if #GetAllyHeroes() > 0 then
      for _,unit in pairs(GetAllyHeroes()) do
        if GetDistance(unit,insecTarget) < 2000 then
          insecTowards = unit
        end
      end
    end
    if insecTowards == nil or _G.LeftMousDown then
      insecTowards = mousePos
    else
      return
    end
    CastPosition = insecTowards
    if GetDistance(insecTowards, mousePos) > 50 then
      CastPosition, HitChance, Position = UPL:Predict(_R, myHero, insecTowards)
    end
    CastPosition1 = Vector(self.insecTarget)-300*(Vector(CastPosition)-Vector(self.insecTarget)):normalized()
    myHero:MoveTo(CastPosition1.x, CastPosition1.z)
    local x, y, z = VectorPointProjectionOnLineSegment(myHero, CastPosition, self.insecTarget)
    if GetDistance(myHero, CastPosition1) < 25 and z then
      if myHero:CanUseSpell(_Q) then 
        Cast(_Q, self.insecTarget)
        DelayAction(function() Cast(_R, self.insecTarget, true) DelayAction(function() Cast(_Q) end, 0.33) end, data[0].delay+GetDistance(self.insecTarget, myHero.pos)/data[0].speed)
      else
        Cast(_R, self.insecTarget, true)
      end
    end
    if GetDistance(CastPosition1) > 300 and GetDistance(CastPosition1) < 600 then
      if self:Jump(CastPosition1, 50, true) then return end
      slot = self:GetWardSlot()
      if not slot then return end
      CastSpell(slot, CastPosition1.x, CastPosition1.z)
    end
  end

  function LeeSin:Msg(Msg, Key)
    if Msg == WM_LBUTTONDOWN then 
      _G.LeftMousDown = true
    elseif Msg == WM_LBUTTONUP then
      _G.LeftMousDown = false
    end
    if Msg == WM_LBUTTONDOWN then
      local minD = 0
      local starget = nil
      for i, enemy in ipairs(GetEnemyHeroes()) do
        if ValidTarget(enemy) then
          if GetDistance(enemy, mousePos) <= minD or starget == nil then
            minD = GetDistance(enemy, mousePos)
            starget = enemy
          end
        end
      end
      if starget and minD < 500 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Insec-target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New insec-target selected: "..starget.charName.."")
        end
      end
    end
  end

  function LeeSin:ProcessSpell(unit, spell)  
    if unit == myHero then
      if string.find(string.lower(spell.name), "attack") then
        self.lastWindup = GetInGameTimer()+spell.windUpTime
      end
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

  function LeeSin:QDmg(unit)
    return GetDmg(_Q, myHero, unit)+GetDmg(_Q, myHero, unit)+myHero:CalcDamage(unit,(unit.maxHealth-unit.health)*0.08)
  end

  function LeeSin:LastHit()
    if ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q")) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q"))) and myHero:CanUseSpell(_Q) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = GetDmg(_Q, myHero, winion)
        local MinionDmg2 = self:QDmg(winion)
        if MinionDmg1 and MinionDmg1 >= winion.health+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, false, true, 1.5)
        elseif MinionDmg2 and MinionDmg1 and MinionDmg1+MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, false, true, 1.5)
          DelayAction(Cast, 0.33, {_Q})
        elseif MinionDmg2 and MinionDmg2 >= winion.health+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          DelayAction(Cast, 0.33, {_Q})
        end
      end
    end
    if ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E")) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E"))) and myHero:CanUseSpell(_W) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, 300) then
          Cast(_E)
        end
      end
    end
  end

  function LeeSin:LaneClear()
    if Config:getParam("LaneClear", "Q") and myHero:CanUseSpell(_Q) == READY then
      local minionTarget = nil
      for i, minion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.health+minionTarget.shield >= minion.health+minion.shield and ValidTarget(minion, 1100) then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        Cast(_Q, minionTarget, false, true, 1.5)
      end
      for i, minion in pairs(JMobs.objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.maxHealth < minion.maxHealth and GetDistance(minion) < 1100 then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        Cast(_Q, minionTarget, false, true, 1.5)
      end
    end
    if Config:getParam("LaneClear", "E") and myHero:CanUseSpell(_E) == READY then
      BestPos, BestHit = GetFarmPosition(data[2].range, data[2].width)
      if BestHit > 1 and GetDistance(BestPos) < 150 then 
        Cast(_E)
      end
      for i, minion in pairs(JMobs.objects) do
        if minionTarget == nil then 
          minionTarget = minion
        elseif minionTarget.maxHealth < minion.maxHealth and GetDistance(minion) < 350 then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        Cast(_E, minionTarget, false, true, 1.2)
      end
    end
  end

  function LeeSin:Combo()
    if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, 400) and self:IsFirstCast(_E) then
      Cast(_E, Target, false, true, 1.2)
    end
    if Target.health < GetDmg(_Q, myHero, Target)+GetDmg(_R, myHero, Target)+(Target.maxHealth-(Target.health-GetDmg(_R, myHero, Target)*0.08)) then
      if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
        Cast(_Q, Target, false, true, 1.5)
      elseif myHero:CanUseSpell(_Q) == READY and GetStacks(Target) > 0 then
        Cast(_R, Target)
        DelayAction(Cast, 0.33, {_Q})
      end
    elseif myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
      Cast(_Q, Target, false, true, 1.5)
    elseif Target ~= nil and GetStacks(Target) > 0 and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
      Cast(_Q)
    end
  end

  function LeeSin:IsFirstCast(x)
    if string.find(myHero:GetSpellData(x).name, 'One') then
        return true
    else
        return false
    end
  end

  function LeeSin:Harrass()
    if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if not self.oldPos and GetStacks(Target) and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
      self.oldPos = myHero
      Cast(_Q)
    end
    if self.oldPos and GetDistance(Target) < 250 and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
      for _,winion in pairs(minionManager(MINION_ALLY, 450, self.oldPos, MINION_SORT_HEALTH_ASC).objects) do
        if GetDistance(self.oldPos) < GetDistance(winion) and GetDistance(winion) < 600 then
          self.oldPos = winion
        end
      end
      DelayAction(function() self:Jump(self.oldPos, 400, false) self.oldPos = nil end, 0.33)
    end
    if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].width) then
      Cast(_E, Target, false, true, 1.2)
    end
  end

  function LeeSin:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+self:QDmg(enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
          DelayAction(function() if not self:IsFirstCast(_Q) then Cast(_Q) end end, data[0].delay+GetDistance(enemy, myHero.pos)/data[0].speed)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].width) then
          Cast(_E, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Lux"

  function Lux:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:DetonateE() end)
    AddProcessSpellCallback(function(x,y) self:ShieldManager(x,y) end)
  end

  function Lux:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","E"}, slider = {50,50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Lux:DetonateE()
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" and Config:getParam("Misc", "Ea") then
      Cast(_E)
    end
  end

  function Lux:ShieldManager(unit, spell)
    if not unit.isMe and unit.team ~= myHero.team and not IsRecalling(myHero) and Config:getParam("Misc", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      if spell.target and spell.target.isMe then
        if Config:getParam("Misc", "Wa") and myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      elseif GetDistance(spell.endPos) < GetDistance(myHero.pos, myHero.minBBox) then
        if Config:getParam("Misc", "Wa") and myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      end
    end
  end

  function Lux:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
          Cast(_Q, winion, false, true, 2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, winion, true)
        end
      end
    end 
  end

  function Lux:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetLowestMinion(data[_Q].range)
      if minionTarget ~= nil then
        Cast(_Q, minionTarget)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_E].range, data[_E].width)
      if BestHit > 1 then 
        Cast(_E, BestPos)
      end
    end  
  end

  function Lux:Combo()
    if GetStacks(Target) > 0 and Config:getParam("Combo", "R") and myHero:CanUseSpell(_R) == READY and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= Target.health then
      Cast(_R, Target, false, true, 2)
    end
    if timeToShoot() then
      if Config:getParam("Combo", "Q") and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY then
        Cast(_Q, Target, false, true, 2)
      end
      if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target, false, true, 1.5)
      end
      if Config:getParam("Combo", "R") and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) >= Target.health then
        Cast(_R, Target, false, true, 2)
      end
    end
  end

  function Lux:Harrass()
    if GetStacks(Target) == 0 then
      if Config:getParam("Combo", "Q") and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, false, true, 2)
      end
      if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target, false, true, 1.5)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_E, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_Q, enemy, false, true, 1.2) DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Malzahar"

  function Malzahar:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:OrbWalk() end)
  end

  function Malzahar:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    Config:addParam({state = "Harrass", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {30,30,30}})
    for _,s in pairs({"LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {65,50,30}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  end

  function Malzahar:OrbWalk()
    if (Config:getParam("Harrass", "Harrass") or Config:getParam("Combo", "Combo") or Config:getParam("LastHit", "LastHit") or Config:getParam("LaneClear", "LaneClear")) and heroCanMove() and GetDistance(mousePos, myHero.pos) > myHero.boundingRadius then
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
  end

  function Malzahar:LastHit()
    if timeToShoot() then
      if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
        for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
          local QMinionDmg = GetDmg(_Q, myHero, minion)
          if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
            Cast(_Q, minion, false, true, 1.2)
          end
        end
      end
      if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then    
        for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
          local WMinionDmg = GetDmg(_W, myHero, minion)      
          if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range) then
            Cast(_W, minion, false, true, 1.5)
          end      
        end    
      end  
      if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
        for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
          local EMinionDmg = GetDmg(_E, myHero, minion)
          if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
            Cast(_E, minion, true)
          end
        end
      end 
    end
    if timeToShoot() then
      minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius)
      if minionTarget ~= nil and minionTarget.health < GetDmg("AD", myHero, minionTarget) and GetDistance(minionTarget)<myHero.range+myHero.boundingRadius*2 then
        myHero:Attack(minionTarget)
      end
    end
  end

  function Malzahar:LaneClear()
    if timeToShoot() then
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[0].range)
        if minionTarget ~= nil then
          Cast(_Q, minionTarget, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
        BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
        if BestHit > 1 then 
          Cast(_W, BestPos)
        end
      end  
      if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, true)
        end
      end 
    end 
    if timeToShoot() then
      minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius)
      if minionTarget ~= nil and GetDistance(minionTarget)<myHero.range+myHero.boundingRadius*2 then
        myHero:Attack(minionTarget)
      end
    end
  end

  function Malzahar:Combo()
    if timeToShoot() then
      if Config:getParam("Combo", "Q") and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, false, true, 1.5)
      end
      if Config:getParam("Combo", "W") and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, false, true, 1.5)
      end
      if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target, true)
      end
      if Config:getParam("Combo", "R") and myHero:CanUseSpell(_R) == READY then
        Cast(_R, Target, true)
      end
    end
    if timeToShoot() and GetDistance(Target) < myHero.range+myHero.boundingRadius*2 then
      myHero:Attack(Target)
    end
  end

  function Malzahar:Harrass()
    if timeToShoot() then
      if Config:getParam("Combo", "Q") and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, false, true, 1.5)
      end
      if Config:getParam("Combo", "W") and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, false, true, 1.5)
      end
      if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY then
        Cast(_W, Target, true)
      end
    end
    if timeToShoot() and GetDistance(Target) < myHero.range+myHero.boundingRadius*2 then
      myHero:Attack(Target)
    end
  end

  function Malzahar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)*2.5 and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Nidalee"

  function Nidalee:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    self:Menu()
    self.data = {
      Human  = {
          [_Q] = { speed = 1337, delay = 0.125, range = 1500, width = 25, collision = true, aoe = false, type = "linear"},
          [_W] = { range = 900},
          [_E] = { range = 600}
        },
      Cougar = {
          [_W] = { range = 350, width = 175},
          [_E] = { range = 350}}
    }
    self.ludenStacks = 0
    self.spearCooldownUntil = 0
    AddDrawCallback(function() self:Draw() end)
    AddTickCallback(function() self:Heal() end)
    AddTickCallback(function() self:DmgCalc() end)
    AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    AddTickCallback(function() self:Flee() end)
  end

  function Nidalee:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "Harrass", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q"}, slider = {50}})
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Combo", name = "Flee", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Nidalee:UpdateBuff(unit, buff, stacks)
    if unit and unit.isMe and buff and buff.name and buff.name == "itemmagicshankcharge" then self.ludenStacks = stacks end
  end

  function Nidalee:RemoveBuff(unit, buff)
    if unit and unit.isMe and buff and buff.name and buff.name == "itemmagicshankcharge" then self.ludenStacks = 0 end
  end

  function Nidalee:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name and spell.name == "JavelinToss" then self.spearCooldownUntil = GetInGameTimer()+6*(1+unit.cdr) end
  end

  function Nidalee:Heal()
    if not IsRecalling(myHero) and self:IsHuman() and Config:getParam("Misc", "Ea") and Config:getParam("Misc", "mana", "E") <= myHero.mana/myHero.maxMana*100 and myHero.maxHealth-myHero.health > 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap then
      Cast(_E, myHero, true)
    end
    if self:IsHuman() and Config:getParam("Misc", "Ea") and Config:getParam("Misc", "mana", "E") <= myHero.mana/myHero.maxMana*100 then
      for _,k in pairs(GetAllyHeroes()) do
        if GetDistance(k) < self.data.Human[2].range and k.maxHealth-k.health < 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and (k.maxHealth-k.health)/k.maxHealth <= 0.35 then
          Cast(_E, k, true)
        end
      end
    end
  end

  function Nidalee:Flee()
    if Config:getParam("Combo", "Flee") then
      if self:IsHuman() then
        Cast(_R)
      else
        Cast(_W, mousePos)
        myHero:MoveTo(mousePos.x, mousePos.z)
      end
    end
  end

  function Nidalee:IsHuman()
    return myHero:GetSpellData(_Q).name == "JavelinToss"
  end

  function Nidalee:GetAARange()
    return myHero.range+myHero.boundingRadius*2
  end

  function Nidalee:getMousePos()
    local MyPos = Vector(myHero.x, myHero.y, myHero.z)
    local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
    return MyPos - (MyPos - MousePos):normalized() * self.data.Cougar[1].range
  end

  function Nidalee:Draw()
    if self:IsHuman() then
      if Config:getParam("Draws", "Q") and myHero:CanUseSpell(_Q) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[0].range, ARGB(255, 155, 155, 155))
      end
      if Config:getParam("Draws", "W") and myHero:CanUseSpell(_W) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[1].range, ARGB(255, 155, 155, 155))
      end
      if Config:getParam("Draws", "E") and myHero:CanUseSpell(_E) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[2].range, ARGB(255, 155, 155, 155))
      end
    else
      if Config:getParam("Draws", "Q") and myHero:CanUseSpell(_Q) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self:GetAARange(), ARGB(255, 155, 155, 155))
      end
      if Config:getParam("Draws", "W") and myHero:CanUseSpell(_W) == READY then
        local drawPos = self:getMousePos()
        local barPos = WorldToScreen(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width/3, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawText("W Jump", 15, barPos.x, barPos.y, ARGB(255, 155, 155, 155))
      end
      if Config:getParam("Draws", "E") and myHero:CanUseSpell(_E) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Cougar[2].range, ARGB(255, 155, 155, 155))
      end
    end
    if Config:getParam("Draws", "DMG") then
      for i,k in pairs(GetEnemyHeroes()) do
        local enemy = k
        if ValidTarget(enemy) then
          local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
          local posX = barPos.x - 35
          local posY = barPos.y - 50
          DrawText(killTextTable[enemy.networkID].indicatorText, 18, posX, posY, ARGB(255, 150, 255, 150))
          DrawText(killTextTable[enemy.networkID].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 50, 50))
        end
      end
    end
  end

  function Nidalee:DmgCalc()
    if not Config:getParam("Draws", "DMG") then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageAA = self:GetDmg("AD", enemy)
        local damageQ  = self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)
        local damageC  = self:GetRWEQComboDmg(enemy)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        if myHero:CanUseSpell(_Q) == READY and damageQ > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
        end
        if myHero:CanUseSpell(_R) == READY and damageC > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."RWEQ"
        end
        if enemy.health < damageQ+damageC then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Killable"
        else
          local neededAA = math.floor(100 * (damageQ+damageC+damageI) / (enemy.health))
          killTextTable[enemy.networkID].indicatorText = neededAA.."% Combo dmg"
        end
        local enemyDamageAA = GetDmg("AD", enemy, myHero)
        local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
        if enemyNeededAA ~= 0 then         
          killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
      end
    end
  end

  function Nidalee:Combo()
    if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    self:DoRWEQCombo(Target)
    if not self:IsHuman() and GetDistance(Target) > 425 then
      Cast(_R)
    end
    if not self:IsHuman() and self.spearCooldownUntil < GetInGameTimer() then
      Cast(_R)
    end
  end

  function Nidalee:DoRWEQCombo(unit)
    if myHero:CanUseSpell(_R) == READY and GetStacks(unit) > 0 and self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config:getParam("Combo", "R") then
      Cast(_R)
    end
    if myHero:CanUseSpell(_W) == READY and GetStacks(unit) > 0 and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range > 0 and Config:getParam("Combo", "W") then
      Cast(_W, unit)
    end
    if not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range <= 0 then
      if self:GetDmg(_Q,unit) >= unit.health and myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and not Config:getParam("Combo", "E") then
          CastSpell(_Q, myHero:Attack(unit))
      elseif self:GetRWEQComboDmg(unit,-self:GetDmg(_W,unit)) >= unit.health then
        if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") then
          Cast(_E, unit)
        end
        if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY and Config:getParam("Combo", "Q") and Config:getParam("Combo", "E") then
          CastSpell(_Q, myHero:Attack(unit))
        end
        if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and not Config:getParam("Combo", "E") then
          CastSpell(_Q, myHero:Attack(unit))
        end
      else
        if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") then
          Cast(_E, unit)
        end
        if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") then
          CastSpell(_Q, myHero:Attack(unit))
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config:getParam("Combo", "W") then
        if GetDistance(unit) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(unit) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
          Cast(_W, unit)
        end
      end
    end
  end

  function Nidalee:GetRWEQComboDmg(target,damage)
    local unit = {pos = target.pos, armor = target.armor, magicArmor = target.magicArmor, maxHealth = target.maxHealth, health = target.health}
    local dmg = damage or 0
    if myHero:CanUseSpell(_W) == READY then
      dmg = dmg + self:GetDmg(_W,unit)
    end
    if myHero:CanUseSpell(_E) == READY then
      dmg = dmg + self:GetDmg(_E,unit)
    end
    if myHero:CanUseSpell(_Q) == READY then
      unit.health = unit.health-dmg
      dmg = dmg + self:GetDmg(_Q,unit)+self:GetDmg("Lichbane", unit)
    end
    return dmg
  end

  function Nidalee:Harrass()
    if self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, self.data.Human[0].range) then
        Cast(_Q, Target, false, true, 2)
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, self.data.Human[0].range) then
        CastSpell(_Q, myHero:Attack(unit))
      end
      if myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and ValidTarget(Target, self.data.Human[2].range) then
        Cast(_E, unit)
      end
    end
  end

  function Nidalee:LastHit()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("LastHit", "Q") and ValidTarget(Target, data[0].range) then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
          Cast(_Q, myHero:Attack(minionTarget))
        end
      end
    end
  end

  function Nidalee:LaneClear()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
          Cast(_Q, myHero:Attack(minionTarget))
        end
        minionTarget = GetJMinion(self:GetAARange())
        if minionTarget then
          Cast(_Q, myHero:Attack(minionTarget))
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") then
        local pos, hit = GetFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          Cast(_W, pos)
        end
        local pos, hit = GetJFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          Cast(_W, pos)
        end
      end
      if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") then
        local pos, hit = GetFarmPosition(self.data.Cougar[2].range, self.data.Cougar[2].range/2)
        if pos and hit > 0 then
          Cast(_E, pos)
        end
        local pos, hit = GetJFarmPosition(self.data.Cougar[2].range, self.data.Cougar[2].range/2)
        if pos and hit > 0 then
          Cast(_E, pos)
        end
      end
    end
  end

  function Nidalee:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
        if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and enemy.health < self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, self.data.Human[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
        if myHero:CanUseSpell(_Q) == READY and not self:IsHuman() and enemy.health < self:GetDmg(_Q, enemy, true) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, self.data.Human[0].range) then
          local pos, chance, ppos = UPL:Predict(_Q, myHero, enemy)
          if chance >= 2 then
            Cast(_R)
            DelayAction(function() Cast(_Q, enemy, false, true, 1.5) end, 0.125)
          end
        end
        if not self:IsHuman() and EnemiesAround(enemy, 500) < 3 then
          if myHero:CanUseSpell(_Q) == READY and enemy.health < self:GetDmg(_Q, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, self:GetAARange()) then
            Cast(_Q, myHero:Attack(enemy))
          end
          if myHero:CanUseSpell(_W) == READY and enemy.health < self:GetDmg(_W, enemy) and Config:getParam("Killsteal", "W") then
            if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
              Cast(_W, enemy)
            end
          end
          if myHero:CanUseSpell(_E) == READY and enemy.health < self:GetDmg(_E, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, self.data.Cougar[2].range) then
            Cast(_E, enemy)
          end
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and self:IsHuman() and enemy.health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_Q, enemy, false, true, 1.2)
          DelayAction(function() self:DoRWEQCombo(enemy) end, 0.05+self.data.Human[0].delay+GetDistance(enemy)/self.data.Human[0].speed)
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and not self:IsHuman() and enemy.health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "R") and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_R)
        end
        if GetStacks(enemy) > 0 and EnemiesAround(enemy, 500) < 3 and GetDistance(enemy)-self.data.Cougar[1].range*2 < 0 then
          if enemy.health < self:GetRWEQComboDmg(enemy,0) then
            self:DoRWEQCombo(enemy)
          end
        end
      end
    end
  end

  function Nidalee:GetDmg(spell, target, human)
    if target == nil then
      return
    end
    local source           = myHero
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

    local QLevel, WLevel, ELevel, RLevel = source:GetSpellData(_Q).level, source:GetSpellData(_W).level, source:GetSpellData(_E).level, source:GetSpellData(_R).level
    if source ~= myHero then
      return TotalDmg*(1-ArmorPercent)
    end
    if spell == "IGNITE" then
      return 50+20*Level/2
    elseif spell == "AD" then
      ADDmg = TotalDmg
    elseif spell == "Ludens" then
      APDmg = self.ludenStacks >= 90 and 100+0.1*AP or 0
    elseif spell == "Lichbane" then
      APDmg = (GetLichSlot() and source.damage*0.75+0.5*AP or 0)
    elseif human then
      if spell == _Q then
        APDmg = (25+25*QLevel+0.4*AP)*math.max(1,math.min(3,GetDistance(target.pos)/1250*3))--kanker
      elseif spell == _W then
      elseif spell == _E then
      end
    elseif not human then
      if spell == _Q then
        APDmg = ((({[1]=4,[2]=20,[3]=50,[4]=90})[RLevel])+0.36*AP+0.75*TotalDmg)*(1+GetStacks(target)*0.33)*2.5*(target.maxHealth-target.health)/target.maxHealth--kanker
      elseif spell == _W then
        APDmg = 50*RLevel+0.45*AP
      elseif spell == _E then
        APDmg = 10+60*RLevel+0.45*AP
      end
    end
    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))
    return math.floor(dmg)
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Orianna"

function Orianna:__init()
  self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
  self:Menu()
  self.Ball = nil
  AddTickCallback(function() self:TrackBall() end)
  AddTickCallback(function() self:UltLogic() end)
end

function Orianna:TrackBall()
  if objHolder["TheDoomBall"] and (GetDistance(objHolder["TheDoomBall"], myHero.pos) <= myHero.boundingRadius*2+7 or GetDistance(objHolder["TheDoomBall"]) > 1250) then
    objHolder["TheDoomBall"] = nil
  end
end

function Orianna:UltLogic()
  if Config:getParam("Misc", "Ra") then
    local enemies = 0
    if objHolder["TheDoomBall"] then
      enemies = EnemiesAround(objHolder["TheDoomBall"], data[3].width-myHero.boundingRadius)
    else
      enemies = EnemiesAround(myHero, data[3].width-myHero.boundingRadius)
    end
    if enemies >= 3 then
      CastSpell(_R)
    end
  end
end

function Orianna:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  for _,s in pairs({"Combo", "Harrass", "Killsteal"}) do
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  for _,s in pairs({"LaneClear", "LastHit"}) do
    Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W"}, slider = {30,50}})
  end
  Config:addParam({state = "Harrass", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {30,50,50}})
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Orianna:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q, winion, false, true, 1.2)
      end
    end
  end
  if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmgQ = GetDmg(_Q, myHero, winion)
      local MinionDmgW = GetDmg(_W, myHero, winion)
      if MinionDmgQ and MinionDmgW >= winion.health and (objHolder["TheDoomBall"] and GetDistance(winion, objHolder["TheDoomBall"]) < data[1].width or GetDistance(winion) < data[1].width) then
        Cast(_W)
      end
      if myHero:CanUseSpell(_Q) == READY and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= winion.health and (objHolder["TheDoomBall"] and GetDistance(winion, objHolder["TheDoomBall"]) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_Q, winion, false, true, 1.2)
          DelayAction(Cast, 0.25, {_W})
      end
    end
  end
end

function Orianna:LaneClear()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then
    BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
    if BestHit > 1 then 
      CastSpell(_Q, BestPos.x, BestPos.z)
    end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
    BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_W].width)
    if BestHit > 1 and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"], BestPos) < 50 then 
      Cast(_W)
    end
  end
end

function Orianna:Combo()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") then
    if objHolder["TheDoomBall"] then Cast(_Q, Target, false, true, 1.5, objHolder["TheDoomBall"]) else Cast(_Q, Target, false, true, 1.5, myHero) end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("Combo", "W") then
    self:CastW(Target)
  end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
    Cast(_E, myHero, true)
  end
  if myHero:CanUseSpell(_R) == READY and Target.health < self:CalcRComboDmg(Target) and Config:getParam("Combo", "R") then
    self:CastR(Target)
  end
end

function Orianna:CalcRComboDmg(unit)
  dmg = 0
  if myHero:GetSpellData(_Q).currentCd < 1.5 then
    dmg = dmg + GetDmg(_Q, myHero, unit)
  end
  return (GetDmg(_R, myHero, unit)+GetDmg("AD", myHero, unit))+dmg
end

function Orianna:Harrass()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
    if objHolder["TheDoomBall"] then Cast(_Q, Target, false, true, 1.5, objHolder["TheDoomBall"]) else Cast(_Q, Target, false, true, 1.5, myHero) end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
    self:CastW(Target)
  end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
    Cast(_E, myHero, true)
  end
end

function Orianna:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      local Ball = objHolder["TheDoomBall"] or myHero
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        Cast(_Q, Target, false, true, 1.5, Ball)
      elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") then
        self:CastW(enemy)
      elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, enemy) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius > GetDistance(enemy) then
        Cast(_E, myHero)
      elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") then
        self:CastR(enemy)
      elseif myHero:CanUseSpell(_R) == READY and enemy.health < self:CalcRComboDmg(enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "Q") and Config:getParam("Killsteal", "W") then
        self:CastR(enemy)
        DelayAction(Cast, data[3].delay, {_Q, Target, false, true, 1.5, Ball})
        DelayAction(function() self:CastW(enemy) end, data[3].delay+data[0].delay+GetDistance(Ball,enemy)/data[0].speed)
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

function Orianna:CastW(unit)
  if myHero:CanUseSpell(_W) ~= READY or unit == nil or myHero.dead then return end
  local Ball = objHolder["TheDoomBall"] or myHero
  if GetDistance(unit, Ball) < data[1].width-unit.boundingRadius then 
    Cast(_W)
  end  
end

function Orianna:CastR(unit)
  if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
  local Ball = objHolder["TheDoomBall"] or myHero
  if GetDistance(unit, Ball) < data[3].width-unit.boundingRadius then  
    Cast(_R) 
  end  
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Rengar"

function Rengar:__init()
  self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
  self:Menu()
  self.oneShotTimer = 0
  self.ultOn = false
  self.osTarget = nil
  self.isLeap = false
  self.alertTicker = 0
  self.keyStr = {[0] = "Q", [1] = "W", [2] = "E"}
  AddTickCallback(function() self:Tick() end)
  AddCreateObjCallback(function(x) self:CreateObj(x) end)
  AddDeleteObjCallback(function(x) self:DeleteObj(x) end)
  AddMsgCallback(function(x,y) self:Msg(x,y) end)
end

function Rengar:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Misc", name = "Oneshot", key = string.byte("T"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Misc", name = "Oneshot2", code = SCRIPT_PARAM_LIST, value = 1, list = {"Q", "W", "E"}})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Rengar:Tick()
  if Config:getParam("Misc", "Oneshot") then
    local os = Config:getParam("Misc", "Oneshot2")
    Config:incParamBy1("Misc", "Oneshot2")
    if os ~= Config:getParam("Misc", "Oneshot2") then
      PrintAlertRed("Switched Oneshotmode! Now: "..self.keyStr[Config:getParam("Misc", "Oneshot2")-1])
    end
  end
  if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, 1500) then
    Target = self.Forcetarget  
  end
  if self.osTarget ~= nil and (not ValidTarget(self.osTarget, 1500) or self.osTarget.dead) then
    self.osTarget = nil
  end
  if self.isLeap and self.oneShotTimer+1.5 < GetInGameTimer() then
    self.isLeap = false
  end
end

function Rengar:Msg(Msg, Key)
  if Msg == WM_LBUTTONDOWN then
    local minD = 0
    local starget = nil
    for i, enemy in ipairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) then
        if GetDistance(enemy, mousePos) <= minD or starget == nil then
          minD = GetDistance(enemy, mousePos)
          starget = enemy
        end
      end
    end
    
    if starget and minD < 500 then
      if self.Forcetarget and starget.charName == self.Forcetarget.charName then
        self.Forcetarget = nil
      else
        self.Forcetarget = starget
        ScriptologyMsg("New target selected: "..starget.charName.."")
      end
    end
  end
end

function Rengar:CreateObj(object)
  if object ~= nil then
    if string.find(object.name, "Rengar_Base_R_Buf") and GetDistance(myHero, object) < 80 then
      self.ultOn = true
    elseif string.find(object.name, "Rengar_LeapSound") and GetDistance(myHero, object) < 80 then
      self.isLeap = true
    end
  end 
end
 
function Rengar:DeleteObj(object)
  if object ~= nil and string.find(object.name, "Rengar_Base_R_Buf") then
    self.ultOn = false
    self.oneShotTimer = GetInGameTimer()
  end
end

function Rengar:LastHit()
  if myHero.mana == 5 and Config:getParam("LaneClear", "W") and (myHero.health / myHero.maxHealth) * 100 < 90 then
    Cast(_W)
  else
    if Config:getParam("LaneClear", "Q") then
      local minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius*2)
      if minionTarget ~= nil and minionTarget.health < GetDmg(_Q, myHero, minionTarget) then
        CastSpell(_Q, myHero:Attack(minionTarget))
      end
    end
    if Config:getParam("LaneClear", "W") then
      local minionTarget = GetLowestMinion(data[1].range)
      if minionTarget ~= nil and minionTarget.health < GetDmg(_W, myHero, minionTarget) then
        Cast(_W)
      end
    end
    if Config:getParam("LaneClear", "E") then
      local minionTarget = GetLowestMinion(data[2].range)
      if minionTarget ~= nil and minionTarget.health < GetDmg(_E, myHero, minionTarget) then
        Cast(_E, minionTarget, false, true, 1)
      end
    end
  end
end

function Rengar:LaneClear()
  if myHero.mana == 5 and Config:getParam("LaneClear", "W") and (myHero.health / myHero.maxHealth) * 100 < 90 then
    Cast(_W)
  else
    if Config:getParam("LaneClear", "Q") then
      local minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius*2)
      if minionTarget ~= nil then
        CastSpell(_Q, myHero:Attack(minionTarget))
      end
    end
    if Config:getParam("LaneClear", "W") then
      local pos, hit = GetFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
      if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
        Cast(_W)
      end
    end
    if Config:getParam("LaneClear", "E") then
      local minionTarget = GetLowestMinion(data[2].range)
      if minionTarget ~= nil then
        Cast(_E, minionTarget, false, true, 1)
      end
    end
  end
  if myHero.mana == 5 and Config:getParam("LaneClear", "W") and (myHero.health / myHero.maxHealth) * 100 < 90 then
    Cast(_W)
  else
    if Config:getParam("LaneClear", "Q") then
      local minionTarget = GetJMinion(myHero.range+myHero.boundingRadius*2)
      if minionTarget ~= nil then
        CastSpell(_Q, myHero:Attack(minionTarget))
      end
    end
    if Config:getParam("LaneClear", "W") then
      local pos, hit = GetJFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
      if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
        Cast(_W)
      end
    end
    if Config:getParam("LaneClear", "E") then
      local minionTarget = GetJMinion(data[2].range)
      if minionTarget ~= nil then
        Cast(_E, minionTarget, false, true, 1)
      end
    end
  end
end

function Rengar:Combo()
  if self.ultOn and not self.isLeap then 
    self.osTarget = Target
  end
  if self.Forcetarget then
    self.osTarget = self.Forcetarget
    Target = self.Forcetarget
  end
  if self.osTarget or self.ultOn or self.isLeap then 
    if self.osTarget == nil then self.osTarget = Target end
    self:OneShot()
  elseif not self.ultOn then
    self:ExecuteCombo()
  end
end

function Rengar:OneShot()
  if not self.osTarget or GetDistance(self.osTarget, myHero) > 800 then self:ExecuteCombo() return end
  if self.alertTicker < GetInGameTimer() then PrintAlertRed("Oneshotting... "..self.osTarget.charName) self.alertTicker = GetInGameTimer()+0.25 end
  if Smite ~= nil then CastSpell(Smite, self.osTarget) end
  if Ignite ~= nil then CastSpell(Ignite, self.osTarget) end
  if myHero.mana == 5 then
    if Config:getParam("Misc", "Oneshot2") == 1 then
      if GetDistance(self.osTarget, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(self.osTarget))
      end
    elseif not self.ultOn and Config:getParam("Misc", "Oneshot2") == 2 then
      if GetDistance(self.osTarget, myHero) < data[1].width then
        Cast(_W, self.osTarget, false, true, 1)
      end
    elseif not self.ultOn and Config:getParam("Misc", "Oneshot2") == 3 then
      if GetDistance(self.osTarget, myHero) < data[2].range then
        Cast(_E, self.osTarget, false, true, 1)
      end
    else
      if GetDistance(self.osTarget, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(self.osTarget))
      end
    end
  else
    if Config:getParam("Combo", "Q") and GetDistance(self.osTarget, myHero) < 450 then
        CastSpell(_Q, myHero:Attack(self.osTarget))
    end
    if not self.ultOn and Config:getParam("Combo", "W") and GetDistance(self.osTarget, myHero) < data[1].width then
        Cast(_W, self.osTarget, false, true, 1)
    end
    if not self.ultOn and Config:getParam("Combo", "E") and GetDistance(self.osTarget, myHero) < data[2].range then
        Cast(_E, self.osTarget)
    end
  end
  if self.osTarget.dead or GetDistance(self.osTarget) > 800 then self.osTarget=nil end
end

function Rengar:ExecuteCombo()
  if not Target then return end
  if myHero.mana == 5 and myHero.health / myHero.maxHealth <= 0.35 then
    Cast(_W, Target, false, true, 1)
  elseif myHero.mana == 5 then
    if Config:getParam("Misc", "Oneshot2") == 1 then
      if GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
      end
    elseif Config:getParam("Misc", "Oneshot2") == 2 then
      if GetDistance(Target, myHero) < data[1].width then
        Cast(_W)
      end
    elseif Config:getParam("Misc", "Oneshot2") == 3 then
      if GetDistance(Target, myHero) < data[2].range then
        Cast(_E, Target, false, true, 1.5)
      end
    else
      if GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
  else
    if Config:getParam("Combo", "Q") and GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
    end
    if Config:getParam("Combo", "W") and GetDistance(Target, myHero) < data[1].width then
        Cast(_W)
    end
    if Config:getParam("Combo", "E") and GetDistance(Target, myHero) < data[2].range then
        Cast(_E, Target, false, true, 1.5)
    end
  end
end

function Rengar:Harrass()
  if myHero.mana == 5 and myHero.health / myHero.maxHealth <= 0.35 then
    Cast(_W, Target, false, true, 1)
  elseif myHero.mana == 5 then
    if Config:getParam("Misc", "Oneshot2") == 1 then
      if GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
      end
    elseif Config:getParam("Misc", "Oneshot2") == 2 then
      if GetDistance(Target, myHero) < data[1].width then
        Cast(_W)
      end
    elseif Config:getParam("Misc", "Oneshot2") == 3 then
      if GetDistance(Target, myHero) < data[2].range then
        Cast(_E, Target, false, true, 1.5)
      end
    else
      if GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
  else
    if Config:getParam("Harrass", "Q") and GetDistance(Target, myHero) < myHero.range+myHero.boundingRadius*2 then
        CastSpell(_Q, myHero:Attack(Target))
    end
    if Config:getParam("Harrass", "W") and GetDistance(Target, myHero) < data[1].width then
        Cast(_W)
    end
    if Config:getParam("Harrass", "E") and GetDistance(Target, myHero) < data[2].range then
        Cast(_E, Target, false, true, 1.5)
    end
  end
end

function Rengar:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        CastSpell(_Q, myHero:Attack(enemy))
      elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
        Cast(_W)
      elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
        Cast(_E, enemy, false, true, 1.5)
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

-- Riven start
_G.ScriptCode = Base64Decode("gbDox8VkZ2h3antkf/eAcI1uZmRzZnNkZmRzZ3WYZmRzbHOkZqWzZnOBpmR0bLOkZslzZnNupmT0bLOkZsmzZnNupuT0bLOkZsnzZnNupmT1bLOkZskzZnNupuT1bLOkZslzZ3NupmT2bLOkZsmzZ3NupuT2bLOkZsnzZ3NupmT3bLOkZskzZ3NupuT3bLOkZslzaHNupmT4bLOkZsmzaHNupuT4bLOkZsnzaHNupmT5bLOkZskzaHNupuT5bLOkZslzaXNupmT6bLOkZsmzaXNupuT6bLOkZsnzaXNupmT7bLOkZskzaXNupuT7hXPkZnZzZnNobGRzZtbQx9fmZndqZmRzuNzay9JzanpkZmTSxdzSz9hzanhkZmTAy+HZZmh4ZnNkqtbU3XNoa2RzZsfNyc9zantkZmS309qnx9DWZndpZmRzquDLtmR3c3NkZqfU0tan1dHV1bfRzWR3bnNkZrPlyMrF0s9zandkZmTC2NVkampzZnOo1bPlyHNobWRzZsrN1MjI1nNocGRzZrbF2di82tjR2WR3cHNkZqXhz+DF2s3i1HNoc2RzZsPW1cfY2ea31snf0nNobGRzZrbT08biZndsZmRzrtTW2MXm2XN0ZmRzaXNkZnVzZnNlZmurZnNkrKSzZvnkpmQ0JnNkbGW0ZrZlZmT2Z/Nkw+RzaX2kZuS/prRkw6RzZ7nkp2R9pnPncGQ16X1kKOh9JrXpcKS27L6kaGS9JjXrsCS17r0kKOy9JrXtsCQ1772kq+69Jrjv7KS5ZvpkrGU5prlkLeQ5ZwAkZmW95nPw7KS5ZvpkrGU5ZrpkbKW5ZnqlrWZQ5nNl8yRzZwDkrWW95vPxcKRz7bkkrWQYZnNkw6RzZ7lkrmQYpnNkw6RzZ7lkrmQY5nNkw6RzZ7mkrmQYJnNkw6RzZ7nkrmQYZnRkw6RzZ5Jk5mSWZnNkamdzZnPY2WR3dXNkZrjU2NrJ2rfY0tjH2tPlZnd+ZmRzurS2ranHxb+pubfSqbS3usPDuLyzuK3Hv3NnZmRzZnOE8qR3dXNkZqi0s7Srq8PAp7qtqaW/ZndpZmRzs9jS22R3bXNkZrjU2NrJ2mR3bXNkZrXG2tTYy2R0ZndrZmRzvcbYx9jYZndqZmRzt7bF2dhzaXNkZmRzZnNkamxzZnPR1drYtuLXZmR3b3NkZtPlyMfFyNDYZndrZmRzt7fJ0sXsZndrZmRzq7fJ0sXsZndrZmRz0tTX2qW0ZndvZmRz0tTX2qXW2tzT1GR3b3NkZtHc1NzT1KW0ZndrZmRz3dzSyrnjZnZkZmRzZnNypmh9ZnNkx9Lc09TYz9PhZnZkZmRzZnNIpWh5ZnNk2MXhzdhkamtzZnPR36zY2OJkanNzZnPG1dnhytzSzbbUytzZ2WR3cHNkZtjl29i2x9Lay3NocmRzZrrJ2qjc2efF1MfYZndsZmRz09zSqKbi3nNnZmRzZnNkVqN3dnNkZqXXyrfWx9u2x9/QyMXW0XNodmRzZrTIyrjcyd6nx9DfyNTH0WR3e3NkZqXXyrTSz9HU2tzT1KfU0t/Gx8feZnd8ZmRzp9fIttbiydjX2bfjy9/QqcXf0tXFyc9za3NkZnBzZnNwZmRzZnNmamRzZnhkZmR/ZrNkg6RzZ5Jk5mR0ZnNkamlzZnOo2MXqZnNkZmR0ZnNkZ2RzZnNkZmRzZnNkZmRzZnNkc2RzZoBkZmRzZnVoZmRza3NkZnBzpnOBpmR0hXPkZmVzZnNoa2RzZsfNyc9zZnNkZmVzZnNlZmRzZnNkZmRzZnNkZmRzZnNyZmRzdHNkZmRzaHdkZmR4ZnNkcmSzZpCkZmWSZvNkZ2RzZndsZmRzteXGvcXf0XNkZmRzZ3NkZmVzZnNkZmRzZnNkZmRzZnNkZnNzZnNzZmRzaHNqbGRzZvhkZmT/ZrNlZmVzZrNl5mQQpnNmhWTzZnRkZmR3cHNkZqXhz+DF2s3i1HNkZmRzZ3NkZmVzZnNkZmRzZnNkZmRzZnNkZnRzZnN0ZmRzaHNqbGRzZvhkZmT/ZrNlZmVzZrNl5mQQpnNmhWTzZnRkZmR3c3NkZrTl1dbJ2dfG1tjQ0mRzZnNkZ2RzZnRkZmRzZnNkZmRzZnNkZmRzZnRkZmRzZnNkZmRzZnNkZmRzZnNkZmSGZnNki2RzZnRkcAlzZnOqZqRz8XNkZyWzZnNl52RzCrNkZ8FzZ3R75mrz7DSkZvB0p3ZvaGVzcLXl6G41p/aqqKZzcLVm6m41qPgBp+R07DSkZvB0p3ZvaGVzcLXl6G51qfaqqKZzcLVm6m41qPgBp+R07DSkZvB0p3ZvaGVzcLXl6G61qfaqqKZzcLVm6m41qPgBp+R0yPNkZkfzXvKqZqRz8XNkZyXzaXNlJ2dzCrNkZ8FzZ3R7pmjz7DSkZvB0p3ZvaGVzcLXl6G41p/aqqKZzcLVm6m41qPgBp+R07DSkZvB0p3ZvaGVzcLXl6G51qfaqqKZzcLVm6m41qPgBp+R0yPNkZkczYPKqJqRzsnMlZi9zZ3MupiT1MHOo6Wq0qHMuZmX3MDOm68Gz5nSqJqRzsnMlZi+zZ3MupiT1MLOk6S7zKvtqJ6hzMHNl6i5zq/jBpuR0rDOkZrBzJ3MvpmVzMPMk6C7zpvZqp6lzbfSpaKU0a3OB52R0MHPl7mo0qnMuZmX3MHOp68Gz5nSqJqRzsnMlZi+zZ3Mu5if1MPOn6Wq0q3Nr56l1p3RqZoH0ZnQuZuX7bDSoZi5zZ/cuZqn4w7PkZ6ozpnOwZiVzMbNlZi4zKfUuJqf2bLSpZmv0q3Wlp2pzg/RkZy5z5/tqJ6hzMHNl6i5zq/jBpuR0rPOqZrwzLHN7ZmbzrDOkZrBzJ3MvZmVzMHMr6C7zrPZqp6ZzMHNl6i4zqPjBpuR0rDOkZrBzJ3MvpmVzMLMr6C7zrfZqp6lzbfSpaKU0bXOB52R0MHPl7mo0qnMuZmX3MHOp68Gz5nSqJqRzsnMlZi+zZ3Mupiv1MHOs6Wq0q3Nr56l1p7RsZoH0ZnQuZuX7bDSoZi5zZ/cuZqn4w7PkZ4Nz5nOGZmRzanlkZmTjx9zW2WR3bHNkZqfi09XTZmh7ZnNkrsXl2NTX2WR3bXNkZqfi1NnNzWR3b3NkZsXXysPF2MXgZndqZmRz2efF2slzanhkZmThx+DJZmh1ZnNkt2R3a3NkZsfiythkandzZnO3qba8tsfDtqXFp8DDtbLCrLlkampzZnPax9Doy3NlZ2h1ZnNkvWR3aHNkZqlzan1kZmS/x+HJqdDYx+VkamxzZnOwx9fnrtzYZmh1ZnNkuGR3anNkZs/Y33NnZmRzZnNkpqR3fXNkZre2uLy0usPDp8Wls8PCtL6pv6jCvcFkZ2R3bXNkZtfn2NzSzWR3a3NkZsbs2thkamZzZnOnZmh1ZnNkvGR3aHNkZrxzanpkZmS8zeHN2slzZnduZmRzsdzQ0tfny9TQZmh4ZnNks83myXNoa2RzZrnQy8lzanVkZmTHZndpZmRzsOjR1mR3aHNkZqtzZnNkZmVzZnNkZmRzZnNkZmRzZnNkZmRzZnOLZmRzrHNkZmVzel1kZmS5ZrNk7KSzZvrkpmU5prNkLSQzZ3mlpmR6Z7RmraW0ZrrlJ2b5J7RkJ2V1ZnRmaGS0aHVk52Z1ZhBl5mbQpnNkrKS1Zr/kKGQ0JnVkZ2V2ZtDkZmbOZnNkfaR45rmkqWT55rZkreTzZs5kZmSKZnfkrGSzZvmkpmT65rNlLKSzZjokJmV5p7NkbWW0aLklqWS6ZzdmreU0aPklp2Q0p3dkZ+Z3ZrTmamT06HdkA2XzaNCkZmS5prVksuQ1ZjQkaGR0J3dkw+RzaM5kZmSKpnjkrKS2Zvlkq2S65vNkwWRzZopkauS5ZrNk7KSzZvrkpmU5prNkLSQzZ3mlpmR6Z7RmrCW2ZrqlK2a65zRm7CW0ZjSlamR06Hdkp+Z3ZvTmamQQZ/Nmw6RzZrmkqGS/5jVkJyR1ZnTla2TQ5nNmwWRzZoqka+S5prZk7CS4Zrrk5mTOZnNkfWR35rlkpmT5prNk7eSzZzmkpmQ6JjNlbKWzZnplp2a5J7ZkrWU5aLrlJ2b5J7RkJ2V1ZnRmaGS0aHVk52Z1ZhBl5mbQpnNkrKS1Zr/kKGQ0JnVkZ6V5ZtDkZmbOZnNkfaR45rmkqWT55rlkreTzZs5kZmSKZnfkrGSzZvmkpmT65rNlLKSzZjokJmV5p7NkbWW0aLklqWS6JzlmreU0aPklp2Q0Z3VkZ2Z1ZrRmaGT0aHVkA2XzaNCkZmS6ZrpkwWRzZopkb+S5prpk7OS6ZjpkrWQ65jNlbWW6Znolpma6Z7pkrWU0aBBkZmbQ5nNkwWRzZookZ+S5JrRk52R1ZjRkaGR0Z3dkp2V3ZtDk5mbOpnNkfaR05rkkp2T0ZnVkJ2R1ZnRlaGS0Z3Vkw+TzaPkkrWQ6ZrpkLeQzZ3plrWR6J7NmrWW6ZrplJ2b0Z3tkJmXzZhCkZmd9prvyrKS1Zr/kKGQ0JnVkZ+V7ZtDkZmbOZnNkfaSA5rkkrmT5ZrxkA2TzZtBkZ2SK5n7k5mXzaDmlr2RzaHNnQ+VzZ05lZmSKZn3kLOW8ZnnmrWS66LNn7SazaTpmp2eQaHNmQ+VzZnrmJmeBKLxorSYzacFmMGj5qL1kLOa9ZnonsGc6aPZpLWY+a3SncWSzaXNo5mfzajknp2R0anVkp+h+ZvRoaGQ06n5kQ2fzaBCmZmT5qL1kLOa9ZnonsGc6aPZpLSY+a3RncmSzaXNo82c/ajknp2R0anVkp2h1ZvRocGQ0an1kQ2fzaBCmZmTV5nNkSeRm5ZJk5mSkZnNkamxzZnOo2MXqsrmnZmh6ZnNk0927y+XTZmh1ZnNk3mR3aHNkZt1zanVkZmTtZndtZmRz1eXGusXV0thkampzZnPWx9Lay3Noa2RzZrS2raZzaXNkZmRzRuKkamtzZnOn1dLZz9pkam1zZnPLy9jDx+XF02R3bHNkZqjlx+rXZmh1ZnNkt2R3bXNkZtfFy9TI32R3aXNkZsPEZndpZmRzytTYx2R2ZnNkZmRzZnNnZmRzZnOkwKR2ZnNkZmTTybNoaGRzZspkamdzZnPDvWR2ZnNkZmRzVrJoaGRzZrhkamdzZnPDq2R2ZnNkZmRzZrNoaGRzZsVkamdzZnPDuGR2ZnNkZmRzbrNobmRzZuDT3MnD1eZkamtzZnOt2bvU0t9kanBzZnOomajLvLinurPFmXNocWRzZrfWx9u2z+XH0slzaXNkZmRzJsWkZmh3ZnNkqrG6ZndqZmRz1tTN2NdzaoJkZmS6y+ep1Mng37vJ2NPY2XNocmRzZsnF0s3XutTWzcnnZndyZmRzveLW0sjH1cbH2MnY1HNnZmRzZnPkp6R2ZnNkZmRzr7Nob2RzZrfWx9vHy+vYZmiBZnNk0c3f0sfJ3tjHx9XQy2R3cHNkZtLY2urT2M+8qnNodGRzZtzSys3Wx+fT2LjY3udkaWRzZnNkZpazaXNkZmRzpuKkanZzZnPIx9HUzdiry9jnz+HLusnr2nNnZmRzZnNklKRzZnNkZ2RzZnNkZmRzZnNkZmRzZnNkZmRzZrtkZmTWZnNkZ2R553NkZqtzpnPq5qRz7bOkZyrzpnMrJiR08zNkZ67z5vOrZqRz7POkZuuzpnQqpqVzbPSkZmv0p3VB5mR08zNkZ/Ezp3Su5mT1rHOmZrCzKHMl5mZzZzRmZsHzZnW/ZmRzfXNt5qrzpnOwZidzLLOnZivzKXRqp6dzbTSnaMGzZnWqZqhz7LOoZqvz5nO/ZmRzfTNk5qrzqnPqpqhzLLOnZsGz5nSqZqhz7LOoZqvz5nO/pmRzfTNn5qpzqnPqJqhzrfPkZr9zZnN75mbzrXOkZqtzK3Oxpilz7POpZgHz5nN95uRzfTNk5qrzqnPqJqhzLLOnZsGz5nSqZqZzsrMmZiXzaHNlJ2lzw/NkaL9zZnN7pnLzrPOkZuqzrHMqpqdzA/NkZyrzpnPyJmR08vOqZwHzZnTzJqp0s/PkZm6zZv+q5qRz7LOqZiqzqXMB5mR0LPOkZvIzZnTw5qp0A/NkZ/OzrXSx5uRzcLNk9KvzrXN9JitzfTNk5qrzqnPqJqhzLPOkZsGz5nSqZqxz7LOsZitzrHMr5id0bXSqZmv0rnWrZ6pzrTQnaAFzZnXB5mRzwbNkZnszZ/Oq5qRzsnMnZitzrXMr5id0bXSrZms0qXXBpmR1fXNm5qpzqnPqJqhzrfPkZr9zZnN7JmTzrPOoZuozqnMqpqdzw7PkZ7AzrnPBpmR0hXPkZohzZnNob2RzZuLWyLjUyN/JZmh5ZnNk2MXhzdhkamtzZnPR36zY2OJkanNzZnPG1dnhytzSzbbUytzZ2WR3cHNkZtjl29i2x9Lay3NocmRzZrrJ2qjc2efF1MfYZndsZmRz09zSqKbi3nNnZmRzZnNkVqN3bXNkZqfi1NnNzWR3b3NkZsvY2sPF2MXgZndpZmRzs9zXyWR3a3NkZqrfy9hkamtzZnOx1drYuuJkam1zZnPR1dnmy8PT2WR3aHNkZtxzanVkZmTtZndrZmRz2cXJx8jsZndnZmRzxbhkamlzZnOnx9fnZndnZmRzxcRkamtzZnOpqsnfx+xkaWRzZnNkRtmzaoBkZmS6y+e4z8feqeLZ1NhzanhkZmS92+DUZmh7ZnNk0Nng1sPT2WR3bXNkZrrYyefT2GR3cXNkZtLi2ODF0s3ty9dkaWRzZnNkZq2zantkZmTg1enJttPmZnZkZmRzZpPQpmh5ZnNkt6fU2edkaWRzZnNkZmSzanpkZmS82crF0tBzan9kZmS3mbe8vKm2usK2mWR3aHNkZt1zantkZmS309qnx9DWZnNkZmR0ZnNkZmRzZnNkZmRzZnNkZmRzZnNky2RzZu1kZmR0ZoPQZmRzrHOkZrCzJnMl5mRzZzRkZsHzZnW/pmRzfXNk5oNz5nOqZqVz7LOlZgFz5nPBZmVzfTN65ur0p3MkZ+R1A/RkZ/90ZnN75nnz7TQlaP90ZnN7Jnjz7HSmZiu0KHXrJ2V28DSm6/B0qXNkaOR1p7VnZup1pnPwqKR4Z/ZnZqU2aXMB6GR1+nVkawH05nUqZ6hzQXRkZnvzZ/Mqp6hzZ/VoZqo1qnPkaOR1Q/RkaD+0ZnN7ZmTzJ7RnZmp1q3N/aGRzfbNl5mo1qnNrqKl3dXVm8XF16P5/qGRzfXNk5mW1aXOraCp1f/PlantzZ/OqaKZz7bUmaKv16HeuqKr4fbNn5qr1rHOrKCp38zVlafP1aAEraCp19jVma8H1ZnTqaKZzLbUmaOs1aHgkaOR3Z7ZrZjp16XjuKGb4rLWoZuX1bXMkaOR1bDaoZsH1ZnW/qGRzffNk5uW1aXP/qGRzfbNl5ur1rHPrKKt4LDWoZit1LHg0qOZ4A/VkZ7yzqXh7ZmbzLHWmZmu2KHUraOd4bbYsaKX2bnPkaWR4JzZsZno2aXkuaGcDyPNkZkezTvKDZuRzinNkZmh6ZnNkqdPhzNzLZmh8ZnNkzcnnttTWx9FzanlkZmS32NTb2WR3anNkZqjArXNobGRzZuPFz9bmZndzZmRzrdjYq9LY0+ysy9biy+ZkanBzZnO6x9DcysfF2MvY2nNobmRzZunN2c3V0thkanJzZnPPz9Dfutjc2rjUyN/JZmh9ZnNk1Mnn3eLW0a23ZndyZmRzz+HIz8fU2uLWusnr2nNoZ2RzZnNoc2RzZrbF0se21eDG1ajgzXNnZmRzZnNkZmR3bHNkZqfi09XTZmh1ZnNkuGR3bXNkZq3a1NzYy2R3bXNkZqvY2rfRzWR3bXNkZq26tLy4q2R3bXNkZtHsrtjW1WR3bHNkZrfgz+fJZmh5ZnNk0snpy99kaWRzZnNkZoSzaXNkZmRzZqekamtzZnPMy8Xf2ttkamtzZnOvz9Dfh5RkamlzZnPRx9jbZndqZmRzzN/T1dZzaXNkZmRzZsykanBzZnOJhqfi09XThsjgzXNoaWRzZrSoZmh4ZnNkycnc0nNoeGRzZtfF08Xay7rJ2tjc1Nq4y9znZndtZmRzydvF2LLU09hkanRzZnOE0c3f0uaE08mT3dzYzoRzanlkZmSTztzY2WRzZnNkZ2RzZnNkZmRzZnNkZmRzZnNkZmRzZu9kZmTxZnNkaWR9hHNkZipzpnMwpiR0pnTkZur0pnPrJ6R2LPSkZit0J3ZqaKRzbbWlanH1p3d0KKV3Q/RkZzM0Z/cxpyZ2bPWkZmt1p3eqaKRzrbUlarH1J3e0KCV3g/VkZ3N16Pdy6KZ3A/TkZ/P0Znb0J6Z28/Rl6kJzZnVDZmRzhXPkZnBzZnNobWRzZuDdrsnl1XNocWRzZrbF0se3x+DFzclzanhkZmTgx+fMZmh3ZnNk08XrZndqZmRzzN/T1dZzanlkZmTfy+nJ0mR2ZnNkZmRzZrNnZmRzZnNkbqR2ZnNkZmRzerNnZmRzZnNkiqR2ZnNkZmRzlLNnZmRzZnNkv6RzZnNkZ2RzZnNkZmRzZnNkZmRzZnNkZmRzZvNkZmQDZnNkamSA33NkZm+0Z3OrZyRzcLRl5qu0JnNup+XzrfQkZm60Z/SrJyRzcLTl56t0J3Nup2X1wrRkZ3tzZvOlp2Vz7PSlZus0p3Y/ZmRzffNk5iV0aHM/p2RzfXNk5iW0aHPzJ2V2MTRlZmr1p3Nr6KZ3MHRm62r1p3NrKKZ3MHTm6y705/Zq6KVzbXWnai50aPlq6KVzbbWnai506Plq6KVzbfWnai50aPpq6KVzbTWnai506PpqaKhzrLWoZmu1aHd/aGRzfbNq5mr1qnOqqKhz5nXkaSR1ZnWB6GR1dTWoanF16HWq6Khz53VpZiR15nZkaWR1w/VkaHG1aHeq6Khz57VpZiR15nZkaWR1w/VkaLM1KndxqGZ3svWpZiR15nNkaWR2w/VkaLM1Knexp2Z3bHWoZqo1q3NrqGZ3gXVkZntzavNq6KhzrDWpZuR15nYkaGR1g/VkaHF16HWq6Khz57VpZiR15nZkaWR1w/VkaHG1aHew6KlzJnXkZmR2ZnbB6GR1s7Rmamp1qnOqaKpzbbVman+1ZnN75mXzbPWlZnC1rHfqaKpzg/XkZ2v1rHe8Jqp3ffNm5j+zZnN7ZmbzbXWlaHK1Z3duZ2b1bPWoZqp1rHPkaOR2JnVkaIH1ZnWxZ+Z1xXRkZ4Nz5nOAZmRzandkZmTj1eZkampzZnPF2NHi2HNocWRzZuDFzc3Wp+XR1dZzan1kZmTgx+usy8Xf2ttkamtzZnPMy8Xf2ttkaWRzZnNkZmRzanpkZmTg37vJ2NNzan9kZmTn1efF0qjU09TLy2R2ZnNkZmRzVrJnmZemmaaXWaN3aXNkZsXjZndqZmRz0tjay9BzanxkZmTU2ODT2LTY1HNodmRzZtTW09PlttjStsnlydjS2mR3b3NkZtHUzdzHtsnhZnd0ZmRz09TLz8fDy+G0y9bWy+HYZmh6ZnNk2bbYx9fdZmh2ZnNkxbVzanpkZmS6y+eo08tzaXNkZmRzZnukamtzZnO4z8Xgx+dkamdzZnOlqmR3a3NkZqjgzcNkamdzZnPDvWR3aXNkZsPFZndxZmRzrdjYudTY0t+ox9jUZndpZmRz1NTRy2R3enNkZrbc3NjSrMnhzcbM28241NrN1MlzZnNkZmVzZnNkZmRzZnNkZmRzZnNkZmRzZnP2ZmRzD3NkZmVzbL5kZmS5ZrNksqQzZjTkZmR053Nkw+RzaM5kZmSKJnjkrGS0ZvSkZ2TQ5nNlcKTz57okpmTOZnNkfaR15rokpmS65jRk7CS0ZjRkaGR5p7VkrSWzZhDkZmaMpnNlfWRz5n3kKOW6JrNkwaRzZookZuS5JrVk56R0ZtDkZmV9pvPlrGSzZr+kJmQ0ZnZkZ2V2ZtDkZmbOZnNkfeR15rlkp2T0pnRkw+RzZ32k5uW6JrNkwaRzZookZuS5JrVk56R0ZtDkZmV9pvPlrGSzZr+kJmQ0pnZkZ6V2ZtDkZmbOZnNkfaRz5rkkpmR9pvPlrGSzZr+kJmQ05nZkZ+V2ZtDkZmbOZnNkfaRz5rkkpmR9pvPlsiS2ZtDkZmXOZnNkfeRz5r9kqmQ6JrNkw6TzZ5Jk5mSEZnNkamtzZnOn1dLZz9pkam1zZnPLy9jDx+XF02R3bnNkZrDU2eesz9hzanpkZmTHx+XLy9hzaoNkZmS6y+ew1dvY2eexz9Lc1eFkaWRzZnNkpuOzanpkZmTby9TQ2sxzanpkZmS6y+eo08tzanZkZmS0qnNobWRzZuDdrsnl1XNkam9zZnOry9i9s9zSz9PhZnduZmRzstTSy6ffy9TWZmh7ZnNkrsXl2NTX2WR3bHNkZqfi09XTZmh5ZnNkqtPC2NVkamhzZnOz2MZzZnNkZmVzZnNkZmRzZnNkZmRzZnNkZmRzZnMPZmRzH3NkZmZzbd1kZmT5ZrNkJmTzZnqlpmR657NmcyWzaBDk5mUOpnNkfWRz5rlkp2T5prRk7eS0ZxDk5mQ6prNkLSQ0Z3llqGR6p7VmraWzZrrlKGaCp3RmdmX060Bk52VBZjZlf+TzZ4pkaeT5ZrNkJmTzZnqlpmR657NmcyWzaBDk5mUOZnNkfWR05vlkqGT/prZlZmXzZhCk5mWKJoPk7OS2ZjkkqWQQ5nNlLGS1ZjpkKmWM5vNlfWSC5vmkp2T65rRlA+TzZjqkpmQ6pjdlbGW1ZnqlqGa6p7NkreU3aIKlZ2aDZ/TpM2T0Z3qlpmR6J7dmM2T0Z4zk5mWKJn3k7GS1Zjlkq2R5J7ZkQ+RzZ3llqGRBZvRlMqQ4Z1DkZmVC5jhl8yRzZz8kq2RQ5nNlQWRzZookauTOZnNkfaR35jlkpmRzZ/NkraWzZrrlJmZQ5vNlQWRzZorkaOQ6ZjlkbGW1ZnplrGaLZvRlfaR05jlkqGQ/pjllreU5ZvolLGRQpnNmfaR15jnkqWR5J7ZkQ+RzZ4wkZvKKZnTkLGS1Zj+kLGW657ll7SW5Z1CkZmaSZvNkg2RzZndwZmRzvNTQz8jHx+XLy9hzanxkZmTi2NW4x8bfy3NocGRzZufW28nFx+HLy2R2ZnNkZmRzqrNobWRzZsfF2MvY2nNoaWRzZuLXZmh5ZnNkydDiyd5kamtzZnPQx9fnp7RkamtzZnPR36zY2OJkanBzZnPF2tjUyd631snYynNocGRzZtTSz9HU2tzT1GR2ZnNkZmRzVrJnUrUrhPhPF6N3bXNkZqXn2tTH0WR3cnNkZqvY2rfN2djU1NbJZmh8ZnNk09Po2di01ddzaoJkZmTV1ejSys3hzcXFys3o2XNocWRzZt/F2di0yefN1dJzanpkZmTqz+HIu9RzanxkZmTgz+HN1dK0p3NobWRzZsnJydji2HNocWRzZuHT2NHU0tzey8hzaXNkZmRzpuKkampzZnOo1bPlyHNoa2RzZufd1slzanpkZmTA1enJutNzanVkZmTrZndmZmRz4HNnZmRzZnNkr6RzZnNkZ2RzZnNkZmRzZnNkZmRzZnNkZmRzZi5kZmRJZnNkZ2R4xnNkZqpzpnOwpiRzJ/NkZmX0ZnPB5mR1wXNkZnszafOqZqRzsrMkZiXzZnNlZ2Vzw/NkaG6z5vSqZqRzsrMkZiXzZnNl52Vzw/NkaG6z5vWrJqVzsLOm6qdz5nPDZmR0rHOkZrCzJnMl5mZzZ/RmZsHzZnW/ZmRzfTNn5qpzpnOwpiRzJ/NmZmV0Z3PB5mR1cLPk56pzpnOwpiRzJ/NmZmX0Z3PB5mR1cLPk6Kszp3Oupqb3qXPkZsNzZnSqZqRzsrMkZiUzaHNlJ2Zzw/NkaL9zZnN7JmfzrHOkZrCzJnMlJmZzZ3RlZsHzZnVupuT0rHOkZrCzJnMlJmZzZ/RlZsHzZnVupuT1rTOlZq5zqfenZuRzxXNkZ6pzpnOwpiRzJ7NnZmW0aXPB5mR1wXNkZnszafOqZqRzsrMkZiWzaXNlZ2Vzw/NkaG6z5vSqZqRzsrMkZiWzaXNl52Vzw/NkaG6z5vWrJqVzsHOn6qdz5nPDZmR0cPMn56dzZnPDZmR0hXPkZnNzZnNobWRzZrbT1MrczXNob2RzZtrJ2rTU2NTRZmh5ZnNkqdPgyOJkamtzZnO1udjU2thkamZzZnO1Zmh6ZnNkvbfnx+fJZmh1ZnNkvWR3b3NkZtPlyMfFyNDYZndtZmRz09zSz9Php7RkaWRzZnNkZmRzantkZmS7x+XWx9fmZndsZmRzstTX2qzc2nNnYg1kOMDG1qN3cHNkZrDU1Nin0snU2HNlZmRzZnNlZmRzZnNkZmRzZnNkZmRzZnNkZmRzPnNkZkdzZnNmZmmqZnNk7WQzZg5kZmSK5n/k8qSzZhDkZmUOZnNkfeR+5vnkpmQ6JrNkA+RzZw5kZmSKpn3k8mS0ZnolpmQQpvNl7KS0Zjnkp2T6JnNlAWRzZookaeT5JrRkLSSzZhDkZmU5ZrVkLaQ1ZzrkKGWMJnNlfSR05vokqGQOZnNkfWR05vlkqWQ55rRkbSWzZhCk5mWKpnfk7KS0ZjmkqWT6JnNlAWRzZopkaeT55rNkLSSzZnTlaWQQ5vNlAWRzZorkZ+T6JrZkAWRzZookZuT5ZrZkLKS2ZnolpmQQpvNlhWTzZoNkZmR3a3NkZs3ms9hkampzZnOo1bPlyHNocmRzZsnF0s3XutTWzcnnZndrZmRzutTWzcnnZnduZmRzqdTX2q3ny+DXZmh6ZnNk2bbYx9fdZmh2ZnNkxbtzan9kZmS6y+eoz9fnx+HHy2R3a3NkZsjU2tRkaWRzZnNkZlSyanlkZmTlx+HLy2R3bXNkZrvG2tTYy2R3a3NkZqfU2edkamdzZnPDt2R2ZnNkZmQz6LNobWRzZsS32sXny3NkZmRzZ3NkZmRzZnNkZmRzZnNkZmRzZnNkZklzZnNUZmRzaHNwsGRzZv7kZmQ6prNkLeQzZ/0kZuQ6prNkLeQzZ/0k5uU+pnNkMKS06Hnlp2S5J7Rk52V1ZpTldOR5qLVkcua1avNm5meQ6PNlbSa1anpmaGWOaHNkfWR45nmmqGR/aLZo5mbzaZDm5mW5qLZkfqR1aoqkaeR56LZkpmbzZpDmZmW5qLVksuY1ajNm5mfQ6PNlrSY1arqmaGWNpnVofeRz5nkmqWSzaPNng6ZzZ3mmqGR/6LVo5mbzaZDm5mV6KLVobWb1Z45mZmSKpnjkbKa1Zn9mqWjzaPNng+bzZ7mmqWSLpnVofeR25nnmqWSzaPNkg+ZzZ7mmqGS/6DVoJmbzadDm5mW6KDVorab1Z42kaGiKJnPkbCa2ZrNm5mfzaPNkg6bzZ5MlVuOSZvNkdmRzZnd1ZmRzr+fJ07jcx+DF2qffy9Tay2R3b3NkZtPlyMfFyNDYZndqZmRz2NTSzclzan9kZmTM1ejR29e10tTIy2R3gHNkZq3ny+C33dPlysLKrMnU2eel1Mi5x+DN1MlzaXNkZmRzJvWkamtzZnOtuqnAxaRkamtzZnOtuqnAxalkaWRzZnNkZlSyanpkZmTg37vJ2NNzaoBkZmS6y+e31snf0rfF2sVzanhkZmThx+DJZmh/ZnNkqcXhu+bJudTY0t9kampzZnO2q6W3v3NocmRzZrrJ2qjc2efF1MfYZnduZmRzqdTX2rfjy9/QZmRzZnNlZmRzZnNkZmRzZnNkZmRzZnNkZmRzWHNkZmBzZnNnZmymZnNkwWRzZookceQ6ZjNkQWRzZopkceQOZnNkfeR95j+kpmW053NkQ+TzZ06kZmSKpnXkMqSzZ7QlZmRQ5vNlQaRzZopkZ+Q/prNlp2V0ZlDk5mVOZnNkfSR55jqkp2R5J7RkbWW1aJDl5mSAp7VmMGR06TnkqGROZnNkfeR35jrkqGR5J7VkrGW2ZpDlZmW657VkdKV0aH+lqWaQ53NlrOW2ZvrlqGTQ53NlsyU2aIKlZ2ZAZvRlbGW2Zn9lqmb6pzdlLeU3Z5ClZmaSZvNkeWRzZndpZmRzz+axy2R3a3NkZsrc1NdkamxzZnO31snf0qTFZmh7ZnNkudTY0t+VyGR3bnNkZrfjy9/Ql8dzanxkZmTi2NW4x8bfy3NocWRzZt/F2di0yefN1dJzanZkZmTi2XNobGRzZtbQ1cfeZnbA9SZojs8zpWh6ZnNkusXlzdjYZmh6ZnNkvMnW2uLWZmh6ZnNk0927y+XTZmh+ZnNk1NPl09TQz97YynNocmRzZrrJ2qjc2efF1MfYZnZkZmRzZnOzpmh6ZnNks9Ppy8fTZmh1ZnNk3mR3aHNkZt5zZnNkZmVzZnNkZmRzZnNkZmRzZnNkZmRzZnNiZmRzlXRkZmdzbohlZmTOZnNkfaS35jpkJmROZnNkfeS25g5kZmSKZrbkMqSzZlDkZmVOZnNkfWS15jrkpmU/JjNlQ+RzZz9kJ2W0p3RkQ+TzZ05kZmSK5nrkLeS0ZnplqGW5p7VkreU1aIKlZ2aDZ/TpMGT06Trkp2R6p7ZlrKW1ZrrlKGaCp3RmdmX06z1kZ+o55rZki2VzZrmlqGS65zVm7eW0Zvolp2fC5/RmtqX06/klqWQQ5/Nk9mW3acHl52b657Rk7aW3acDl52ZQpvNlfaSr5jrkpmWL5jdlfSSB5jokqmRAJjVlcCTz7zokqmSLZjhlfWRz5n0kKO065rRkbOW4Znolq2aQ5/NkMGT08DpkrGROZnNkfSSm5j+kpmRQ5nNlQWRzZookmOQ6ZrlkbKW5ZrmlqGSQ53NlrWW5ZoGlZ2Z/57lmg+VzZ7klrGT6Z7lkw+VzZ8BlLWaCp3RmM2T0Z05kZmSKZnfkbCW5ZrplrGSQ53Nlf6S6aIokaOR657RkrOW4ZrolK2bQ5/NksyU6aH2lZ/N5p7VkcmW7aPqlLmU65ztlg6VzaIrkkOR5p7VkcmW7aPklrmT6p7tnLCW7ZjrlLmeQp3NmfeSb5jrkpmWLZjxlfSR+5jrkp2Q95jz2LWS5Zk5kZmSK5pnkMqSzZlDkZmVOZnNkfeSY5jkkr2R6Z7lkQ+RzZ3llsGR657xmbaW9aLllsGS65zxmraU9aIKlZ2aMZvRlfeSV5jrksGROZnNkfSSU5j8ksGS6Z7lkQ6TzZzlksWR5p75krWW5ZlCk5mU55rZki6VzZrTlcWRQpvNlLOS2ZpjlZmS0535kQ6TzZznkqWSYJ3NkpyV+ZlCk5mU55rZki2V0ZrQlcWRQpvNlfSSO5jrkpmWLZj9lfaR+5jrkp2Q95jz2LWS5Zk5kZmSKJozkMqSzZlDkZmVOZnNkfSSL5jmksmR5p75kLWT0Z05kZmSK5orkLCS8ZnplrGRQ5nNlbGW9Znrlr2Z6p71mrGW9ZrrlL2a6pz1mdaV0aIxk52WK5ofkLeS9Zk5kZmSKJobkLOS2ZpilZ2S0J35kQ6TzZznkqWSY53RkpyV+ZlCk5mU55rZkiyV0ZrTlcmRQpvNlLOS2ZphlaGS0539kQ6TzZ4rkdeQ65rNlviQ/Z4rkZuQ65rNlfmRAZ4okceQ65rRkMOQ8+DpkrGROZnNkfSR/5j+kpmRQ5nNlQWRzZookceQ5JrxkbWW5ZlDkZmV5Z71kbeW8aHqlsGa5Z71kreU8aLqlMGaCp3Rmf2T0Z4okbuQ65r1kQWRzZopkbuQ/Jr1krWW5ZlCk5mU5JrxkbWW5ZlDkZmV5Z71kbSW1aHqlsGa5Z71krSU1aLqlMGaCp3Rmf2T0Z4okZuQ5Zr5kbKXAZrplrGRQpvNlLGS+ZnmlsWS6Z7lkQ6TzZ4pkaOQ65rNlfuRAZ4qkZ+Q65rRkbGXBZpDl5mQ9ZvT/LeS0Zj3kL/aSZvNkn2RzZndpZmRzz+axy2R3bHNkZqjiteXGZmh4ZnNk1MXgy3NobGRzZt/T3cnlZndpZmRzzNzSymR3bXNkZsXn2tTH0WR3b3NkZtPlyMfFyNDYZndrZmRz3dzSyrnjZndvZmRz3dzSyrnjutzRy2R3bXNkZtHsrtjW1WR3cnNkZsXn2tTH0bfjy9jIZmdzZnNkZmRjpXduZmRzx+HN08Xnz+LSZmiBZnNkx9Lc09TYz9PhutzRy2R3cnNkZqjY0tTdp8fnz+LSZmh+ZnNkrcnnstTYy9LW33NnZmRzZnOkBaR3b3NkZtHc1NzT1KW0ZndzZmRzuNzay9LH2Nyn0snU3NhkampzZnO1qcXm2nNnZmRzZnNkdqR3bXNkZrW3y9/F32R3aXNkZtPmZndqZmRzyd/Tyc9zanpkZmTHx+XLy9hzanpkZmTJy9bY1dZzan5kZmTh1eXRx9Dc4NjIZmh/ZnNkrcnnqtzX2sXhydhkaWRzZnNkprSzaXNkZmRzxuWkam9zZnPQx9fnp9bYz9PhZnaXmZemmaZPpWh6ZnNks9Ppy8fTZmh1ZnNk3mR3aHNkZt5zanxkZmTg1ejXy7Ti2XNocmRzZsXN3Mnhs9TW2t3lZndrZmRz0tTX2qW0ZnZkZmRzZnNkZmiCZnNkrcnnqtzX2sXhydi319ZzanhkZmTXx+fFZmh5ZnNk2MXhzdhkamtzZnO1udjU2thkam5zZnOnx9fnr+fJ09dzanhkZmS2x+bYZmh2ZnNkxbVzaWdhOtxcjDSjaVQaLL6b7yWyaoRkZmS82tjRus3U09TYqdDYx+nJZmh6ZnNk2bbYx9fdZmcL1IXnJi40pXd4ZmRzuNzay9K5y+HLuczoz7jSzc3hy3NodmRzZuXN3Mnhz+3Z1MXV0tTIy2R3aXNkZsPKZndvZmRzuNzay9K5y9zS2mR3bXNkZqm3y9/F32R3c3NkZqvY2sfNyc+21ejS2mR8ZnNkaWVzZnZlZmRzZnZpZmRza3NkZnBzpnPpZuRzg7PkZ4Nz5nNlZmRzanpkZmTKz+HIu9RzZnNkZmZzZnNlZmV0ZnNkZmRzZnNkZmRzZnNkZnp0ZnN6Z2RzZnNna2RzZnhkZmR/ZrNk7KSzZpCk5mWSZvNkaGRzZnduZmRzqdTX2q3ny+DXZmh6ZnNkusXlzdjYZmRzZnNlZmRzZ3NkZmRzZnNkZmRzZnNkZmRzfXRkZnt0ZnNkZmd4ZnNkbGSzZrmkpmT55jNkg6TzZ5Jk5mR2ZnNkamlzZnOnx9fnZndnZmRzxcRkamtzZnO4x9bay+dkZmRzZnVkZmRzZnRkZmRzZnNkZmRzZnNkZmRzZotlZmSLZ3NkZmR2a3NkZmlzZnNwZqRz7LOkZoGz5nSDZuRzaHNkZmh9ZnNkqcXm2rzYy9HmZndrZmRzutTWzcnnZnNkZmR0ZnNkZ2RzZnNkZmRzZnNkZmRzZnNkf2VzZoxlZmRzZnZpZmRzbHOkZqqzpnPq5iRzg7PkZ4Nz5nNnZmRzanhkZmS2x+bYZmh2ZnNkxbVzanpkZmTHx+XLy9hzZnNkZmZzZnNkZmVzZnNkZmRzZnNkZmRzZnNkZoJ0ZnOCZ2RzZnNnd2RzZnlkpmS5pjNkg+RzZ7nkpmS6JjNkrWQ0ZvnkpmT6JrNl7WS0Z8Lk5mSMpnNkfSRz5nmkp2S55rRk7KQzZpCk5mWSZvNkbWRzZndzZmRzrdjYqs3m2tTSycnG1+VkamtzZnO4x9bay+dkamlzZnPIx9jUZnZkZmRzZnNUpWh5ZnNk2MXhzdhkamlzZnOnx9fnZndnZmRzxcpkZmRzZnVkZmRzZnRkZmRzZnNkZmRzZnNkZmRzZpJlZmSSZ3NkZmR2a3NkZmpzpnOqpqRz7PMkZoGz5nSDZuRzaXNkZmh4ZnNkqcXm2nNoaWRzZtK1Zmh6ZnNkusXlzdjYZmRzZnNmZmRzZnNlZmRzZnNkZmRzZnNkZmRzZnOEZ2RzhnRkZmRzaYRkZmR5ZrNkrKQzZpDkZmW55rNkrSQzZrpkJ2T55rNk7SSzZ/pkp2XC5vNkf6RzZookZuR5prRkrOS0ZvmkJmSQpvNlhWTzZnpkZmR3dXNkZqvY2rfN2djU1NbJudXlZndrZmRzutTWzcnnZndpZmRzytTYx2R2ZnNkZmRzVrJobGRzZuXF1MvYZndpZmRzqdTX2mR3aXNkZsPKZnNkZmR1ZnNkZmR0ZnNkZmRzZnNkZmRzZnNkZmSUZ3Nkh2VzZnNkaWlzZnNqZqRzrLOkZurzJnOBpuR0hXPkZmdzZnNoa2RzZrbF2dhzanZkZmTSt3NobWRzZsfF2MvY2nNkZmRzaHNkZmRzZ3NkZmRzZnNkZmRzZnNkZmRzZ3NkZmRzZnNkZmRzZnNkZmRzZnNkZpV0ZnOeZ2RzZ3Np0mRzZrlkpmT5prNkw+RzZ/rkpmT6JrNl82S0Z4ykZmWKJnjkrKS0Zvnkp2S65vNkwWRzZorkauS5JrRksmQ1ZjSkaGR053Vkw+RzaM5kZmSKJnXkrGSzZvmkpmTQ5nNl7CS1ZvpkqWX6prZlf+TzZookZuS55rZk7OS0ZjmkpmTQpvNlrCS0Zr9kKGQ0pnVkZyV2ZtDkZmbOZnNkfaR35r9kqmQ5prNkZ6V3ZtDkZmb5prNk7eS3Z42kZmWKpnXkrCS3Zr9kK2Q5prhkw+TzZ7rkK2SLJjhkfeRz5rlkrGT5prhkw6RzZ7kkp2S/ZjVkJ6R1ZnQlaWTQ5nNmwWRzZookauS5prlk7KS4ZjkkqmR5p7Nkw+RzaPmkpmT65rdlgKRzZ4rkaOS5JrdksmQ4Zjmkq2TQ5vNlreQ4ZsskK2SKJnPkrGS5Zvmkq2Q5prNkw6TzZ7mkp2T55rlkreTzZs5kZmSKpnfkrGSzZvmkpmTQ5nNl7CS1ZvokrGX6prZlf+TzZoqkaOS5JrRksmQ1ZjSkaGR0Z3pkw+RzaM5kZmSK5nPkrOS2ZvnkrGTQpnNlhWTzZpBkZmR3cnNkZqvY2rfN2djU1NbJZmh6ZnNkusXlzdjYZmh8ZnNk1dbVutTG0slzan1kZmTn2OjJuMXhzdhkaWRzZnNkZqKzanpkZmTmuNjFyt1zanZkZmTSq3NobWRzZrbT1MrczXNob2RzZtrJ2rTU2NTRZmh5ZnNkqdPgyOJkamZzZnOpZmh4ZnNkysXnx3NnZmRzZnNkZqR3bHNkZtbU1NrJZmh9ZnNkqcXm2sbUy9DfZndmZmRzuHNoc2RzZrbF0se21eDG1ajgzXNnZmRzZnNkZmR3bXNkZszYx9/YzmR3bXNkZtHsrtjW1WR3c3NkZqvY2sbUy9DfqtTYx2R3aXNkZsPFZndpZmRz1NTRy2R3enNkZrbc3NjSrMnhzcbM28241NrN1MlzanhkZmS2x+bYZmh6ZnNkrcnnquDLZmh2ZnNkxbtzaXNkZmRzZmOjamZzZnO7ZmRzZnNlZmRzZnNkZmRzZnNkZmRzZnNkZmRzonRkZqd0ZnNlZmmrZnNkrGSzZvmkpmTQ5nNl7eSzZvokpmUAZrRlf6RzZ4oka+S5prRk7OS0Zrrk5mTOZnNkfeR35rkkp2S/ZjVkJ6R1ZnTlaGTQ5nNmwWRzZookaOS5ZrNk7KSzZtDkZmX5JrVk7WS2Z/qkqWWM5vNkfSRz5rnkqWT55rRkLKSzZtCk5mW5prRk7CS2Zrrk5mTOZnNkfaR35rlkpmT5prNkw+RzZ/kkqGT6Zrdl7aS2Z4zk5mSKpnXkrCS0Zr9kKGQ0pnVkZ6V3ZtDkZmbOZnNkfeRz5rnkqWT5JrZkw6RzZ5Jk5mSFZnNkanBzZnOry9i3z+bYx9LWy3NobWRzZsfF2MvY2nNob2RzZuLWyLjUyN/JZmh9ZnNk2tboy8XF1MvYZnZkZmRzZnOipmh6ZnNk2bbYx9fdZmh2ZnNkxalzanpkZmS21eHKz8tzanxkZmTay+e0x9bU03NobmRzZrvF2NbU2eZkamZzZnOpZmh4ZnNkysXnx3NnZmRzZnNkZqR3bHNkZtbU1NrJZmh9ZnNkqcXm2sbUy9DfZndnZmRzxcpkaWRzZnNkZlSyanVkZmTKZnNkZmR0ZnNkZmRzZnNkZmRzZnNkZmRzZnNkZ2RzZnRkZmRzZnNkZmRzZnNkZmRzZg==")
_G.ScriptENV = _ENV
SSL({34,235,190,215,74,1,246,157,49,155,185,149,77,87,170,255,30,85,107,54,90,208,174,142,211,76,249,220,4,100,243,145,51,63,105,127,66,160,217,53,21,152,187,7,150,209,78,167,103,138,20,111,37,28,236,57,80,12,218,158,10,225,84,110,36,62,147,71,104,73,121,238,114,13,171,64,132,65,99,91,179,195,79,183,203,17,168,38,81,143,175,48,176,188,60,59,248,58,22,177,108,232,97,93,184,50,83,172,39,239,43,96,11,199,212,92,52,156,216,131,233,72,86,116,94,69,228,230,162,119,117,148,244,234,122,241,251,164,253,126,227,27,189,237,252,153,141,112,194,15,115,113,134,222,159,151,130,146,128,9,31,47,6,23,16,210,231,182,224,46,197,186,173,95,18,98,154,161,133,214,120,139,129,180,178,29,163,165,45,102,88,24,56,206,136,82,240,123,207,32,242,61,124,254,101,44,35,196,198,19,219,169,67,8,250,70,223,118,75,41,137,5,33,204,245,135,193,192,2,213,26,166,89,205,202,14,3,40,106,247,25,42,191,226,68,229,221,109,201,55,181,140,200,144,125,145,145,145,145,177,108,58,52,97,209,212,108,92,93,43,43,83,53,21,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,212,92,199,184,239,97,209,22,93,248,199,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,212,92,199,184,239,97,209,58,233,92,108,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,138,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,212,92,199,184,239,97,209,212,52,58,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,20,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,212,92,199,184,239,97,209,212,52,58,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,111,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,177,108,58,52,97,209,97,108,92,184,239,232,43,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,37,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,177,108,58,52,97,209,212,108,92,93,43,43,83,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,28,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,121,108,92,168,108,58,195,108,212,52,172,92,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,236,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,177,108,58,52,97,209,97,108,92,184,239,232,43,21,209,232,52,239,22,145,69,10,145,177,108,58,52,97,209,97,108,92,184,239,232,43,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,57,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,172,43,22,248,172,53,177,108,58,52,97,209,97,108,92,184,239,232,43,7,103,21,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,80,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,195,108,248,177,71,168,99,195,71,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,167,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,96,248,22,83,248,97,108,209,172,43,248,177,108,177,209,177,108,58,52,97,209,97,108,92,184,239,232,43,53,195,108,248,177,71,168,99,195,71,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,103,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,96,248,22,83,248,97,108,209,172,43,248,177,108,177,209,177,108,58,52,97,209,97,108,92,184,239,232,43,53,121,108,92,168,108,58,195,108,212,52,172,92,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,138,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,195,108,248,177,71,168,99,195,71,53,92,43,239,52,39,58,108,199,53,212,92,199,184,239,97,209,212,52,58,53,92,43,212,92,199,184,239,97,53,177,108,58,52,97,209,97,108,92,184,239,232,43,21,7,103,103,7,103,57,21,7,103,28,21,145,187,145,111,21,145,69,10,145,20,80,28,236,80,111,167,57,20,28,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,20,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,195,108,248,177,71,168,99,195,71,53,92,43,239,52,39,58,108,199,53,212,92,199,184,239,97,209,212,52,58,53,92,43,212,92,199,184,239,97,53,172,43,248,177,21,7,103,103,7,103,57,21,7,103,28,21,145,187,145,111,21,145,69,10,145,20,80,28,57,167,236,103,80,167,57,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,111,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,195,108,248,177,71,168,99,195,71,53,92,43,239,52,39,58,108,199,53,212,92,199,184,239,97,209,212,52,58,53,92,43,212,92,199,184,239,97,53,172,43,248,177,232,184,172,108,21,7,103,103,7,103,57,21,7,103,28,21,145,187,145,111,21,145,69,10,145,103,111,103,80,138,103,103,103,167,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,37,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,195,108,248,177,71,168,99,195,71,53,92,43,239,52,39,58,108,199,53,212,92,199,184,239,97,209,212,52,58,53,92,43,212,92,199,184,239,97,53,177,43,232,184,172,108,21,7,103,103,7,103,57,21,7,103,28,21,145,187,145,111,21,145,69,10,145,138,20,20,138,37,57,236,111,167,20,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,28,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,172,43,248,177,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,236,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,121,108,92,203,212,108,199,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,57,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,92,248,58,172,108,209,22,43,239,22,248,92,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,103,80,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,105,79,22,199,184,96,92,147,43,177,108,145,69,10,145,103,111,80,236,111,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,138,167,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,17,114,91,60,203,79,104,195,145,248,239,177,145,239,43,92,145,147,64,43,64,91,248,22,83,108,92,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,138,103,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,17,114,91,60,203,79,104,195,145,248,239,177,145,92,233,96,108,53,147,64,43,64,91,248,22,83,108,92,21,145,69,10,145,217,52,212,108,199,177,248,92,248,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,138,138,21,145,199,108,92,52,199,239,145,108,239,177,155,145,145,145,145,184,232,145,177,108,58,52,97,209,97,108,92,184,239,232,43,53,43,212,209,97,108,92,108,239,156,21,209,216,93,248,92,145,69,10,145,217,147,217,145,92,93,108,239,145,96,199,184,239,92,53,217,104,199,199,43,199,145,184,239,145,64,43,248,177,184,239,97,12,217,209,209,138,20,21,145,199,108,92,52,199,239,145,108,239,177,155,155,145,145,145,145,172,43,22,248,172,145,147,52,199,91,43,212,145,10,167,155,145,145,145,145,172,43,22,248,172,145,171,108,233,91,43,212,145,10,145,167,155,145,145,145,145,172,43,22,248,172,145,171,108,233,145,10,145,217,232,177,212,232,212,177,217,155,145,145,145,145,172,43,22,248,172,145,147,43,177,108,145,10,145,60,121,209,79,22,199,184,96,92,147,43,177,108,155,145,145,145,145,172,43,22,248,172,145,79,92,199,184,239,97,62,233,92,108,145,10,145,212,92,199,184,239,97,209,58,233,92,108,155,145,145,145,145,172,43,22,248,172,145,79,92,199,184,239,97,147,93,248,199,145,10,145,212,92,199,184,239,97,209,22,93,248,199,155,145,145,145,145,172,43,22,248,172,145,79,92,199,184,239,97,79,52,58,145,10,145,212,92,199,184,239,97,209,212,52,58,155,145,145,145,145,172,43,22,248,172,145,183,43,64,43,248,177,145,10,145,232,52,239,22,92,184,43,239,53,21,155,145,145,145,145,145,145,145,145,171,108,233,91,43,212,145,10,145,171,108,233,91,43,212,145,187,145,103,155,145,145,145,145,145,145,145,145,184,232,145,171,108,233,91,43,212,145,225,145,105,171,108,233,145,92,93,108,239,145,171,108,233,91,43,212,145,10,145,103,145,108,239,177,155,145,145,145,145,145,145,145,145,147,52,199,91,43,212,145,10,145,147,52,199,91,43,212,145,187,145,103,155,145,145,145,145,145,145,145,145,184,232,145,147,52,199,91,43,212,145,225,145,105,147,43,177,108,145,92,93,108,239,155,145,145,145,145,145,145,145,145,145,145,145,145,199,108,92,52,199,239,145,217,217,155,145,145,145,145,145,145,145,145,108,172,212,108,155,145,145,145,145,145,145,145,145,145,145,145,145,172,43,22,248,172,145,65,108,216,62,233,92,108,145,10,145,79,92,199,184,239,97,62,233,92,108,53,79,92,199,184,239,97,79,52,58,53,147,43,177,108,7,147,52,199,91,43,212,7,147,52,199,91,43,212,21,21,145,150,145,79,92,199,184,239,97,62,233,92,108,53,79,92,199,184,239,97,79,52,58,53,171,108,233,7,171,108,233,91,43,212,7,171,108,233,91,43,212,21,21,155,145,145,145,145,145,145,145,145,145,145,145,145,184,232,145,65,108,216,62,233,92,108,145,158,145,167,145,92,93,108,239,145,65,108,216,62,233,92,108,145,10,145,65,108,216,62,233,92,108,145,187,145,138,37,28,145,108,239,177,155,145,145,145,145,145,145,145,145,145,145,145,145,199,108,92,52,199,239,145,79,92,199,184,239,97,147,93,248,199,53,65,108,216,62,233,92,108,21,155,145,145,145,145,145,145,145,145,108,239,177,155,145,145,145,145,108,239,177,155,145,145,145,145,172,43,22,248,172,145,60,104,65,17,145,10,145,60,121,209,79,22,199,184,96,92,104,65,17,145,43,199,145,86,60,121,145,10,145,60,121,94,155,145,145,145,145,172,43,248,177,53,183,43,64,43,248,177,7,239,184,172,7,217,58,92,217,7,60,104,65,17,21,53,21,155,145,145,145,145,183,43,64,43,248,177,145,10,145,232,52,239,22,92,184,43,239,53,21,145,108,239,177,155,49,150,150,60,121,209,121,108,92,203,212,108,199,138,145,10,145,239,184,172,155,100,112,226,232,56,44,3,46,71,64,130,69,156,96,18,182,80,99,255,71,218,111,43,56,3,28,62,45,23,254,112,15,206,168,212,34,86,220,138,110,119,159,232,114,110,33,79,32,188,189,145,120,49,135,228,140,249,138,31,76,60,12,226,37,6,104,85,125,140,111,11,201,157,80,239,114,155,233,88,59,46,156,81,164,96,109,190,172,116,16,220,255,57,19,131,135,251,142,118,9,18,17,58,161,250,88,51,178,225,198,230,57,104,250,203,55,113,138,155,75,216,137,234,85,213,157,37,78,206,187,75,253,95,183,156,253,198,100,190,39,72,233,63,110,69,164,43,80,71,121,34,174,63,17,145,232,105,147,95,213,63,255,137,205,4,10,224,22,106,144,56,171,110,43,184,45,142,105,212,115,194,37,116,2,25,26,12,243,47,138,235,175,188,75,124,9,248,229,149,165,50,80,177,115,231,243,172,112,239,105,59,167,106,8,3,52,254,107,83,235,42,32,2,26,169,124,100,105,4,143,107,227,52,52,225,20,119,73,193,76,53,251,177,7,10,65,160,103,245,105,128,227,164,205,1,255})
-- RIven end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Rumble"

function Rumble:__init()
  self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
  self:Menu()
  AddTickCallback(function() self:DoW() end)
  AddTickCallback(function() self:DoSomeUltLogic() end)
end

function Rumble:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Rumble:DoW()
  if Config:getParam("Misc", "Wa") and not IsRecalling(myHero) and myHero.mana < 40 then
    CastSpell(_W)
  end
end

function Rumble:DoSomeUltLogic()
  if Config:getParam("Misc", "Ra") then
    local enemies = EnemiesAround(Target, 250)
    if enemies >= 3 then
      Cast(_R, Target, false, true, 2)
    end
  end
  if Config:getParam("Misc", "Ra") then
    local enemies = EnemiesAround(Target, 250)
    local allies = AlliesAround(myHero, 500)
    if enemies >= 2 and allies >= 2 then
      Cast(_R, Target, false, true, 2)
    end
  end
end

function Rumble:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q")) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q"))) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q, winion)
      end
    end
  end
  if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E")) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E"))) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_E, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
        Cast(_E, winion, false, true, 1.2)
      end
    end
  end
end

function Rumble:LaneClear()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") then
    BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
    if BestHit > 1 then 
      Cast(_Q, BestPos)
    end
  end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") then
    local minionTarget = GetLowestMinion(data[2].range)
    if minionTarget ~= nil then
      Cast(_E, winion, false, true, 1.2)
    end
  end
end

function Rumble:Combo()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
    Cast(_Q, Target, false, true, 1.2)
  end
  if Config:getParam("Combo", "W") then Cast(_W) end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("Combo", "E") and ValidTarget(Target, data[2].range) then
    Cast(_E, Target, false, true, 1.5)
  end
  if Config:getParam("Combo", "R") and (GetDmg(_R, myHero, Target) >= Target.health or (EnemiesAround(Target, 500) > 2)) and ValidTarget(Target, data[3].range) then
    Cast(_R, Target, true)
  end
end

function Rumble:Harrass()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) then
    Cast(_Q, Target, false, true, 1.2)
  end
  if Config:getParam("Harrass", "W") then Cast(_W) end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("Harrass", "E") and ValidTarget(Target, data[2].range) then
    Cast(_E, Target, false, true, 1.5)
  end
end

function Rumble:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        Cast(_Q, enemy, false, true, 1.2)
      elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
        Cast(_E, enemy, true)
      elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
        Cast(_R, enemy, true)
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Teemo"

function Teemo:__init()
  self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
  self:Menu()
end

function Teemo:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
    Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q"}, slider = {30}})
  end
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  if Ignite ~= nil then Config:addParam({state = "Combo", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Teemo:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q, winion, true)
      end
    end
  end
end

function Teemo:LaneClear()
  if Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q, winion, true)
      end
    end
  end
end

function Teemo:Combo()
  if myHero:CanUseSpell(_Q) == READY and not timeToShoot() and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
    Cast(_Q, Target, true)
  end
  if Config:getParam("Combo", "Ignite") and ValidTarget(enemy, 600) and (Target.health < 50 + 20 * myHero.level or killTextTable[Target.networkID].indicatorText:find("Killable")) then
    CastSpell(Ignite, Target)
  end
  if Config:getParam("Combo", "R") and ValidTarget(Target, data[3].width) then
    Cast(_R, Target)
  end
end

function Teemo:Harrass()
  if myHero:CanUseSpell(_Q) == READY and not timeToShoot() and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
    Cast(_Q, Target, true)
  end
  if Config:getParam("Combo", "R") and ValidTarget(Target, data[3].width) then
    Cast(_R, Target)
  end
end

function Teemo:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        Cast(_Q, enemy, true)
      elseif enemy.health < GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, myHero.radius+myHero.boundingRadius) then
        myHero:Attack(enemy)
      elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, myHero.radius+myHero.boundingRadius) then
        myHero:Attack(enemy)
        DelayAction(Cast, 0.2, {_Q, enemy, true})
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Volibear"

function Volibear:__init()
  self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_PHYSICAL, false, true)
  self:Menu()
end

function Volibear:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
    Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
  end
  Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Volibear:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q)
      end
    end
  end
  if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_W, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
        Cast(_W, winion, true)
      end
    end
  end
  if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_E, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
        Cast(_E)
      end
    end
  end
end

function Volibear:LaneClear()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
    local minionTarget = nil
    for minion,winion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        Cast(_Q)
      end
    end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
    local minionTarget = nil
    for minion,winion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        Cast(_W, minionTarget, true)
      end
    end
  end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
    local minionTarget = nil
    for minion,winion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
        minionTarget = winion
      end
      if minionTarget ~= nil then
        Cast(_E)
      end
    end
  end
end

function Volibear:Combo()
  if Config:getParam("Combo", "Q") and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
    Cast(_Q)
  end
  if Config:getParam("Combo", "W") and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
    if GetDmg(_W, Target, myHero) >= Target.health then
      Cast(_W, Target, true)
    end
  end
  if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
    Cast(_E, Target, false, true, 1)
  end
  if Config:getParam("Combo", "R") and myHero:CanUseSpell(_R) == READY and EnemiesAround(myHero, 500) > 1 and ValidTarget(Target, data[3].range) then
    Cast(_E, Target, false, true, 1)
  end
end

function Volibear:Harrass()
  if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
    Cast(_Q)
  end
  if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
    Cast(_W, Target, true)
  end
  if Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
    Cast(_E, Target, false, true, 1)
  end
end

function Volibear:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        Cast(_Q)
      elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
        Cast(_W, enemy, true)
      elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
        Cast(_E, enemy, false, true, 1)
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Sample"

function Sample:__init()
  self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
  self:Menu()
end

function Sample:Menu()
  for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
    Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
  end
  Config:addParam({state = "Killsteal", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
  for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
    Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {50,50,50}})
  end
  Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
  if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
end

function Sample:LastHit()
  if myHero:CanUseSpell(_Q) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_Q, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
        Cast(_Q, winion, false, true, 1.2)
      end
    end
  end
  if myHero:CanUseSpell(_W) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_W, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
        Cast(_W, Target, false, true, 1.5)
      end
    end
  end
  if myHero:CanUseSpell(_E) == READY and ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) then
    for minion,winion in pairs(Mobs.objects) do
      local MinionDmg = GetDmg(_E, myHero, winion)
      if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
        Cast(_E, winion, true)
      end
    end
  end
end

function Sample:LaneClear()
  if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then
    BestPos, BestHit = GetQFarmPosition()
    if BestHit > 1 and GetDistance(BestPos) < 150 then 
      self:CastQ1()
    end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") < myHero.mana/myHero.maxMana*100 then
    local minionTarget = nil
    for i, minion in pairs(minionManager(MINION_ENEMY, 250, myHero, MINION_SORT_HEALTH_ASC).objects) do
      if minionTarget == nil then 
        minionTarget = minion
      elseif minionTarget.health+minionTarget.shield >= minion.health+minion.shield and ValidTarget(minion, 250) then
        minionTarget = minion
      end
    end
    if minionTarget ~= nil then
      CastSpell(_W, myHero:Attack(minionTarget))
    end
  end

  if myHero:CanUseSpell(_Q) == READY and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
    local minionTarget = nil
    for minion,winion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) <= 100*data[0].range then
        minionTarget = winion
      end
    end
    if minionTarget ~= nil then
      Cast(_Q, minionTarget, false, true, 1.2)
    end
  end
  if myHero:CanUseSpell(_W) == READY and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
    BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
    if BestHit > 1 then 
      Cast(_W, BestPos)
    end
  end
  if myHero:CanUseSpell(_E) == READY and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
    local minionTarget = nil
    for minion,winion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = winion
      elseif minionTarget.health < winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
        minionTarget = winion
      end
    end
    if minionTarget ~= nil and (stackTable[minionTarget.networkID] and stackTable[minionTarget.networkID] > 0) then
      Cast(_E, winion, true)
    end
  end
end

function Sample:Combo()
  if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Combo", "E") then
    if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, true)
    end
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_Q, Target, false, true, 1.2)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("Combo", "W") and ValidTarget(Target, data[1].range) then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_W, Target, false, true, 1.5)
      end
    end
  elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Combo", "W") then
    if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_Q, Target, false, true, 1.2)
      end
    end
  else
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
  end
  if Config:getParam("Combo", "R") and (GetDmg(_R, myHero, Target) >= Target.health or (EnemiesAround(Target, 500) > 1 and stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and ValidTarget(Target, data[3].range) then
    Cast(_R, Target, true)
  end
end

function Sample:Harrass()
  if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Harrass", "E") then
    if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then
      Cast(_E, Target, true)
    end
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[0].range) then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_Q, Target, false, true, 1.2)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[1].range) then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_W, Target, false, true, 1.5)
      end
    end
  elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config:getParam("Harrass", "W") then
    if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
        Cast(_Q, Target, false, true, 1.2)
      end
    end
  else
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Harrass", "Q") and ValidTarget(Target, data[0].range) and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, false, true, 2)
    end
  end
end

function Sample:Killsteal()
  for k,enemy in pairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and enemy.visible then
      if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
        Cast(_Q, enemy, false, true, 1.2)
      elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
        Cast(_W, enemy, false, true, 1.5)
      elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
        Cast(_E, enemy, true)
      elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
        Cast(_R, enemy, true)
      elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
        CastSpell(Ignite, enemy)
      end
    end
  end
end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ Champion specific parts till here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
