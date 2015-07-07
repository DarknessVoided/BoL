--[[

     ____           _       __         __                
    / __/____ ____ (_)___  / /_ ___   / /___  ___ _ __ __
   _\ \ / __// __// // _ \/ __// _ \ / // _ \/ _ `// // /
  /___/ \__//_/  /_// .__/\__/ \___//_/ \___/\_, / \_, / 
                   /_/                      /___/ /___/  

    By Scriptologe a.k.a Nebelwolfi

    Credits and thanks to: DefinitelyRiot

]]--

--Scriptstatus Tracker
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion    = 1.993
_G.ScriptologyAutoUpdate = true
_G.ScriptologyLoaded     = false
_G.ScriptologyDebug      = false

-- { Global functions

  function OnLoad()
    champList = { "Ahri", "Ashe", "Azir", "Blitzcrank", "Brand", "Cassiopeia", "Darius", "Ekko", "Kalista", "Katarina", 
                  "KogMaw", "LeeSin", "Lux", "Malzahar", "Nidalee", "Orianna", "Rengar", "Riven", "Ryze", "Rumble", 
                  "Talon", "Teemo", "Vayne", "Volibear", "Yasuo" }
    Cfg = scriptConfig("Scriptology Loader", "Scriptology")
    supported = {}
    for _,champ in pairs(champList) do
      supported[champ] = true
    end
    if FileExist(LIB_PATH .. "/ImprovedScriptConfig.lua") then
      require("ImprovedScriptConfig")
    else 
      ScriptologyMsg("Downloading ImprovedScriptConfig, please don't press F9")
      DelayAction(function() DownloadFile("https://raw.github.com/Feez/BoL/master/Common/ImprovedScriptConfig.lua".."?rand="..math.random(1,10000), LIB_PATH.."ImprovedScriptConfig.lua", function () ScriptologyMsg("Successfully downloaded ImprovedScriptConfig. Press F9 twice.") end) end, 3) 
      return true
    end  
    if supported[myHero.charName] then
      if ScriptologyAutoUpdate and Update() then
        return
      else
        Auth()
      end
    else
      ScriptologyMsg("Your Champion is not supported (yet)!")
      ScriptologyMsg("Loaded SAwareness, SEvade and SWalk to menu instead")
      if not _G.Reborn_Initialised and not _G.MMA_Loaded then LoadOrb() end
      SetupAwareness()
      SetupEvade()
    end
  end

  function Load()
    Menu()
    Vars()
    loadedClass = _G[myHero.charName]()
    ScriptologyLoaded = true
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
          DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Scriptology.lua".."?rand="..math.random(1,10000), SCRIPT_PATH.."Scriptology.lua", function () ScriptologyMsg("Successfully updated. ("..ScriptologyVersion.." => "..ScriptologyServerVersion.."), press F9 twice to load the updated version") end) end, 3)
          return true
        end
      end
    else
      ScriptologyMsg("Error downloading version info")
    end
    if myHero.charName ~= "Darius" and myHero.charName ~= "Katarina" and myHero.charName ~= "Riven" and myHero.charName ~= "Teemo" and myHero.charName ~= "Volibear" and not _G.UPLloaded then
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
    Cfg:addSubMenu(myHero.charName, "Scriptology")
    Config = Cfg.Scriptology
    Config:addSubMenu("Combo","Combo")
    Config:addSubMenu("Harrass","Harrass")
    if myHero.charName ~= "Blitzcrank" then
    Config:addSubMenu("LastHit","LastHit")
    Config:addSubMenu("LaneClear","LaneClear") end
    Config:addSubMenu("Killsteal","Killsteal")
    if myHero.charName ~= "Volibear" and myHero.charName ~= "Teemo" then 
      Config:addSubMenu("Misc","Misc")
    end
    Config:addSubMenu("Draws","Draws")
    Config.Draws:addParam("Q", "Draw Q", SCRIPT_PARAM_ONOFF, true)
    if myHero.charName ~= "Orianna" then
      Config.Draws:addParam("W", "Draw W", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("E", "Draw E", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("R", "Draw R", SCRIPT_PARAM_ONOFF, true)
    end
    Config.Draws:addParam("DMG", "Draw DMG", SCRIPT_PARAM_ONOFF, true)
    Config.Draws:addParam("LFC", "Use LFC", SCRIPT_PARAM_ONOFF, true)
    Config.Draws:addParam("OpacityQ", "Opacity Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Draws:addParam("OpacityW", "Opacity W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Draws:addParam("OpacityE", "Opacity E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Draws:addParam("OpacityR", "Opacity R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config:addSubMenu("Key Settings","kConfig")
    if UPL ~= nil then UPL:AddToMenu(Cfg) end
    SetupOrbwalk()
    SetupAwareness()
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
          [_Q] = { range = 880, delay = 0.25, speed = 1600, width = 120, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
          [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
          [_E] = { range = 900, delay = 0.25, speed = 1550, width = 65, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
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
          [_W] = { speed = math.huge, delay = 0, range = 450, width = 350, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return (Level < 11 and 45+5*Level or Level*10)+0.6*AP+(GetMaladySlot() and 15+0.15*AP or 0) end},
          [_E] = { range = 1300, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.4*AP end},
          [_R] = { speed = 1300, delay = 0.2, range = 500, width = 200, collision = false, aoe = true, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+75*level+0.5*AP end}
        },
        ["Blitzcrank"] = {
          [_Q] = { speed = 1800, delay = 0.25, range = 900, width = 70, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 55*level+25+AP end},
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
          [_W] = { speed = math.huge, delay = 2, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
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
        ["Katarina"] = {
          [_Q] = { range = 675, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+25*level+0.45*AP end},
          [_W] = { range = 375, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.25*AP+0.6*TotalDmg end},
          [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+30*level+0.25*AP end},
          [_R] = { range = 550, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+10*level+0.2*AP+0.3*source.addDamage end}
          },
        ["KogMaw"] = {
          [_Q] = { range = 975, delay = 0.25, speed = 1600, width = 80, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+50*level+0.5*AP end},
          [_W] = { range = function() return myHero.range + myHero.boundingRadius*2 + 110+20*myHero:GetSpellData(_W).level end, dmgAP = function(AP, level, Level, TotalDmg, source, target) return target.maxHealth*0.01*(level+1)+0.01*AP+TotalDmg end},
          [_E] = { range = 1200, delay = 0.25, speed = 1300, width = 120, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
          [_R] = { range = 1500, speed = math.huge, delay = 1.1,  width = 250, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.3*AP+0.5*TotalDmg end}
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
          [_Q] = { speed = 1350, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
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
        ["Ryze"] = {
          [_Q] = { speed = 1875, delay = 0.25, range = 900, width = 55, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.55*AP+(0.015+0.05*level)*source.maxMana end},
          [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 60+20*level+0.4*AP+0.025*myHero.maxMana end},
          [_E] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 34+16*level+0.3*AP+0.02*myHero.maxMana end},
          [_R] = { range = 900}
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
        ["Talon"] = {
          [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+30*level+0.3*(myHero.addDamage) end},
          [_W] = { speed = 900, delay = 0.5, range = 600, width = 200, collision = false, aoe = false, type = "cone", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(5+25*level+0.6*(myHero.addDamage)) end},
          [_E] = { range = 700},
          [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 650, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(70+50*level+0.75*(myHero.addDamage)) end}
        },
        ["Teemo"] = {
          [_Q] = { range = myHero.range+myHero.boundingRadius*3, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*Level+0.8*AP end},
          [_W] = { range = 25000},
          [_E] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 9*level+0.3*AP end},
          [_R] = { range = myHero.range, width = 250}
        },
        ["Vayne"] = {
          [_Q] = { range = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.25+0.05*level)*TotalDmg+TotalDmg end},
          [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return 10+10*level+((0.03+0.01*level)*target.maxHealth) end},
          [_E] = { speed = 2000, delay = 0.25, range = 1000, width = 0, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.5*TotalDmg end},
          [_R] = { range = 1000}
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
          [_Q] = { range = 500, speed = math.huge, delay = 0.125, width = 55, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20*level+TotalDmg-10 end},
          [_W] = { range = 350},
          [_E] = { range = 475, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+20*level+AP end},
          [_R] = { range = 1200, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 100+100*level+1.5*TotalDmg end}
        },
        ["Yorick"] = {
          [_Q] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+1.2*TotalDmg+TotalDmg end},
          [_W] = { range = 0, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+20*level+AP end},
          [_E] = { range = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 100+100*level+source.addDamage*1.5 end},
          [_R] = { }
        }
    }
    lastAttack = 0
    lastWindup = 0
    previousWindUp = 0
    previousAttackCooldown = 0
    ultOn = 0
    ultTarget = nil
    trackList = {
        ["Ahri"] = {
          "AhriSeduce"
        },
        ["Blitzcrank"] = {
          "rocketgrab2"
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
        },
        ["Yasuo"] = {
          "YasuoDashWrapper"
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
    if UPL.SP and myHero.charName == "Blitzcrank" then
      UPL.SP.SpellData[myHero.charName][_Q].collision = false
    end
    Target = nil
    Mobs = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC)
    JMobs = minionManager(MINION_JUNGLE, 750, myHero, MINION_SORT_HEALTH_ASC)
    sReady = {[_Q] = false, [_W] = false, [_E] = false, [_R] = false}
  end

  function SetupAwareness()
    if not _G.PrinceViewVersion then
      loadedAwareness = SAwareness()
    end
  end

  function SetupEvade()
    if not _G.Evadeee_Loaded then
      loadedEvade = SEvade()
    end
  end

  function SetupOrbwalk()
    if myHero.charName == "Azir" or myHero.charName == "Malzahar" or myHero.charName == "Katarina" or myHero.charName == "Rengar" or myHero.charName == "Riven" or myHero.charName == "Talon" or myHero.charName == "Yasuo" then
      if myHero.charName ~= "Katarina" and myHero.charName ~= "Riven" and myHero.charName ~= "Yasuo" then ScriptologyMsg("Inbuilt OrbWalker activated! Do not use any other") end
      if myHero.charName == "Riven" then return end
      LoadOrb()
      DelayAction(function() ScriptologyMsg("Inbuilt OrbWalker activated! Do not use any other") end, 5)
    else
      if _G.AutoCarry then
        if _G.Reborn_Initialised then
          Cfg:addParam("owinfo", "SAC support loaded", SCRIPT_PARAM_INFO, "")
          ScriptologyMsg("Found SAC: Reborn")
        else
          ScriptologyMsg("Found SAC: Revamped")
          Cfg:addParam("owinfo", "SAC support loaded", SCRIPT_PARAM_INFO, "")
        end
      elseif _G.Reborn_Loaded then
        DelayAction(function() SetupOrbwalk() end, 1)
      elseif _G.MMA_Loaded then
        ScriptologyMsg("Found MMA")
        Cfg:addParam("owinfo", "MMA support loaded", SCRIPT_PARAM_INFO, "")
      else
        Cfg:addParam("info", "Choose your Orbwalker", SCRIPT_PARAM_INFO, "")
        if FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
          Cfg:addParam("bfw", "Big Fat Orbwalker", SCRIPT_PARAM_ONOFF, false)
          DelayAction(function() Cfg.bfw = false end, 0.1)
          DelayAction(function() Cfg:setCallback("bfw", function(var) if var then require "Big Fat Orbwalker" RemoveOw() end end) end, 0.25)
        end
        if FileExist(LIB_PATH .. "SxOrbWalk.lua") then
          Cfg:addParam("SxOrbWalk", "SxOrbWalk", SCRIPT_PARAM_ONOFF, false)
          DelayAction(function() Cfg.SxOrbWalk = false end, 0.1)
          DelayAction(function() Cfg:setCallback("SxOrbWalk", function(var) if var then LoadSxOrbWalk() end end) end, 0.25)
        end
        if FileExist(LIB_PATH .. "SOW.lua") then
          Cfg:addParam("SOW", "SOW", SCRIPT_PARAM_ONOFF, false)
          DelayAction(function() Cfg.SOW = false end, 0.1)
          DelayAction(function() Cfg:setCallback("SOW", function(var) if var then LoadSOW() end end) end, 0.25)
        end
        Cfg:addParam("SWalkl", "SWalk", SCRIPT_PARAM_ONOFF, false)
        DelayAction(function() Cfg.SWalkl = false end, 0.1)
        DelayAction(function() Cfg:setCallback("SWalkl", function(var) if var then LoadOrb() RemoveOw() end end) end, 0.25)
        DelayAction(function() if Cfg.SWalkl ~= nil and not loadedOrb then LoadOrb() RemoveOw() end end, 60)
      end
    end
  end

  function LoadSxOrbWalk()
    require 'SxOrbWalk'
    Cfg:addSubMenu("SxOrbWalk","SxOrbWalk")
    SxOrb:LoadToMenu(Cfg.SxOrbWalk)
    ScriptologyMsg("Loaded SxOrb.")
    RemoveOw()
  end

  function LoadSOW()
    require 'SOW'
    require 'VPrediction'
    SOWVP = SOW(VP)
    Cfg:addSubMenu("SOW","SOW")
    SOWVP:LoadToMenu(Cfg.SOW)
    ScriptologyMsg("Loaded SOW")
    RemoveOw()
  end

  function RemoveOw()
    DelayAction(function()
      Cfg:removeParam("info")
      if Cfg.bfw ~= nil then
        Cfg:removeParam("bfw")
      end
      if Cfg.SOW ~= nil then
        Cfg:removeParam("SOW")
      end
      if Cfg.SxOrbWalk ~= nil then
        Cfg:removeParam("SxOrbWalk")
      end
      if Cfg.SWalkl ~= nil then
        Cfg:removeParam("SWalkl")
      end
    end, 0.05)
  end

  function LoadOrb()
  -- CastSpell(s, myHero:Attack(t)) and CastSpell(s)
    aaResetTable = { ["Darius"] = {_W}, ["Rengar"] = {_Q}, ["Riven"] = {_W}, ["Sivir"] = {_W}, ["Talon"] = {_Q} }
  -- CastSpell(s, x, z)
    aaResetTable2 = { ["Kalista"] = {_Q}, ["Lucian"] = {_E}, ["Riven"] = {_Q}, ["Talon"] = {_W}, ["Yasuo"] = {_Q} }
  -- CastSpell(s, t)
    aaResetTable3 = { ["Lucian"] = {_Q}, ["Teemo"] = {_Q}, ["Yasuo"] = {_R} }
    loadedOrb = SWalk(myHero.range < 500, aaResetTable[myHero.charName], aaResetTable2[myHero.charName], aaResetTable3[myHero.charName])
  end

  function DisableOrbwalkerMovement()
    if _G.Reborn_Loaded then
      if _G.Reborn_Initialised then
        _G.AutoCarry.MyHero:MovementEnabled(false)
      end
    elseif _G.MMA_Loaded then
      _G.MMA_AvoidMovement(true)
    elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
      _G["BigFatOrb_DisableMove"] = true
    elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
      SxOrb:DisableMove()
    elseif FileExist(LIB_PATH .. "SOW.lua") then
      SOWVP.Move = false
    end
  end

  function EnableOrbwalkerMovement()
    if _G.Reborn_Loaded then
      if _G.Reborn_Initialised then
        _G.AutoCarry.MyHero:MovementEnabled(true)
      end
    elseif _G.MMA_Loaded then
      _G.MMA_AvoidMovement(false)
    elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
      _G["BigFatOrb_DisableMove"] = false
    elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
      SxOrb:EnableMove()
    elseif FileExist(LIB_PATH .. "SOW.lua") then
      SOWi.Move = true
    end
  end

  function DisableOrbwalkerAttacks()
    if _G.Reborn_Loaded then
      if _G.Reborn_Initialised then
        _G.AutoCarry.MyHero:AttacksEnabled(false)
      end
    elseif _G.MMA_Loaded then
      _G.MMA_StopAttacks(true)
    elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
      _G["BigFatOrb_DisableAttacks"] = true
    elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
      SxOrb:DisableAttacks()
    elseif FileExist(LIB_PATH .. "SOW.lua") then
      SOWi.Attacks = false
    end
  end

  function EnableOrbwalkerAttacks()
    if _G.Reborn_Loaded then
      if _G.Reborn_Initialised then
        _G.AutoCarry.MyHero:AttacksEnabled(true)
      end
    elseif _G.MMA_Loaded then
      _G.MMA_StopAttacks(false)
    elseif FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
      _G["BigFatOrb_DisableAttacks"] = false
    elseif FileExist(LIB_PATH .. "SxOrbWalk.lua") then
      SxOrb:EnableAttacks()
    elseif FileExist(LIB_PATH .. "SOW.lua") then
      SOWi.Attacks = true
    end
  end

  function Tick()
    if myHero.charName ~= "Blitzcrank" then Target = GetCustomTarget() end
    if Cfg.SWalkl ~= nil and not loadedOrb and Config.kConfig.Combo and not _G.Reborn_Initialised and not _G.MMA_Loaded then LoadOrb() RemoveOw() end
    Mobs:update()
    JMobs:update()

    for _=0,3 do
      sReady[_] = myHero:CanUseSpell(_) == READY
    end

    if myHero.charName ~= "Riven" then loadedClass:Killsteal() end

    if Target ~= nil or myHero.charName == "Blitzcrank" then 
      if Config.kConfig.Harrass and not Config.kConfig.Combo then
        loadedClass:Harrass()
      end

      if Config.kConfig.Combo then
        loadedClass:Combo()
      end
    end

    if myHero.charName ~= "Riven" then
      if Config.kConfig.LastHit or Config.kConfig.LaneClear then
        loadedClass:LastHit()
      end
    end

    if Config.kConfig.LaneClear then
      loadedClass:LaneClear()
    end

    if myHero.charName ~= "Nidalee" and myHero.charName ~= "Riven" then DmgCalc() end
  end

  function Draw()
    if myHero.charName == "Nidalee" or myHero.charName == "Riven" then return end
    if Config.Draws.Q and myHero:CanUseSpell(_Q) == READY then
      DrawLFC(myHero.x, myHero.y, myHero.z, myHero.charName == "Rengar" and myHero.range+myHero.boundingRadius*2 or data[0].range > 0 and data[0].range or data[0].width, ARGB(255*Config.Draws.OpacityQ/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100)))
    end
    if myHero.charName ~= "Orianna" then
      if Config.Draws.W and myHero:CanUseSpell(_W) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(data[1].range) == "function" and data[1].range() or data[1].range > 0 and data[1].range or data[1].width, ARGB(255*Config.Draws.OpacityW/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100)))
      end
      if Config.Draws.E and myHero:CanUseSpell(_E) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range > 0 and data[2].range or data[2].width, ARGB(255*Config.Draws.OpacityE/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100)))
      end
      if Config.Draws.R and (myHero:CanUseSpell(_R) == READY or myHero.charName == "Katarina") then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(data[3].range) == "function" and data[3].range() or data[3].range > 0 and data[3].range or data[3].width, ARGB(255*Config.Draws.OpacityR/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100)))
      end
    end
    --print(#objHolder)
    if objTrackList[myHero.charName] then
      if #objHolder > 0 then
        for _,obj in pairs(objHolder) do
          if obj ~= myHero then
            if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge then
              if objTimeHolder[obj.networkID]>GetInGameTimer() then 
                local barPos = WorldToScreen(D3DXVECTOR3(obj.x, obj.y, obj.z))
                local posX = barPos.x - 35
                local posY = barPos.y - 50
                if myHero.charName ~= "Azir" or Config.Draws.W then DrawText((math.floor((objTimeHolder[obj.networkID]-GetInGameTimer())*100)/100).."s", 25, posX, posY, ARGB(255, 255, 0, 0)) end
              else
                objHolder[obj.networkID] = nil
                objTimeHolder[obj.networkID] = nil
              end
            end
            width = myHero.charName == "Ekko" and obj.name == "Ekko" and data[3].width or (((myHero.charName == "Ekko" and obj.name:find("Ekko_Base_W")) or myHero.charName == "Azir") and data[1].width or data[0].width)
            if myHero.charName == "Ekko" then
              if obj.name == "Ekko" and Config.Draws.R then 
                DrawLFT(obj.x, obj.y, obj.z, width, ARGB(155, 155, 150, 250)) 
                DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
              elseif obj.name:find("Ekko_Base_Q") and Config.Draws.Q then 
                DrawLine3D(myHero.x, myHero.y, myHero.z, obj.x, obj.y, obj.z, 1, ARGB(255, 155, 150, 250)) 
                DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
              elseif Config.Draws.W then
                DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
              end
            elseif myHero.charName == "Orianna" then
              DrawCircle(obj.x-8, obj.y, obj.z+87, data[0].width-50, 0x111111)
              for i=0,2 do
                LagFree(obj.x-8, obj.y, obj.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (math.pi/4.5)*(i))
              end 
              LagFree(obj.x-8, obj.y, obj.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
            elseif myHero.charName ~= "Azir" or Config.Draws.W then
              DrawLFC(obj.x, obj.y, obj.z, width, ARGB(255, 155, 150, 250))
            end
          end
        end
      end
    end
    if Config.Draws.DMG then
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
        if Config.Misc.Ej then
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
            objHolder[object.networkID] = object
            objTimeHolder[object.networkID] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
          elseif myHero.charName ~= "Ahri" then
            objHolder[object.networkID] = object
            objTimeHolder[object.networkID] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
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
          objHolder[object.networkID] = nil
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
        ultTarget = Target
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
    if _G.MMA_Loaded and _G.MMA_Target() and _G.MMA_Target().type == myHero.type then return _G.MMA_Target() end
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

  function GetLineFarmPosition(range, width, source)
    local BestPos 
    local BestHit = 0
    source = source or myHero
    local objects = minionManager(MINION_ENEMY, range, source, MINION_SORT_HEALTH_ASC).objects
    for i, object in ipairs(objects) do
      local EndPos = Vector(source) + range * (Vector(object) - Vector(source)):normalized()
      local hit = CountObjectsOnLineSegment(source, EndPos, width, objects)
      if hit > BestHit then
        BestHit = hit
        BestPos = object
        if BestHit == #objects then
          break
        end
      end
    end
    return BestPos, BestHit
  end

  function CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
    local n = 0
    for i, object in ipairs(objects) do
      local pointSegment, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
      local w = width
      if isOnSegment and GetDistanceSqr(pointSegment, object) < w * w and GetDistanceSqr(StartPos, EndPos) > GetDistanceSqr(StartPos, object) then
        n = n + 1
      end
    end
    return n
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

  function ArrangeTSPriorities()
    local priorityTable2 = {
        p5 = {"Alistar", "Amumu", "Blitzcrank", "Braum", "ChoGath", "DrMundo", "Garen", "Gnar", "Hecarim", "JarvanIV", "Leona", "Lulu", "Malphite", "Nasus", "Nautilus", "Nunu", "Olaf", "Rammus", "Renekton", "Sejuani", "Shen", "Shyvana", "Singed", "Sion", "Skarner", "Taric", "Thresh", "Volibear", "Warwick", "MonkeyKing", "Yorick", "Zac"},
        p4 = {"Aatrox", "Darius", "Elise", "Evelynn", "Galio", "Gangplank", "Gragas", "Irelia", "Jax","LeeSin", "Maokai", "Morgana", "Nocturne", "Pantheon", "Poppy", "Rengar", "Rumble", "Ryze", "Swain","Trundle", "Tryndamere", "Udyr", "Urgot", "Vi", "XinZhao", "RekSai"},
        p3 = {"Akali", "Diana", "Fiddlesticks", "Fiora", "Fizz", "Heimerdinger", "Janna", "Jayce", "Kassadin","Kayle", "KhaZix", "Lissandra", "Mordekaiser", "Nami", "Nidalee", "Riven", "Shaco", "Sona", "Soraka", "Vladimir", "Yasuo", "Zilean", "Zyra"},
        p2 = {"Ahri", "Anivia", "Annie",  "Brand",  "Cassiopeia", "Ekko", "Karma", "Karthus", "Katarina", "Kennen", "LeBlanc",  "Lux", "Malzahar", "MasterYi", "Orianna", "Syndra", "Talon",  "TwistedFate", "Veigar", "VelKoz", "Viktor", "Xerath", "Zed", "Ziggs" },
        p1 = {"Ashe", "Caitlyn", "Corki", "Draven", "Ezreal", "Graves", "Jinx", "Kalista", "KogMaw", "Lucian", "MissFortune", "Quinn", "Sivir", "Teemo", "Tristana", "Twitch", "Varus", "Vayne"},
    }
     local priorityOrder = {
        [1] = {1,1,1,1,1},
        [2] = {1,1,2,2,2},
        [3] = {1,1,2,3,3},
        [4] = {1,2,3,4,4},
        [5] = {1,2,3,4,5},
    }
    local function _SetPriority(table, hero, priority)
        if table ~= nil and hero ~= nil and priority ~= nil and type(table) == "table" then
            for i=1, #table, 1 do
                if hero.charName:find(table[i]) ~= nil and type(priority) == "number" then
                    TS_SetHeroPriority(priority, hero.charName)
                end
            end
        end
    end
    for i=1, #table, 1 do

    end
    local enemies = #GetEnemyHeroes()
    if priorityTable2~=nil and type(priorityTable2) == "table" and enemies > 0 then
      for i, enemy in ipairs(GetEnemyHeroes()) do
        _SetPriority(priorityTable2.p1, enemy, math.min(1, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p2, enemy, math.min(2, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p3,  enemy, math.min(3, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p4,  enemy, math.min(4, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p5,  enemy, math.min(5, #GetEnemyHeroes()))
      end
    end
  end

  function DrawLFC(x, y, z, radius, color)
      if Config.Draws.LFC then
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
    if not Config.Draws.DMG or myHero.charName == "Rengar" then return end
    if myHero.charName == "Ryze" then loadedClass:DmgCalc() return end
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
          local damageW  = myHero.charName == "KogMaw" and 0 or (myHero.charName == "Azir" and loadedClass:CountSoldiers(enemy) or 1) * GetDmg(_W, myHero, enemy)
          local damageE  = GetDmg(_E, myHero, enemy)
          local damageR  = GetDmg(_R, myHero, enemy)*(myHero.charName == "Katarina" and 10 or 1)
          local damageRC  = (myHero.charName == "Orianna" and loadedClass:CalcRComboDmg(enemy) or 0)
          local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
          local damageS  = Smite and (20 + 8 * myHero.level) or 0
          local c = 0
          damageQ = myHero:CanUseSpell(_Q) == READY and damageQ or 0
          damageW = (myHero:CanUseSpell(_W) == READY or myHero.charName == "Azir") and damageW or 0
          damageE = myHero:CanUseSpell(_E) == READY and damageE or 0
          damageR = (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) and damageR or 0
          if myHero:CanUseSpell(_Q) == READY and damageQ > 0 then
            c = c + 1
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
          end
          if myHero:CanUseSpell(_W) == READY and damageW > 0 then
            c = c + 1
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."W"
          end
          if myHero:CanUseSpell(_E) == READY and damageE > 0 then
            c = c + 1
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."E"
          end
          if myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and damageR > 0 and myHero.charName ~= "Orianna" then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."R"
          end
          if myHero:CanUseSpell(_R) == READY and damageRC > 0 then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."RQ"
          end
          if enemy.health < (GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy)+damageRC+((myHero.charName == "Talon" and c > 0) and damageAA or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1) then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Killable"
          end
          if myHero.charName == "Teemo" and enemy.health > damageQ+damageE+damageAA then
            local neededAA = math.ceil((enemy.health) / (damageAA+damageE))
            neededAA = neededAA < 1 and 1 or neededAA
            killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
          elseif myHero.charName == "Ashe" or myHero.charName == "Vayne" then
            local neededAA = math.ceil((enemy.health-damageQ-damageW-damageE) / (damageAA))
            neededAA = neededAA < 1 and 1 or neededAA
            killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
          elseif enemy.health > (damageQ+damageW+damageE+damageR+(myHero.charName == "Talon" and damageAA*c/2 or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1) then
            local neededAA = math.ceil(100*((damageQ+damageW+damageE+damageR+(myHero.charName == "Talon" and damageAA*c/2 or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1))/(enemy.health))
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
      if GetMaladySlot() then
        APDmg = 15 + 0.15*AP
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

  function GetMaladySlot()
    for slot = ITEM_1, ITEM_7, 1 do
      if myHero:GetSpellData(slot).name and (string.find(string.lower(myHero:GetSpellData(slot).name), "malady")) then
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

  function GetClosestAlly()
    local ally = nil
    for v,k in pairs(GetAllyHeroes()) do
      if not ally then ally = k end
      if GetDistanceSqr(k) < GetDistanceSqr(ally) then
        ally = k
      end
    end
    return ally
  end

  function GetClosestEnemy(pos)
    local enemy = nil
    pos = pos or myHero
    for v,k in pairs(GetEnemyHeroes()) do
      if not enemy then enemy = k end
      if GetDistanceSqr(k, pos) < GetDistanceSqr(enemy, pos) then
        enemy = k
      end
    end
    return enemy
  end

  function EnemiesAroundAndFacingMe(Unit, range)
    local c=0
    if Unit == nil then return 0 end
    for i=1,heroManager.iCount do hero = heroManager:GetHero(i) 
      if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then pos, b = PredictPos(hero) if pos and GetDistance(pos, myHero) < GetDistance(hero, myHero) then c=c+1 end end end return c
  end

  function PredictPos(target,delay)
    if not target then return end
    delay = delay or 0
    speed = target.ms
    dir = GetTargetDirection(target)
    if dir and target.isMoving then
      return Vector(target)+Vector(dir.x, dir.y, dir.z):normalized()*speed/8+Vector(dir.x, dir.y, dir.z):normalized()*target.ms*delay, GetDistance(target.minBBox, target.pos)
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
-- }

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SAwareness - Inbuilt Awareness from here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "SAwareness"

  function SAwareness:__init()
    Cfg:addSubMenu("SAwareness", "SAwareness")
    self.Config = Cfg.SAwareness
    self.Config:addParam("i", "Cooldowns", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("cde", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("cda", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("i", "Waypoints", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("wpe", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("wpa", "Allies:", SCRIPT_PARAM_ONOFF, false)
    AddDrawCallback(function() self:Draw() end)
    return self
  end

  function SAwareness:Draw()
    local offset = 18
    local nextOffset = 0
    if self.Config.cde then
      for _,k in pairs(GetEnemyHeroes()) do
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", offset, drawPos[1]+nextOffset+i*offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + offset/2 end
              if cd > 99 then nextOffset = nextOffset + offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", offset, drawPos[1]+nextOffset+4*offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
    if self.Config.cda then
      for _,k in pairs(GetAllyHeroes()) do
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", offset, drawPos[1]+nextOffset+i*offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + offset/2 end
              if cd > 99 then nextOffset = nextOffset + offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", offset, drawPos[1]+nextOffset+4*offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
    if self.Config.wpe then
      for i, k in ipairs(GetEnemyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
            DrawLine3D(k.x, k.y, k.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(105, 255, 255, 255))
          end
          for i=k.pathIndex, k.pathCount-1 do
            local Path = k:GetPath(i)
            local Path2 = k:GetPath(i+1)
            DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(105, 255, 255, 255))
          end
        end
      end
    end
    if self.Config.wpa then
      for i, k in ipairs(GetAllyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
            DrawLine3D(k.x, k.y, k.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(105, 255, 255, 255))
          end
          for i=k.pathIndex, k.pathCount-1 do
            local Path = k:GetPath(i)
            local Path2 = k:GetPath(i+1)
            DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(105, 255, 255, 255))
          end
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SAwareness - Inbuilt Awareness till here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SAwareness - Inbuilt Awareness from here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "SEvade"

  function SEvade:__init()
    Cfg:addSubMenu("SEvade", "SEvade")
    self.Config = Cfg.SEvade
    self.Config:addParam("i", "Soon", SCRIPT_PARAM_INFO, "")
    return self
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SAwareness - Inbuilt Awareness till here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SWalk - Inbuilt OrbWalker from here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "SWalk"

  function SWalk:__init(m, a1, a2, a3)
    self.melee = m
    -- CastSpell(s, myHero:Attack(t)) and CastSpell(s)
      self.aaResetTable = a1
    -- CastSpell(s, x, z)
      self.aaResetTable2 = a2
    -- CastSpell(s, t)
      self.aaResetTable3 = a3
    self.State = {}
    self.orbTable = { lastAA = 0, windUp = 4, animation = 0.5 }
    self.myRange = myHero.range+myHero.boundingRadius
    if Cfg then
      Cfg:addSubMenu("SWalk", "SWalk")
      self.Config = Cfg.SWalk
    else
      self.Config = scriptConfig("SWalk", "SW"..myHero.charName)
    end
    self.Config:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -20, 20, 0)
    local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    if self.aaResetTable then
      for _,k in pairs(self.aaResetTable) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    if self.aaResetTable2 then
      for _,k in pairs(self.aaResetTable2) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    if self.aaResetTable3 then
      for _,k in pairs(self.aaResetTable3) do
        self.Config:addParam(str[k], "AA Reset with "..str[k], SCRIPT_PARAM_ONOFF, true)
      end
    end
    self.Config:addParam("i", "Use items", SCRIPT_PARAM_ONOFF, true)
    AddTickCallback(function() self:OrbWalk() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    if VIP_USER and self.melee then 
      self.Config:addParam("wtt", "Walk to Target", SCRIPT_PARAM_ONOFF, true) 
      if VIP_USER then
        self.Config:addParam("pc", "Use packet for animation cancel", SCRIPT_PARAM_ONOFF, true)
        AddRecvPacketCallback2(function(x) self:RecvPacket(x) end) 
      end
    end
    if self.aaResetTable or self.aaResetTable2 or self.aaResetTable3 then
      self.Config:addParam("aar", "Reset AA only in combo/harrass", SCRIPT_PARAM_ONOFF, true)
    end
    if not supported[myHero.charName] then
      self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
      Cfg:addSubMenu("Target Selector", "ts")
      Cfg.ts:addTS(self.ts)
      ArrangeTSPriorities()
      sReady = {}
      self.Config:addSubMenu("Key Settings", "kConfig")
      self.Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    else
      self.Config.kConfig = Cfg.Scriptology.kConfig
    end
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    return self
  end

  function SWalk:Draw()
    DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.range+myHero.boundingRadius, 1, ARGB(105,0,255,0), 32)
  end

  function SWalk:OrbWalk()
    if not supported[myHero.charName] and not ScriptologyLoaded and self.ts then self.ts:update() Target = self.ts.target end
    myRange = myHero.range+myHero.boundingRadius
    if self.Config.kConfig.LastHit then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      dmg = GetDmg("AD",myHero,self.Target)
      if self.Target and dmg and self.Target.health >= dmg then 
        if health >= dmg then
          self.Target = nil
        end
      end
      if health < 0 then self.Target = nil end
    end
    if self.Config.kConfig.LaneClear then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      if not self.Target then
        self.Target = GetJMinion(self.myRange)
      end
      dmg = GetDmg("AD",myHero,self.Target)
      if self.Target and dmg and health ~= self.Target.health and (health >= dmg or self.Target.health-health-dmg <= 0) then
        self.Target = nil
      end
      if health < 0 then self.Target = nil end
    end 
    if self.Config.kConfig.Harrass then
      self.Target = Target
    end
    if self.Config.kConfig.Combo then
      self.Target = Target
    end
    if (self.Forcetarget or Forcetarget or (loadedClass and loadedClass.Forcetarget)) and ValidTarget(self.Forcetarget, self.myRange*1.2) then
      self.Target = self.Forcetarget
    end
    if self:DoOrb() then
      if ScriptologyLoaded and loadedClass.Target then loadedClass.Target = self.Target end
      self:Orb(self.Target) 
    end
  end

  function SWalk:Orb(unit)
    if not ValidTarget(unit, myRange) then unit = Target end
    if os.clock() > self.orbTable.lastAA + self.orbTable.animation and ValidTarget(unit, myRange) then
      myHero:Attack(unit)
      if myHero.charName == "Kalista" then
        local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250 
        if self:DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
          myHero:MoveTo(movePos.x, movePos.z)
        end
      end
    elseif GetDistance(mousePos) > myHero.boundingRadius and (self.Config.pc and os.clock() > self.orbTable.lastAA or os.clock() > self.orbTable.lastAA + self.orbTable.windUp + self.Config.cadj/1000) then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and unit and ValidTarget(unit, myRange) and unit.type == myHero.type and self.melee and self.Config.wtt then
        if GetDistance(unit) > myHero.boundingRadius+unit.boundingRadius then
          myHero:MoveTo(unit.x, unit.z)
        end
      elseif self:DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function SWalk:DoOrb()
    if not supported[myHero.charName] then
      for _=0,3 do
        sReady[_] = myHero:CanUseSpell(_) == READY
      end
      self.State[_Q] = true
      self.State[_W] = true
      self.State[_E] = true
      self.IState = self.Config.kConfig.Combo or self.Config.kConfig.Harrass
      return self.Config.kConfig.Combo or self.Config.kConfig.Harrass or self.Config.kConfig.LastHit or self.Config.kConfig.LaneClear
    end
    if (myHero.charName == "Katarina" or myHero.charName == "Malzahar") and ultOn and ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead then return false end
    if self.Config.kConfig.Combo then
      self.IState = true
      return self:SetStates(Config.Combo)
    end
    if self.Config.kConfig.Harrass then
      self.IState = true
      return self:SetStates(Config.Harrass)
    end
    if self.Config.kConfig.LastHit then
      self.IState = false
      return self:SetStates(Config.LastHit)
    end
    if self.Config.kConfig.LaneClear then
      self.IState = false
      return self:SetStates(Config.LaneClear)
    end
    return false
  end

  function SWalk:GetLowestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = VP:GetPredictedHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800), self.orbTable.windUp)
      if minionTarget == nil then 
        minionTarget = minion
        health = hp
      elseif health >= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
      end
    end
    return minionTarget, health
  end

  function SWalk:SetStates(mode)
    self.State[_Q] = mode.Q
    self.State[_W] = mode.W
    self.State[_E] = mode.E
    if myHero.charName == "Rengar" and myHero.mana == 5 then
      self.State[_Q] = false
      self.State[_W] = false
      self.State[_E] = false
      if Config.Misc.Empower2 == 1 then
        self.State[_Q] = true
      elseif Config.Misc.Empower2 == 2 then
        self.State[_W] = true
      elseif Config.Misc.Empower2 == 3 then
        self.State[_E] = true
      end
    end
    return true
  end

  function SWalk:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and not self.Config.pc then
      if spell.name:lower():find("attack") then
        self.orbTable.windUp = myHero.charName == "Kalista" and 0 or spell.windUpTime
        self.orbTable.animation = myHero.charName == "Kalista" and 0 or spell.animationTime
        self.orbTable.lastAA = myHero.charName == "Kalista" and 0 or os.clock()
        DelayAction(function() self:WindUp(self.Target) end, 1 / (myHero.attackSpeed * 1 / (spell.windUpTime * myHero.attackSpeed)) - GetLatency() / 2000)
      end
    end
  end

  function SWalk:RecvPacket(p)
    if self.Config.pc and p.header == 0xD1 then
      self.orbTable.lastAA = 0
      self:WindUp(self.Target)
    end
  end

  function SWalk:WindUp(unit)
    if ValidTarget(unit) then
      local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
      if (self.Config.aar and self.IState or true) then
        if self.aaResetTable then
          for _,k in pairs(self.aaResetTable) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k)
              return
            end
          end
        end
        if self.aaResetTable2 then
          for _,k in pairs(self.aaResetTable2) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              if UPLloaded then
                Cast(k, unit, false, true, 1)
              else
                CastSpell(k, unit.x, unit.z)
              end
              return
            end
          end
        end
        if self.aaResetTable3 then
          for _,k in pairs(self.aaResetTable3) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if self.Config[str[k]] and sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, unit)
              return
            end
          end
        end
      end
      if self.IState and self.Config.i and self:CastItems(unit) then return end
    end
  end

  function SWalk:CastItems(unit)
    local i = {["ItemTiamatCleave"] = self.myRange, ["YoumusBlade"] = self.myRange}
    local u = {["ItemSwordOfFeastAndFamine"] = 600}
    for slot = ITEM_1, ITEM_6 do
      if i[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= i[myHero:GetSpellData(slot).name] then
        CastSpell(slot) 
        return true
      end
      if u[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= u[myHero:GetSpellData(slot).name] then
        CastSpell(slot, unit) 
        return true
      end
    end
    return false
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[[ SWalk - Inbuilt OrbWalker till here ]]--
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

-- -- Alerter Class
  -- written by Weee
  -- adjusted so it doesn't create a scriptConfig instance
  --[[
      PrintAlert(text, duration, r, g, b, sprite)           - Pushes an alert message (notification) to the middle of the screen. Together with first message it also adds a configuration menu to the scriptConfig.
                  text:   Alert text                        - <string>
  ]]

  local __mAlerter, __Alerter_OnTick, __Alerter_OnDraw = nil, nil, nil

  function PrintAlertRed(text, duration)
      if not __mAlerter then __mAlerter = __Alerter() end
      return __mAlerter:Push(text, duration, 255, 0, 0)
  end

  class("__Alerter")
  function __Alerter:__init()
      if not __Alerter_OnTick then
          function __Alerter_OnTick() if __mAlerter then __mAlerter:OnTick() end end
          AddTickCallback(__Alerter_OnTick)
      end
      if not __Alerter_OnDraw then
          function __Alerter_OnDraw() if __mAlerter then __mAlerter:OnDraw() end end
          AddDrawCallback(__Alerter_OnDraw)
      end

      self.yO = -WINDOW_H * 0.25
      self.x = WINDOW_W/2
      self.y = WINDOW_H/2 + self.yO
      self._alerts = {}
      self.activeCount = 0
      return self
  end

  function __Alerter:OnTick()
      self.yO = -WINDOW_H * 0.25
      self.x = WINDOW_W/2
      self.y = WINDOW_H/2 + self.yO
      --if #self._alerts == 0 then self:__finalize() end
  end

  function __Alerter:OnDraw()
      local gameTime = GetInGameTimer()
      for i, alert in ipairs(self._alerts) do
          self.activeCount = 0
          for j = 1, i do
              local cAlert = self._alerts[j]
              if not cAlert.outro then self.activeCount = self.activeCount + 1 end
          end
          if self.activeCount <= 3 and (not alert.playT or alert.playT + 0.5*2 + alert.duration > gameTime) then
              alert.playT = not alert.playT and self._alerts[i-1] and (self._alerts[i-1].playT + 0.5 >= gameTime and self._alerts[i-1].playT + 0.5 or gameTime) or alert.playT or gameTime
              local intro = alert.playT + 0.5 > gameTime
              alert.outro = alert.playT + 0.5 + alert.duration <= gameTime
              alert.step = alert.outro and math.min(1, (gameTime - alert.playT - 0.5 - alert.duration) / 0.5)
                      or gameTime >= alert.playT and math.min(1, (gameTime - alert.playT) / 0.5)
                      or 0
              local xO = alert.outro and self:Easing(alert.step, 0, 50) or self:Easing(alert.step, -50, 50)
              local alpha = alert.outro and self:Easing(alert.step, 255, -255) or self:Easing(alert.step, 0, 255)
              local yOffsetTar = GetTextArea(alert.text, 20).y * 1.2 * (self.activeCount-1)
              alert.yOffset = intro and alert.step == 0 and yOffsetTar
                      or #self._alerts > 1 and not alert.outro and (alert.yOffset < yOffsetTar and math.min(yOffsetTar, alert.yOffset + 0.5) or alert.yOffset > yOffsetTar and math.max(yOffsetTar, alert.yOffset - 0.5))
                      or alert.yOffset
              local x = self.x + xO
              local y = self.y - alert.yOffset
              -- outline:
              local o = 1--TODO
              if o > 0 then
                  for j = -o, o do
                      for k = -o, o do
                          DrawTextA(alert.text, 20, math.floor(x+j), math.floor(y+k), ARGB(alpha, 0, 0, 0), "center", "center")
                      end
                  end
              end
              -- sprite:
              if alert.sprite then
                  alert.sprite:SetScale(alert.spriteScale, alert.spriteScale)
                  alert.sprite:Draw(math.floor(x - GetTextArea(alert.text, 20).x/2 - alert.sprite.width * alert.spriteScale * 1.5), math.floor(y - alert.sprite.width * alert.spriteScale / 2), alpha)
              end
              -- text:
              DrawTextA(alert.text, 20, math.floor(x), math.floor(y), ARGB(alpha, alert.r, alert.g, alert.b), "center", "center")
          elseif alert.playT and alert.playT + 0.5*2 + alert.duration <= gameTime then
              table.remove(self._alerts, i)
          end
      end
  end

  function __Alerter:Push(text, duration, r, g, b, sprite)
      local alert = {}
      alert.text = text
      alert.sprite = sprite
      alert.spriteScale = sprite and 20 / sprite.height
      alert.duration = duration or 1
      alert.r = r
      alert.g = g
      alert.b = b

      alert.parent = self
      alert.yOffset = 0

      alert.reset = function(duration)
          alert.playT = GetInGameTimer() - 0.5
          alert.duration = duration or 0
          alert.yOffset = GetTextArea(alert.text, 20).y * (self.activeCount-1)
      end

      self._alerts[#self._alerts+1] = alert
      return alert
  end

  function __Alerter:Easing(step, sPos, tPos)
      step = step - 1
      return tPos * (step ^ 3 + 1) + sPos
  end

  function __Alerter:__finalize()
      __Alerter_OnTick = nil
      __Alerter_OnDraw = nil
      __mAlerter = nil
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.Orb = nil
    self.ultOn = 0
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    AddTickCallback(function() self:Tick() end)
    AddDrawCallback(function() self:Draw() end)
  end

  function Ahri:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
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
    if Config.Misc.Qc then self:CatchQ() end
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
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_Q].range)
      if minion and minion.health < GetDmg(_Q, myHero, minion) then 
        Cast(_Q, minion)
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetLineFarmPosition(data[_Q].range, data[_Q].width)
      if BestPos and BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      minion = GetClosestMinion(data[_W].range)
      if minion and minion.health < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      minion = GetLowestMinion(data[_E].range)
      if minion and minion.health < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_E] and Config.Combo.E and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if GetStacks(Target) > 0 then
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      self:CatchQ()
    end
    if Target.health < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    elseif self.ultOn > GetInGameTimer()-10 and (not self.Orb or self.Orb.time < GetInGameTimer()-1.5) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb and self.Orb.dir and self.Orb.time > GetInGameTimer()-1.5 then
      --DisableOrbwalkerMovement()
      local x,y,z = UPL.VP:GetLineCastPosition(Target, data[0].delay, data[0].width, data[0].range, data[0].speed, Vector(Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir))), data[0].collision)
      local x = Vector(self.Orb.dir)+(x-Vector(self.Orb.dir)):normalized()*(data[0].range)
      if self.ultOn > GetInGameTimer()-10 then
        x = Vector(x)-(Vector(Target)-myHero):normalized()*data[3].range
        Cast(_R,x)
      else
        --myHero:MoveTo(x.x,x.z)
      end
      if x and GetDistance(x) < 50  then
        --EnableOrbwalkerMovement()   
      end 
    else
      --EnableOrbwalkerMovement() 
    end
  end

  function Ahri:Harrass()
    if not Target then return end
    if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[2].range then
      Cast(_E, Target, false, true, 2)
    end
    if GetStacks(Target) > 0 then
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, false, true, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      self:CatchQ()
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)*2 and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.Q and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.W and ValidTarget(enemy, data[3].range) then
          Cast(_W)
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_W)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_Q, enemy, false, true, 1.5) Cast(_W) Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:AimR() end)
  end

  function Ashe:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("AimR", "Aim R", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
  end

  function Ashe:AimR()
    if Config.Misc.AimR then
      for _,k in pairs(GetEnemyHeroes()) do
        if not k.dead and GetDistance(k,mousePos) < 750 then
          Cast(_R, k, false, true, 2)
        end
      end
    end
  end

  function Ashe:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
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
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, data[1].range, player, MINION_SORT_HEALTH_ASC).objects) do
        local WMinionDmg = GetDmg(_W, myHero, minion)
        if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range+data[1].width) then
          Cast(_W, minion)
        end
      end    
    end  
  end

  function Ashe:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      if self:QReady() then
        Cast(_Q)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
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
    if Config.Combo.Q and ValidTarget(Target, data[0].range) then
      if self:QReady() then
        Cast(_Q)
      end
    end
    if Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
    if Config.Combo.R and GetDistance(Target) < myHero.range*2+myHero.boundingRadius*4 and GetDmg(_R, myHero, Target)+GetDmg("AD", myHero, Target)+GetDmg(_W, myHero, Target) < Target.health then
      Cast(_R, Target, false, true, 1.5)
    end
  end

  function Ashe:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      if self:QReady() then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
    if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
  end

  function Ashe:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and self:QReady() and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistance(enemy) < 2500 then
          Cast(_R, enemy, false, true, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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

class "Azir"

  function Azir:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[0].range, DAMAGE_MAGICAL)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.soldierToDash = nil
    self.Target = nil
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  end

  function Azir:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name == "AzirQ" then
        for _,obj in pairs(objHolder) do
          if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
            objTimeHolder[obj.networkID] = objTimeHolder[obj.networkID] + 1
          end
        end
      end
    end
  end

  function Azir:CountSoldiers(unit)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() and not (unit and GetDistance(obj, unit) > data[1].width) then 
        soldiers = soldiers + 1
      end
    end
    return soldiers
  end

  function Azir:GetSoldier(i)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
        soldiers = soldiers + 1
        if i == soldiers then return obj end
      end
    end
  end

  function Azir:GetSoldiers()
    soldiers = {}
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < math.huge and objTimeHolder[obj.networkID]>GetInGameTimer() then 
        table.insert(soldiers, obj)
      end
    end
    return soldiers
  end

  function Azir:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Azir:LastHit()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and ((Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, self.Target)
    end
    if ((Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) and self.Target and self:CountSoldiers() > 0 and GetDmg(_Q, myHero, self.Target)*self:CountSoldiers() > self.Target.health then
      Cast(_Q, self.Target)
    end
  end

  function Azir:LaneClear()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target)
    end
    if Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        pos, hit = GetLineFarmPosition(data[0].range,data[0].width,k)
        if pos and hit > 0 then
          Cast(_Q, pos)
        end
      end
    end
  end

  function Azir:Combo()
    if sReady[_W] and Config.Combo.W then
      Cast(_W, self.Target)
    end
    if Config.Combo.Q and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target, false, true, 1.5)
      end
    end
    if self.Target and Config.Combo.E and self.Target.health < GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      for _,k in pairs(self:GetSoldiers()) do
        local x, y, z = VectorPointProjectionOnLineSegment(myHero, k, self.Target)
        if x and y and z then
          Cast(_E,k,true)
        end
      end
    end
    if self.Target and Config.Combo.R and self.Target.health < GetDmg(_R,myHero,self.Target)+GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      Cast(_R,self.Target,false,true,2)
    end
  end

  function Azir:Harrass()
    if self:CountSoldiers() <= 1 and sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target)
    end
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target, false, true, 1.5)
      end
    end
  end

  function Azir:Flee()
    if self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        if not self.soldierToDash then
          self.soldierToDash = k
        elseif self.soldierToDash and GetDistanceSqr(k,mousePos) < GetDistanceSqr(self.soldierToDash,mousePos) then
          self.soldierToDash = k
        end
      end
    end
    if not self.soldierToDash and sReady[_W] then
      Cast(_W, mousePos)
    end
    if self:CountSoldiers() > 0 and self.soldierToDash then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * data[0].range
      if movePos then
        Cast(_Q, movePos)
        Cast(_E, self.soldierToDash, true)
        DelayAction(function() self.soldierToDash = nil end, myHero:GetSpellData(_E).currentCd)
      end
    end
  end

  function Azir:Insec()
    local enemy = GetClosestEnemy(mousePos)
    if not enemy then return end
    if GetDistance(enemy) > 750 then return end
    if self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        if not self.soldierToDash then
          self.soldierToDash = k
        elseif self.soldierToDash and GetDistanceSqr(k,enemy) < GetDistanceSqr(self.soldierToDash,enemy) then
          self.soldierToDash = k
        end
      end
    end
    if not self.soldierToDash and sReady[_W] then
      Cast(_W, enemy)
    end
    if self:CountSoldiers() > 0 and self.soldierToDash then
      local movePos = myHero + (Vector(enemy) - myHero):normalized() * data[0].range + (Vector(enemy) - myHero):normalized():perpendicular() * data[1].width
      if movePos then
        Cast(_Q, movePos)
        Cast(_E, self.soldierToDash, true)
        DelayAction(function() Cast(_R, enemy, false, true, 1) end, 1)
        DelayAction(function() self.soldierToDash = nil end, 2)
      end
    end
  end

  function Azir:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if self:CountSoldiers(enemy)*GetDmg(_W,myHero,enemy) > enemy.health and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          myHero:Attack(enemy)
        elseif (self:CountSoldiers(enemy)+1)*GetDmg(_W,myHero,enemy) > enemy.health and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          Cast(_W, enemy)
          myHero:Attack(enemy)
        elseif GetDmg(_R,myHero,enemy) > enemy.health and Config.Killsteal.R and GetDistance(enemy) < data[3].range then
          Cast(_R, enemy, false, true, 1)
        end
      end
    end
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
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    if Smite ~= nil then Config.Misc:addParam("S", "Smitegrab", SCRIPT_PARAM_ONOFF, true) end
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

    if target and myHero:CanUseSpell(_E) == READY and Config.Combo.E then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
        CastSpell(_E, myHero:Attack(target))
      end
    end

    if target and myHero:CanUseSpell(_R) == READY and Config.Combo.R then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
        CastSpell(_R)
      end
    end

    if target and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.2 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        local Mcol2, mcol2 = self.Col:GetMinionCollision(myHero, target)
        if not Mcol and not Mcol2 then
          CastSpell(_Q, CastPosition.x,  CastPosition.z)
        elseif Smite and Config.Misc.S and mcol+mcol2 == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = nil
          for _,k in pairs(Mobs.objects) do
            if not minion and k and GetDistanceSqr(k) < data[2].range*data[2].range then minion = k end
            if minion and k and GetDistanceSqr(k,myHero)+GetDistanceSqr(k,CastPosition) < GetDistanceSqr(minion,myHero)+GetDistanceSqr(minion,CastPosition) and GetDistanceSqr(k) < data[2].range*data[2].range then
              minion = k
            end
          end
          if minion then
            CastSpell(_Q, CastPosition.x,  CastPosition.z)
            DelayAction(function() CastSpell(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
  end

  function Blitzcrank:Harrass()
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
        CastSpell(_E, myHero:Attack(target))
      end
    end
    
    if target and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.5 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        local Mcol2, mcol2 = self.Col:GetMinionCollision(myHero, target)
        if not Mcol and not Mcol2 then
          CastSpell(_Q, CastPosition.x,  CastPosition.z)
        elseif Smite and Config.Misc.S and mcol+mcol2 == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = nil
          for _,k in pairs(Mobs.objects) do
            if not minion and k and GetDistanceSqr(k) < data[2].range*data[2].range then minion = k end
            if minion and k and GetDistanceSqr(k,myHero)+GetDistanceSqr(k,CastPosition) < GetDistanceSqr(minion,myHero)+GetDistanceSqr(minion,CastPosition) and GetDistanceSqr(k) < data[2].range*data[2].range then
              minion = k
            end
          end
          if minion then
            CastSpell(_Q, CastPosition.x,  CastPosition.z)
            DelayAction(function() CastSpell(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
  end

  function Blitzcrank:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range-enemy.boundingRadius) then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    
    if Config.Draws.Q and myHero:CanUseSpell(_Q) and target ~= nil then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Brand:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Brand:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion, true)
        end
      end
    end
  end

  function Brand:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
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
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
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
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
        Cast(_E, Target, true)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
        Cast(_W, Target, false, true, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
        Cast(_Q, Target, false, true, 1.5)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= Target.health or (EnemiesAround(Target, 500) > 1 and stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target, true)
    end
  end

  function Brand:Harrass()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harrass.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target, true)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, data[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target, false, true, 1.5)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harrass.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W, Target, false, true, 1.5)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target, false, true, 1.2)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, false, true, 2)
      end
    end
  end

  function Brand:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.lastE = 0
    AddTickCallback(function() self:LastHitSomethingPoisonedWithE() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
  end

  function Cassiopeia:ProcessSpell(unit, spell)
    if unit and unit.isMe then
      if spell.name == "CassiopeiaTwinFang" then
        self.lastE = GetInGameTimer() + (100+Config.Misc.Humanizer)/200
      end
    end
  end

  function Cassiopeia:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Misc:addParam("Humanizer", "Humanizer", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
  end

  function Cassiopeia:LastHitSomethingPoisonedWithE()
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E and not Config.kConfig.Combo and not Config.kConfig.Harrass then    
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
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E then    
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
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
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
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if self.lastE > GetInGameTimer() then return end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
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
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Combo.E and ValidTarget(Target, data[2].range) then
      if GetStacks(Target) > 0 then
        Cast(_E, Target, true)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) + 2*GetDmg(_E, myHero, Target) >= Target.health or (EnemiesAroundAndFacingMe(Target, 500) > 1 and GetStacks(Target) > 0)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target, true)
    end
  end

  function Cassiopeia:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and ValidTarget(Target, data[1].range) and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Harrass.E and ValidTarget(Target, data[2].range) and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      if GetStacks(Target) > 0 then
        Cast(_E, Target, true)
      end
    end
  end

  function Cassiopeia:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif enemy.health < GetDmg(_E, myHero, enemy)*2 and GetStacks(enemy) > 0 and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
          DelayAction(Cast, 0.55, {_E, enemy, true})
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Darius:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetQ", "Max Q range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
  end

  function Darius:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana)) then
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
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = self:GetDmg("W", myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, myHero.range+myHero.boundingRadius) then
          CastSpell(_W, myHero:Attack(winion))
        end
      end
    end
  end

  function Darius:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(0, data[0].width)
      if BestHit > 1 and GetDistance(BestPos) < 150 then 
        Cast(_Q)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then
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
      if myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) > Target.health+Target.shield and Config.Combo.R then
        Cast(_R, enemy, true)
      end
    end
  end

  function Darius:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY then
      self:CastQ(Target)
    end
    if Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY then
      self:CastW(Target)
    end
  end

  function Darius:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      local qDmg = ((GetDmg(_Q, myHero, enemy)*1.5) or 0) 
      local q1Dmg = ((GetDmg(_Q, myHero, enemy)) or 0)  
      local wDmg = ((GetDmg(_W, myHero, enemy)) or 0)   
      local rDmg = ((GetDmg(_R, myHero, enemy)) or 0)
      local iDmg = (50 + 20 * myHero.level) / 5
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:GetSpellData(_R).level == 3 and myHero:CanUseSpell(_R) and enemy.health+enemy.shield < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy, true)
        elseif myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < qDmg and Config.Killsteal.Q and ValidTarget(enemy, 450) then
          self:CastQ(enemy)
        elseif myHero:CanUseSpell(_Q) and enemy.health+enemy.shield < q1Dmg and Config.Killsteal.Q and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) and enemy.health+enemy.shield < wDmg and Config.Killsteal.W then
          if ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
            CastSpell(_W, myHero:Attack(enemy))
          elseif ValidTarget(enemy, data[2].range*(Config.Misc.offsetE/100)) then
            self:CastE(enemy)
            DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif myHero:CanUseSpell(_R) and enemy.health+enemy.shield < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          if ScriptologyDebug then print(rDmg)  end
          Cast(_R, enemy, true)
        elseif enemy.health+enemy.shield < iDmg and Config.Killsteal.I and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Darius:CastQ(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[0].width*(Config.Misc.offsetQ/100)-dist and GetDistance(target) >= 250 then
      Cast(_Q)
    end
  end

  function Darius:CastE(target) 
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < data[2].range*(Config.Misc.offsetE/100)-dist then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Ekko:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
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
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, winion)
        if QMinionDmg and QMinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range+myHero.range+myHero.boundingRadius) and GetDistance(winion) < data[2].range+myHero.range+myHero.boundingRadius then
          Cast(_E, winion)
        end
      end
    end
  end

  function Ekko:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      pos, hit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if hit > 1 then
        Cast(_Q, pos)
      end
    end
  end

  function Ekko:Combo()
    if Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.2)
    end
    if Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, false, true, 1)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target)
      end
    else
      if Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    end
  end

  function Ekko:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target)
      end
    else
      if Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target)
      end
    end
  end

  function Ekko:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 1.5, self:GetTwin())
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, myHero.range+myHero.boundingRadius, DAMAGE_MAGICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.soulMate = nil
    self.saveAlly = false
    AddTickCallback(function() self:Tick() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
  end

  function Kalista:ProcessSpell(unit, spell)
    if not unit or not spell or GetDistance(unit) > 1000 then return end
    if spell.name == "KalistaPSpellCast" then 
      self.soulMate = spell.target
      Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      ScriptologyMsg("Soulmate found: "..spell.target.charName)
    end
    if Config.Misc.R and self.saveAlly and unit.team ~= self.soulMate.team and (self.soulMate == spell.target or GetDistance(spell.endPos,self.soulMate) < self.soulMate.boundingRadius*3) then
      Cast(_R)
      ScriptologyMsg("Saving soulmate from spell: "..spell.name)
      self.saveAlly = false
    end
  end

  function Kalista:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("WallJump", "WallJump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ej", "Use E to steal Jungle", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("AAGap", "AAs as Gapcloser on minions", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("R", "Save ally with R (none bound)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rhp", "Save ally under X% hp", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
  end

  function Kalista:Tick()
    if Config.Misc.WallJump then
      CastSpell(_Q, mousePos.x, mousePos.z)
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
    if myHero:CanUseSpell(_E) and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E) or Config.Misc.Ej) then
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
          if (string.find(winion.charName, "Crab") or string.find(winion.charName, "Rift") or string.find(winion.charName, "Baron") or string.find(winion.charName, "Dragon") or string.find(winion.charName, "Gromp") or ((string.find(winion.charName, "Krug") or string.find(winion.charName, "Murkwolf") or string.find(winion.charName, "Razorbeak") or string.find(winion.charName, "Red") or string.find(winion.charName, "Blue")))) then
            if not string.find(winion.charName, "Mini") then       
              killableCounterJ = killableCounterJ + 1
            end
          end
        end
      end
      if (Config.kConfig.LaneClear and killableCounter >= Config.LaneClear.Ea) or (Config.kConfig.LastHit and killableCounter >= Config.LastHit.Ea) or (Config.Misc.Ej and killableCounterJ >= 1) then
        Cast(_E)
      end
    end
    if self.soulMate and self.soulMate.health/self.soulMate.maxHealth < Config.Misc.Rhp/100 then
      self.saveAlly = true
    else
      self.saveAlly = false
    end
    if Target and Config.kConfig.Combo and Config.Misc.AAGap and GetDistance(GetClosestEnemy()) > myHero.range+myHero.boundingRadius+Target.boundingRadius then
      local winion = GetLowestMinion(myHero.range+myHero.boundingRadius*2)  
      if winion ~= nil then
        myHero:Attack(winion)
        myHero:MoveTo(mousePos.x, mousePos.z)
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
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
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
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) and myHero.mana >= 85+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, data[2].range) then
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
      if killableCounter > 0 and GetStacks(Target) > 0 then
        Cast(_E)
      end
    end
  end

  function Kalista:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero.mana >= 85+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target, false, true, 1.2)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, data[2].range) then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Katarina"

  function Katarina:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST, 700, DAMAGE_MAGICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.Target = nil
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and string.find(string.lower(object.name), "ward") then
        table.insert(self.Wards, object)
      end
    end
    AddTickCallback(function() self:Tick() end)
    AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
  end

  function Katarina:Tick()
    if Config.Misc.Jump then self:WardJump() end
  end

  function Katarina:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Katarina:WardJump()
    if self.casted and self.jumped then self.casted, self.jumped = false, false
    elseif myHero:CanUseSpell(_E) == READY then
      local pos = self:getMousePos()
      if self:Jump(pos, 150, true) then return end
      slot = self:GetWardSlot()
      if not slot then return end
      CastSpell(slot, pos.x, pos.z)
    end
  end

  function Katarina:Jump(pos, range, useWard)
    for _,ally in pairs(GetAllyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
        CastSpell(_E, ally)
        self.jumped = true
        return true
      end
    end
    for _,ally in pairs(GetEnemyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
        CastSpell(_E, ally)
        self.jumped = true
        return true
      end
    end
    for minion,winion in pairs(minionManager(MINION_ALL, range, pos, MINION_SORT_HEALTH_ASC).objects) do
      if (GetDistance(winion, pos) <= range) then
        CastSpell(_E, winion)
        self.jumped = true
        return true
      end
    end
    table.sort(self.Wards, function(x,y) return GetDistance(x) < GetDistance(y) end)
    for i, ward in ipairs(self.Wards) do
      if (GetDistance(ward, pos) <= range) then
        CastSpell(_E, ward)
        self.jumped = true
        return true
      end
    end
  end

  function Katarina:CreateObj(obj)
    if obj ~= nil and obj.valid then
      if string.find(string.lower(obj.name), "ward") then
        table.insert(self.Wards, obj)
      end
    end
  end

  function Katarina:getMousePos(range)
    local MyPos = Vector(myHero.x, myHero.y, myHero.z)
    local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
    return MyPos - (MyPos - MousePos):normalized() * 700
  end

  function Katarina:GetWardSlot()
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (string.find(string.lower(myHero:GetSpellData(slot).name), "ward") or string.find(string.lower(myHero:GetSpellData(slot).name), "trinkettotem")) then
        return slot
      end
    end
    return nil
  end

  function Katarina:LastHit()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LastHit.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range and self.Target.health < GetDmg(_Q, myHero, self.Target) then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LastHit.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 and self.Target.health < GetDmg(_W, myHero, self.Target) then
      Cast(_W)
    end
    if Config.LastHit.E and sReady[_E] and GetDistance(self.Target) < data[2].range and self.Target.health < GetDmg(_E, myHero, self.Target) then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:LaneClear()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LaneClear.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LaneClear.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.LaneClear.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Combo()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Combo.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Combo.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Combo.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
    if Config.Combo.R and sReady[_R] and GetDistance(self.Target) < 200 and self.Target.health < GetDmg(_R, myHero, self.Target)*10 then
      Cast(_R)
    end
  end

  function Katarina:Harrass()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Harrass.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Harrass.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Harrass.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and GetDistance(enemy) < 700 then
        local dmg = 0
        if Config.Killsteal.Q and sReady[_Q] then
            dmg = dmg + GetDmg(_Q, myHero, enemy)
        end
        if Config.Killsteal.W and sReady[_W] then
            dmg = dmg + GetDmg(_W, myHero, enemy)
        end
        if Config.Killsteal.E and sReady[_E] then
            dmg = dmg + GetDmg(_E, myHero, enemy)
        end
        if dmg+((sReady[_Q] and Config.Killsteal.Q) and myHero:CalcMagicDamage(enemy,15*myHero:GetSpellData(_Q).level+0.15*myHero.ap) or 0)+((myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and Config.Killsteal.R) and GetDmg(_R, myHero, enemy)*10 or 0) >= enemy.health then
          if Config.Killsteal.Q and sReady[_Q] then
            Cast(_Q, enemy, true)
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy, true})
              if Config.Killsteal.W and sReady[_W] then
                DelayAction(function() Cast(_W) end, 0.5)
                if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.75)
                end
              end
            elseif Config.Killsteal.W and sReady[_W] then
              pos, b = PredictPos(enemy)
              if pos and GetDistance(pos) < data[1].range then
                DelayAction(function() Cast(_W) end, 0.25)
                if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.5)
                end
              end
            end
          elseif Config.Killsteal.E and sReady[_E] then
            Cast(_E, enemy, true)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] then
            pos, b = PredictPos(enemy)
            if pos and GetDistance(pos) < data[1].range then
              Cast(_W)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.25)
              end
            end
          elseif GetDistance(enemy) < 250 and Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
            Cast(_R)
          end
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "KogMaw"
  
  function KogMaw:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:Tick() end)
  end

  function KogMaw:Tick()
    self.ts.range = 900+myHero:GetSpellData(_R).level*300
  end

  function KogMaw:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function KogMaw:LastHit()
    local minionTarget = GetLowestMinion(math.min(data[0].range, data[1].range()))
    if not minionTarget then return end
    if GetDmg(_Q, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_Q, minionTarget, false, true, 2)
    elseif GetDmg(_W, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, myHero:Attack(minionTarget))
    elseif GetDmg(_E, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_E, minionTarget2, false, true, 2)
    end
  end

  function KogMaw:LaneClear()
    local minionTarget = GetLowestMinion(math.min(data[0].range, data[1].range()))
    if minionTarget then
      if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, minionTarget, false, true, 2)
      end
      if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W, myHero:Attack(minionTarget))
      end
    end
    minionTarget = GetLineFarmPosition(data[2].range, data[2].width)
    if minionTarget then
      if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, minionTarget, false, true, 2)
      end
    end
  end

  function KogMaw:Combo()
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target, false, true, 2)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W, myHero:Attack(Target))
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target, false, true, 2)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
      Cast(_R, Target, false, true, 2)
    end
  end

  function KogMaw:Harrass()
    if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, false, true, 2)
    end
    if Config.Harrass.W and myHero:CanUseSpell(_W) == READY and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, myHero:Attack(Target))
    end
    if Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      Cast(_E, Target, false, true, 2)
    end
  end

  function KogMaw:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_E, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_Q, enemy, false, true, 1.2) DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
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
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function LeeSin:InsecTicker()
    if Config.Misc.Insec then
      self:Insec()
    end
    if Config.Misc.Jump then
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
    if ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) and myHero:CanUseSpell(_Q) == READY then
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
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and myHero:CanUseSpell(_W) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health+winion.shield and ValidTarget(winion, 300) then
          Cast(_E)
        end
      end
    end
  end

  function LeeSin:LaneClear()
    if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY then
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
    if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+self:QDmg(enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
          DelayAction(function() if not self:IsFirstCast(_Q) then Cast(_Q) end end, data[0].delay+GetDistance(enemy, myHero.pos)/data[0].speed)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].width) then
          Cast(_E, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:DetonateE() end)
    AddProcessSpellCallback(function(x,y) self:ShieldManager(x,y) end)
  end

  function Lux:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("Wa", "Shield with W (auto)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("manaW", "Min Mana % for shield", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Misc:addParam("Ea", "Detonate E (auto)", SCRIPT_PARAM_ONOFF, true)
  end

  function Lux:DetonateE()
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" and Config.Misc.Ea then
      Cast(_E)
    end
  end

  function Lux:ShieldManager(unit, spell)
    if Config.Misc.Wa and not unit.isMe and unit.team ~= myHero.team and not IsRecalling(myHero) and Config.Misc.manaW <= 100*myHero.mana/myHero.maxMana then
      if spell.target and spell.target.isMe then
        if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      elseif GetDistance(spell.endPos) < GetDistance(myHero.pos, myHero.minBBox) then
        if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      end
    end
  end

  function Lux:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
          Cast(_Q, winion, false, true, 2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= minion.health and ValidTarget(minion, data[2].range) then
          Cast(_E, winion, true)
        end
      end
    end 
  end

  function Lux:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetLowestMinion(data[_Q].range)
      if minionTarget ~= nil then
        Cast(_Q, minionTarget)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_E].range, data[_E].width)
      if BestHit > 1 then 
        Cast(_E, BestPos)
      end
    end  
  end

  function Lux:Combo()
    if GetStacks(Target) > 0 and Config.Combo.R and myHero:CanUseSpell(_R) == READY and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= Target.health then
      Cast(_R, Target, false, true, 2)
    end
    if timeToShoot() then
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY then
        Cast(_Q, Target, false, true, 2)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target, false, true, 1.5)
      end
      if Config.Combo.R and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) >= Target.health then
        Cast(_R, Target, false, true, 2)
      end
    end
  end

  function Lux:Harrass()
    if GetStacks(Target) == 0 then
      if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, false, true, 2)
      end
      if Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target, false, true, 1.5)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_E, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_Q, enemy, false, true, 1.2) DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.2)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
          DelayAction(function() Cast(_R, enemy, false, true, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, false, true, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:OrbWalk() end)
  end

  function Malzahar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Malzahar:OrbWalk()
    if (Config.kConfig.Harrass or Config.kConfig.Combo or Config.kConfig.LastHit or Config.kConfig.LaneClear) and heroCanMove() and GetDistance(mousePos, myHero.pos) > myHero.boundingRadius then
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
  end

  function Malzahar:LastHit()
    if timeToShoot() then
      if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
        for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
          local QMinionDmg = GetDmg(_Q, myHero, minion)
          if QMinionDmg >= minion.health and ValidTarget(minion, data[0].range) then
            Cast(_Q, minion, false, true, 1.2)
          end
        end
      end
      if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then    
        for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
          local WMinionDmg = GetDmg(_W, myHero, minion)      
          if WMinionDmg >= minion.health and ValidTarget(minion, data[1].range) then
            Cast(_W, minion, false, true, 1.5)
          end      
        end    
      end  
      if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
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
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[0].range)
        if minionTarget ~= nil then
          Cast(_Q, minionTarget, false, true, 1.2)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
        if BestHit > 1 then 
          Cast(_W, BestPos)
        end
      end  
      if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
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
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, false, true, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, false, true, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target, true)
      end
      if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
        Cast(_R, Target, true)
      end
    end
    if timeToShoot() and GetDistance(Target) < myHero.range+myHero.boundingRadius*2 then
      myHero:Attack(Target)
    end
  end

  function Malzahar:Harrass()
    if timeToShoot() then
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, false, true, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, false, true, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_W, Target, true)
      end
    end
    if timeToShoot() and GetDistance(Target) < myHero.range+myHero.boundingRadius*2 then
      myHero:Attack(Target)
    end
  end

  function Malzahar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)*2.5 and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
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
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Eas", "Heal with E (self)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("Eaa", "Heal with E (allies)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("manaEs", "Mana E (self)", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
    Config.Misc:addParam("healthEs", "Health E (self)", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addParam("manaEa", "Mana E (allies)", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Misc:addParam("healthEa", "Health E (allies)", SCRIPT_PARAM_SLICE, 35, 0, 100, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
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
    if not IsRecalling(myHero) and self:IsHuman() and Config.Misc.Eas and Config.Misc.manaEs <= myHero.mana/myHero.maxMana*100 and myHero.maxHealth-myHero.health > 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and myHero.health/myHero.maxHealth <= Config.Misc.healthEs/100 then
      Cast(_E, myHero, true)
    end
    if not IsRecalling(myHero) and self:IsHuman() and Config.Misc.Eaa and Config.Misc.manaEa <= myHero.mana/myHero.maxMana*100 then
      for _,k in pairs(GetAllyHeroes()) do
        if GetDistance(k) < self.data.Human[2].range and k.maxHealth-k.health < 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and k.health/k.maxHealth <= Config.Misc.healthEa/100 then
          Cast(_E, k, true)
        end
      end
    end
  end

  function Nidalee:Flee()
    if Config.Misc.Flee then
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
      if Config.Draws.Q and myHero:CanUseSpell(_Q) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[0].range, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.W and myHero:CanUseSpell(_W) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[1].range, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.E and myHero:CanUseSpell(_E) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[2].range, ARGB(255, 155, 155, 155))
      end
    else
      if Config.Draws.Q and myHero:CanUseSpell(_Q) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self:GetAARange(), ARGB(255, 155, 155, 155))
      end
      if Config.Draws.W and myHero:CanUseSpell(_W) == READY then
        local drawPos = self:getMousePos()
        local barPos = WorldToScreen(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width/3, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawText("W Jump", 15, barPos.x, barPos.y, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.E and myHero:CanUseSpell(_E) == READY then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Cougar[2].range, ARGB(255, 155, 155, 155))
      end
    end
    if Config.Draws.DMG then
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
    if not Config.Draws.DMG then return end
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
    if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and Config.Combo.Q and ValidTarget(Target, data[0].range) then
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
    if not unit then return end
    if unit and myHero:CanUseSpell(_R) == READY and GetStacks(unit) > 0 and self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.R then
      Cast(_R)
    end
    if unit and myHero:CanUseSpell(_W) == READY and GetStacks(unit) > 0 and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.W then
      Cast(_W, unit)
    end
    if unit and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range <= 0 then
      if unit and self:GetDmg(_Q,unit) >= unit.health and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q, myHero:Attack(unit))
      elseif unit and self:GetRWEQComboDmg(unit,-self:GetDmg(_W,unit)) >= unit.health then
        if unit and myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit)
        end
        if unit and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY and Config.Combo.Q and Config.Combo.E then
          CastSpell(_Q, myHero:Attack(unit))
        end
        if unit and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q, myHero:Attack(unit))
        end
      elseif unit then
        if unit and myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit)
        end
        if unit and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
          CastSpell(_Q, myHero:Attack(unit))
        end
      end
      if unit and myHero:CanUseSpell(_W) == READY and Config.Combo.W then
        if unit and GetDistance(unit) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(unit) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
          Cast(_W, unit)
        end
      end
    end
  end

  function Nidalee:GetRWEQComboDmg(target,damage)
    if not target then return end
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
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, self.data.Human[0].range) then
        Cast(_Q, Target, false, true, 2)
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, self:GetAARange()) then
        CastSpell(_Q, myHero:Attack(Target))
      end
      if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, self.data.Cougar[2].range) then
        Cast(_E, Target)
      end
    end
  end

  function Nidalee:LastHit()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LastHit.Q and ValidTarget(Target, data[0].range) then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
          Cast(_Q, myHero:Attack(minionTarget))
        end
      end
    end
  end

  function Nidalee:LaneClear()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
          Cast(_Q, myHero:Attack(minionTarget))
        end
        minionTarget = GetJMinion(self:GetAARange())
        if minionTarget then
          Cast(_Q, myHero:Attack(minionTarget))
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W then
        local pos, hit = GetFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          Cast(_W, pos)
        end
        local pos, hit = GetJFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          Cast(_W, pos)
        end
      end
      if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E then
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
      if enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and enemy.health < self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
        if myHero:CanUseSpell(_Q) == READY and not self:IsHuman() and enemy.health < self:GetDmg(_Q, enemy, true) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          local pos, chance, ppos = UPL:Predict(_Q, myHero, enemy)
          if chance >= 2 then
            Cast(_R)
            DelayAction(function() Cast(_Q, enemy, false, true, 1.5) end, 0.125)
          end
        end
        if not self:IsHuman() and EnemiesAround(enemy, 500) < 3 then
          if myHero:CanUseSpell(_Q) == READY and enemy.health < self:GetDmg(_Q, enemy) and Config.Killsteal.Q and ValidTarget(enemy, self:GetAARange()) then
            Cast(_Q, myHero:Attack(enemy))
          end
          if myHero:CanUseSpell(_W) == READY and enemy.health < self:GetDmg(_W, enemy) and Config.Killsteal.W then
            if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
              Cast(_W, enemy)
            end
          end
          if myHero:CanUseSpell(_E) == READY and enemy.health < self:GetDmg(_E, enemy) and Config.Killsteal.E and ValidTarget(enemy, self.data.Cougar[2].range) then
            Cast(_E, enemy)
          end
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and self:IsHuman() and enemy.health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_Q, enemy, false, true, 1.2)
          DelayAction(function() self:DoRWEQCombo(enemy) end, 0.05+self.data.Human[0].delay+GetDistance(enemy)/self.data.Human[0].speed)
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and not self:IsHuman() and enemy.health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
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
    if Config.Misc.Ra then
      local enemies = 0
      if objHolder["TheDoomBall"] then
        enemies = EnemiesAround(objHolder["TheDoomBall"], data[3].width-myHero.boundingRadius)
      else
        enemies = EnemiesAround(myHero, data[3].width-myHero.boundingRadius)
      end
      if enemies >= Config.Misc.Re then
        CastSpell(_R)
      end
    end
  end

  function Orianna:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, 0, 1, #GetEnemyHeroes(), 0)
  end

  function Orianna:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, false, true, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
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
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_W].width)
      if BestHit > 1 and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"], BestPos) < 50 then 
        Cast(_W)
      end
    end
  end

  function Orianna:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
      if objHolder["TheDoomBall"] then Cast(_Q, Target, false, true, 1.5, objHolder["TheDoomBall"]) else Cast(_Q, Target, false, true, 1.5, myHero) end
    end
    if myHero:CanUseSpell(_W) == READY and Config.Combo.W then
      self:CastW(Target)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
      Cast(_E, myHero, true)
    end
    if myHero:CanUseSpell(_R) == READY and Target.health < self:CalcRComboDmg(Target) and Config.Combo.R then
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
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      if objHolder["TheDoomBall"] then Cast(_Q, Target, false, true, 1.5, objHolder["TheDoomBall"]) else Cast(_Q, Target, false, true, 1.5, myHero) end
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:CastW(Target)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, Target) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius >= GetDistance(Target) then
      Cast(_E, myHero, true)
    end
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local Ball = objHolder["TheDoomBall"] or myHero
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, Target, false, true, 1.5, Ball)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W then
          self:CastW(enemy)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and objHolder["TheDoomBall"] and GetDistance(objHolder["TheDoomBall"]) > 150 and VectorPointProjectionOnLineSegment(objHolder["TheDoomBall"], myHero, enemy) and GetDistance(objHolder["TheDoomBall"])-objHolder["TheDoomBall"].boundingRadius > GetDistance(enemy) then
          Cast(_E, myHero)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
          self:CastR(enemy)
          DelayAction(Cast, data[3].delay, {_Q, Target, false, true, 1.5, Ball})
          DelayAction(function() self:CastW(enemy) end, data[3].delay+data[0].delay+GetDistance(Ball,enemy)/data[0].speed)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.lastEmpChange = 0
    self.Target = nil
    self.keyStr = {[0] = "Q", [1] = "W", [2] = "E"}
    AddTickCallback(function() self:Tick() end)
    AddMsgCallback(function(x,y) self:Msg(x,y) end)
    AddAnimationCallback(function(x,y) self:Animation(x,y) end)
    AddProcessSpellCallback(function(unit,spell) self:ProcessSpell(unit,spell) end)
  end

  function Rengar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Combo:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("Empower", "Empower", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    Config.Misc:addParam("Empower2", "Active Empower: ", SCRIPT_PARAM_LIST, 1, {"Q", "W", "E"})
  end

  function Rengar:Tick()
    if Config.Misc.Empower and self.lastEmpChange < GetInGameTimer() then
      self.lastEmpChange = GetInGameTimer() +0.33
      Config.Misc.Empower = false
      local os = Config.Misc.Empower2
      Config.Misc.Empower2 = Config.Misc.Empower2 + 1
      if Config.Misc.Empower2 == 4 then Config.Misc.Empower2 = 1 end
      if os ~= Config.Misc.Empower2 then
        PrintAlertRed("Switched Empoweredmode! Now using: "..self.keyStr[Config.Misc.Empower2-1])
      end
    end
    if not self.Target then
      self.ts:update()
      self.Target = self.ts.target
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

  function Rengar:Animation(unit, ani)
    if unit and unit.isMe and ani then
      if ani == "Spell5" and loadedOrb:DoOrb() then
        if self.Target and Smite ~= nil and Config.Combo.S then CastSpell(Smite, self.Target) end
        if self.Target and Ignite ~= nil and Config.Combo.I then CastSpell(Ignite, self.Target) end
        loadedOrb.orbTable.lastAA = 0
        loadedOrb.orbTable.windUp = 0.01
        if (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harrass and Config.Harrass.E) then DelayAction(function() if self.Target then CastSpell(_E, self.Target.x, self.Target.z) end end, 0.39 - GetLatency() / 2000) end
        DelayAction(function() loadedOrb:WindUp(unit) end, 1 / (myHero.attackSpeed) - GetLatency() / 2000)
      end
    end
  end

  function Rengar:ProcessSpell(unit,spell)
    if unit and unit.isMe and spell and loadedOrb:DoOrb() then
      if spell.name:lower():find("rengare") and (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harrass and Config.Harrass.W) then
        loadedOrb.orbTable.lastAA = 0
        Cast(_W)
      end
    end
  end

  function Rengar:CastItems(unit)
    local i = {["ItemTiamatCleave"] = self.orbTable.range, ["YoumusBlade"] = self.orbTable.range}
    local u = {["ItemSwordOfFeastAndFamine"] = 600}
    for slot = ITEM_1, ITEM_6 do
      if i[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= i[myHero:GetSpellData(slot).name] then
        CastSpell(slot) 
      end
      if u[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= u[myHero:GetSpellData(slot).name] then
        CastSpell(slot, unit)
      end
    end
  end

  function Rengar:Combo()
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 2 then
        Cast(_W, self.Target, false, true, 1)
      elseif Config.Misc.Empower2 == 2 then
        Cast(_E, self.Target, false, true, 2)
      end
    else
      if Config.Combo.W and sReady[_W] then
        Cast(_W, self.Target, false, true, 1)
      end
      if Config.Combo.E and sReady[_E] then
        Cast(_E, self.Target, false, true, 1)
      end
    end
  end

  function Rengar:Harrass()
  end

  function Rengar:LastHit()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.Q then
        local minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius*2)
        if minionTarget ~= nil and minionTarget.health < GetDmg(_Q, myHero, minionTarget) then
          CastSpell(_Q, myHero:Attack(minionTarget))
        end
      end
      if Config.LaneClear.W then
        local minionTarget = GetLowestMinion(data[1].range)
        if minionTarget ~= nil and minionTarget.health < GetDmg(_W, myHero, minionTarget) then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil and minionTarget.health < GetDmg(_E, myHero, minionTarget) then
          Cast(_E, minionTarget, false, true, 1)
        end
      end
    end
  end

  function Rengar:LaneClear()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.Q then
        local minionTarget = GetLowestMinion(myHero.range+myHero.boundingRadius*2)
        if minionTarget ~= nil then
          CastSpell(_Q, myHero:Attack(minionTarget))
        end
      end
      if Config.LaneClear.W then
        local pos, hit = GetFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, false, true, 1)
        end
      end
    end
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.Q then
        local minionTarget = GetJMinion(myHero.range+myHero.boundingRadius*2)
        if minionTarget ~= nil then
          CastSpell(_Q, myHero:Attack(minionTarget))
        end
      end
      if Config.LaneClear.W then
        local pos, hit = GetJFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetJMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, false, true, 1)
        end
      end
    end
  end

  function Rengar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, false, true, 1)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Riven"

  function Riven:__init()
    self.ts = TargetSelector(TARGET_NEAR_MOUSE, 930, DAMAGE_PHYSICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.Target = Target
    self.QState = false
    self.WState = false
    self.QCast  = 0
    self.movePos = nil
    self.rNow   = false
    self.orbTable = { QDelay = 0, EDelay = 0, lastAA = 0, lastAction = 0, minionAA = 0, windUp = 3.75, animation = 0.625, range = myHero.range + myHero.boundingRadius, trueRange = myHero.range + GetDistance(myHero.minBBox) + 1 }
    AddDrawCallback(function() self:Draw() end)
    AddTickCallback(function() self:Tick() end)
    AddTickCallback(function() self:OrbWalk() end)
    AddAnimationCallback(function(unit,ani) self:Animation(unit,ani) end)
    AddProcessSpellCallback(function(unit,spell) self:ProcessSpell(unit,spell) end)
    AddMsgCallback(function(x,y) self:Msg(x,y) end)
    if VIP_USER then AddRecvPacketCallback2(function(p) self:RecvPacket(p) end) end
  end

  function Riven:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Wa", "Auto stun with W", SCRIPT_PARAM_ONKEYDOWN, true)
    Config.Misc:addParam("Wae", "Auto stun if X enemies", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Riven:Msg(Msg, Key)
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

  function Riven:Draw()
    DrawLFC(myHero.x, myHero.y, myHero.z, self.orbTable.range, ARGB(255,255,255,255))
    if Config.Draws.Q and sReady[_Q] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[0].range, ARGB(105,155,155,155))
    end
    if Config.Draws.W and sReady[_W] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[1].range, ARGB(105,155,155,155))
    end
    if Config.Draws.E and sReady[_E] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[2].range, ARGB(255,255,255,255))
    end
    if Config.Draws.R and sReady[_R] then
      DrawLFC(myHero.x, myHero.y, myHero.z, data[3].range, ARGB(255,255,255,255)) 
    end
    if self.movePos then
      local color = IsWall(D3DXVECTOR3(self.movePos.x,self.movePos.y,self.movePos.z)) and ARGB(255,255,0,0) or ARGB(255,255,255,255)
      DrawCircle(self.movePos.x, self.movePos.y, self.movePos.z, 75, color) 
      self.movePos = nil
    end
    if Config.Draws.DMG then
      for i,k in pairs(GetEnemyHeroes()) do
        local enemy = k
        if ValidTarget(enemy) then
          local barPos = WorldToScreen(D3DXVECTOR3(enemy.x, enemy.y, enemy.z))
          local posX = barPos.x - 35
          local posY = barPos.y - 50
          DrawText(killTextTable[enemy.networkID].indicatorText, 18, posX, posY, ARGB(255, 250, 255, 250))
          DrawText(killTextTable[enemy.networkID].damageGettingText, 15, posX, posY + 15, ARGB(255, 255, 50, 50))
        end
      end
    end
  end

  function Riven:Tick()
    self.orbTable.range = myHero.range + myHero.boundingRadius
    self.orbTable.trueRange = myHero.range + GetDistance(myHero.minBBox) + 1
    if Config.Misc.Flee then
      myHero:MoveTo(mousePos.x, mousePos.z)
      if sReady[_E] then
        Cast(_E, mousePos)
      end
      if not sReady[_E] and sReady[_Q] and self.orbTable.EDelay + 350 < GetTickCount() then
        Cast(_Q, mousePos)
      end
    end
    if Config.Misc.Jump then
      self.jumpPos = myHero + (Vector(mousePos) - myHero):normalized() * 50
      self.movePos = myHero + (Vector(mousePos) - myHero):normalized() * 225
      if self.QCast < 2 then
        Cast(_Q, myHero)
      end
      if not IsWall(D3DXVECTOR3(self.jumpPos.x,self.jumpPos.y,self.jumpPos.z)) then
        myHero:MoveTo(self.movePos.x, self.movePos.z)
      else
        if sReady[_Q] then
          Cast(_Q, mousePos)
        end
      end
    end
    self:AutoW()
    self:DmgCalc()
  end

  function Riven:DmgCalc()
    if not Config.Draws.DMG then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageC  = self:CalcComboDmg(enemy, 0, not Config.Combo.R)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        if enemy.health < damageC+damageI then
          killTextTable[enemy.networkID].indicatorText = "Kill!!"
        else
          local neededAA = math.floor(100 * (damageC+damageI) / (enemy.health))
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

  function Riven:DmgP(unit, ad)
    return myHero:CalcDamage(unit, 5+math.max(5*math.floor((myHero.level+2)/3)+10,10*math.floor((myHero.level+2)/3)-15)*ad/100)
  end

  function Riven:RecvPacket(p)
    if p.header == 209 and self:DoOrb() then
      self:CastDance()
      self:WindUp(myHero)
    end
  end

  function Riven:CalcComboDmg(target, damage, disableUlt)
    local unit = {pos = target.pos, armor = target.armor, magicArmor = target.magicArmor, maxHealth = target.maxHealth, health = target.health}
    local dmg = damage or 0
    local ad = myHero.totalDamage*((disableUlt and (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine")) and 1 or 1.2)
    local me = {ap = myHero.ap, level = myHero.level, totalDamage = ad, armorPen = myHero.armorPen, armorPenPercent = myHero.armorPenPercent, magicPen = myHero.magicPen, magicPenPercent = myHero.magicPenPercent}
    if sReady[_Q] then
      dmg = dmg + GetDmg(_Q,me,unit)*3+GetDmg("Tiamat",me,unit)+GetDmg("AD",me,unit)*3+self:DmgP(target, ad)*3
    end
    if sReady[_W] then
      dmg = dmg + GetDmg(_W,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
    end
    if (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine") and not disableUlt then
      unit.health = unit.health-dmg
      dmg = dmg + GetDmg(_R,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
    end
    return dmg
  end

  function Riven:OrbWalk()
    if Config.kConfig.LastHit then
      self.Target = GetLowestMinion(500)
      if self.Target and self.Target.health > GetDmg("AD",myHero,self.Target) then
        self.Target = nil
      end
      if not self.Target then
        self.Target = GetJMinion(500)
      end
    end
    if Config.kConfig.LaneClear then
      self.Target = GetLowestMinion(500)
      if not self.Target then
        self.Target = GetJMinion(500)
      end
    end
    if Config.kConfig.Harrass then
      self.Target = Target
    end
    if Config.kConfig.Combo then
      self.Target = Target
    end
    if self.Forcetarget and ValidTarget(self.Forcetarget, self.orbTable.trueRange + 40) then
      self.Target = self.Forcetarget
    end
    if self:DoOrb() then self:Orb(self.Target) end
  end

  function Riven:Orb(unit)
    if not ValidTarget(unit, self.orbTable.trueRange + 40) then
      unit = Target
    end
    if os.clock() > self.orbTable.lastAA + 1 / (myHero.attackSpeed * self.orbTable.animation) - 0.07 and ValidTarget(unit, self.orbTable.trueRange + 40) then
      myHero:Attack(unit)
    elseif GetDistance(mousePos) > myHero.boundingRadius and os.clock() > self.orbTable.lastAction + 1 / (myHero.attackSpeed * self.orbTable.windUp) + self.orbTable.minionAA then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and unit and ValidTarget(unit, self.orbTable.trueRange) and unit.type == myHero.type then
        myHero:MoveTo(unit.x, unit.z)
      elseif GetDistance(mousePos) > 50 then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function Riven:DoOrb()
    if Config.kConfig.Combo then
      self.QState = Config.Combo.Q
      self.WState = Config.Combo.W
      self.IState = true
      self.orbTable.minionAA = 0
      return true
    end
    if Config.kConfig.Harrass then
      self.QState = Config.Harrass.Q
      self.WState = Config.Harrass.W
      self.IState = true
      self.orbTable.minionAA = 0
      return true
    end
    if Config.kConfig.LastHit then
      self.QState = Config.LastHit.Q
      self.WState = Config.LastHit.W
      self.IState = false
      self.orbTable.minionAA = 0.004
      return true
    end
    if Config.kConfig.LaneClear then
      self.QState = Config.LaneClear.Q
      self.WState = Config.LaneClear.W
      self.IState = false
      self.orbTable.minionAA = 0.004
      return true
    end
    self.QState = false
    return false
  end

  function Riven:WindUp(unit)
    if unit.isMe then
      if self:DoOrb() and ValidTarget(self.Target) then
        self:CastItems(self.Target) 
        if sReady[_W] and GetDistance(self.Target) < data[1].range and self.WState then 
          Cast(_W, self.Target)
        elseif sReady[_Q] and ValidTarget(self.Target, 600) and self.QState then
          if myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" and self.QCast == 2 then
            Cast(_R, self.Target)
            DelayAction(function() Cast(_Q, self.Target) end, 0.137)
          else
            Cast(_Q, self.Target)
          end
        end
      end
    end
  end

  function Riven:CastItems(unit)
    if not self.IState then return end
    local i = {["ItemTiamatCleave"] = self.orbTable.range, ["YoumusBlade"] = self.orbTable.range}
    local u = {["ItemSwordOfFeastAndFamine"] = 600}
    for slot = ITEM_1, ITEM_6 do
      if i[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= i[myHero:GetSpellData(slot).name] then
        CastSpell(slot) 
      end
      if u[myHero:GetSpellData(slot).name] and myHero:CanUseSpell(slot) == READY and GetDistance(unit) <= u[myHero:GetSpellData(slot).name] then
        CastSpell(slot, unit)
      end
    end
  end

  function Riven:Animation(unit,ani)
    if unit and unit.isMe and ani then
      if ani:find("Spell1a") or ani:find("Spell1b") or ani:find("Spell1c") then
        self.orbTable.lastAction = os.clock() + 0.245
        if self.Target then
          if VIP_USER and self.QCast == 3 and false then 
            DelayAction(function() self:CastDance() end, 0.137)
          else
            local movePos = self.Target + (Vector(myHero) - self.Target):normalized() * (GetDistance(self.Target) + 62)
            myHero:MoveTo(movePos.x, movePos.z)
          end
        end
      end
    end
  end

  function Riven:CastDance()
    p = CLoLPacket(242)
    p.vTable = 15285260
    p:EncodeF(myHero.networkID)
    p:Encode1(255)
    p:Encode2(15871)
    p:Encode2(62088)
    SendPacket(p)
  end

  function Riven:ProcessSpell(unit,spell)
    if unit and unit.isMe and spell then
      if spell.name:lower():find("attack") then
        self.orbTable.windUp = 1 / (spell.windUpTime * myHero.attackSpeed)
        self.orbTable.animation = 1 / (spell.animationTime * myHero.attackSpeed)
        DelayAction(function() self:WindUp(unit) end, 1 / (myHero.attackSpeed * self.orbTable.windUp) + (self.QCast == 3 and 0.02 or 0) - GetLatency() / 2000 + self.orbTable.minionAA)
      elseif spell.name == "RivenTriCleave" then
        self.QCast = self.QCast + 1
        if self.QCast == 4 then self.QCast = 1 end
        self.orbTable.QDelay = os.clock()
        if self.Target and self:DoOrb() then
          local movePos = self.Target + (Vector(myHero) - self.Target):normalized() * (GetDistance(self.Target) + 65)
          if movePos and GetDistance(self.Target) < 294 then
            self.orbTable.lastAction = os.clock() + 0.85
            myHero:MoveTo(movePos.x, movePos.z)
          else
            myHero:MoveTo(mousePos.x, mousePos.z)
          end
        end
      elseif spell.name == "RivenMartyr" then
        self.orbTable.lastAA = 0
        if self.Target and self:DoOrb() and GetDistance(self.Target) < data[0].range then
          self:CastItems(self.Target)
          Cast(_Q, self.Target)
          DelayAction(function() self:CastItems(self.Target) end, 0.134)
          DelayAction(function() Cast(_Q, self.Target) end, 0.134)
          DelayAction(function() self:CastItems(self.Target) end, 0.137)
          DelayAction(function() Cast(_Q, self.Target) end, 0.137)
        end
      elseif spell.name == "ItemTiamatCleave" then
        self.orbTable.lastAA = 0
        if self.Target and self:DoOrb() and sReady[_Q] and GetDistance(self.Target) < data[0].range then
          DelayAction(function() if self.Target and GetDistance(self.Target) < data[1].range then Cast(_W, self.Target) end end, 0.137)
          DelayAction(function() Cast(_Q, self.Target) end, 0.137)
          DelayAction(function() if self.Target and GetDistance(self.Target) < data[1].range then Cast(_W, self.Target) end end, 0.139)
          DelayAction(function() Cast(_Q, self.Target) end, 0.139)
        end
      elseif spell.name == "RivenFengShuiEngine" or spell.name == "rivenizunablade" then
        self.orbTable.lastAA = 0
        if self.Target and self:DoOrb() and GetDistance(self.Target) < data[0].range and self.QCast == 2 then
          self:CastItems(self.Target)
          if self.Target and GetDistance(self.Target) < data[1].range then Cast(_W, self.Target) end
          Cast(_Q, self.Target)
        end
      elseif spell.name == "RivenFeint" then
        self.orbTable.EDelay = GetTickCount()
        self.orbTable.lastAA = 0
      end
    end
  end

  function Riven:Combo()
    if not self.Target then return end
    if GetDistance(self.Target) > self.orbTable.trueRange + 30 and sReady[_E] and Config.Combo.E and GetDistance(self.Target) < data[2].range then
      if Config.Combo.R and self:CalcComboDmg(self.Target, 0) >= self.Target.health and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
        Cast(_E, self.Target)
        DelayAction(function() Cast(_R) end, 0.075) 
      else
        CastSpell(_E, self.Target)
      end
    end
    if Config.Combo.R and GetDistance(self.Target) < data[2].range and self:CalcComboDmg(self.Target, 0) >= self.Target.health and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then Cast(_R) end
    if (GetDmg(_R,myHero,self.Target)+GetDmg(_Q,myHero,self.Target)+GetDmg("AD",myHero,self.Target)+self:DmgP(self.Target,myHero.totalDamage*1.2) >= self.Target.health) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target) end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Combo.W then
      CastSpell(_W)
    end
    if sReady[_Q] and not sReady[_E] and GetDistance(self.Target) > self.orbTable.trueRange + 30 then
      if self.orbTable.EDelay + 300 < GetTickCount() and self.orbTable.QDelay + 1.2 < os.clock() then
        Cast(_Q, Target)
      end
    end
  end

  function Riven:AutoW()
    for _,k in pairs(GetEnemyHeroes()) do
      if sReady[_W] and ValidTarget(k, data[_W].range) and (Config.Misc.Wae <= EnemiesAround(k, data[_W].range)) then
        Cast(_W)
      end
    end
  end

  function Riven:Harrass()
    if not self.Target then return end
    if GetDistance(self.Target) > self.orbTable.trueRange + 30 and sReady[_E] and Config.Harrass.E and GetDistance(self.Target) < data[2].range then
      CastSpell(_E, self.Target)
    end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Harrass.W then
      CastSpell(_W)
    end
  end

  function Riven:LaneClear()
    if not self.Target then return end
    if GetDistance(self.Target) > self.orbTable.trueRange + 30 and sReady[_E] and Config.LaneClear.E and GetDistance(self.Target) < data[2].range then
      CastSpell(_E, self.Target)
    end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.LaneClear.W then
      CastSpell(_W)
    end
    if sReady[_Q] and GetDistance(self.Target) > self.orbTable.trueRange + 36 then
      CastSpell(_Q, self.Target)
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Ryze"

  function Ryze:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_MAGICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    self.passiveTracker = 0
    AddMsgCallback(function(x,y) self:Msg(x,y) end)
    AddDrawCallback(function() self:Draw() end)
    AddApplyBuffCallback(function(unit, buff) self:ApplyBuff(unit, buff) end)
    AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
    AddRemoveBuffCallback(function(unit, buff) self:RemoveBuff(unit, buff) end)
  end

  function Ryze:Draw()
    if self.passiveTracker then
      local barPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
      local posX = barPos.x - 35
      local posY = barPos.y + 50
      DrawText(""..self.passiveTracker, 25, posX, posY, ARGB(255, 255, 0, 0)) 
    end
  end

  function Ryze:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaR", "Mana R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Ryze:Msg(Msg, Key)
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

  function Ryze:ApplyBuff(unit, buff) 
    if unit == nil or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 1 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:UpdateBuff(unit, buff, stacks) 
    if unit == nil or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = stacks end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:RemoveBuff(unit, buff) 
    if unit == nil or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 0 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 0 end 
  end

  function Ryze:LastHit()
    target = GetJMinion(900)
    if not target then
      target = GetLowestMinion(900)
    end
    if not target then return end
    if ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      Cast(_Q, target, false, true, 1)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_W, myHero, target) then 
      Cast(_W, target, true)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      Cast(_E, target, true)
    end
  end

  function Ryze:LaneClear()
    target = GetJMinion(900)
    if not target then
      target = GetLowestMinion(900)
    end
    if target and GetDistance(target) < 900 then 
      if Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and (myHero:GetSpellData(_R).level > 0 and myHero:GetSpellData(_R).currentCd > 0 or true) and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and (myHero:GetSpellData(_R).level > 0 and myHero:GetSpellData(_R).currentCd > 0 or true) and Config.LaneClear.E and Config.LaneClear.manaE < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then
          CastSpell(_W, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and Config.LaneClear.R and Config.LaneClear.manaR < myHero.mana/myHero.maxMana*100 then
          CastSpell(_R, target) 
        end 
      else 
        if Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then CastSpell(_W, target) end
        if Config.LaneClear.E and Config.LaneClear.manaE < myHero.mana/myHero.maxMana*100 then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config.LaneClear.R and Config.LaneClear.manaR < myHero.mana/myHero.maxMana*100 then 
        CastSpell(_R) 
      end 
    end 
  end

  function Ryze:Combo()
    target = Target
    if Forcetarget ~= nil and ValidTarget(Forcetarget, 900) then 
      target = Forcetarget 
    end 
    if target and GetDistance(target) < 900 then 
      if Config.Combo.Q then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and (myHero:GetSpellData(_R).level > 0 and myHero:GetSpellData(_R).currentCd > 0 or true) and Config.Combo.Q then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config.Combo.E then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and (myHero:GetSpellData(_R).level > 0 and myHero:GetSpellData(_R).currentCd > 0 or true) and Config.Combo.W then
          CastSpell(_W, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and Config.Combo.R then
          CastSpell(_R, target) 
        end 
      else 
        if Config.Combo.W then CastSpell(_W, target) end
        if Config.Combo.E then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config.Combo.R then 
        CastSpell(_R) 
      end 
    end 
  end

  function Ryze:Harrass()
    target = Target
    if Forcetarget ~= nil and ValidTarget(Forcetarget, 900) then 
      target = Forcetarget 
    end 
    if target and GetDistance(target) < 900 then 
      if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
          CastSpell(_W, target) 
        end 
      else 
        if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then CastSpell(_W, target) end
        if Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then CastSpell(_E, target) end 
      end 
    end 
  end

  function Ryze:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_W, enemy, true)
          DelayAction(function() Cast(_E, enemy, true) end, 0.25)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Ryze:DmgCalc()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageAA = GetDmg("AD", myHero, enemy)
        local damageQ  = GetDmg(_Q, myHero, enemy)
        local damageW  = GetDmg(_W, myHero, enemy)
        local damageE  = GetDmg(_E, myHero, enemy)
        local damageR  = GetDmg(_R, myHero, enemy)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        local ready    = 0
        for _,k in pairs({_Q,_W,_E,_R}) do 
          if myHero:CanUseSpell(k) == READY then 
            ready = ready + 1 
          end  
        end 
        local mult     = self.passiveTracker >= (6-ready) and 3 or 1
        if damageQ > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
        end
        if damageW > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."W"
        end
        if damageE > 0 then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."E"
        end
        if self.passiveTracker >= 4 then
          killTextTable[enemy.networkID].indicatorText = "Combo"
        end
        if enemy.health < mult*(damageQ+damageW+damageE) then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Kill"
        end
        if enemy.health > mult*(damageQ+damageW+damageE) then
          local neededAA = math.ceil(100*(damageQ+damageW+damageE)/(enemy.health))
          killTextTable[enemy.networkID].indicatorText = neededAA.." % Combodmg"
        end
        local enemyDamageAA = GetDmg("AD", enemy, myHero)
        local enemyNeededAA = not enemyDamageAA and 0 or math.ceil(myHero.health / enemyDamageAA)   
        if enemyNeededAA ~= 0 then         
          killTextTable[enemy.networkID].damageGettingText = enemy.charName .. " kills me with " .. enemyNeededAA .. " hits"
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Rumble"

  function Rumble:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:DoW() end)
    AddTickCallback(function() self:DoSomeUltLogic() end)
  end

  function Rumble:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rae", "Auto R if X enemies", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  end

  function Rumble:DoW()
    if Config.Misc.Wa and not IsRecalling(myHero) and myHero.mana < 40 then
      CastSpell(_W)
    end
  end

  function Rumble:DoSomeUltLogic()
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      if enemies >= Config.Misc.Rae then
        Cast(_R, Target, false, true, 2)
      end
    end
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      local allies = AlliesAround(myHero, 500)
      if enemies >= Config.Misc.Rae-1 and allies >= Config.Misc.Rae-1 then
        Cast(_R, Target, false, true, 2)
      end
    end
  end

  function Rumble:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion, false, true, 1.2)
        end
      end
    end
  end

  function Rumble:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E then
      local minionTarget = GetLowestMinion(data[2].range)
      if minionTarget ~= nil then
        Cast(_E, winion, false, true, 1.2)
      end
    end
  end

  function Rumble:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.2)
    end
    if Config.Combo.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, false, true, 1.5)
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= Target.health or (EnemiesAround(Target, 500) > 2)) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target, true)
    end
  end

  function Rumble:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.2)
    end
    if Config.Harrass.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, false, true, 1.5)
    end
  end

  function Rumble:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Talon"

  function Talon:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Talon:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Talon:LastHit()
    if myHero:GetSpellData(_Q).currentCd == 0 and not self.Target and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          CastSpell(_Q, myHero:Attack(winion))
        end
      end
    end
    if myHero:GetSpellData(_Q).currentCd > 0 and not self.Target and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, winion)
        end
      end
    end
  end

  function Talon:LaneClear()
    if Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      if self.Target and GetDistance(self.Target) < data[0].range then
        CastSpell(_Q, myHero:Attack(self.Target))
      end
    end
    if Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      pos, hit = GetFarmPosition(data[1].range, data[1].width)
      if pos and hit > 0 then
        Cast(_W, pos)
      end
    end
  end

  function Talon:Combo()
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(self.Target, data[2].range) then
      Cast(_E, self.Target, true)
    end
    if myHero:CanUseSpell(_E) ~= READY and myHero:CanUseSpell(_R) == READY and Config.Combo.R and ValidTarget(self.Target, data[3].width) and self.Target.health < GetDmg(_Q, myHero, self.Target)+GetDmg(_W, myHero, self.Target)+GetDmg("AD", myHero, self.Target)+GetDmg(_R, myHero, self.Target) then
      Cast(_R, self.Target, true)
    end
  end

  function Talon:Harrass()
    if Config.Harrass.E and ValidTarget(Target, data[2].range) then
      if myHero:CanUseSpell(_E) == READY then
        Cast(_E, self.Target, true)  
      end
    elseif myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(self.Target, data[0].range) then
      CastSpell(_Q, myHero:Attack(self.Target))
    elseif myHero:CanUseSpell(_W) == READY and Config.Harrass.W and ValidTarget(self.Target, data[1].range) then
      Cast(_W, self.Target, false, true, 2)
    end
  end

  function Talon:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local dmg = 0
        local c = 0
        if Config.Killsteal.Q and sReady[_Q] then
            dmg = dmg + GetDmg(_Q, myHero, enemy)
            c = c + 1
        end
        if Config.Killsteal.W and sReady[_W] then
            dmg = dmg + GetDmg(_W, myHero, enemy)
            c = c + 1
        end
        if Config.Killsteal.E and sReady[_E] then
            dmg = dmg + GetDmg(_E, myHero, enemy)
            c = c + 1
        end
        dmg = dmg + (c > 0 and GetDmg("AD", myHero, enemy) or 0)
        dmg = dmg*((sReady[_E]) and 1+0.03*myHero:GetSpellData(_E).level or 1)+((sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") and Config.Killsteal.R and GetDmg(_R, myHero, enemy)*2 or 0)
        if dmg >= enemy.health and EnemiesAround(enemy,750) < 3 then
          if Config.Killsteal.Q and myHero:GetSpellData(_Q).currentCd == 0 and GetDistance(enemy) < data[2].range then
            if GetDistance(enemy) < data[0].range then CastSpell(_Q, myHero:Attack(enemy)) end
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy, true})
              if Config.Killsteal.W and sReady[_W] then
                DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.5)
                if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.75)
                end
              end
            elseif Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.E and sReady[_E] and GetDistance(enemy) < data[2].range then
            Cast(_E, enemy, true)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy, false, true, 1) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] and GetDistance(enemy) < data[1].range then
            Cast(_W, enemy, false, true, 1)
            if Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
              DelayAction(function() Cast(_R) end, 0.25)
            end
          elseif GetDistance(enemy) < data[3].width and Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
            Cast(_R)
          end
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Teemo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Teemo:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, true)
        end
      end
    end
  end

  function Teemo:LaneClear()
    if Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, true)
        end
      end
    end
  end

  function Teemo:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, true)
    end
    if Config.Combo.I and ValidTarget(enemy, 600) and (Target.health < (50+20*myHero.level+GetDmg(_Q,myHero,Target)+GetDmg("AD",myHero,Target)*5*myHero.attackSpeed) or killTextTable[Target.networkID].indicatorText:find("Killable")) then
      CastSpell(Ignite, Target)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, true)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, true)
        elseif enemy.health < GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.Q and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
          DelayAction(Cast, 0.2, {_Q, enemy, true})
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Vayne"

  function Vayne:__init()
    self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_PHYSICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddTickCallback(function() self:DoSomething() end)
  end

  function Vayne:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_LIST, 100, 0, 100, 0)
    Config.Misc:addDynamicParam("Ea", "Auto E if can stun", SCRIPT_PARAM_ONOFF, true)
  end

  function Vayne:DoSomething()
    if not Config.Misc.Ea then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 1000) and enemy ~= nil and not enemy.dead then
        self:MakeUnitHugTheWall(enemy)
      end
    end
  end

  function Vayne:MakeUnitHugTheWall(unit)
    if not unit or unit.dead or not unit.visible then return end
    local x, y, z = UPL:Predict(_E, myHero, unit)
    for _=10,(450-unit.boundingRadius)*Config.Misc.offsetE/100,10 do
      local dir = x+(x-myHero):normalized()*_
      if IsWall(D3DXVECTOR3(dir.x,dir.y,dir.z)) then
        Cast(_E, unit, true)
        return
      end
    end
  end

  function Vayne:LastHit()
    target = GetJMinion(data[2].range)
    if not target then
      target = GetLowestMinion(data[2].range)
    end
    self:MakeUnitHugTheWall(Target)
  end

  function Vayne:LaneClear()
    target = GetJMinion(data[2].range)
    if not target then
      target = GetLowestMinion(data[2].range)
    end
    self:MakeUnitHugTheWall(Target)
  end

  function Vayne:Combo()
    self:MakeUnitHugTheWall(Target)
  end

  function Vayne:Harrass()
    self:MakeUnitHugTheWall(Target)
  end

  function Vayne:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
  end

  function Volibear:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Volibear:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, winion, true)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E)
        end
      end
    end
  end

  function Volibear:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
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
    if myHero:CanUseSpell(_W) == READY and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
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
    if myHero:CanUseSpell(_E) == READY and Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
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
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      Cast(_Q)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      if GetDmg(_W, Target, myHero) >= Target.health then
        Cast(_W, Target, true)
      end
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and GetDistance(Target) < data[2].range then
      Cast(_E)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY and EnemiesAround(myHero, 500) > 1 and ValidTarget(Target, data[3].range) then
      Cast(_R, myHero:Attack(Target))
    end
  end

  function Volibear:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      Cast(_Q)
    end
    if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, true)
    end
    if Config.Harrass.E and GetDistance(pos) < data[2].range and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
      Cast(_E)
    end
  end

  function Volibear:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range-enemy.boundingRadius) then
          Cast(_E)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Yasuo"

  function Yasuo:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    Cfg:addSubMenu("Target Selector", "ts")
    Cfg.ts:addTS(self.ts)
    ArrangeTSPriorities()
    self:Menu()
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    AddTickCallback(function() self:Tick() end)
  end

  function Yasuo:Tick()
    if Config.Misc.Flee then
      self:Move(mousePos)
    end
  end

  function Yasuo:Move(x)
    myHero:MoveTo(x.x,x.z)
    if sReady[_E] then
      local minion = nil
      for _,k in pairs(Mobs.objects) do
        if not minion and k and GetDistanceSqr(k) < data[2].range*data[2].range then minion = k end
        if minion and k and GetStacks(k) == 0 and GetDistanceSqr(k,myHero) > GetDistanceSqr(minion,myHero) and GetDistanceSqr(k,x) < GetDistanceSqr(minion,x) and GetDistanceSqr(k,x) > data[2].range*data[2].range/2 and GetDistanceSqr(k) < data[2].range*data[2].range then
          minion = k
        end
      end
      if minion then
        Cast(_E, minion, true)
      end
    end
  end

  function Yasuo:ProcessSpell(unit, spell)
    if (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and unit and unit.team ~= myHero.team and GetDistance(unit) < 1500 then
      if myHero == spell.target and spell.name:lower():find("attack") and unit.range > 475 then
        local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
        Cast(_W, wPos)
      elseif spell.endPos and not spell.target then
        local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
        if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
          local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
          Cast(_W, wPos)
        end
      end
    end
  end

  function Yasuo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONOFF, true)
  end

  function Yasuo:LastHit()
    local minion = GetLowestMinion(data[2].range)
    if minion and GetStacks(minion) == 0 and minion.health < GetDmg(_E, myHero, minion) and loadedOrb.State[_E] then
      Cast(_E, minion, true)
    end
    if minion and GetStacks(minion) == 0 and minion.health < GetDmg(_Q, myHero, minion)+GetDmg(_E, myHero, minion) and loadedOrb.State[_Q] and loadedOrb.State[_E] then
      Cast(_E, minion, true)
      DelayAction(function() Cast(_Q) end, 0.25)
    end
  end

  function Yasuo:LaneClear()
    -- mad?
  end

  function Yasuo:Combo()
    if not self.Target then return end
    if GetDistance(self.Target) > loadedOrb.myRange and Config.Combo.E then
      if GetDistance(self.Target) < data[2].range and GetStacks(self.Target) == 0 then
        Cast(_E, self.Target, true)
      else
        self:Move(self.Target)
      end
    end
    if self.Target.y > myHero.y+25 and Config.Combo.R then
      if sReady[_Q] and GetDistance(self.Target) < data[0].range then
        myHero:Attack(self.Target)
      else
        Cast(_R, self.Target, true)
      end
    end
  end

  function Yasuo:Harrass()
    if not self.Target then return end
    if GetDistance(self.Target) > loadedOrb.myRange and GetStacks(self.Target) == 0 and Config.Harrass.E then
      Cast(_E, self.Target, true)
    end
  end

  function Yasuo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if enemy.y > myHero.y+25 and Config.Killsteal.R and GetDmg(_R,myHero,enemy) > enemy.health then
          Cast(_R, enemy, true)
        elseif Config.Killsteal.Q and GetDmg(_Q,myHero,enemy) > enemy.health then
          Cast(_Q, enemy, false, true, 1)
        elseif Config.Killsteal.E and GetDmg(_E,myHero,enemy) > enemy.health then
          Cast(_E, enemy, true)
        elseif Config.Killsteal.Q and Config.Killsteal.E and GetDmg(_Q,myHero,enemy)+GetDmg(_E,myHero,enemy) > enemy.health then
          Cast(_E, enemy, true)
          DelayAction(function() Cast(_Q) end, 0.25)
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
