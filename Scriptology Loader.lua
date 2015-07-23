--[[
     ____           _       __         __                
    / __/____ ____ (_)___  / /_ ___   / /___  ___ _ __ __
   _\ \ / __// __// // _ \/ __// _ \ / // _ \/ _ `// // /
  /___/ \__//_/  /_// .__/\__/ \___//_/ \___/\_, / \_, / 
                   /_/                      /___/ /___/  

    By Nebelwolfi

]]--

--Scriptstatus Tracker
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion       = 2
_G.ScriptologyAutoUpdate    = true
_G.ScriptologyDebug         = false
_G.ScriptologyLoaded        = false
_G.ScriptologyLoadedClasses     = {}
_G.ScriptologyConfig      = scriptConfig("Scriptology Loader", "Scriptology"..myHero.charName)

-- { Scriptology Loader

  AddLoadCallback(function()
    if Update() then
      DelayAction(Load, 2)
    else
      Load()
    end
  end)

  function Load()
    if FileExist(LIB_PATH .. "ScriptologyLib.lua") then
      require("ScriptologyLib")
      if pcall(require, "Scriptology - "..myHero.charName) then
        Vars()
        ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
        _G.ScriptologyLoaded = true
        ScriptologyLoadedClasses[myHero.charName] = _G[myHero.charName]()
        AfterLoad()
      else
        ScriptologyMsg("Plugin: '"..myHero.charName.."' not found, checking online..")
        if CheckForPlugin(myHero.charName) then
          DelayAction(function() 
            if pcall(require, "Scriptology - "..myHero.charName) then 
              Vars()
              ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
              _G.ScriptologyLoaded = true
              ScriptologyLoadedClasses[myHero.charName] = _G[myHero.charName]()
              AfterLoad()
            end 
          end, 3)
        end
      end
    else
      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/ScriptologyLib.lua".."?rand="..math.random(1,10000), LIB_PATH.."ScriptologyLib.lua", function() end)
      DelayAction(Load, 2)
    end
  end

  function AfterLoad()
    for _, class in pairs(ScriptologyLoadedClasses) do
      if class then
        ScriptologyConfig:addSubMenu(_, _)
      end
    end
    if ScriptologyConfig[myHero.charName] then
        _G.Config = ScriptologyConfig[myHero.charName]
        Config:addSubMenu("Combo","Combo")
        Config:addSubMenu("Harrass","Harrass")
        Config:addSubMenu("LastHit","LastHit")
        Config:addSubMenu("LaneClear","LaneClear")
        Config:addSubMenu("Killsteal","Killsteal")
        Config:addSubMenu("Misc","Misc")
        Config:addSubMenu("Draws","Draws")
        Config.Draws:addParam("Q", "Draw Q", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("W", "Draw W", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("E", "Draw E", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("R", "Draw R", SCRIPT_PARAM_ONOFF, true)
        Config.Draws:addParam("DMG", "Draw DMG", SCRIPT_PARAM_ONOFF, true)
        Config.Draws:addParam("LFC", "Use LFC", SCRIPT_PARAM_ONOFF, true)
        Config.Draws:addParam("OpacityQ", "Opacity Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
        Config.Draws:addParam("OpacityW", "Opacity W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
        Config.Draws:addParam("OpacityE", "Opacity E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
        Config.Draws:addParam("OpacityR", "Opacity R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
        Config:addSubMenu("Key Settings","kConfig")
    end
    for _, class in pairs(ScriptologyLoadedClasses) do
      if class then
        pcall(function() class:Load() end)
      end
    end
    LoadAwareness()
    LoadEvade()
    LoadOrb()
    DelayAction(SilentUpdate, 5)
  end

  function LoadAwareness()
      if _G.PrinceViewVersion == nil then
      if pcall(require, "Scriptology - Awareness") then
        ScriptologyMsg("Plugin: 'Awareness' loaded")
        SAwareness()
      else
        if CheckForPlugin("Awareness") then
          DelayAction(LoadAwareness, 2)
        end
      end
      end
  end

  function LoadEvade()
      DelayAction(function()
        if _G.Evadeee_Loaded == nil and _G.Evade == nil and _G.Evading == nil and _G.evade == nil and _G.evading == nil then
          LoadEvade2()
        end
      end, 10)
  end

  function LoadEvade2()
    if pcall(require, "Scriptology - Evade") then
      ScriptologyMsg("Plugin: 'Evade' loaded")
      SEvade()
    else
      if CheckForPlugin("Evade") then
        DelayAction(LoadEvade2, 2)
      end
    end
  end

  function LoadOrb()
    if pcall(require, "Scriptology - Walk") then
      ScriptologyMsg("Plugin: 'Walk' loaded")
      SWalk(nil, ScriptologyConfig)
    else
      if CheckForPlugin("Walk") then
        DelayAction(LoadOrb, 2)
      end
    end
  end

  function Update()
    local ScriptologyServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Scriptology.version")
    if ScriptologyServerData then
      ScriptologyServerVersion = type(tonumber(ScriptologyServerData)) == "number" and tonumber(ScriptologyServerData) or nil
      if ScriptologyServerVersion then
        if tonumber(ScriptologyVersion) < ScriptologyServerVersion then
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/UPL.lua".."?rand="..math.random(1,10000), LIB_PATH.."UPL.lua", function () end)
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Scriptology Loader.lua".."?rand="..math.random(1,10000), SCRIPT_PATH.."Scriptology Loader.lua", function() end)
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/ScriptologyLib.lua".."?rand="..math.random(1,10000), LIB_PATH.."ScriptologyLib.lua", function() end)
          return true
        end
      end
    else
      ScriptologyMsg("Error downloading version info")
    end
    return false
  end

  function SilentUpdate()
    for _, k in pairs(ScriptologyLoadedClasses) do
      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/".._..".lua?rand="..math.random(1,10000), LIB_PATH.."Scriptology - ".._..".lua", function() end)
    end
  end

  function CheckForPlugin(name)
    local ScriptologyPlugin = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/SPlugins/"..name..".version")
    if ScriptologyPlugin then
      ScriptologyPluginVersion = type(tonumber(ScriptologyPlugin)) == "number" and tonumber(ScriptologyPlugin) or nil
      if ScriptologyPluginVersion then
        ScriptologyMsg("Downloading plugin: '"..name.."'")
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/"..name..".lua?rand="..math.random(1,10000), LIB_PATH.."Scriptology - "..name..".lua", function() ScriptologyMsg("Downloaded plugin: '"..name.."'") end)
        return true
      end
    else
      ScriptologyMsg("Plugin not found")
    end
    return false
  end

  AddTickCallback(function()
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:Tick() end)
        end
      end
    end
    if ScriptologyLoadedClasses[myHero.charName] then
      Target = GetCustomTarget()
      if Config.kConfig.Combo then
        pcall(function() ScriptologyLoadedClasses[myHero.charName]:Combo() end)
      end
      if Config.kConfig.Harrass then
        pcall(function() ScriptologyLoadedClasses[myHero.charName]:Harrass() end)
      end
      if Config.kConfig.LaneClear then
        pcall(function() ScriptologyLoadedClasses[myHero.charName]:LaneClear() end)
      end
      if Config.kConfig.LastHit then
        pcall(function() ScriptologyLoadedClasses[myHero.charName]:LastHit() end)
      end
      pcall(function() ScriptologyLoadedClasses[myHero.charName]:Killsteal() end)
    end
  end)

  AddDrawCallback(function()
    if ScriptologyLoaded then
      if pcall(function() ScriptologyLoadedClasses[myHero.charName]:DmgCalc() end) then
        ScriptologyLoadedClasses[myHero.charName]:Draw()
      else
        DmgCalc()
        Draw()
      end
    end
  end)

  AddProcessSpellCallback(function(unit, spell)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:ProcessSpell(unit, spell) end)
        end
      end
    end
  end)
-- }