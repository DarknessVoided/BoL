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
  SAhriVersion          = 1.2 -- r catch angle fix
  SAsheVersion          = 1.4 -- removed ult over whole map
  SAzirVersion          = 0
  SBlitzcrankVersion    = 1.1 -- fixed R ks
  SBrandVersion         = 1
  SCassiopeiaVersion    = 1.4 -- facingme fixed
  SDariusVersion        = 1.2 -- auto Q harrass added
  SEkkoVersion          = 1
  SGnarVersion          = 0
  SJarvanVersion        = 0
  SKalistaVersion       = 1
  SKatarinaVersion      = 1.1 -- fixed all toggles in not-combo-modes
  SKogmawVersion        = 0
  SLeBlancVersion       = 0.1 -- soon(tm)
  SLeeSinVersion        = 1.2 -- is now live
  SLuxVersion           = 1.4 -- fixes
  SMalzaharVersion      = 1
  SNidaleeVersion       = 1.8 -- auto heal check fix
  SOlafVersion          = 0
  SOriannaVersion       = 1.3 -- better ult calculation
  SQuinnVersion         = 0
  SRengarVersion        = 1.6 -- fixed combo stuck bug
  SRivenVersion         = 1.2 -- combo R fix, laneclear fix
  SRyzeVersion          = 1.1 -- lasthit fix
  SRumbleVersion        = 1
  SSejuaniVersion       = 0
  SShyvanaVersion       = 0
  STeemoVersion         = 1.1 -- Q is now QQQ
  SVayneVersion         = 1   -- initial release
  SViktorVersion        = 0
  SVolibearVersion      = 1.1 -- error spam fix
  SYasuoVersion         = 0
  SYorickVersion        = 0
]]--

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion    = 1.72
_G.ScriptologyAutoUpdate = true
_G.ScriptologyLoaded     = false
_G.ScriptologyDebug      = false

-- { Global functions

  function OnLoad()
    require("sScriptConfig")
    champList = { "Ahri", "Ashe", "Blitzcrank", "Brand", "Cassiopeia", 
                  "Darius", "Ekko", 
                  "Kalista", "Katarina", "LeeSin", "Lux", "Malzahar", 
                  "Nidalee", "Orianna", "Rengar", "Riven", "Ryze",
                  "Rumble", "Teemo", 
                  "Vayne", "Volibear" }
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
    Config = sScriptConfig("Scriptology "..myHero.charName, "Scriptology") -- <- u mad?
    Config:addState("Combo")
    Config:addState("Harrass")
    if myHero.charName ~= "Blitzcrank" then Config:addState("Farm")
    Config:addSubStates("Farm", {"LaneClear", "LastHit"}) end
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
      if myHero.charName == "Vayne" then Config:addParam({state = "Misc", name = "Ea", code = SCRIPT_PARAM_ONOFF, value = false})
                                         Config:addParam({state = "Misc", name = "offset", code = SCRIPT_PARAM_SLICE, text = {"E"}, slider = {90}}) end
      if myHero.charName ~= "Darius" and myHero.charName ~= "Katarina" and myHero.charName ~= "Riven" then UPL:AddToMenu2(Config, "Misc") end 
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
        ["Katarina"] = {
          [_Q] = { range = 675, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+25*level+0.45*AP end},
          [_W] = { range = 375, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.25*AP+0.6*TotalDmg end},
          [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+30*level+0.25*AP end},
          [_R] = { range = 550, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+10*level+0.2*AP+0.3*source.addDamage end}
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
      _G.AutoCarry.MyHero:MovementEnabled(true)
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
      _G.AutoCarry.MyHero:AttacksEnabled(false)
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
      _G.AutoCarry.MyHero:AttacksEnabled(true)
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
      if Config:getParam("Draws", "R") and (myHero:CanUseSpell(_R) == READY or myHero.charName == "Katarina") then
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

  function GetLineFarmPosition(range, width)
    local BestPos 
    local BestHit = 0
    local objects = minionManager(MINION_JUNGLE, range, myHero, MINION_SORT_HEALTH_ASC).objects
    for i, object in ipairs(objects) do
      local EndPos = Vector(myHero) + range * (Vector(object) - Vector(myHero)):normalized()
      local hit = CountObjectsOnLineSegment(myHero, EndPos, width, objects)
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
          local damageW  = GetDmg(_W, myHero, enemy)
          local damageE  = GetDmg(_E, myHero, enemy)
          local damageR  = GetDmg(_R, myHero, enemy)*(myHero.charName == "Katarina" and 10 or 1)
          local damageRC  = (myHero.charName == "Orianna" and loadedClass:CalcRComboDmg(enemy) or 0)
          local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
          local damageS  = Smite and (20 + 8 * myHero.level) or 0
          damageQ = myHero:CanUseSpell(_Q) == READY and damageQ or 0
          damageW = myHero:CanUseSpell(_W) == READY and damageW or 0
          damageE = myHero:CanUseSpell(_E) == READY and damageE or 0
          damageR = (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) and damageR or 0
          if myHero:CanUseSpell(_Q) == READY and damageQ > 0 then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."Q"
          end
          if myHero:CanUseSpell(_W) == READY and damageW > 0 then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."W"
          end
          if myHero:CanUseSpell(_E) == READY and damageE > 0 then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.."E"
          end
          if myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and damageR > 0 and myHero.charName ~= "Orianna" then
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
            neededAA = neededAA < 1 and 1 or neededAA
            killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
          elseif myHero.charName == "Ashe" or myHero.charName == "Vayne" then
            local neededAA = math.ceil((enemy.health-damageQ-damageW-damageE) / (damageAA))
            neededAA = neededAA < 1 and 1 or neededAA
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
    for i=1,heroManager.iCount do hero = heroManager:GetHero(i) pos, b = PredictPos(hero) if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range and GetDistance(pos, myHero) < GetDistance(hero, myHero) then c=c+1 end end return c
  end

  function PredictPos(target,delay)
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
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy)*2 and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range) then
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, false, true, 1.5)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[3].range) then
          Cast(_W)
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "R") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, false, true, 1.5)
          DelayAction(function() if GetStacks(enemy) > 0 then Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
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
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (GetStacks(target) > 0 and GetDistance(target, myHero) < data[0].range) then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and enemy.health < GetDmg(_R, myHero, enemy) and Config:getParam("Killsteal", "R") and ValidTarget(enemy, data[3].range-enemy.boundingRadius) then
          Cast(_R)
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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

class "Katarina"

  function Katarina:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST, 700, DAMAGE_MAGICAL, false, true)
    self:Menu()
    self.Target = nil
    self.orbTable = { lastAA = 0, lastAction = 0, minionAA = 0, windUp = 3.75, animation = 0.625 }
    AddTickCallback(function() self:OrbWalk() end)
  end

  function Katarina:OrbWalk()
    if Config:getParam("LastHit", "LastHit") then
      self.Target = GetLowestMinion(700)
      if self.Target and self.Target.health > GetDmg("AD",myHero,self.Target) then
        self.Target = nil
      end
      if not self.Target then
        self.Target = GetJMinion(700)
      end
    end
    if Config:getParam("LaneClear", "LaneClear") then
      self.Target = GetLowestMinion(700)
      if not self.Target then
        self.Target = GetJMinion(700)
      end
    end
    if Config:getParam("Harrass", "Harrass") then
      self.Target = Target
    end
    if Config:getParam("Combo", "Combo") then
      self.Target = Target
    end
    if self.Forcetarget and ValidTarget(self.Forcetarget, 700) then
      self.Target = self.Forcetarget
    end
    if self:DoOrb() then
      DisableOrbwalkerMovement()
      DisableOrbwalkerAttacks() 
      self:Orb(self.Target) 
    else
      EnableOrbwalkerMovement()
      EnableOrbwalkerAttacks() 
    end
  end

  function Katarina:Orb(unit)
    if not ValidTarget(unit, myHero.range + GetDistance(myHero.minBBox) + 1 + 40) then
      unit = Target
    end
    if os.clock() > self.orbTable.lastAA + 1 / (myHero.attackSpeed * self.orbTable.animation) - 0.07 and ValidTarget(unit, myHero.range + GetDistance(myHero.minBBox) + 1 + 40) then
      myHero:Attack(unit)
    elseif GetDistance(mousePos) > myHero.boundingRadius and os.clock() > self.orbTable.lastAction + 1 / (myHero.attackSpeed * self.orbTable.windUp) + self.orbTable.minionAA then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and unit and ValidTarget(unit, self.orbTable.trueRange) and unit.type == myHero.type then
        myHero:MoveTo(unit.x, unit.z)
      elseif self:DoOrb() and GetDistance(mousePos) > 50 then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function Katarina:DoOrb()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead then
      return false
    end
    if Config:getParam("Combo", "Combo") then
      return true
    end
    if Config:getParam("Harrass", "Harrass") then
      return true
    end
    if Config:getParam("LastHit", "LastHit") then
      return true
    end
    if Config:getParam("LaneClear", "LaneClear") then
      return true
    end
    return false
  end

  function Katarina:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
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

  function Katarina:LastHit()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config:getParam("LastHit", "Q") and sReady[_Q] and GetDistance(self.Target) < data[0].range and self.Target.health < GetDmg(_Q, myHero, self.Target) then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if Config:getParam("LastHit", "W") and sReady[_W] and GetDistance(pos) < data[1].range+b/2 and self.Target.health < GetDmg(_W, myHero, self.Target) then
      Cast(_W)
    end
    if Config:getParam("LastHit", "E") and sReady[_E] and GetDistance(self.Target) < data[2].range and self.Target.health < GetDmg(_E, myHero, self.Target) then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:LaneClear()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config:getParam("LaneClear", "Q") and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if Config:getParam("LaneClear", "W") and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config:getParam("LaneClear", "E") and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Combo()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config:getParam("Combo", "Q") and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if Config:getParam("Combo", "W") and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config:getParam("Combo", "E") and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
    if Config:getParam("Combo", "R") and sReady[_R] and GetDistance(self.Target) < 200 and self.Target.health < GetDmg(_R, myHero, self.Target)*10 then
      Cast(_R)
    end
  end

  function Katarina:Harrass()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config:getParam("Harrass", "Q") and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target, true)
    end
    pos, b = PredictPos(self.Target,0.25)
    if Config:getParam("Harrass", "W") and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config:getParam("Harrass", "E") and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target, true)
    end
  end

  function Katarina:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead and GetDistance(enemy) < 700 then
        local dmg = 0
        for _,k in pairs({"Q","W","E"}) do
          if Config:getParam("Killsteal", k) and sReady[_-1] then
            dmg = dmg + GetDmg(_-1, myHero, enemy)
          end
        end
        if dmg+((sReady[_Q] and Config:getParam("Killsteal", "Q")) and myHero:CalcMagicDamage(enemy,15*myHero:GetSpellData(_Q).level+0.15*myHero.ap) or 0)+((myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and Config:getParam("Killsteal", "R")) and GetDmg(_R, myHero, enemy)*10 or 0) >= enemy.health then
          if Config:getParam("Killsteal", "Q") and sReady[_Q] then
            Cast(_Q, enemy, true)
            if Config:getParam("Killsteal", "E") and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy, true})
              if Config:getParam("Killsteal", "W") and sReady[_W] then
                DelayAction(function() Cast(_W) end, 0.5)
                if (Config:getParam("Killsteal", "R") and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.75)
                end
              end
            elseif Config:getParam("Killsteal", "W") and sReady[_W] then
              pos, b = PredictPos(enemy)
              if GetDistance(pos) < data[1].range then
                DelayAction(function() Cast(_W) end, 0.25)
                if Config:getParam("Killsteal", "R") and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() Cast(_R) end, 0.5)
                end
              end
            end
          elseif Config:getParam("Killsteal", "E") and sReady[_E] then
            Cast(_E, enemy, true)
            if Config:getParam("Killsteal", "W") and sReady[_W] then
              DelayAction(function() Cast(_W) end, 0.25)
              if Config:getParam("Killsteal", "R") and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config:getParam("Killsteal", "W") and sReady[_W] then
            pos, b = PredictPos(enemy)
            if GetDistance(pos) < data[1].range then
              Cast(_W)
              if Config:getParam("Killsteal", "R") and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.25)
              end
            end
          elseif GetDistance(enemy) < 250 and Config:getParam("Killsteal", "R") and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
    if not IsRecalling(myHero) and self:IsHuman() and Config:getParam("Misc", "Ea") and Config:getParam("Misc", "mana", "E") <= myHero.mana/myHero.maxMana*100 then
      for _,k in pairs(GetAllyHeroes()) do
        if GetDistance(k) < self.data.Human[2].range and k.maxHealth-k.health < 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and k.health/k.maxHealth <= 0.35 then
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
    if not unit then return end
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
      if enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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

--- Riven start
_G.ScriptCode = Base64Decode("hn7Ok4lnT11xd0xiiNRDgY4/T2FrMlkyN2dOWm+wRGJvRza3dHaPYWFsdXR4PIGvYqlzbVlYpzezX3Kra5eZMjdxjtnueYSib6a2d3Q/j2HjVXW0d5sBb2JOs+3bVKd3Mr4ybGs8mTK6bY6ZbdiEY29Ldvf3O4+ha5fZMzdxjlnxeYSib6b2eHQ/j+HvOJlyN8xOW219hGL0R3a3dJqPY2FZdfT8PIGvYqnzb1lYpze4X3Kra5cZNDdxjtnzeYSib6Y2enQ/j2HoVXW0d5uBcmJOs+3gVKd3Mr6ybms8mTK/bY6ZbdgEZW9Ldvf8O4+ha5dZNjdxjln2eYSib6Z2e3Q/j+H0OJlyN8zOXW19hGL5YDb3dEpPYWFTO3R3NqTbw7fmbV1UZzcyq5vh0KBZNj5nTlnM0q3Q2LU2e3k1T2GutKPpdzpFb2JEwODATms8Mlkyr92T0DI7bE5ZbcetxdpBOn90NU+l2Jmck6PKTl1yc0Ris66dx3Q5XGFrMpyTo8qRyNrVs6bcqDZ7fDVPYbDBl8vYoqxvZkhzbVmd2ZkyXThrazKdoYbZsFlxekRib5if5diKv2FlWTV0d3mi4taN59LGwWc7PFkya6ygwp+Y27fI23NIb29BNsfmpLLG3qWsopzTullxeURib4Sl5NakT2VxMlkyeNzCyMRzSGpvQTa/1afBwtTCNXiBNkFvrqXh0py6zJikWUVrazJdMjdnYlltc0Vidn02d3R7j6Fh1bW0d/cBb2JKdK5ZkWg3Mtwz62uP2TI6cY5Z7b+Eo2+ednd1e8+iazyZMrpxThvwfUQk80v2ufk/j6TxPFl0vrKOW229BKT3i/Y5/H8Po+qZ9TYAgAGx7I7zMuOYZ/2937Kxa7mZeDgtzp9tOgQocM72d3V/z+Ht1bW6d72BtWMKs7RZVOh9MmCzsm0P2TI49A5ZbgAEqXCLtncCP4/h8nhZejcMTllt0IRicId2v3Taj2Frj5kyOK2OoW0YxGJvnnZ3dXvPqWH09XR3k4FvY4oztVnzZzgytnJrbHhZezcMjlpt0IRicGA293RaT2FhUzh0dza14mJIgm1ZTruYpMCX376XxZea273LbXdTYm9BirjGfJS1ynWlgYqsoa1tdkRib0E2hwF1U3FrMll2eLSPoLLSlKrIlH+6tYFPZWZPNXTEm6/kYkh6bVlOu5ikwJffazZgMjdnn6zh1LjHb0I2e3s1T2G4oqnV65tBc2hEc22qkciqplk1a2syWTI3Z05ddXNEYtywrNzEpMJhazZeMjdnwKfc6kRmeEE2d+OnsbXMlMWXN2tVWW1zlabUrZfwdDlWYWFPerjcoqLoYkh6bVlO05ilzXOsazZkMjdnurrg54XF46ql5XQ5WGFhT6Ld5Z+w3aOFc3FgTmc3qcKgz8CiWTU3Z05ZbXNSonNLNnd0lr3K2JPNm6bVTlxtc0Rib0Eatng7T2FrpLqgnsxOXXRzRGLcun7c5qRPZXBPNXTZpbbdxq3h1Kuvy6CnzDJvdTJZMqvZw76/1LLJ1EE6g3Q1T6jGw3nd6qqi3cWpc3FhTmc3n8Kgra2h0TI6Z05ZbXNEUq5FRnd0NZDFz3bLk66qr8XZ1aXF2kE6h3Q1T6LPlq2bmtKRutnfpsPSrDZ7iTVPYaKzmbXln67Q1q3i25yv06OUupXWazZxMjdnj73Rw7bR0qap6seltM3Nkpbg45ii0s1Ed3xZTmd4lr1/3tJ1up6jya+82HNKYm9BRHd0NV1hazJZMjlrTllteERib002t3RSj2FsUVmyN2hOWW13SWJvQXrp1axPYWFPNXV3NkFwYkRzbVlOZzcyWTJrazJZMjd2TlltgkRib0E2eXg1T2FmTzV0gzaBb3+Ec254Tuc3M1kya283WTI3u7e82HNEYm9BN3d0NVBhazJZMjdnTlltc0Rib0E2d4Q1T2F7MlkyN2dQXW1zRGdvQTaDdHVPfqFPNpN3tkFwYkRzcWFOZzeBy5TCzJ7EMjdnTlluc0RicEE2d3Q1T2FhTzV0dzZBb2JEhG1ZTng3Mlk0a3E4WTI37E5Zbf9EonBBN3d0dVDha8+ZMjmGTtltdERib0VAd3Q1kM/Un7qmoNa8WW1zRGJwQTZ3dTVPYWFPNXR3NkFvYkRzbVlOeTcyWURrazJbMj1tTllt+ERib802t3U1UGFhjzb0d9OBb2Rjc+1ZT2c3Ml0/a2syqaSmyrPM4Ma0x9utNnd0NU9iazJZMzdnTlltc0Rib0E2d3Q1T2FrRVkyN3pOWW11RGh1QTZ3+TVPYe1PdXV3N0FvokXzbfaOZzlRWbJrbDJZMjtrTlltwLfJb0E2d3Q2T2FhUDV0dzZBb2JEc21ZTmc3MlkybGsyWTI3Z05ZbXNEYm9BNnd0NU9h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6lFZsjeLTlltd0tib0F55uKbuMhhUz50dzao1NaU1N+6u2c7OFkya6+kuqmqZ1JdbXNEpryINnt6NU9h25PCpKpnUmhtc0Sp1LV75dmiyKnQpMiXqmdSZW1zRLjQrZ/byJbByMbDNXh/NkFv2K3m1ru6zDc2ZzJra53CnqO7s9Hhx6XE26Y2e341T2HPtKnr5qisuKZEd3tZTmegoL2bzsymyKSLzMbNbXdFYm9BNnuBNU9hrpPFlXrWu7vct7HJb0Q2d3Q1T2FrMl04N2dOnNzgptFvRTh3dDWhYWVWNXR3f6jdy7jYbV1VZzcyoJffr5/AMjtuTlltvIuwuJV7d3g8T2FhvK683Kiwb2ZKc21ZodSgpr4yb3EyWTKjzMS+2XNHYm9BNnd0VY9kazJZMjdngplxekRib6mb2OCpt2FvOVkyN7K3xdmUZWJzRjZ3dKKw1clPOXp3NkHVzrPi31lRZzcyWTJrxHJdPjdnTn6NtrPP0bBW2+GcT2VkTzV0uHpBc2dEc228s9CjMl1Ea2syvZOkyLW+tNi41tivncvZrcNhbztZMjfKtrrfwaXP1EE6h3Q1T4HWm8Weqoe7vo3qrdbXYTZ7ejVPYYG3nujqNkFvYkR0bVlOZzcyWTJrazJZMjdnTlltc0RiBkE2dw01T2FkTz+SdzZBNWKEczmZDmh3M9ky8exyWbn4p1Ef7rNEKXACOX12dU9orXNdP7moUmkvtEg/8EE3RjU20y6s9Fw4uadOYG+0SKhxgTa+tvZTruMQOcQ590WM5ER0fFvQ60W0mzYI7LJawbhnUekutUfv8EK6VXQ1UUBhTzWTd7ZBe2JEc3FgTmc3n9J60N2hWTZCZ05ZsNSwxbOio9jbmk9lcDJZMqTIwsFtd0hib0Gj2Ow1U2drMlmYo9a9y213SmJvQaLc6pq7YWRPNXR3NkFvokdzbVlOZzc6mTVrazJZMjd7jlxtc0Rib0Fat3c1T2FhTzWitzlBb2JEc22yjmc3Mlkza2syWTI3Z05ZbXNEYm9BNnd0NU9hBjJZMuJnTllxc1Hyb0E2grU2T6hs8lk8eGjOoK4zRGywwra+9fVPa6JQtrs49kF5o8X0tFoPZ0FzWrTHrDJaSTdnzpqudETo8II2/jV2UjxhTzWL9znBNWOGc3ObkGf+M9s1RqwyWUm3aM4f7rRELvADOb22d08+7LJa+fgpUbFtNkd570G2OLU4TzysMllJN2fOGu52RPEwQjlCNTZPZ+OQNXs5eUU5Y8b6c9uPZz40nTY1bDTh/Ljo0V/vtERpsYU6QXW312fjkDV7+XpFOWNG/HPbj2c+9J02NWy04ji5qE5gb7hILHBDwH12d0+nrXdZOXlpUnRvc0R5r0e2ffZ6T6etd1myOedRGW9zRn/xQTiGNnpTbmPRN7r5e0HwZEpzLVvOajc1WTTI7TJbP3lpUp/vuETjsUc2N3a1UmFkTzfR+TZDviQJd3qbUGuDtJ8yK22yWTI6Z1G273NGsTEGOsS1N1NnbXRZePmtTmCvdUh9cUE2jnQ5z2ftd1l4+a1O2W/zRyJxQTiU9jVRbmPRN7r5e0HwpEpzLVvOajc1WTTI7TJbP3lpUqXvuUQiccE2d3c1Ur7jTzfBuDhFdWSGc7ObkGc+dFs2hq0yWUm3aM5f77REbvGDOv22d09+7bJaOfmpUrFttkh5r0a2UrQ1T3grNtk5OahQZ690SGxwQ7h99npPp6ORNfR5tkQvZER1ittOaUQ02zSx7XdZs3ltThlv80dickE41PY1UW6jUTnA+XxBL2TEc21cTmqUtFk0uKw0XZE4Z094bfNEfm9BNnt4NU9h26HMMjttTllt1LbP3rM2e381T2HYk8CbmqjAxtzlRGZ5QTZ34ZbHqcawoejfNkV2YkRz1b6v06uaWTVrazJZMjdnTl10c0Ri3Lp+3OakT2VtTzV066W10M6I1Nq6tcw3NmAya2ulq5eYy8dZcXZEYm+giHd4Qk9ha3m+porXs8XZt6XW0EE6fHQ1T8/Mn74yO3tOWW3FrdjUr3zc4pyiyda4euLen6/UYkdzbVlOZzcimDWenmWMZWpajV1wc0Ri0LE2e3o1T2HNtKvZ4zZFeGJEc87Lu9apgr6ga29CWTI3yMDG3OWUx92Rm+nXmr3VazZiMjdnu7rU3Key1K82e4Q1T2HYk8Cbmrezx73YtsXUr6p3eDhPYWGuhnR7PUFvYovY4Z27zjc1WTJrazJZOndrVVltc5jL0K6X63Q5UmFhT3a4dzpGb2JEt9rAnmc7NVkya8qJWTI3Z05abXNEYm9BNnd0NU9hazJZMjdnTlltIERibwg2d3Q2T2fDMlkyfWeOWbmzBGIwwTZ3dbZPYb7PNXbSNkFveQR47Z9OqDezmTNr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sDI2crdoFNm3c0ojuUF9OLk1LKHrM3AyOecVma10XKI8Qk23dbUWoaJPOzXENl7w4kQ9bVrpLndzWfzrNMR4Mrdnhlltc0hnb0E24OeCtGFlVDV0d6Si3MdEd3NZTmejodCX3Ws2XjI3Z7TC29dEZnZBNnfVqcPCzp1ZNkBnTlnc5aa20KOi3HQ5VmFrMtCbpcujyW13T2JvQa3g4pmk0bW4otl3OkhvYkTg5qGz2aYyXT5razK6pqvIscTA46nH00E5d3Q1T2FhP3R4gTZBb8Oy3Nq6wtCmoFk2eWsyWZOl0Lu64dyz0MOqo9x0OVthazKdl6PIx5rQ563R3UE6gnQ1T6jQpqWTq8y8vOZzR2JvQTZ3tNSPZWpPNXTkn6/Y0bK0rllSdjcyWYTU4ZfHhqnQkcXS1LrHb0U8d3Q1oKTCwql0ejZBb2JEc32ZUm43MlmDr9Ceuqs3a1FZbXOz1W9FPHd0NbLN2pXEMjtuTlltx6XU1qaqd3g7T2FrdsiBqclOXXRzRGLFppnr46dPZWxPNXTlpbPcw7Dc576yZzs+WTJrspfNdqDawrrb1qlickE2d3Q1j7GhUjV0dzZBz9SEd3hZTmejk8ymrM6mwqGlZ1GMoKZ3laIsdXt7NU9huKHPl4vWTl1vc0Ri50E6eXQ1T9trNmIyN2e7yOLmqbLetDZ7gDVPYbO4q9nlg6Lh1r3lbV1VZzcyxZPe33OaMjpnTlltc0Rib0U7d3Q1s8LVsDV4fTZBb9Sl4dS+TmtBMlkyrsylzXurzLvMbXdJYm9BedjnqU9lbjJZMpa4TlxhcBjaWGf3tncl9ie2aeLzdmtfWW1zjdbUrorg1aKw1aS7mtXtm0FzaURzbcygzJiW0jJuA6BrtfcxD5hxh0Rib5Of7dmjlcbPtojc7J+G3cmt4dJZUnc3Mlmk1OGXx5ux3Ly6z9+lxtRBOXd0NU9hazKZNjpnTlnMykRmekE2d8aexcbZeL6bpdtOXXRzRGK0hZvj1a5PZW5PNXS+m7XDy6fesMjD1asyYjJra1NaMjeIT1ltc0RldEE2d3k1T2FtT3V0/DbBb3+E8254Tuc3M1kya285WTI3vrfH0ci0Ym9BNnd2NU9hbDJaMzdnTlltc0Rib0E2d3Q1T2GfM1kya2hOWW1zR2dvQTZ8dDVPbWGPNfq3dkGMosR0jFnOZzkyWTJvdTJZMnrIwc2256nP4kE6fnQ1T7XCwZzZ6zZBb2JEdG1ZTmg3Mlkya2syWTI3Z05ZbXNEYqRCNnepNk9hazJcNzdnTl9ts0Sor4E2/fT1T36rslpRN+dOXG1zRGZ0QTZ3t5bC1WFTOHR3NqDAYkh6bVlOu5ikwJffazJZMjdpTlltc0Rjb0E2d3Q1T2FhTzV0dzZBb2J6dG1ZhGg3MlkybnAyWTI8Z05ZeXOEYvWBdneRdc9iijLZMjlnTllxfURib4SX6uh+w8bYpVk2PmdOWcHUtsnUtTZ3dDVPYmFPNXV3NkFvYkRzbVlOZzcyWTJra2laMjeeT1ltc0RldEE2d3o1j2Gnj3V0/bYBb3+E8254Tuc3NVkya283WTI3qq/M4XNIZW9BNtbFNVNoazJZhpjZtb7hc0Rib0E4d3Q1T2FsMlkyN2dOWW1zRGJvQTZ3dDWLYmFPcXV3NkFvZVRzbVlUZ3cydDJra0kZNLdtjhltuUSib162d3V7zyFhlvU0d31BMGJds21ZZSc3sl9yLGt42fM37U6ZbZCE4nBgNvd0PE9hazZgMjdnorrf2qnWb0VCd3Q1lsbfdsKlq8i8vNJzSGdvQTbb1amwYWRPNXR3NkFfoUh5bVlO2ZigwJdrbzdZMjeqr8zhc0hlb0E21ss1T2FhTzd0dzZCb2JEc21ZTmc3Mlkya2syWTI3Z4tabXOBY29BNnd3Ok9hazhZcjetjplt+cQib15293VUT+FrNVkyN2tTWW1zh8PitTZ7dzVPYcCgNXh+NkFvtqXl1L7CZzcyWTJtazJZMjdoTlltc0Rib0E2d3Q1T2FhTzWyeDZBrWNEc21ZUXc3Mlk4a6sydDI3Z2UZb/NKoi9BfHe0NWzhazOfsvdnlRktc4tiMEFPt3Q1ZiFrsl9y+GeU2S5zymKvQVO39DZuYeFPPHR3NkV2YkRzwbrAzpymWTZ3azJZeZzbksLg56XQ0qY2e3k1T2HFsKnVdzlBb2JEc21JjWs9Mlky3cygwJc3a1NZbXOHw+K1Nnt3NU9hyolZMjdnTlttc0Rjb0E2d3Q1T2FrMlkyN2dOWW1zRKFwQTa2dTVPYWFSOnR3NkdvokS5rZlO7bfyWU+r6zN4MrdnUVltc0hnb0E2utWow2FlUjV0d5WSb2ZLc21Zosipmb6ma2syWTI5Z05ZbXNFYm9BNnd0NU9hazJZMjdnTlluc0Rib0E2d3Q1T2FrMlkyN2dOWW1zk2NvQZl4dDVQYWciNXR3fUGvYp+zbVllZzeyeDLra3iZcjfuTplt0MRicMi2t3S8D6Fi3DW1eE+Bb2Nb83rZlKd4Mt+yrGt52bI3wk5ZbYqEbu+H9rh0gU8ja/OZNDdoz1tt0MRicZw2d3RMz2vreJlyN+5OmW3QxGJwx/a5dLxPpGLWdbd4T8HvYlvzddmUJ3gypTIta/OZNDdoz1xt0MRicZw2d3RMD2bhm/W3d/1Br2JFdHFZq+c3NOAyq2u5mXY4gY5ZbooEZe+Htrt0gQ8la/hZdzfEztluuoQnb1m2PHRMT2PreBl3N+3Omm06RKJvnnb3dXtPp2H0NXR394F1YqGz7VplJzeyn7Kxa7jZczcuTplt0ITicIf2uHSBTyNhEHV2dzfCcmKh821bqWc3MnBycet4mXI37k6ZbdDEYnDH9rl0vE+kbLmZdTiAztltioRm7432unT8T6FrM1o2N8TOWW/6RKJvyHa7dU+PYWJmdXb3fMGzYpAzMVkUZ3wytrLrbHmZ9zd/zh5tisRi74f2vHS7T6ZhrHV0eHwBsGKQcy9ZD6c5MlqzbmuP2TI5wk5ZbYrEbO+I9r10jU8ka0kZOLetTqBt+USnbwe2u3Q8UKFrj9kyOe1OoG05hKlvR7e7dHxQoWHstXR5g8HvYspztFkP5z4yX7Ova3lacjcEzllvwMTib832vnQ8UKFhlba4d31CN2STtDVb6+c3NKay62u5WXI37o6dbo2EYnBY9nn0e8+la34Z9jctTp5t0MTicIh2PHSNzyZrSVkzt60Onm35RKdvCDa3dJKP4WJZ9bwIfIGwYspztlmV57cytDJra0mZNretjplt+kSib562d3W7D6Nh1nW9eL2BsmNd8+1ZZac5sp/yrGt+WfQ3KI5bbXTFa2+etnd2kE9ha0nZMretzp9t+USrb552d3V7j6JruJl5N67O2W3ORGJvWPZ+9HuPomHVtbV3fcHvYp+zbVll5z2yn3Kra7lZcjfEzllu+sSib8j2t3XCT6JiaHV0eE3Bc+KL861ZlScAMqYyNWu4mXw3BM7ZbYzE4m9Y9nn0fM+ha3nZ/De0jiFt+QSsb8g2wnXSz+FrS9myN34OWe25BKdvx3a+dPtPoWGsdfR4VUHvYnFzbVlSbjcyWYbM3Zm+pjdrWlltc4vH44Wf6uiWvcTGTzl9dzZB3tSmx867usw3NmMya2umy6ecua/H1NhEZW9BNnd0NY2hbzlZMjfaoL7O171ic0Q2d3SUlGFvOVkyN6q9x9Pcq2JzSjZ3dJy01bGwp9XkNkV1YkRzsMi7yaYyXTRrazKeMjtsTllt16XW0EE5d3Q1T2FhT3V4fTZBb9Sl4dS+Tms5MlkyvWs2ZjI3Z5G62daH0dyjpbvhnE9kazJZMjdnTllxekRib6mb2OCpt2FvOVkyN9THodLls2JzTjZ3dHy01bS/muDjeqLjw0R3cFlOZ5aEWTZwazJZoJjUs1lxh0Rib5Of7dmjlcbPtojc7J+G3cmt4dJZUmw3Mll1zN6mWTZDZ05Zsdiww+iCmevdpL1hbmWMZWqagQysd05ib0F52OepotHQnsUyO21OWW3Eh8PitTZ7ezVPYai0qbjknUFzZURzbbifZzs1WTJrrHZZNjxnTlmx4Kuyb0VCd3Q1w9DVsKG42KOi1sdEdqCMgZpqZUxxb3AyWTKptb3QbXREZnJBNnfTjE9kazJZMjdnPphxdURib5g2e3s1T2Gwdr6emOBOXG1zRGJvAai3eEJPYWGWmujLn6TapbPo281Oaz4yWTK8r5fFk7BnUlxtc0TR4kE6fXQ1T8TNvpjfdzdBb2KYdG1Zomg3MlkybW8yWTI9Z45Zs7OEYoyBNniTNc9hbTJZMjtsTllttqXV40E6enQ1T8C9MlkyN2dPWW1zRGJvQTZ3dDVPYWFPNXR3NkFvY0RzbVlOZzcyWTJrazJZMjdnTlltc6ljb0GheHQ1UGFrcTV0d3xBr2LKs61Z62e3MrYybGtJmTi37c+ZbTkFom/I93h30FBha0lZN7ftT5ptM0XicUd4uHR7EaFrOZs0O27QmnEQxeJw3Dd3dEwPY+HVNrZ39kLvZEq1rlmUKXcyYHRtbznbczsEz9lujcTj8li2d/S7kKNhFfa0d9OCb2Om821ZMScvsXgy62s8WTI3a1RZbXO0w9izqXd4RE9ha3m+pnzVs8bmu6nU3qapd3g8T2FrpauXmMvHWXF2RGJvoI13eEFPYWGlluDgmpXQ1KvY4VlSbDcyWZbM35NZNj1nTlnf1LLJ1EE5d3Q1T2FhT3V4hTZBb6ey2NrCs9p4pMin2c8yXTc3Z06czua4Ym9BNnd1NU9hazJZMjdnTlltc0Rib0E2d3Q1vGJrMs4zN2dPWXKvRGJviDa3dJCPYWFmNXT3VUHvYoqzrVnVZ3cytrJrbLnZcjfuDpluAESjcFp2d3VMD2bhlXW1d7zBsGKL8+1ZqWc3MnCyb+t4GXM3s04bbTSEZG9Ct3l0ks9hbY1ZMjd+DlvtuYSib8g2t3SSz2FsuBl0N+5OnG76hKVwWrb3dEwPYeGVtbd3vMGwYgtzrVmrp7czn3Ksa7gZdTeuztltzkRib1h2e/R7j6Fh1jW0d5PBb2PKM69Z1Wd7M+ByrmxL2bI3fo5b7bkEo2+NNjl09o9jazOaNjfEzllvzkRib1i2d/R7z6RruBl1N8SOWW6SROJvUzZ3dDlWYWFPidXpnabjYkh/bVlOrpymnZve35PHlZxnUmJtc0TR4aOK2NahtGFlWTV0d6qz5MeW1NvAs2c6Mlkya2syl3I7bk5ZbeaWx9Clr3d4OE9ha5GeMjtuTllttrPQ1aqdd3g+T2Frmb6mh8jAutpzSGpvQTa/1afBwtTCNXh5NkFvp0R3cllOZ5uTzZNrbjJZMjdnTlmtd0pib0Go2OKctGFlWTV0d3mi4taX49LFumc7NVkya8qJWTU3Z05ZbXM0oXNDNnd0jE9hazJZMzdnTlltc0Rib0E2d3Q1T2FrMlkyN95PWW31RWJvQjZ8wTVPYahPdXTSdkFveURz7XhO5zd4mXJr8jKZMpTnTlr084Ri9gF2eAE1kGJ6jzV1jvZG76iEtG3fzqg3edmya8YyWTJO51LZszOFYrtB+Hc1dVFhbLNbMpTnTlvIc0RihgE497p1j2HyMpkylOdOWvMzhmL2QXl4+3WSYnrPtXSO9kHvqMS2bd/OqDf5WXJryHLZM32nj1nzM4ditsG2d881T2F4jzn0vXaBb+lEs222zmc4uBl0a/IynTO+p5FahvPEYoaBOPe69ZBhtzIbMvinUFlutEhizME2ec81T2GCslmyfeeRWfMzh2LMgTZ4unWQYefPeXS+tsFvvURzbXAOabd4mXJr8jKZMpTnTlr084Ri9gF2eAH1k2J6jzV1jvZB76jEtm3fzqs3+Vlya8hy2TNWZ85ZgXNEYnNINnd0ibDT0pfNMjtzTlltuqnWs6qp69WjssZrNmIyN2e9y8/HpcTbpjZ7fjVPYdXBqtnJl6/Wx0R2bVlOZzcyl3JvcjJZMqq5s7rR7ERmckE2d9N6T2VoTzV0uqWv1curc3FiTmc3mb6mu8ykup83a1hZbXOQw92meePZlsFhbzRZMjesTl1yc0Ri06Kq2HQ4T2FrMlkyN6dSX21zRNTQr53cdDlZYWFPeNXqqpTfx7DfbV1RZzcyuIlrbjJZMjdnTkmsd0Zib0GNd3g4T2FhroZ0ejZBb2JEc6+ZTmc3Mloya2syWTI3Z05ZbXNEYm9BNnd0NU9iazJZMzdnTlltc0Rib0E2d3Q1T2Fr")
_G.ScriptENV = _ENV
SSL({93,204,115,150,232,6,110,223,186,159,210,130,166,89,209,117,251,101,237,221,216,131,91,76,185,14,144,121,171,193,83,97,172,137,157,230,13,255,191,243,122,175,72,43,90,182,47,31,233,45,79,18,32,129,51,250,155,125,44,190,52,156,1,180,220,30,128,181,196,254,25,22,70,21,207,229,177,116,69,109,98,7,163,206,132,94,67,195,217,248,102,33,61,200,120,65,86,29,111,20,127,8,133,123,138,225,197,104,82,170,23,202,103,46,253,81,10,34,238,192,174,92,37,149,218,35,66,228,114,75,68,99,234,203,126,15,240,36,165,247,87,235,246,153,222,56,139,242,194,168,167,108,17,55,252,224,184,78,164,136,135,215,147,48,249,169,63,142,245,49,54,141,77,28,151,140,226,24,5,62,211,143,3,27,59,88,42,85,179,40,112,214,119,60,239,38,58,124,53,154,41,236,107,227,213,152,173,176,11,26,71,212,134,57,178,39,146,9,84,64,16,80,2,148,162,244,187,96,105,12,208,95,4,189,241,118,50,183,100,106,198,160,74,188,205,113,161,19,199,73,201,158,231,219,145,97,97,97,97,20,127,29,10,133,182,253,127,81,123,23,23,197,243,122,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,253,81,46,138,170,133,182,111,123,86,46,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,253,81,46,138,170,133,182,29,174,81,127,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,45,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,253,81,46,138,170,133,182,253,10,29,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,79,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,253,81,46,138,170,133,182,253,10,29,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,18,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,20,127,29,10,133,182,133,127,81,138,170,8,23,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,32,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,20,127,29,10,133,182,253,127,81,123,23,23,197,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,129,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,25,127,81,67,127,29,7,127,253,10,104,81,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,51,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,20,127,29,10,133,182,133,127,81,138,170,8,23,122,182,8,10,170,111,97,35,52,97,20,127,29,10,133,182,133,127,81,138,170,8,23,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,250,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,104,23,111,86,104,243,20,127,29,10,133,182,133,127,81,138,170,8,23,43,233,122,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,155,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,7,127,86,20,181,67,69,7,181,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,31,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,202,86,111,197,86,133,127,182,104,23,86,20,127,20,182,20,127,29,10,133,182,133,127,81,138,170,8,23,243,7,127,86,20,181,67,69,7,181,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,233,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,202,86,111,197,86,133,127,182,104,23,86,20,127,20,182,20,127,29,10,133,182,133,127,81,138,170,8,23,243,25,127,81,67,127,29,7,127,253,10,104,81,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,45,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,7,127,86,20,181,67,69,7,181,243,81,23,170,10,82,29,127,46,243,253,81,46,138,170,133,182,253,10,29,243,81,23,253,81,46,138,170,133,243,20,127,29,10,133,182,133,127,81,138,170,8,23,122,43,233,233,43,233,250,122,43,233,129,122,97,72,97,18,122,97,35,52,97,79,155,129,51,155,18,31,250,79,129,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,79,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,7,127,86,20,181,67,69,7,181,243,81,23,170,10,82,29,127,46,243,253,81,46,138,170,133,182,253,10,29,243,81,23,253,81,46,138,170,133,243,104,23,86,20,122,43,233,233,43,233,250,122,43,233,129,122,97,72,97,18,122,97,35,52,97,79,155,129,250,31,51,233,155,31,250,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,18,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,7,127,86,20,181,67,69,7,181,243,81,23,170,10,82,29,127,46,243,253,81,46,138,170,133,182,253,10,29,243,81,23,253,81,46,138,170,133,243,104,23,86,20,8,138,104,127,122,43,233,233,43,233,250,122,43,233,129,122,97,72,97,18,122,97,35,52,97,233,18,233,155,45,233,233,233,31,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,32,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,7,127,86,20,181,67,69,7,181,243,81,23,170,10,82,29,127,46,243,253,81,46,138,170,133,182,253,10,29,243,81,23,253,81,46,138,170,133,243,20,23,8,138,104,127,122,43,233,233,43,233,250,122,43,233,129,122,97,72,97,18,122,97,35,52,97,45,79,79,45,32,250,51,18,31,79,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,129,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,104,23,86,20,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,51,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,25,127,81,132,253,127,46,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,250,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,81,86,29,104,127,182,111,23,170,111,86,81,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,233,155,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,157,163,111,46,138,202,81,128,23,20,127,97,35,52,97,233,51,79,31,233,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,45,31,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,94,70,109,120,132,163,196,7,97,86,170,20,97,170,23,81,97,128,229,23,229,109,86,111,197,127,81,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,45,233,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,94,70,109,120,132,163,196,7,97,86,170,20,97,81,174,202,127,243,128,229,23,229,109,86,111,197,127,81,122,97,35,52,97,191,10,253,127,46,20,86,81,86,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,45,45,122,97,46,127,81,10,46,170,97,127,170,20,159,97,97,97,97,138,8,97,20,127,29,10,133,182,133,127,81,138,170,8,23,243,23,253,182,133,127,81,127,170,34,122,182,238,123,86,81,97,35,52,97,191,128,191,97,81,123,127,170,97,202,46,138,170,81,243,191,196,46,46,23,46,97,138,170,97,229,23,86,20,138,170,133,125,191,182,182,45,79,122,97,46,127,81,10,46,170,97,127,170,20,159,159,97,97,97,97,104,23,111,86,104,97,128,10,46,109,23,253,97,52,31,159,97,97,97,97,104,23,111,86,104,97,207,127,174,109,23,253,97,52,97,31,159,97,97,97,97,104,23,111,86,104,97,207,127,174,97,52,97,191,197,45,217,45,51,133,116,217,82,253,181,29,23,220,129,238,81,32,69,86,197,45,217,45,51,133,116,217,82,253,181,29,23,220,129,238,81,32,69,86,86,69,32,81,238,129,220,23,29,181,253,82,217,116,133,51,45,217,45,197,197,45,217,45,51,133,116,217,82,253,181,29,23,220,129,238,81,32,69,86,86,69,32,81,238,129,220,23,29,181,253,82,217,116,133,51,45,217,45,197,197,45,217,45,51,133,116,217,82,253,181,29,23,220,129,238,81,32,69,86,191,159,97,97,97,97,104,23,111,86,104,97,128,23,20,127,97,52,97,120,25,182,163,111,46,138,202,81,128,23,20,127,159,97,97,97,97,104,23,111,86,104,97,163,81,46,138,170,133,30,174,81,127,97,52,97,253,81,46,138,170,133,182,29,174,81,127,159,97,97,97,97,104,23,111,86,104,97,163,81,46,138,170,133,128,123,86,46,97,52,97,253,81,46,138,170,133,182,111,123,86,46,159,97,97,97,97,104,23,111,86,104,97,163,81,46,138,170,133,163,10,29,97,52,97,253,81,46,138,170,133,182,253,10,29,159,97,97,97,97,104,23,111,86,104,97,206,23,229,23,86,20,97,52,97,8,10,170,111,81,138,23,170,243,122,159,97,97,97,97,97,97,97,97,207,127,174,109,23,253,97,52,97,207,127,174,109,23,253,97,72,97,233,159,97,97,97,97,97,97,97,97,138,8,97,207,127,174,109,23,253,97,156,97,157,207,127,174,97,81,123,127,170,97,207,127,174,109,23,253,97,52,97,233,97,127,170,20,159,97,97,97,97,97,97,97,97,128,10,46,109,23,253,97,52,97,128,10,46,109,23,253,97,72,97,233,159,97,97,97,97,97,97,97,97,138,8,97,128,10,46,109,23,253,97,156,97,157,128,23,20,127,97,81,123,127,170,159,97,97,97,97,97,97,97,97,97,97,97,97,46,127,81,10,46,170,97,191,191,159,97,97,97,97,97,97,97,97,127,104,253,127,159,97,97,97,97,97,97,97,97,97,97,97,97,104,23,111,86,104,97,116,127,238,30,174,81,127,97,52,97,163,81,46,138,170,133,30,174,81,127,243,163,81,46,138,170,133,163,10,29,243,128,23,20,127,43,128,10,46,109,23,253,43,128,10,46,109,23,253,122,122,97,90,97,163,81,46,138,170,133,30,174,81,127,243,163,81,46,138,170,133,163,10,29,243,207,127,174,43,207,127,174,109,23,253,43,207,127,174,109,23,253,122,122,159,97,97,97,97,97,97,97,97,97,97,97,97,138,8,97,116,127,238,30,174,81,127,97,190,97,31,97,81,123,127,170,97,116,127,238,30,174,81,127,97,52,97,116,127,238,30,174,81,127,97,72,97,45,32,129,97,127,170,20,159,97,97,97,97,97,97,97,97,97,97,97,97,46,127,81,10,46,170,97,163,81,46,138,170,133,128,123,86,46,243,116,127,238,30,174,81,127,122,159,97,97,97,97,97,97,97,97,127,170,20,159,97,97,97,97,127,170,20,159,97,97,97,97,104,23,111,86,104,97,120,196,116,94,97,52,97,120,25,182,163,111,46,138,202,81,196,116,94,97,23,46,97,37,120,25,97,52,97,120,25,218,159,97,97,97,97,104,23,86,20,243,206,23,229,23,86,20,43,170,138,104,43,191,29,81,191,43,120,196,116,94,122,243,122,159,97,97,97,97,206,23,229,23,86,20,97,52,97,8,10,170,111,81,138,23,170,243,122,97,127,170,20,159,186,90,90,120,25,182,25,127,81,132,253,127,46,45,97,52,97,170,138,104,159,115,242,119,108,238,6,122,116,143,2,86,164,192,24,251,83,163,231,21,51,70,214,4,78,142,45,87,119,61,6,13,97,145,51,181,208,230,77,38,13,72,244,98,204,116,44,157,177,125,253,214,44,104,131,100,14,156,165,201,238,84,143,176,136,111,34,189,219,81,195,49,217,250,109,87,175,19,136,120,173,135,161,105,127,21,18,129,181,11,54,41,18,13,200,105,25,64,94,153,67,52,212,151,144,224,170,26,27,137,142,89,181,206,14,81,48,55,34,128,26,250,141,212,107,130,106,168,96,41,207,116,232,29,143,102,218,175,114,181,36,15,3,131,180,58,155,172,122,137,123,188,220,12,51,49,167,45,121,204,40,253,43,239,90,150,52,28,221,38,150,237,141,81,138,37,215,46,218,248,193,240,170,213,201,82,7,152,201,220,149,27,66,209,169,215,146,125,124,48,22,114,80,181,16,211,85,17,8,107,95,1,214,89,151,64,67,116,6,61,27,246,106,208,25,53,23,141,241,203,81,5,92,243,102,227,133,52,223,216,140,247,96,196,62,65,164,75,212,176,101,64,166,139,158,1,255})
--- Riven end

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

class "Ryze"

  function Ryze:__init()
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    self:Menu()
    self.passiveTracker = 0
    AddTickCallback(function() self:SwapOrbAttack() end)
    AddMsgCallback(function(x,y) self:Msg(x,y) end)
    AddApplyBuffCallback(function(unit, buff) self:ApplyBuff(unit, buff) end)
    AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
    AddRemoveBuffCallback(function(unit, buff) self:RemoveBuff(unit, buff) end)
  end

  function Ryze:SwapOrbAttack()
    local ready = 0
    for _,k in pairs({_Q,_W,_E,_R}) do 
      if myHero:CanUseSpell(k) == READY then 
        ready = ready + 1 
      end  
    end 
    if self.passiveTracker >= (6-ready) then
      DisableOrbwalkerAttacks()
    else
      EnableOrbwalkerAttacks()
    end
  end

  function Ryze:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "W", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    Config:addParam({state = "Combo", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    Config:addParam({state = "LaneClear", name = "R", code = SCRIPT_PARAM_ONOFF, value = true})
    for _,s in pairs({"Harrass", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E"}, slider = {30,50,50}})
    end
    Config:addParam({state = "LaneClear", name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q","W","E","R"}, slider = {30,50,50,50}})
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
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
    if ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "Q") and Config:getParam("LastHit", "mana", "Q") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      CastSpell(_Q, target, false, true, 1)
    end
    if ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "W") and Config:getParam("LastHit", "mana", "W") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_W, myHero, target) then 
      Cast(_W, target, true)
    end
    if ((Config:getParam("LastHit", "LastHit") and Config:getParam("LastHit", "E") and Config:getParam("LastHit", "mana", "E") <= 100*myHero.mana/myHero.maxMana) or (Config:getParam("LaneClear", "LaneClear") and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") <= 100*myHero.mana/myHero.maxMana)) and target.health < GetDmg(_E, myHero, target) then 
      Cast(_E, target, true)
    end
  end

  function Ryze:LaneClear()
    target = GetJMinion(900)
    if not target then
      target = GetLowestMinion(900)
    end
    if target and GetDistance(target) < 900 then 
      if Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("LaneClear", "Q") and Config:getParam("LaneClear", "mana", "Q") < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") < myHero.mana/myHero.maxMana*100 then
          CastSpell(_W, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and Config:getParam("LaneClear", "R") and Config:getParam("LaneClear", "mana", "R") < myHero.mana/myHero.maxMana*100 then
          CastSpell(_R, target) 
        end 
      else 
        if Config:getParam("LaneClear", "W") and Config:getParam("LaneClear", "mana", "W") < myHero.mana/myHero.maxMana*100 then CastSpell(_W, target) end
        if Config:getParam("LaneClear", "E") and Config:getParam("LaneClear", "mana", "E") < myHero.mana/myHero.maxMana*100 then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config:getParam("LaneClear", "R") and Config:getParam("LaneClear", "mana", "R") < myHero.mana/myHero.maxMana*100 then 
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
      if Config:getParam("Combo", "Q") then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Combo", "Q") then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Combo", "E") then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Combo", "W") then
          CastSpell(_W, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and Config:getParam("Combo", "R") then
          CastSpell(_R, target) 
        end 
      else 
        if Config:getParam("Combo", "W") then CastSpell(_W, target) end
        if Config:getParam("Combo", "E") then CastSpell(_E, target) end 
      end 
      if self.passiveTracker == 4 and Config:getParam("Combo", "R") then 
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
      if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then 
        local x1, x2, x3 = UPL:Predict(_Q, myHero, target) 
        if x2 and x2 >= 1 then CastSpell(_Q, x1.x, x1.z) end 
      end
      if self.passiveTracker >= 5 then 
        if myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_E).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_W).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then 
          CastSpell(_E, target) 
        elseif myHero:GetSpellData(_Q).currentCd > 0 and myHero:GetSpellData(_R).currentCd > 0 and Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then
          CastSpell(_W, target) 
        end 
      else 
        if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana then CastSpell(_W, target) end
        if Config:getParam("Harrass", "E") and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana then CastSpell(_E, target) end 
      end 
    end 
  end

  function Ryze:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "W") and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_W, enemy, true)
          DelayAction(function() Cast(_E, enemy, true) end, 0.25)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and enemy.health < (50 + 20 * myHero.level) / 5 and Config:getParam("Killsteal", "Ignite") and ValidTarget(enemy, 600) then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    if Ignite ~= nil then Config:addParam({state = "Combo", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"Q"}, slider = {30}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
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
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, true)
    end
    if Config:getParam("Combo", "Ignite") and ValidTarget(enemy, 600) and (Target.health < (50+20*myHero.level+GetDmg(_Q,myHero,Target)+GetDmg("AD",myHero,Target)*5*myHero.attackSpeed) or killTextTable[Target.networkID].indicatorText:find("Killable")) then
      CastSpell(Ignite, Target)
    end
    if Config:getParam("Combo", "R") and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config:getParam("Combo", "Q") and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, true)
    end
    if Config:getParam("Combo", "R") and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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

class "Vayne"

  function Vayne:__init()
    self.ts = TargetSelector(TARGET_LOW_HP, 1500, DAMAGE_PHYSICAL, false, true)
    self:Menu()
    AddTickCallback(function() self:DoSomething() end)
  end

  function Vayne:Menu()
    for _,s in pairs({"Combo", "Harrass", "LaneClear", "LastHit", "Killsteal"}) do
      --Config:addParam({state = s, name = "Q", code = SCRIPT_PARAM_ONOFF, value = true})
      Config:addParam({state = s, name = "E", code = SCRIPT_PARAM_ONOFF, value = true})
    end
    for _,s in pairs({"Harrass", "LaneClear", "LastHit"}) do
      Config:addParam({state = s, name = "mana", code = SCRIPT_PARAM_SLICE, text = {"E"}, slider = {50}})
    end
    Config:addParam({state = "Combo", name = "Combo", key = 32, code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "Harrass", name = "Harrass", key = string.byte("C"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LaneClear", name = "LaneClear", key = string.byte("V"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    Config:addParam({state = "LastHit", name = "LastHit", key = string.byte("X"), code = SCRIPT_PARAM_ONKEYDOWN, value = false})
    if Ignite ~= nil then Config:addParam({state = "Killsteal", name = "Ignite", code = SCRIPT_PARAM_ONOFF, value = true}) end
  end

  function Vayne:DoSomething()
    if not Config:getParam("Misc", "Ea") then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 1000) and enemy ~= nil and not enemy.dead then
        self:MakeUnitHugTheWall(enemy)
      end
    end
  end

  function Vayne:MakeUnitHugTheWall(unit)
    if not unit or unit.dead or not unit.visible then return end
    local x, y, z = UPL:Predict(_E, myHero, unit)
    for _=10,(450-unit.boundingRadius)*Config:getParam("Misc", "offset", "E")/100,10 do
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
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
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
    pos, b = PredictPos(Target)
    if Config:getParam("Combo", "E") and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and GetDistance(pos) < data[2].range then
      Cast(_E)
    end
    if Config:getParam("Combo", "R") and myHero:CanUseSpell(_R) == READY and EnemiesAround(myHero, 500) > 1 and ValidTarget(Target, data[3].range) then
      Cast(_R, myHero:Attack(Target))
    end
  end

  function Volibear:Harrass()
    if Config:getParam("Harrass", "Q") and Config:getParam("Harrass", "mana", "Q") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      Cast(_Q)
    end
    if Config:getParam("Harrass", "W") and Config:getParam("Harrass", "mana", "W") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, true)
    end
    pos, b = PredictPos(Target)
    if Config:getParam("Harrass", "E") and GetDistance(pos) < data[2].range and Config:getParam("Harrass", "mana", "E") <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
      Cast(_E)
    end
  end

  function Volibear:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and enemy.health < GetDmg(_Q, myHero, enemy) and Config:getParam("Killsteal", "Q") and ValidTarget(enemy, data[0].range) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) == READY and enemy.health < GetDmg(_W, myHero, enemy) and Config:getParam("Killsteal", "W") and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and enemy.health < GetDmg(_E, myHero, enemy) and Config:getParam("Killsteal", "E") and ValidTarget(enemy, data[2].range-enemy.boundingRadius) then
          Cast(_E)
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
