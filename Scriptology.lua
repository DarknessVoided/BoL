--[[
     ____        _      __       __                 ___   ___ 
    / __/_______(_)__  / /____  / /__  ___ ___ __  |_  | / _ \
   _\ \/ __/ __/ / _ \/ __/ _ \/ / _ \/ _ `/ // / / __/_/ // /
  /___/\__/_/ /_/ .__/\__/\___/_/\___/\_, /\_, / /____(_)___/ 
               /_/                   /___//___/               
               
    By Nebelwolfi

]]--

--Scriptstatus Tracker
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion       = 2.01
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
    if FileExist(LIB_PATH .. "ScriptologyLib.lua") and FileExist(LIB_PATH .. "SPrediction.lua") then
      require("ScriptologyLib")
      if ScriptologyDebug then
        require("Scriptology - "..myHero.charName)
        Vars()
        ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
        _G.ScriptologyLoaded = true
        ScriptologyLoadedClasses[myHero.charName] = _G[myHero.charName]()
        AfterLoad()
      elseif pcall(require, "Scriptology - "..myHero.charName) then
        Vars()
        ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
        _G.ScriptologyLoaded = true
        ScriptologyLoadedClasses[myHero.charName] = _G[myHero.charName]()
        AfterLoad()
      else
        ScriptologyMsg("Plugin: '"..myHero.charName.."' not found, checking online..")
        if CheckForPlugin(myHero.charName) then
          DelayAction(function() 
            if ScriptologyDebug then require("Scriptology - "..myHero.charName) end
            if pcall(require, "Scriptology - "..myHero.charName) then 
              Vars()
              ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
              _G.ScriptologyLoaded = true
              ScriptologyLoadedClasses[myHero.charName] = _G[myHero.charName]()
              AfterLoad()
            else
              print("Error: Failed to load the plugin!")
            end 
          end, 3)
        else
          AfterLoad()
        end
      end
    else
      if not FileExist(LIB_PATH .. "SPrediction.lua") then
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/SPrediction.lua?no-cache="..math.random(1, 25000), LIB_PATH.."SPrediction.lua", function() end)
      elseif not FileExist(LIB_PATH .. "ScriptologyLib.lua") then
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/ScriptologyLib.lua".."?no-cache="..math.random(1, 25000), LIB_PATH.."ScriptologyLib.lua", function() end)
      end
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
        if ScriptologyDebug then
          class:Load()
        else
          pcall(function() class:Load() end)
        end
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
    if _G.AutoCarry then
          if _G.Reborn_Initialised then
            ScriptologyMsg("Found SAC: Reborn")
          else
            ScriptologyMsg("Found SAC: Revamped")
          end
    elseif _G.Reborn_Loaded then
          DelayAction(LoadOrb, 1)
    elseif _G.MMA_Loaded then
          ScriptologyMsg("Found MMA")
    else
          ScriptologyConfig:addParam("info", "Choose your Orbwalker", SCRIPT_PARAM_INFO, "")
          if FileExist(LIB_PATH .. "Big Fat Orbwalker.lua") then
            ScriptologyConfig:addParam("bfw", "Big Fat Orbwalker", SCRIPT_PARAM_ONOFF, false)
            DelayAction(function() ScriptologyConfig.bfw = false end, 0.1)
            DelayAction(function() ScriptologyConfig:setCallback("bfw", function(var) if var then require "Big Fat Orbwalker" RemoveOw() loadedAnWalker = true end end) end, 0.25)
          end
          if FileExist(LIB_PATH .. "SxOrbWalk.lua") then
            ScriptologyConfig:addParam("SxOrbWalk", "SxOrbWalk", SCRIPT_PARAM_ONOFF, false)
            DelayAction(function() ScriptologyConfig.SxOrbWalk = false end, 0.1)
            DelayAction(function() ScriptologyConfig:setCallback("SxOrbWalk", function(var) if var then LoadSxOrbWalk() end end) end, 0.25)
          end
          if FileExist(LIB_PATH .. "SOW.lua") then
            ScriptologyConfig:addParam("SOW", "SOW", SCRIPT_PARAM_ONOFF, false)
            DelayAction(function() ScriptologyConfig.SOW = false end, 0.1)
            DelayAction(function() ScriptologyConfig:setCallback("SOW", function(var) if var then LoadSOW() end end) end, 0.25)
          end
          ScriptologyConfig:addParam("SWalkl", "SWalk", SCRIPT_PARAM_ONOFF, false)
          DelayAction(function() ScriptologyConfig.SWalkl = false end, 0.1)
          DelayAction(function() ScriptologyConfig:setCallback("SWalkl", function(var) if var then LoadSWalk() RemoveOw() end end) end, 0.25)
    end
  end

  function LoadSxOrbWalk()
    require 'SxOrbWalk'
    SxOrb:LoadToMenu()
    ScriptologyMsg("Loaded SxOrb.")
    RemoveOw()
    loadedAnWalker = true
  end

  function LoadSOW()
    require 'SOW'
    require 'VPrediction'
    SOWVP = SOW(VP)
    Cfg:addSubMenu("SOW","SOW")
    SOWVP:LoadToMenu(Cfg.SOW)
    ScriptologyMsg("Loaded SOW")
    RemoveOw()
    loadedAnWalker = true
  end

  function _G.RemoveOw()
    DelayAction(function()
      ScriptologyConfig:removeParam("info")
      if ScriptologyConfig.bfw ~= nil then
        ScriptologyConfig:removeParam("bfw")
      end
      if ScriptologyConfig.SOW ~= nil then
        ScriptologyConfig:removeParam("SOW")
      end
      if ScriptologyConfig.SxOrbWalk ~= nil then
        ScriptologyConfig:removeParam("SxOrbWalk")
      end
      if ScriptologyConfig.SWalkl ~= nil then
        ScriptologyConfig:removeParam("SWalkl")
      end
    end, 0.05)
  end

  function _G.LoadSWalk()
    if pcall(require, "Scriptology - Walk") then
      ScriptologyMsg("Plugin: 'Walk' loaded")
      _G.loadedOrb = SWalk(nil, ScriptologyConfig)
      loadedAnWalker = true
    else
      if CheckForPlugin("Walk") then
        DelayAction(LoadSWalk, 2)
      end
    end
  end

  function Update()
    local ScriptologyServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Scriptology.version?no-cache="..math.random(1, 25000))
    if ScriptologyServerData then
      ScriptologyServerVersion = type(tonumber(ScriptologyServerData)) == "number" and tonumber(ScriptologyServerData) or nil
      if ScriptologyServerVersion then
        if tonumber(ScriptologyVersion) < ScriptologyServerVersion then
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Scriptology.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH.."Scriptology.lua", function() end)
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/ScriptologyLib.lua".."?no-cache="..math.random(1, 25000), LIB_PATH.."ScriptologyLib.lua", function() end)
          ScriptologyMsg("Updated") 
          return true
        end
      end
    else
      ScriptologyMsg("Error downloading version info")
    end
    return false
  end

  function ScriptologyMsg(msg) 
    print("<font color=\"#6699ff\"><b>[Scriptology Loader]: "..myHero.charName.." - </b></font> <font color=\"#FFFFFF\">"..msg..".</font>") 
  end

  function SilentUpdate()
    DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/Awareness.lua?no-cache="..math.random(1, 25000), LIB_PATH.."Scriptology - Awareness.lua", function() end)
    DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/Evade.lua?no-cache="..math.random(1, 25000), LIB_PATH.."Scriptology - Evade.lua", function() end)
    DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/Walk.lua?no-cache="..math.random(1, 25000), LIB_PATH.."Scriptology - Walk.lua", function() end)
    for _, k in pairs(ScriptologyLoadedClasses) do
      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/".._..".lua?no-cache="..math.random(1, 25000), LIB_PATH.."Scriptology - ".._..".lua", function() end)
    end
  end

  function CheckForPlugin(name)
    local ScriptologyPlugin = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/SPlugins/"..name..".version")
    if ScriptologyPlugin then
      ScriptologyPluginVersion = type(tonumber(ScriptologyPlugin)) == "number" and tonumber(ScriptologyPlugin) or nil
      if ScriptologyPluginVersion then
        ScriptologyMsg("Downloading plugin: '"..name.."'")
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SPlugins/"..name..".lua?no-cache="..math.random(1, 25000), LIB_PATH.."Scriptology - "..name..".lua", function() ScriptologyMsg("Downloaded plugin: '"..name.."'") end)
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
      if targetSel then
        targetSel:update()
        _G.Target = targetSel.target
        ScriptologyLoadedClasses[myHero.charName].Target = targetSel.target
      end
      if Config.kConfig.Combo then
        if ScriptologyConfig.SWalkl ~= nil and not loadedAnWalker then
          LoadSWalk() 
          RemoveOw()
        end
        if ScriptologyDebug then
          ScriptologyLoadedClasses[myHero.charName]:Combo()
        else
          pcall(function() ScriptologyLoadedClasses[myHero.charName]:Combo() end)
        end
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

  AddMsgCallback(function(msg, key)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:WndMsg(msg, key) end)
          pcall(function() class:Msg(msg, key) end)
        end
      end
    end
  end)

  AddDrawCallback(function()
    if ScriptologyLoaded then
      DmgCalc()
      Draw()
      pcall(function() ScriptologyLoadedClasses[myHero.charName]:DmgCalc() end)
      pcall(function() ScriptologyLoadedClasses[myHero.charName]:Draw() end)
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

  AddAnimationCallback(function(unit, ani)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:Animation(unit, ani) end)
        end
      end
    end
  end)

  AddCreateObjCallback(function(obj)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:CreateObj(obj) end)
        end
      end
    end
  end)

  AddDeleteObjCallback(function(obj)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:DeleteObj(obj) end)
        end
      end
    end
  end)

  AddApplyBuffCallback(function(source, unit, buff)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:ApplyBuff(source, unit, buff) end)
        end
      end
    end   
  end)

  AddUpdateBuffCallback(function(unit, buff, stacks)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:UpdateBuff(unit, buff, stacks) end)
        end
      end
    end
  end)

  AddRemoveBuffCallback(function(unit, buff)
    if ScriptologyLoaded then
      for _, class in pairs(ScriptologyLoadedClasses) do
        if class then
          pcall(function() class:RemoveBuff(unit, buff) end)
        end
      end
    end
  end)
-- }