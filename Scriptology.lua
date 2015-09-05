_G.ScriptologyVersion       = 2.2458
_G.ScriptologyLoaded        = false
_G.ScriptologyLoadActivator = true
_G.ScriptologyLoadAwareness = true
_G.ScriptologyFixBugsplats  = true
_G.ScriptologyLoadEvade     = false
_G.ScriptologyAutoUpdate    = true
_G.ScriptologyConfig        = scriptConfig("Scriptology Loader", "Scriptology")
local min, max, cos, sin, pi, huge, ceil, floor, round, random, abs, deg, asin, acos = math.min, math.max, math.cos, math.sin, math.pi, math.huge, math.ceil, math.floor, math.round, math.random, math.abs, math.deg, math.asin, math.acos
-- { Load

  function OnLoad()
    Update()
    LoadSpellData()
    LoadActivator()
    LoadAwareness()
    LoadEvade()
    LoadOrbwalker()
    if VIP_USER then
      EmoteSpammer()
    end
    LoadChampion()
    Msg("Loaded! (v".._G.ScriptologyVersion..")")
    OnAfterLoad()
  end

  function Update()
    local ToUpdate = {}
    ToUpdate.UseHttps = true
    ToUpdate.Host = "raw.githubusercontent.com"
    ToUpdate.VersionPath = "/nebelwolfi/BoL/master/Scriptology.version"
    ToUpdate.ScriptPath =  "/nebelwolfi/BoL/master/Scriptology.lua"
    ToUpdate.SavePath = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
    ToUpdate.CallbackUpdate = function(NewVersion,OldVersion) Msg("Updated from v"..OldVersion.." to "..NewVersion..". Please press F9 twice to reload.") end
    ToUpdate.CallbackNoUpdate = function(OldVersion) end
    ToUpdate.CallbackNewVersion = function(NewVersion) Msg("New version found v"..NewVersion..". Please wait until it's downloaded.") end
    ToUpdate.CallbackError = function(NewVersion) Msg("There was an error while updating.") end
    CScriptUpdate(_G.ScriptologyVersion,ToUpdate.UseHttps, ToUpdate.Host, ToUpdate.VersionPath, ToUpdate.ScriptPath, ToUpdate.SavePath, ToUpdate.CallbackUpdate,ToUpdate.CallbackNoUpdate, ToUpdate.CallbackNewVersion,ToUpdate.CallbackError)
  end

  function LoadSpellData()
    if FileExist(LIB_PATH .. "SpellData.lua") then
      if pcall(function() _G.spellData = loadfile(LIB_PATH .. "SpellData.lua")() end) then
        _G.myHeroSpellData = spellData[myHero.charName]
        DelayAction(function()
        CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", function() end, function() end, function() end, LoadSpellData)
        end, 5)
      else
        CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", LoadSpellData, function() end, function() end, LoadSpellData)
      end
    else
      CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", LoadSpellData, function() end, function() end, LoadSpellData)
    end
  end

  -- { Activator

    function LoadActivator()
      if _G.ScriptologyLoadActivator then
        ScriptologyConfig:addSubMenu("Activator", "Activator")
        ScriptologyConfig.Activator:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
        ScriptologyConfig.Activator:setCallback("activate", function(var) if var then LoadActivator2() else UnloadActivator() end end)
        if ScriptologyConfig.Activator.activate then LoadActivator2() end
      end
    end

    function LoadActivator2()
      if not Activerino then
        Activerino = Activator()
        Msg("Plugin: 'Activator' loaded")
      end
    end

    function UnloadActivator()
      Msg("Plugin: 'Activator' un-ticked. Press 2x F9 to unload.")
    end

  -- }

  -- { Awareness 

    function LoadAwareness(b)
      DelayAction(function() 
        if _G.PrinceViewVersion == nil and _G.DA_LOADED == nil and _G.ScriptologyLoadAwareness then
          if not b then ScriptologyConfig:addSubMenu("Awareness", "Awareness") end
          ScriptologyConfig.Awareness:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
          ScriptologyConfig.Awareness:setCallback("activate", function(var) if var then LoadAwareness2() else UnloadAwareness() end end)
          if ScriptologyConfig.Awareness.activate then LoadAwareness2() end
        end
      end, 0.25)
    end

    function LoadAwareness2()
      if not Awarerino then
        Awarerino = Awareness()
        Msg("Plugin: 'Awareness' loaded")
      end
    end

    function UnloadAwareness()
      Msg("Plugin: 'Awareness' un-ticked. Press 2x F9 to unload.")
    end

  -- }

  -- { Evade

    function LoadEvade()
      ScriptologyConfig:addSubMenu("Evade", "Evade")
      DelayAction(function()
        if _G.Evadeee_Loaded == nil and _G.Evade == nil and _G.Evading == nil and _G.evade == nil and _G.evading == nil and _G.ScriptologyLoadEvade then
          ScriptologyConfig.Evade:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
          ScriptologyConfig.Evade:setCallback("activate", function(var) if var then LoadEvade2() else UnloadEvade() end end)
          if ScriptologyConfig.Evade.activate then LoadEvade2() end
        else
          ScriptologyConfig.Evade:addParam("info", "Inbuilt Evade disabled!", SCRIPT_PARAM_INFO, "")
        end
      end, 10)
    end

    function LoadEvade2()
      Dodgerino = EvadeS()
      Msg("Plugin: 'Evade' loaded")
    end

    function UnloadEvade()
      Msg("Plugin: 'Evade' un-ticked. Press 2x F9 to unload.")
    end

  -- }

  -- { Orbwalker

    function LoadOrbwalker()
      if myHero.charName == "Riven" then return end
      if _G.Reborn_Loaded or _G.AutoCarry then
      elseif _G.MMA_Loaded then
      elseif _G.NebelwolfisOrbWalkerInit or _G.NebelwolfisOrbWalkerLoaded then
      else
        ScriptologyConfig:addSubMenu("Orbwalker", "Orbwalker")
        ScriptologyConfig.Orbwalker:addParam("info", "Choose your Orbwalker", SCRIPT_PARAM_LIST, 1, {"Nebelwolfi's Orb Walker", "SxOrbWalk", "Simple Orb Walk", "Big Fat Walk"})
        ScriptologyConfig.Orbwalker:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
        ScriptologyConfig.Orbwalker:setCallback("activate", function(var) if var and not (isNOW or isSOW or isBFW or isSxOrb) then LoadOrb() else UnloadOrb() Msg("Reload now. Press 2xF9.") end end)
        if ScriptologyConfig.Orbwalker.activate then LoadOrb() end
      end
    end

    function LoadOrb()
      if ScriptologyConfig.Orbwalker.info == 1 then
        require "Nebelwolfi's Orb Walker"
        isNOW = true
        --NOW = NebelwolfisOrbWalker(ScriptologyConfig.Orbwalker)
        --Msg("Nebelwolfi's Orb Walker loaded!")
      elseif ScriptologyConfig.Orbwalker.info == 2 then
        require "SxOrbwalk"
        isSxOrb = true
        SxOrb:LoadToMenu(ScriptologyConfig.Orbwalker)
        --Msg("SxOrbWalk loaded!")
      elseif ScriptologyConfig.Orbwalker.info == 3 then
        require "SOW"
        require "VPrediction"
        isSOW = true
        _G.VP = VPrediction()
        SOWVP = SOW(VP)
        SOWVP:LoadToMenu(ScriptologyConfig.Orbwalker)
        --Msg("Loaded Simple Orb Walker!")
      elseif ScriptologyConfig.Orbwalker.info == 4 then
        require "Big Fat Orbwalker"
        _G["BigFatOrb_DisableAttacks"] = false
        _G["BigFatOrb_DisableMove"] = false
        isBFW = true
        --Msg("Loaded Big Fat Orbwalker!")
      end
    end

    function UnloadOrb()
        Msg("OrbWalker un-ticked. Press 2x F9 to unload.")
    end

  -- }

  -- { Champion

    function LoadChampion()
      if _G[myHero.charName] then
        Champerino = _G[myHero.charName]()
      end
    end

  -- }

  -- { After Load

    function OnAfterLoad()
      if not Champerino then return end
      SetupPredictionMenu()
      SetupTargetSelector()
      InitMenu()
      InitVars()
      AddPluginTicks()
      InitPermaShow()
    end

    function SetupPredictionMenu()
      ScriptologyConfig:addSubMenu("Prediction", "Prediction")
      Prediction = {}
      predictionStringTable = {}
      for _, k in pairs({VP = "VPrediction", SP = "SPrediction", HP = "HPrediction"}) do
        if FileExist(LIB_PATH .. k .. ".lua") then
          if _G[_] then
          Prediction[_] = _G[_]
          table.insert(predictionStringTable, k)
          else
            if pcall(function() require(k) end) then
              if pcall(function() _G[_] = _G[k]() end) then
                Prediction[_] = _G[_]
                table.insert(predictionStringTable, k)
              end
            end
          end
        end
      end
      table.sort(predictionStringTable)
      table.sort(Prediction)
      if VIP_USER and not _G.ScriptologyFixBugsplats and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
        require "DivinePred"
        _G.DP = DivinePred()
        Prediction["DP"] = _G.DP
        table.insert(predictionStringTable, "DivinePred")
      end
      str = {[-3] = "P", [-2] = "Q3", [-1] = "Q2", [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R", [4] = "I", [5] = "S"}
      local SetupHPredSpell = function(k)
        spell = myHeroSpellData[k]
        if not HPSpells then HPSpells = {} end
        if spell.type == "linear" then
          if spell.speed ~= huge then 
            if spell.collision then
              HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay, collisionM = spell.collision, collisionH = spell.collision})
            else
              HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay})
            end
          else
            HPSpells[k] = HPSkillshot({type = "PromptLine", range = spell.range, width = 2*spell.width, delay = spell.delay})
          end
        elseif spell.type == "circular" then
          if spell.speed ~= huge then 
            HPSpells[k] = HPSkillshot({type = "DelayCircle", range = spell.range, speed = spell.speed, radius = spell.width, delay = spell.delay})
          else
            HPSpells[k] = HPSkillshot({type = "PromptCircle", range = spell.range, radius = spell.width, delay = spell.delay})
          end
        else
          HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay})
        end
      end
      local SetupDPredSpell = function(k)
        local spell = myHeroSpellData[k]
        local col = spell.collision and ((myHero.charName=="Lux" or myHero.charName=="Veigar") and 1 or 0) or huge
        if spell.type == "linear" then
          Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
        elseif spell.type == "circular" then
          Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
        elseif spell.type == "cone" then
          Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
        end
        if _G.DP.bindSS then
          _G.DP:bindSS(str[k], Spell, 1)
        else
          print("Your DivinePrediction is outdated.")
        end
      end
      for m, mode in pairs({Harass = {"Harass", 1.5}, LastHit = {"LastHit", 1}, Combo = {"Combo", 1.55}, LaneClear = {"LaneClear", 1}}) do
        ScriptologyConfig.Prediction:addSubMenu(mode[1].." Settings", mode[1])
        for _=-2, 3 do
          if myHeroSpellData and myHeroSpellData[_] and myHeroSpellData[_].type then
          ScriptologyConfig.Prediction[mode[1]]:addParam("pred"..str[_], str[_].." Settings", SCRIPT_PARAM_LIST, 1, predictionStringTable)
          ScriptologyConfig.Prediction[mode[1]]:addParam("pred"..str[_].."val", "-> Accuracy", SCRIPT_PARAM_SLICE, mode[2], 0, 3, 2)
          end
        end
      end
      for _=-2, 3 do
        if myHeroSpellData and myHeroSpellData[_] and myHeroSpellData[_].type then
          if _G.DP ~= nil then
            SetupDPredSpell(_)
          end
          if _G.HP ~= nil then
            SetupHPredSpell(_)
          end
        end
      end
    end

    function SetupTargetSelector()
      targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1250, DAMAGE_MAGIC, false, true)
      ScriptologyConfig:addSubMenu("Target Selector", "ts")
      ScriptologyConfig.ts:addTS(targetSel)
      ArrangeTSPriorities()
    end

    function InitMenu()
      ScriptologyConfig:addSubMenu(myHero.charName, myHero.charName)
      _G.Config = ScriptologyConfig[myHero.charName]
      Config:addSubMenu("Combo","Combo")
      Config:addSubMenu("Harass","Harass")
      Config:addSubMenu("LastHit","LastHit")
      Config:addSubMenu("LaneClear","LaneClear")
      Config.LaneClear:addParam("J", "Attack Jungle Mobs", SCRIPT_PARAM_ONOFF, true)
      Config:addSubMenu("Killsteal","Killsteal")
      Config:addSubMenu("Misc","Misc")
      Config:addSubMenu("Draws","Draws")
      Config.Draws:addParam("Q", "Draw Q", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("W", "Draw W", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("E", "Draw E", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("R", "Draw R", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("DMG", "Draw DMG", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("LFC", "Use LFC", SCRIPT_PARAM_ONOFF, false)
      Config.Draws:addParam("PermaShow", "- Scriptology Perma Show -", SCRIPT_PARAM_ONOFF, true)
      Config.Draws:addParam("ColorQ", "Color Q", SCRIPT_PARAM_COLOR, {255, 0x66, 0x33, 0x00})
      Config.Draws:addParam("ColorW", "Color W", SCRIPT_PARAM_COLOR, {255, 0x33, 0x33, 0x00})
      Config.Draws:addParam("ColorE", "Color E", SCRIPT_PARAM_COLOR, {255, 0x66, 0x66, 0x00})
      Config.Draws:addParam("ColorR", "Color R", SCRIPT_PARAM_COLOR, {255, 0x99, 0x33, 0x00})
      Config:addSubMenu("Key Settings","kConfig")
    end

    function InitVars()
      sReady = {}
      for _=0, 3 do
        sReady[_] = myHero:CanUseSpell(_) == 0
      end
      Mobs = MinionManager()
      buffStackTrackList = { ["Darius"] = "dariushemo", ["Kalista"] = "kalistaexpungemarker", ["TahmKench"] = "tahmpassive", ["Tristana"] = "tristanaecharge", ["Vayne"] = "vaynesilvereddebuff" }
      if buffStackTrackList[myHero.charName] then
        buffToTrackForStacks = buffStackTrackList[myHero.charName]
      end
      stackTable = {}
      killTable = {}
      for i, enemy in pairs(GetEnemyHeroes()) do
        killTable[enemy.networkID] = {0, 0, 0, 0, 0, 0}
      end
      killDrawTable = {}
      for i, enemy in pairs(GetEnemyHeroes()) do
        killDrawTable[enemy.networkID] = {}
      end
      colors = { 0xDFFFE258, 0xDF8866F4, 0xDF55F855, 0xDFFF5858 }
      gapcloserTable = {
        ["Aatrox"] = _E, ["Akali"] = _R, ["Alistar"] = _W, ["Ahri"] = _R, ["Amumu"] = _Q, ["Corki"] = _W,
        ["Diana"] = _R, ["Elise"] = _Q, ["Elise"] = _E, ["Fiddlesticks"] = _R, ["Fiora"] = _Q,
        ["Fizz"] = _Q, ["Gnar"] = _E, ["Grags"] = _E, ["Graves"] = _E, ["Hecarim"] = _R,
        ["Irelia"] = _Q, ["JarvanIV"] = _Q, ["Jax"] = _Q, ["Jayce"] = "JayceToTheSkies", ["Katarina"] = _E, 
        ["Kassadin"] = _R, ["Kennen"] = _E, ["KhaZix"] = _E, ["Lissandra"] = _E, ["LeBlanc"] = _W, 
        ["LeeSin"] = "blindmonkqtwo", ["Leona"] = _E, ["Lucian"] = _E, ["Malphite"] = _R, ["MasterYi"] = _Q, 
        ["MonkeyKing"] = _E, ["Nautilus"] = _Q, ["Nocturne"] = _R, ["Olaf"] = _R, ["Pantheon"] = _W, 
        ["Poppy"] = _E, ["RekSai"] = _E, ["Renekton"] = _E, ["Riven"] = _Q, ["Sejuani"] = _Q, 
        ["Sion"] = _R, ["Shen"] = _E, ["Shyvana"] = _R, ["Talon"] = _E, ["Thresh"] = _Q, 
        ["Tristana"] = _W, ["Tryndamere"] = "Slash", ["Udyr"] = _E, ["Volibear"] = _Q, ["Vi"] = _Q, 
        ["XinZhao"] = _E, ["Yasuo"] = _E, ["Zac"] = _E, ["Ziggs"] = _W
      }
    end

    function AddPluginTicks()
      AddTickCallback(function();for _=0,3 do;sReady[_]=(myHero:CanUseSpell(_)==READY);end;end)
      tickTable = {
      function() 
        targetSel:update()
        if ValidTarget(Forcetarget) then
          Target = Forcetarget
        elseif _G.MMA_Loaded and _G.MMA_Target() and _G.MMA_Target().type == myHero.type then 
          Target = _G.MMA_Target()
        elseif _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then 
          Target = _G.AutoCarry.Attack_Crosshair.target
        elseif _G.NebelwolfisOrbWalkerLoaded and _G.NebelwolfisOrbWalker:GetTarget() and _G.NebelwolfisOrbWalker:GetTarget().type == myHero.type then 
          Target = _G.NebelwolfisOrbWalker:GetTarget()
        else
          Target = targetSel.target
        end
      end,
      function()
        if Champerino.CalculateDamage then
          Champerino:CalculateDamage()
        else
          CalculateDamage()
        end
      end
      }
      if Champerino.Combo then
        table.insert(tickTable,
          function()
            if Config.kConfig.Combo and (ValidTarget(Target) or myHero.charName == "Ryze") then
              Champerino:Combo()
            end
          end
        )
      end
      if Champerino.Harass then
        table.insert(tickTable,
          function()
            if Config.kConfig.Harass and ValidTarget(Target) then
              Champerino:Harass()
            end
          end
        )
      end
      if Champerino.LaneClear then
        table.insert(tickTable,
          function()
            if Config.kConfig.LaneClear then
              Champerino:LaneClear()
            end
          end
        )
      end
      if Champerino.LastHit then
        table.insert(tickTable,
        function()
          if Config.kConfig.LastHit or Config.kConfig.LaneClear then
            Champerino:LastHit()
          end
        end
        )
      end
      if Champerino.Tick and Champerino.Killsteal then
        table.insert(tickTable,
        function()
          if Champerino.Tick then 
            Champerino:Tick() 
          end
          if Champerino.Killsteal then 
            Champerino:Killsteal() 
          end
        end
        )
      elseif Champerino.Killsteal then
        table.insert(tickTable,
        function()
          if Champerino.Killsteal then 
            Champerino:Killsteal() 
          end
        end
        )
      elseif Champerino.Tick then
        table.insert(tickTable,
        function()
          if Champerino.Tick then 
            Champerino:Tick() 
          end
        end
        )
      end
      gTick=0;cTick=0;AddTickCallback(function() 
        local time = os.clock()
        if gTick < time then
          gTick = time + 0.025
          cTick = cTick + 1
          if cTick > #tickTable then cTick = 1 end
          tickTable[cTick]()
        end
        CalculateDamageOffsets()
      end)
      if buffToTrackForStacks then
        AddApplyBuffCallback(function(unit, source, buff)
          if unit and buff and unit.team ~= myHero.team and buff.name:lower() == buffToTrackForStacks then
            stackTable[unit.networkID] = 1
          end
        end)
        AddUpdateBuffCallback(function(unit, buff, stacks)
          if unit and buff and stacks and unit.team ~= myHero.team and buff.name:lower() == buffToTrackForStacks then
            stackTable[unit.networkID] = stacks
          end
        end)
        AddRemoveBuffCallback(function(unit, buff)
          if unit and buff and unit.team ~= myHero.team and buff.name:lower() == buffToTrackForStacks then
            stackTable[unit.networkID] = 0
          end
        end)
      end
      if Champerino.ApplyBuff ~= nil then
        AddApplyBuffCallback(function(unit, source, buff)
          Champerino:ApplyBuff(unit, source, buff)
        end)
      end
      if Champerino.UpdateBuff ~= nil then
        AddUpdateBuffCallback(function(unit, buff, stacks)
          Champerino:UpdateBuff(unit, buff, stacks)
        end)
      end
      if Champerino.RemoveBuff ~= nil then
        AddRemoveBuffCallback(function(unit, buff)
          Champerino:RemoveBuff(unit, buff)
        end)
      end
      if Champerino.ProcessSpell ~= nil then
        AddProcessSpellCallback(function(unit, spell)
          Champerino:ProcessSpell(unit, spell)
        end)
      end
      if Champerino.Animation ~= nil then
        AddAnimationCallback(function(unit, ani)
          Champerino:Animation(unit, ani)
        end)
      end
      if Champerino.CreateObj ~= nil then
        AddCreateObjCallback(function(obj)
          Champerino:CreateObj(obj)
        end)
      end
      if Champerino.DeleteObj ~= nil then
        AddDeleteObjCallback(function(obj)
          Champerino:DeleteObj(obj)
        end)
      end
      if Champerino and Champerino.WndMsg then
        AddMsgCallback(function(msg, key)
          Champerino:WndMsg(msg, key)
        end)
      end
      if Champerino and Champerino.Msg then
        AddMsgCallback(function(msg, key)
          Champerino:Msg(msg, key)
        end)
      end
      if Champerino and Champerino.Draw then
        AddDrawCallback(function()
          Champerino:Draw()
        end)
      end
      if Champerino then
        AddMsgCallback(function(msg, key)
          ForcetargetMsg(msg, key)
        end)
      end
      AddDrawCallback(function()
        Draw()
      end)
      if Champerino.Load then
        Champerino:Load()
      end
    end

    function InitPermaShow()
      AddTickCallback(function()
        if Config.Draws.PermaShow then
          CustomPermaShow(" - Scriptology Perma Show - ", nil, true, nil, nil, nil, 0)
          local activeMode = nil
          local modes = {"LaneClear", "LastHit", "Harass", "Combo"}
          for i = 1, 4 do
            local mode = modes[i]
            if Config.kConfig[mode] then
              activeMode = mode
              CustomPermaShow("Active Mode: "..mode, nil, Config.kConfig[mode], nil, ARGB(255,0,255,0), ARGB(255,255,0,0), 1)
              local spells = {"Q", "W", "E", "R"}
              for j = 1, 4 do
                local spell = spells[j]
                if Config[mode][spell] and Config[mode]["mana"..spell] then
                  if Config[mode]["mana"..spell] <= myHero.mana/myHero.maxMana*100 then
                   CustomPermaShow("Use "..spell, Config[mode][spell], Config[mode][spell] ~= nil, ARGB(255, 0, 0, 0), ARGB(255,0,255,0), ARGB(255,255,0,0), 1+j)
                  else
                    CustomPermaShow("Use "..spell.." (oom)", false, Config[mode][spell] ~= nil, ARGB(255, 0, 0, 0), ARGB(255,0,255,0), ARGB(255,255,0,255), 1+j)
                  end
                else
                  CustomPermaShow("Use "..spell, Config[mode][spell], Config[mode][spell] ~= nil, ARGB(255, 0, 0, 0), ARGB(255,0,255,0), ARGB(255,255,0,0), 1+j)
                end
              end
            end
          end
          if not activeMode then
            for i = 1, 5 do
              CustomPermaShow("", false, false, nil, nil, nil, i)
            end
          end
        else
          CustomPermaShow("", false, false, nil, nil, nil, 0)
          CustomPermaShow("", false, false, nil, nil, nil, 1)
        end
      end)
    end

  -- }

-- }

-- { Global functions

  function DrawRectangle(x, y, width, height, color)
    DrawLine(x, y+height*0.5, x+width, y+height*0.5, height, color)
  end

  local cwhileActions, cwhileActionsExecuter, maxcwhileActions = {}, nil, 0
  function cwhile(cond, func)
    if not cwhileActionsExecuter then
      function cwhileActionsExecuter()
        for _ = 1, maxcwhileActions do
          local stuff = cwhileActions[_]
          if stuff then
            if stuff.cond() then
              stuff.func()
            else
              cwhileActions[_] = nil
            end
          end
        end
      end
      AddTickCallback(cwhileActionsExecuter)
    end
    for _ = 1, maxcwhileActions do
      if cwhileActions[maxcwhileActions] == nil then
        cwhileActions[_] = { cond = cond, func = func }
        return;
      end
    end
    maxcwhileActions = maxcwhileActions + 1
    cwhileActions[spotToAdd or maxcwhileActions] = { cond = cond, func = func, args = args }
  end

  function EnableOrbwalker()
    if _G.AutoCarry then
      _G.AutoCarry.MyHero:MovementEnabled(true)
      _G.AutoCarry.MyHero:AttacksEnabled(true)
    elseif _G.NebelwolfisOrbWalkerLoaded then
      _G.NebelwolfisOrbWalker:SetOrb(true)
    elseif isSxOrb then
      SxOrb:EnableMove()
      SxOrb:EnableAttacks()
    elseif isSOW then
      SOWi.Attacks = true
    elseif isBFW then
      _G["BigFatOrb_DisableMove"] = false
      _G["BigFatOrb_DisableAttacks"] = false
    elseif _G.MMA_Loaded then
      _G.MMA_AvoidMovement(false)
      _G.MMA_StopAttacks(false)
    end
  end

  function DisableOrbwalker()
    if _G.AutoCarry then
      _G.AutoCarry.MyHero:AttacksEnabled(false)
      _G.AutoCarry.MyHero:MovementEnabled(false)
    elseif _G.NebelwolfisOrbWalkerLoaded then
      _G.NebelwolfisOrbWalker:SetOrb(false)
    elseif isSxOrb then
      SxOrb:DisableAttacks()
      SxOrb:DisableMove()
    elseif isSOW then
      SOWi.Move = false
      SOWi.Attacks = false
    elseif isBFW then
      _G["BigFatOrb_DisableMove"] = true
      _G["BigFatOrb_DisableAttacks"] = true
    elseif _G.MMA_Loaded then
      _G.MMA_AvoidMovement(true)
      _G.MMA_StopAttacks(true)
    end
  end

  function ForcetargetMsg(msg, Key)
    if msg == WM_LBUTTONDOWN then
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

      if starget and minD < starget.boundingRadius*2 then
        if Forcetarget and starget.charName == Forcetarget.charName then
          Forcetarget = nil
          Msg("Target un-selected.", true)
        else
          Forcetarget = starget
          Msg("New target selected: "..starget.charName.."", true)
        end
      end
    end
  end

  function Msg(x, skip)
    local text = "<font color=\"#ff0000\">[</font><font color=\"#ff2a00\">S</font><font color=\"#ff5500\">c</font><font color=\"#ff7f00\">r</font><font color=\"#ff9f00\">i</font><font color=\"#ffbf00\">p</font><font color=\"#ffdf00\">t</font><font color=\"#ffff00\">o</font><font color=\"#aaff00\">l</font><font color=\"#55ff00\">o</font><font color=\"#00ff00\">g</font><font color=\"#00ff55\">y</font><font color=\"#00ffaa\"> </font><font color=\"#00ffff\">L</font><font color=\"#00bfff\">o</font><font color=\"#0080ff\">a</font><font color=\"#0040ff\">d</font><font color=\"#0000ff\">e</font><font color=\"#2e00ff\">r</font><font color=\"#5d00ff\">]</font><font color=\"#8b00ff\">: </font>"
    if not skip and false then
      local num = GetWebResult("random.org", "/integers/?num="..(x:len()*6).."&min=1&max=16&col="..(x:len()*6).."&base=16&format=plain&rnd=new")
      local index = 0
      if num then
        for _=0, x:len() do
          local color = ""
          for c=0,5 do
          local inum = num:find("0",_*6+c)
          local lnum = num:sub(inum+1,inum+1)
          if lnum then
            color = color..lnum
          end
          end
          text = text.."<font color=\"#"..color.."\">"..x:sub(_,_).."</font>"
        end
      else
        for _=0, x:len() do
          text = text.."<font color=\"#FFFFFF\">"..x:sub(_,_).."</font>"
        end
      end
    else
      for _=0, x:len() do
        text = text.."<font color=\"#FFFFFF\">"..x:sub(_,_).."</font>"
      end
    end
    print(text)
  end

  function Draw()
    DrawRange()
    for _, hero in pairs(GetEnemyHeroes()) do
      DrawDmgOnHpBar(hero)
    end
    DrawForcetarget()
    DrawMode()
  end

  function DrawRange()
    if myHero.charName == "Jayce" or myHero.charName == "Nidalee" or not myHeroSpellData then return end
      if Config.Draws.Q and sReady[_Q] and myHeroSpellData[0] then
        DrawLFC(myHero.x, myHero.y, myHero.z, myHero.charName == "Rengar" and myHero.range+myHero.boundingRadius*2 or myHeroSpellData[0].range > 0 and myHeroSpellData[0].range or myHeroSpellData[0].width, ARGB(Config.Draws.ColorQ[1],Config.Draws.ColorQ[2],Config.Draws.ColorQ[3],Config.Draws.ColorQ[4]))
      end
    if myHero.charName ~= "Orianna" then
      if Config.Draws.W and sReady[_W] and myHeroSpellData[1] then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(myHeroSpellData[1].range) == "function" and myHeroSpellData[1].range() or myHeroSpellData[1].range > 0 and myHeroSpellData[1].range or myHeroSpellData[1].width, ARGB(Config.Draws.ColorW[1],Config.Draws.ColorW[2],Config.Draws.ColorW[3],Config.Draws.ColorW[4]))
      end
      if Config.Draws.E and sReady[_E] and myHeroSpellData[2] then
        DrawLFC(myHero.x, myHero.y, myHero.z, myHeroSpellData[2].range > 0 and myHeroSpellData[2].range or myHeroSpellData[2].width, ARGB(Config.Draws.ColorE[1],Config.Draws.ColorE[2],Config.Draws.ColorE[3],Config.Draws.ColorE[4]))
      end
      if Config.Draws.R and (sReady[_R] or myHero.charName == "Katarina") and myHeroSpellData[3] then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(myHeroSpellData[3].range) == "function" and myHeroSpellData[3].range() or myHeroSpellData[3].range > 0 and myHeroSpellData[3].range or myHeroSpellData[3].width, ARGB(Config.Draws.ColorR[1],Config.Draws.ColorR[2],Config.Draws.ColorR[3],Config.Draws.ColorR[4]))
      end
    end
  end

  function DrawDmgOnHpBar(hero)
    if not Config.Draws.DMG then return end
    if hero and not hero.dead and hero.visible and hero.bTargetable then
      local kdt = killDrawTable[hero.networkID]
      for _=1, #kdt do
        local vars = kdt[_]
        if vars and vars[1] then
          DrawRectangle(vars[1], vars[2], vars[3], vars[4], vars[5])
          DrawText(vars[6], vars[7], vars[8], vars[9], vars[10])
        end
      end
    end
  end

  function DrawForcetarget()
    if Forcetarget ~= nil and Forcetarget.visible and not Forcetarget.dead and Forcetarget.bTargetable then
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
    end
  end

  function DrawMode()
    if ScriptologyConfig[myHero.charName] and ScriptologyConfig[myHero.charName].Misc then
      if ScriptologyConfig[myHero.charName].Misc.Insec then
        for i = -1, 1 do
          for j = -1, 1 do
            DrawText("Insec active!", 45, WINDOW_W/2 + i - GetTextArea("Insec active!", 45).x / 2, WINDOW_H/5 + j, 0xFF000000)
          end
        end
        DrawText("Insec active!", 45, WINDOW_W/2 - GetTextArea("Insec active!", 45).x / 2, WINDOW_H/5, 0xFFFF0000)
      end
      if ScriptologyConfig[myHero.charName].Misc.Flee then
        for i = -1, 1 do
          for j = -1, 1 do
            DrawText("Flee active!", 45, WINDOW_W/2 + i - GetTextArea("Flee active!", 45).x / 2, WINDOW_H/5 + j, 0xFF000000)
          end
        end
        DrawText("Flee active!", 45, WINDOW_W/2 - GetTextArea("Flee active!", 45).x / 2, WINDOW_H/5, 0xFFFF0000)
      end
      if ScriptologyConfig[myHero.charName].Misc.Jump then
        for i = -1, 1 do
          for j = -1, 1 do
            DrawText("Jump active!", 45, WINDOW_W/2 + i - GetTextArea("Jump active!", 45).x / 2, WINDOW_H/5 + j, 0xFF000000)
          end
        end
        DrawText("Jump active!", 45, WINDOW_W/2 - GetTextArea("Jump active!", 45).x / 2, WINDOW_H/5, 0xFFFF0000)
      end
    end
  end

  function DrawLFC(x, y, z, radius, color)
    if Config.Draws.LFC then
      DrawCircle3D(x, y, z, radius, 2, color, 32)
    else
      local radius = radius or 300
      DrawCircle(x, y, z, radius, color)
    end
  end

  function CalculateDamage()
    if not Config.Draws.DMG then return end
    for i, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local damageQ = myHero:CanUseSpell(_Q) ~= READY and 0 or myHero.charName == "Kalista" and 0 or GetDmg(_Q, myHero, enemy) or 0
        local damageW = myHero:CanUseSpell(_W) ~= READY and 0 or GetDmg(_W, myHero, enemy) or 0
        local damageE = myHero:CanUseSpell(_E) ~= READY and 0 or GetDmg(_E, myHero, enemy) or 0
        local damageR = myHero:CanUseSpell(_R) ~= READY and 0 or GetDmg(_R, myHero, enemy) or 0
        killTable[enemy.networkID] = {damageQ, damageW, damageE, damageR}
      end
    end
  end

  function CalculateDamageOffsets()
    if not Config.Draws.DMG then return end
    for i, enemy in pairs(GetEnemyHeroes()) do
      local nextOffset = 0
      local barPos = GetUnitHPBarPos(enemy)
      local barOffset = GetUnitHPBarOffset(enemy)
      pos = {x = barPos.x - 67 + barOffset.x * 150, y = barPos.y + barOffset.y * 50 - 4}
      local totalDmg = 0
      killDrawTable[enemy.networkID] = {}
      for _, dmg in pairs(killTable[enemy.networkID]) do
        if dmg > 0 then
          local perc1 = dmg / enemy.maxHealth
          local perc2 = totalDmg / enemy.maxHealth
          totalDmg = totalDmg + dmg
          local offs = 1-(enemy.maxHealth - enemy.health) / enemy.maxHealth
          killDrawTable[enemy.networkID][_] = {
          offs*105+pos.x-perc2*105, pos.y, -perc1*105, 9, colors[_],
          str[_-1], 15, offs*105+pos.x-perc1*105-perc2*105, pos.y-20, colors[_]
          }
        else
          killDrawTable[enemy.networkID][_] = {}
        end
      end
    end
  end

  function GetDmg(spell, source, target)
    if target == nil or source == nil then
      return
    end
    local ADDmg  = 0
    local APDmg  = 0
    local TRUEDmg  = 0
    local AP     = source.ap
    local Level  = source.level
    local TotalDmg   = source.totalDamage
    local crit     = source.critChance
    local crdm     = source.critDmg
    local ArmorPen   = floor(source.armorPen)
    local ArmorPenPercent  = floor(source.armorPenPercent*100)/100
    local MagicPen   = floor(source.magicPen)
    local MagicPenPercent  = floor(source.magicPenPercent*100)/100

    local Armor   = target.armor*ArmorPenPercent-ArmorPen
    local ArmorPercent = Armor > 0 and floor(Armor*100/(100+Armor))/100 or 0--ceil(Armor*100/(100-Armor))/100
    local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
    local MagicArmorPercent = MagicArmor > 0 and floor(MagicArmor*100/(100+MagicArmor))/100 or ceil(MagicArmor*100/(100-MagicArmor))/100
    if spell == "IGNITE" then
      return 50+20*Level/2
    elseif spell == "Tiamat" then
      ADDmg = (GetHydraSlot() and myHero:CanUseSpell(GetHydraSlot()) == READY) and TotalDmg*0.8 or 0 
    elseif spell == "AD" then
      ADDmg = TotalDmg
      if source.charName == "Ashe" and crit then
        ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
      elseif source.charName == "Teemo" then
        APDmg = APDmg + myHeroSpellData[_E].dmgAP(source, target)
      elseif source.charName == "Orianna" then
        APDmg = APDmg + 2 + 8 * ceil(Level/3) + 0.15*AP
      elseif crit then
        ADDmg = ADDmg * (1 + crit)
      end
      if source.charName == "Vayne" and GetStacks(target) == 2 then
        TRUEDmg = TRUEDmg + myHeroSpellData[_W].dmgTRUE(source, target)
      end
      if GetMaladySlot() then
        APDmg = 15 + 0.15*AP
      end
    elseif type(spell) == "number" and spellData[source.charName] and spellData[source.charName][spell] then
      if spellData[source.charName][spell].dmgAD then ADDmg = spellData[source.charName][spell].dmgAD(source, target, GetStacks(target)) end
      if spellData[source.charName][spell].dmgAP then APDmg = spellData[source.charName][spell].dmgAP(source, target, GetStacks(target)) end
      if spellData[source.charName][spell].dmgTRUE then TRUEDmg = spellData[source.charName][spell].dmgTRUE(source, target, GetStacks(target)) end
    end
    dmg = floor(ADDmg*(1-ArmorPercent))+floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
    dmgMod = (UnitHaveBuff(source, "summonerexhaust") and 0.6 or 1) * (UnitHaveBuff(target, "meditate") and 1-(target:GetSpellData(_W).level * 0.05 + 0.5) or 1)
    return floor(dmg) * dmgMod
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

  function GetLichSlot()
    for slot = ITEM_1, ITEM_7, 1 do
      if myHero:GetSpellData(slot).name and (string.find(string.lower(myHero:GetSpellData(slot).name), "atmasimpalerdummyspell")) then
        return slot
      end
    end
    return nil
  end

  function UnitHaveBuff(unit, buffName)
    if unit and buffName and unit.buffCount then
      for i = 1, unit.buffCount do
        local buff = unit:getBuff(i)
        if buff and buff.valid and buff.startT <= GetGameTimer() and buff.endT >= GetGameTimer() and buff.name ~= nil and (buff.name:find(buffName) or buffName:find(buff.name) or buffName:lower() == buff.name:lower()) then 
          return true
        end
      end
    end
    return false
  end

  function GetStacks(unit)
    return stackTable[unit.networkID] or 0
  end

  function Cast(spell, target, source)
    if not spell or spell < 0 then return end
    if not target then
      CastSpell(spell)
      return true;
    elseif target and not target.networkID then
      CastSpell(spell, target.x, target.z)
      return true;
    elseif target and target.networkID then
      if myHeroSpellData[spell] and myHeroSpellData[spell].type then
        local activeMode = nil
        local modes = {"Combo", "Harass", "LaneClear", "LastHit"}
        for m, mode in pairs(modes) do
          if Config.kConfig[mode] then
            activeMode = ScriptologyConfig.Prediction[mode]
          end
        end
        if activeMode == nil then
          activeMode = ScriptologyConfig.Prediction["Combo"]
        end
        local CastPosition, HitChance, Position = Predict(spell, source or myHero, target, activeMode)
        if HitChance and HitChance >= activeMode["pred"..str[spell].."val"] then
          CastSpell(spell, CastPosition.x, CastPosition.z)
          return true;
        end
      else
        CastSpell(spell, target)
        return true;
      end
    end
    return false;
  end

  function Predict(spell, from, to, mode)
    local activeMode = nil
    if not mode then
      local modes = {"Combo", "Harass", "LaneClear", "LastHit"}
      for m, mode in pairs(modes) do
      if Config.kConfig[mode] then
        activeMode = ScriptologyConfig.Prediction[mode]
        break;
      end
      end
      if not activeMode then
        activeMode = ScriptologyConfig.Prediction["Combo"]
      end
    else
      activeMode = mode
    end
    local activePrediction = activeMode["pred"..str[spell]]
    if predictionStringTable[activePrediction] == "VPrediction" then
      local spell = myHeroSpellData[spell]
      if spell.type == "linear" then
        if spell.aoe then
          return _G.VP:GetLineAOECastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from)
        else
          return _G.VP:GetLineCastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from, spell.collision)
        end
      elseif spell.type == "circular" then
        if spell.aoe then
          return _G.VP:GetCircularAOECastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from)
        else
          return _G.VP:GetCircularCastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from, spell.collision)
        end
      elseif spell.type == "cone" then
        if spell.aoe then
          return _G.VP:GetConeAOECastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from)
        else
          return _G.VP:GetLineCastPosition(to, spell.delay, spell.width, spell.range, spell.speed, from, spell.collision)
        end
      end
    elseif predictionStringTable[activePrediction] == "SPrediction" then
      return _G.SP:Predict(to, myHeroSpellData[spell].range, myHeroSpellData[spell].speed, myHeroSpellData[spell].delay, myHeroSpellData[spell].width, (from.charName == "Lux" or from.charName == "Veigar") and 1 or myHeroSpellData[spell].collision, from)
    elseif predictionStringTable[activePrediction] == "HPrediction" then
      local col = myHeroSpellData[spell].collision and ((from.charName=="Lux" or from.charName=="Veigar") and 1 or 0) or huge
      local x, y, z = _G.HP:GetPredict(HPSpells[spell], to, from, col)
      return x, y*3, z
    elseif predictionStringTable[activePrediction] == "DivinePred" then
      local State, Position, perc = _G.DP:predict(str[spell], to, Vector(from))
      if perc and Position then
        return Position, perc/33, (Vector(Target)-Position):normalized()
      else
        return Vector(Target), -0.1, Vector(Target)
      end
    end
  end

  function GetRealHealth(unit)
    return unit.health
  end

  function GetClosestMinion(pos)
    local minionTarget = nil
    for i, minion in pairs(Mobs.objects) do
      if minion and minion.visible and not minion.dead and minion.bTargetable then
        if minionTarget == nil then 
          minionTarget = minion
        elseif GetDistanceSqr(minionTarget,pos) > GetDistanceSqr(minion,pos) then
          minionTarget = minion
        end
      end
    end
    return minionTarget
  end

  function GetJMinion(range)
    local minionTarget = nil
    for i, minion in pairs(Mobs.objects) do
      if minion and minion.visible and not minion.dead and minion.bTargetable and minion.team > 200 and GetDistanceSqr(minion) < range * range and minion.maxHealth < 100000 then
        if not minionTarget then
          minionTarget = minion
        elseif minionTarget.maxHealth < minion.maxHealth then
          minionTarget = minion
        end
      end
    end
    return minionTarget
  end

  function GetFarmPosition(range, width)
    local BestPos 
    local BestHit = 0
    local objects = Mobs.objects
    for i, object in ipairs(objects) do
      local hit = CountObjectsNearPos(object.pos or object, range, width, objects)
      if hit > BestHit and GetDistanceSqr(object) < range * range then
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
    local objects = Mobs.objects
    for i, object in ipairs(objects) do
      local EndPos = Vector(source) + range * (Vector(object) - Vector(source)):normalized()
      local hit = CountObjectsOnLineSegment(source, EndPos, width, objects)
      if hit > BestHit and GetDistanceSqr(object) < range * range then
        BestHit = hit
        BestPos = Vector(object)
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

  function ArrangeTSPriorities()
    local priorityTable2 = {
      p5 = {"Alistar", "Amumu", "Blitzcrank", "Braum", "ChoGath", "DrMundo", "Garen", "Gnar", "Hecarim", "JarvanIV", "Leona", "Lulu", "Malphite", "Nasus", "Nautilus", "Nunu", "Olaf", "Rammus", "Renekton", "Sejuani", "Shen", "Shyvana", "Singed", "Sion", "Skarner", "Taric", "Thresh", "Volibear", "Warwick", "MonkeyKing", "Yorick", "Zac"},
      p4 = {"Aatrox", "Darius", "Elise", "Evelynn", "Galio", "Gangplank", "Gragas", "Irelia", "Jax","LeeSin", "Maokai", "Morgana", "Nocturne", "Pantheon", "Poppy", "Rengar", "Rumble", "Ryze", "Swain","Trundle", "Tryndamere", "Udyr", "Urgot", "Vi", "XinZhao", "RekSai"},
      p3 = {"Akali", "Diana", "Fiddlesticks", "Fiora", "Fizz", "Heimerdinger", "Janna", "Jayce", "Kassadin","Kayle", "KhaZix", "Lissandra", "Mordekaiser", "Nami", "Nidalee", "Riven", "Shaco", "Sona", "Soraka", "TahmKench", "Vladimir", "Yasuo", "Zilean", "Zyra"},
      p2 = {"Ahri", "Anivia", "Annie",  "Brand",  "Cassiopeia", "Ekko", "Karma", "Karthus", "Katarina", "Kennen", "LeBlanc",  "Lux", "Malzahar", "MasterYi", "Orianna", "Syndra", "Talon", "TwistedFate", "Veigar", "VelKoz", "Viktor", "Xerath", "Zed", "Ziggs" },
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
    local enemies = #GetEnemyHeroes()
    if priorityTable2~=nil and type(priorityTable2) == "table" and enemies > 0 then
      for i, enemy in ipairs(GetEnemyHeroes()) do
        _SetPriority(priorityTable2.p1, enemy, min(1, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p2, enemy, min(2, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p3,  enemy, min(3, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p4,  enemy, min(4, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p5,  enemy, min(5, #GetEnemyHeroes()))
      end
    end
  end

  function AlliesAround(Unit, range)
    local c=0
    if Unit == nil then return 0 end
    for i=1,heroManager.iCount do hero = heroManager:GetHero(i) if hero.team == myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then c=c+1 end end return c
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

  function AddGapcloseCallback(spell, range, targeted, config)
    GapcloseSpell = spell
    GapcloseTime = 0
    GapcloseUnit = nil
    GapcloseTargeted = targeted
    GapcloseRange = range
    config:addDynamicParam("antigap", "Auto "..str[spell].." on gapclose", SCRIPT_PARAM_ONOFF, true)
    for _,k in pairs(GetEnemyHeroes()) do
      if gapcloserTable[k.charName] then
        config:addParam(k.charName, "Use "..str[spell].." on "..k.charName.." "..(type(gapcloserTable[k.charName]) == 'number' and str[gapcloserTable[k.charName]] or (k.charName == "LeeSin" and "Q" or "E")), SCRIPT_PARAM_ONOFF, true)
      end
    end
    AddProcessSpellCallback(function(unit, spell)
      if not config.antigap or not gapcloserTable[unit.charName] or not config[unit.charName] or not unit then return end
        if spell.name == (type(gapcloserTable[unit.charName]) == 'number' and unit:GetSpellData(gapcloserTable[unit.charName]).name or gapcloserTable[unit.charName]) and (spell.target == myHero or GetDistanceSqr(spell.endPos) < GapcloseRange*GapcloseRange*4) then
        GapcloseTime = os.clock() + 2
        GapcloseUnit = unit
      end
    end)
    AddTickCallback(function()
      if sReady[GapcloseSpell] and GapcloseTime and GapcloseUnit and GapcloseTime > os.clock() then
        if GapcloseTargeted then
          if GetDistanceSqr(GapcloseUnit,myHero) < GapcloseRange*GapcloseRange then
            if myHero.charName == "Jayce" and loadedClass:IsRange() then Cast(_R) end
            Cast(GapcloseSpell, GapcloseUnit)
          end
        else 
          if GetDistanceSqr(GapcloseUnit,myHero) < GapcloseRange*GapcloseRange then
            Cast(GapcloseSpell)
          end
        end
      else
        GapcloseTime = 0
        GapcloseUnit = nil
      end
    end)
  end
  -- Vars
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonersmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonersmite") then Smite = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerheal") then Heal = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerheal") then Heal = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerbarrier") then Barrier = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerbarrier") then Barrier = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerflash") then Flash = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerflash") then Flash = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonerboost") then Cleanse = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerboost") then Cleanse = SUMMONER_2 end
  if myHero:GetSpellData(SUMMONER_1).name:find("summonermana") then Clarity = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonermana") then Clarity = SUMMONER_2 end
  -- Vars

-- }

-- { classes

class "Activator"
class "Ahri"
class "Ashe"
class "Awareness"
class "Azir"
class "Blitzcrank"
class "Brand"
class "Cassiopeia"
class "Darius"
class "Diana"
class "Draven"
class "DrMundo"
class "Ekko"
class "EmoteSpammer"
class "EvadeS"
class "Gangplank"
class "Gnar"
class "Hecarim"
class "Irelia"
class "Jarvan"
class "Jax"
class "Jayce"
class "Jinx"
class "Kalista"
class "Katarina"
class "KhaZix"
class "KogMaw"
class "LeBlanc"
class "LeeSin"
class "Lissandra"
class "Lux"
class "Malzahar"
class "MinionManager"
class "Nidalee"
class "Olaf"
class "Orianna"
class "Quinn"
class "RekSai"
class "Rengar"
class "Riven"
class "Rumble"
class "Ryze"
class "Shen"
class "Shyvana"
class "Syndra"
class "Talon"
class "Teemo"
class "Thresh"
class "Tristana"
class "Vayne"
class "Veigar"
class "Viktor"
class "Vladimir"
class "Volibear"
class "WardJump"
class "Yasuo"
class "Yorick"

-- { Activator

  function Activator:__init()
    self.toCleanse = {
      [5] = true, [8] = true, [10] = true, [11] = true, [21] = true, [22] = true, [24] = true,--   24, 5, 11, 22, 21, 8, 10
    }
    self.tick = 0
    self.tick2 = 0
    self:Load()
    self:AddCallbacks()
  end

  function Activator:Load()
    self.Config = ScriptologyConfig.Activator
    self.Config:addSubMenu("Summoners", "s")
    if false then
      if Flash then
        self.Config.s:addParam("Flash", "Flash", SCRIPT_PARAM_ONOFF, false)
      end
      if Ignite then
        self.Config.s:addParam("Ignite", "Ignite", SCRIPT_PARAM_ONOFF, true)
      end
      if Exhaust then
        self.Config.s:addParam("Exhaust", "Exhaust", SCRIPT_PARAM_ONOFF, true)
      end
      if Smite then
        self.Config.s:addParam("Smite", "Smite", SCRIPT_PARAM_ONOFF, true)
      end
    end
    if Barrier then
      self.Config.s:addParam("Barrier", "Barrier", SCRIPT_PARAM_ONOFF, true)
    end
    if Heal then
      self.Config.s:addParam("Heal", "Heal", SCRIPT_PARAM_ONOFF, true)
      self.Config.s:addParam("SaveAlly", "Save Ally", SCRIPT_PARAM_ONOFF, false)
    end
    if Cleanse then
      self.Config.s:addParam("Cleanse", "Cleanse", SCRIPT_PARAM_ONOFF, true)
    end
    if Clarity then
      self.Config.s:addParam("Clarity", "Clarity", SCRIPT_PARAM_ONOFF, true)
    end
    self.Config:addSubMenu("Items", "i")
    self.Config.i:addParam("Cleanse", "Cleanse", SCRIPT_PARAM_ONOFF, true)
  end

  function Activator:AddCallbacks()
    AddTickCallback(function() self:Tick() end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
  end

  function Activator:Tick()
    if self.tick > os.clock() then return end
    self.tick = os.clock() + 0.125
    if self.Config.s.Clarity then
      for _=0,3 do
        if myHero:CanUseSpell(_) == 6 then
          CastSpell(Clarity)
        end
      end
    end
    if self.tick2 > os.clock() then return end
    self.tick2 = os.clock() + 0.25
    if self.Config.s.Cleanse then
      for i = 1, myHero.buffCount do
        local buff = myHero:getBuff(i)
        if buff and buff.valid and buff.startT <= GetGameTimer() and buff.endT >= GetGameTimer() 
        and buff.name ~= nil and (buff.name:lower():find("summonerexhaust") or self.toCleanse[buff.type]) then 
          if self.Config.s.Cleanse and myHero:CanUseSpell(Cleanse) == READY then
            CastSpell(Cleanse)
            return;
          elseif self.Config.i.Cleanse then
            for _ = ITEM_1, ITEM_7 do
              if myHero:CanUseSpell(_) == READY and (myHero:GetSpellData(_).name == "ItemDervishBlade" or myHero:GetSpellData(_).name == "QuicksilverSash") then
                CastSpell(_)
                return;
              end
            end
          end
        end
      end
    end
  end

  function Activator:ProcessSpell(unit, spell)
    --spellData
    if unit and spell and unit.team ~= myHero.team and spell.name and unit.type == myHero.type then
      local sName = spell.name
      local target = spell.target
      if target then
        if not target.dead and not unit.dead and target.visible and unit.visible and target.bTargetable then
          local dmg = 0
          if spell.name:lower():find("attack") then
            dmg = GetDmg("AD", unit, target)*1.25
          elseif spellData[unit.charName] then
            for _, s in pairs(spellData[unit.charName]) do
              if s.name and s.name ~= "" and (s.name:lower():find(sName:lower()) or sName:lower():find(s.name:lower())) then
                local d = GetDmg(_, unit, target)
                dmg = d > 0 and d or 150
              end
            end
          end
          local thp = GetRealHealth(target)
          if dmg >= thp then
            if target.isMe then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == READY then
                  CastSpell(Heal)
                  return;
                end
              end
              if Barrier and self.Config.s.Barrier and target.isMe then
                if myHero:CanUseSpell(Barrier) == READY then
                  CastSpell(Barrier)
                  return;
                end
              end
            elseif self.Config.s.SaveAlly and target.team == myHero.team and target.type == myHero.type then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == READY and GetDistance(target) < 600 then
                  CastSpell(Heal)
                  return;
                end
              end
            end
          end
        end
      elseif not target then
        local dmg = 0
        local sp = nil
        local p, _, b = nil, nil, nil --
        for _, s in pairs(spellData[unit.charName]) do
          if s.name and s.name ~= "" and (s.name:lower():find(sName:lower()) or sName:lower():find(s.name:lower())) then
            local d = GetDmg(_, unit, myHero) * 1.1
            if s.type then
              if s.type == "linear" then
                local pos = unit + (Vector(spell.endPos) - unit):normalized()*s.range
                p, _, b = VectorPointProjectionOnLineSegment(unit, pos, myHero)
              elseif s.type == "circular" then
                p, _, b = spell.endPos, _, true
              end
            end
            sp = s
            dmg = d > 0 and d or myHero.maxHealth*0.15
          end
        end
        local thp = GetRealHealth(myHero)
        if dmg >= thp and b and sp and GetDistanceSqr(p) < sp.width^2 then
          if Heal and self.Config.s.Heal then
            if myHero:CanUseSpell(Heal) == READY then
              CastSpell(Heal)
              return;
            end
          end
          if Barrier and self.Config.s.Barrier then
            if myHero:CanUseSpell(Barrier) == READY then
              CastSpell(Barrier)
              return;
            end
          end
        end
      end
    end
  end

-- }

-- { Ahri

  function Ahri:__init()
    self.Orb = nil
    self.tempOrbNID = nil
    self.tempOrbPOS = nil
    self.ultOn = 0
  end

  function Ahri:Load()
    self:Menu()
  end

  function Ahri:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Qc", "Catch Q", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, myHeroSpellData[2].range, false, Config.Misc)
  end

  function Ahri:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name == "AhriTumble" then
        if self.ultOn < os.clock()-10 then 
          self.ultOn = os.clock()
        end
      end
    end
  end

  function Ahri:CreateObj(obj)
    if obj and obj.name == "missile" and obj.spellOwner.isMe and GetDistance(obj) > 175 then
      self.Orb = obj
    end
  end

  function Ahri:DeleteObj(obj)
    if self.Orb and obj.networkID == self.Orb.networkID then
      self.Orb = nil
    end
  end

  function Ahri:Tick()
    if Config.Misc.Qc then
      self:CatchQ()
    end
  end

  function Ahri:Draw()
    if self.Orb then
      DrawCircle3D(self.Orb.x, self.Orb.y, self.Orb.z, myHero.boundingRadius, 2, 0xFFFF0000, 32)
      DrawLine3D(self.Orb.x, self.Orb.y, self.Orb.z,myHero.x,myHero.y,myHero.z,1,ARGB(55, 255, 255, 255))
    end
  end

  function Ahri:LastHit()
    for i, minion in pairs(Mobs.objects) do 
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        local health = GetRealHealth(minion) 
        for _=0,3 do
          if sReady[_] and GetDmg(_, myHero, minion) >= health and GetDistanceSqr(minion) < myHeroSpellData[_].range^2 and ((Config.kConfig.LastHit and Config.LastHit[str[_]] and Config.LastHit["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear[str[_]] and Config.LaneClear["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana)) then
            Cast(_, minion)
            return;
          end
        end
      end
    end
  end

  function Ahri:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetLineFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestPos and BestHit > 0 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      minion = GetClosestMinion(myHero)
      if minion and GetRealHealth(minion) < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      minion = GetClosestMinion(myHero)
      if minion and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < myHeroSpellData[0].range then
      Cast(_Q, Target)
    end
    if sReady[_W] and Config.Combo.W and GetDistance(Target) < myHeroSpellData[1].range then
      CastSpell(_W)
    end
    if sReady[_E] and Config.Combo.E and GetDistance(Target) < myHeroSpellData[2].range then
      Cast(_E, Target)
    end
    if not UnitHaveBuff(Target, "ahriseduce") then
      if Config.Combo.R then
        self:CatchQ()
      end
    end
    if Config.Combo.R and GetRealHealth(Target) < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < myHeroSpellData[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    elseif Config.Combo.R and self.ultOn > os.clock()-10 and not self.Orb and GetDistance(Target) < myHeroSpellData[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    end
  end

  function Ahri:Harass()
    if not Target then return end
    if sReady[_Q] and Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < myHeroSpellData[0].range then
      Cast(_Q, Target)
    end
    if sReady[_W] and Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < myHeroSpellData[1].range then
      CastSpell(_W)
    end
    if sReady[_E] and Config.Harass.E and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < myHeroSpellData[2].range then
      Cast(_E, Target)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb then
      local x,y,z = _G.VP:GetLineCastPosition(Target, myHeroSpellData[0].delay, myHeroSpellData[0].width, myHeroSpellData[0].range, myHeroSpellData[0].speed, Vector(Vector(self.Orb.dir)+(Vector(self.Orb)-myHero):normalized()*(myHeroSpellData[0].range-GetDistance(self.Orb))), myHeroSpellData[0].collision)
      local x = Vector(self.Orb)+(x-Vector(self.Orb)):normalized()*(myHeroSpellData[0].range)
      if self.ultOn > os.clock()-10 then
      x = Vector(x)-(Vector(Target)-myHero):normalized()*myHeroSpellData[3].range
      Cast(_R,x)
      end
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_Q] and health < GetDmg(_Q, myHero, enemy)*2 and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          CastSpell(_W)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_R, ultPos)
        elseif sReady[_Q] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_Q, enemy)
          Cast(_R, enemy)
        elseif sReady[_W] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          CastSpell(_W)
          Cast(_R, ultPos)
        elseif sReady[_E] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_R, ultPos) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          Cast(_Q, enemy)
          CastSpell(_W)
        elseif sReady[_Q] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_W] and sReady[_E] and health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then CastSpell(_W) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) CastSpell(_W) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and sReady[_E] and sReady[_R] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) CastSpell(_W) Cast(_R, ultPos) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        end
      end
    end
  end

-- }

-- { Ashe

  function Ashe:__init()
  end

  function Ashe:Load()
    self:Menu()
    targetSel._dmgType = DAMAGE_PHYSICAL
  end

  function Ashe:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("AimR", "Aim R", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
  end

  function Ashe:Tick()
    if Config.Misc.AimR then
      for _,k in pairs(GetEnemyHeroes()) do
        if not k.dead and GetDistance(k,mousePos) < 250 then
          Cast(_R, k)
        end
      end
    end
  end

  function Ashe:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, myHeroSpellData[0].range) then
          if self:QReady() then
            Cast(_Q) 
            myHero:Attack(minion)
          end
        end
      end
    end
    if sReady[_W] and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local WMinionDmg = GetDmg(_W, myHero, minion)
        if WMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, myHeroSpellData[1].range+myHeroSpellData[1].width) then
          CastSpell(_W, minion.x, minion.z)
        end
      end    
    end  
  end

  function Ashe:LaneClear()
    if sReady[_Q] and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      if self:QReady() then
        Cast(_Q)
      end
    end
    if sReady[_W] and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
      if minionTarget ~= nil then
        CastSpell(_W, minionTarget.x, minionTarget.z)
      end
    end 
  end

  function Ashe:Combo()
    if Config.Combo.Q and GetDistanceSqr(Target) < myHeroSpellData[0].range^2 then
      if self:QReady() then
        CastSpell(_Q)
      end
    end
    if Config.Combo.W then
      for k,enemy in pairs(GetEnemyHeroes()) do
        if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
          if GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
            Cast(_W, enemy)
          end
        end
      end
    end
    if Config.Combo.R and GetDistance(Target) < myHero.range*2+myHero.boundingRadius*4 and GetDmg(_R, myHero, Target)+GetDmg("AD", myHero, Target)+GetDmg(_W, myHero, Target) < GetRealHealth(Target) then
      Cast(_R, Target)
    end
  end

  function Ashe:Harass()
    if Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and GetDistanceSqr(Target) < myHeroSpellData[0].range^2 then
      if self:QReady() then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
    if Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      for k,enemy in pairs(GetEnemyHeroes()) do
        if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
          if GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
            Cast(_W, enemy)
          end
        end
      end
    end
  end

  function Ashe:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        if sReady[_Q] and self:QReady() and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif sReady[_W] and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          Cast(_W, enemy)
        elseif sReady[_R] and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistance(enemy) < 2500 then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Ashe:QReady()
    return UnitHaveBuff(myHero, "asheqcastready")
  end

-- }

-- { Awareness

  function Awareness:__init()
    self:Load()
  end

  function Awareness:Load()
    self.Config = ScriptologyConfig.Awareness
    self.Config:addSubMenu("Cooldowns", "cd")
    self.Config.cd:addParam("cde", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config.cd:addParam("cda", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config.cd:addParam("cds", "Self:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addSubMenu("Waypoints", "wp")
    self.Config.wp:addParam("wpe", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config.wp:addParam("wpa", "Allies:", SCRIPT_PARAM_ONOFF, false)
    self.Config.wp:addParam("wps", "Self:", SCRIPT_PARAM_ONOFF, false)
    AddDrawCallback(function() self:Draw() end)
    UpdateWindow()
    self.offset = 18
    self.enemyWards = {}
    self.summoners = {  
      ["summonerbarrier"]               = {"Barrier",       0xFFFFFF00},
      ["summonerboost"]                 = {"Cleanse",       0xFF0000FF},
      ["summonermana"]                  = {"Clarity",       0xFF0000FF},
      ["summonerclairvoyance"]          = {"Clairvoyance",  0xFF0000FF},
      ["summonerdot"]                   = {"Ignite",        0xFFFF0000},
      ["summonerexhaust"]               = {"Exhaust",       0xFFFFA500},
      ["summonerflash"]                 = {"Flash",         0xFFFFFF00},
      ["summonerhaste"]                 = {"Ghost",         0xFF0000FF},
      ["summonerheal"]                  = {"Heal",          0xFF00FF00},
      ["summonerodingarrison"]          = {"Garrison",      0xFF00FF00},
      ["summonerteleport"]              = {"Teleport",      0xFFFF00FF},
      ["summonersmite"]                 = {"Smite",         0xFFFFFF00},
      ["itemsmiteaoe"]                  = {"Smite",         0xFFFFFF00},
      ["s5_summonersmiteduel"]          = {"Smite",         0xFFFFFF00},
      ["s5_summonersmitequick"]         = {"Smite",         0xFFFFFF00},
      ["s5_summonersmiteplayerganker"]  = {"Smite",         0xFFFFFF00},
      ["summonersnowball"]              = {"Snowball",      0xFFFFFFFF},
    }
  end

  function Awareness:Draw()
    self:DrawCD()
    self:DrawWP()
  end

  function Awareness:DrawCD()
    if self.Config.cd.cde or self.Config.cd.cda then
      for i=1,heroManager.iCount do 
        k = heroManager:GetHero(i)
        if not k.isMe and (k.team == myHero.team and self.Config.cd.cda) or (k.team ~= myHero.team and self.Config.cd.cde) then
          if k and k.visible and not k.dead and k.bTargetable then
            local nextOffset = 0
            local barPos = GetUnitHPBarPos(k)
            local barOffset = GetUnitHPBarOffset(k)
            do -- For some reason the x offset never exists
              local t = {
              ["Darius"] = -0.05,
              ["Renekton"] = -0.05,
              ["Sion"] = -0.05,
              ["Thresh"] = 0.03,
              }
              barOffset.x = t[k.charName] or 0
            end
            local framePos = {x = barPos.x - 69 + barOffset.x * 150, y = barPos.y + barOffset.y * 50 + 10}
            DrawRectangle(framePos.x, framePos.y - 1, 110, 9, 0xFF000000)
            self:DrawRectangleOutline(framePos.x, framePos.y - 1, 109, 9, 0xFF737173, 1)
            self:DrawRectangleOutline(framePos.x + 1, framePos.y, 107, 7, 0xFF4A494A, 1)
            for _=0, 3 do
              local tSpellData = k:GetSpellData(_)
              local spellPos = {x = framePos.x + 3 + (_ * 26), y = framePos.y + 3}
              if tSpellData.isToggleSpell and tSpellData.toggleState > 0 then
                DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, tSpellData.toggleState == 2 and 0xFF32CD32 or 0xFF2E8B57)
              elseif tSpellData.level >= 1 then
                if tSpellData.currentCd == 0 then
                  DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF32CD32)
                else
                  DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF800000)
                  if tSpellData.totalCooldown > 0 then
                  DrawLine(spellPos.x, spellPos.y, spellPos.x + (tSpellData.totalCooldown - tSpellData.currentCd) / tSpellData.totalCooldown * 25, spellPos.y, 3, 0xFF2E8B57)
                  end
                  local strCooldown = tostring(tSpellData.currentCd < 10 and round(tSpellData.currentCd, 1) or ceil(tSpellData.currentCd))
                  DrawText(strCooldown, 14, spellPos.x - GetTextArea(strCooldown, 14).x / 2 + 12.5, spellPos.y + 5, 0xFFFFFFFF)
                end
              else
              end
              DrawLine(spellPos.x, spellPos.y + 1, spellPos.x + 25, spellPos.y + 1, 1, 0x3F000000)
            end
            for _=0, 1 do
              DrawRectangle(framePos.x-25, framePos.y - 17 + (_ * 11), 28, 9, 0xFF000000)
              self:DrawRectangleOutline(framePos.x-25, framePos.y - 17 + (_ * 11), 27, 9, 0xFF737173, 1)
              self:DrawRectangleOutline(framePos.x-25, framePos.y - 16 + (_ * 11), 25, 7, 0xFF4A494A, 1)
              local tSpellData = k:GetSpellData(_+4)
              local spellPos = {x = framePos.x-25, y = framePos.y - 15 + 2 + (_ * 11)}
              if tSpellData.currentCd == 0 then
                DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, (self.summoners[tSpellData.name] or self.summoners["summonerteleport"])[2])
              else
                DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF800000)
                if tSpellData.totalCooldown > 0 then
                  DrawLine(spellPos.x, spellPos.y, spellPos.x + (tSpellData.totalCooldown - tSpellData.currentCd) / tSpellData.totalCooldown * 25, spellPos.y, 3, (self.summoners[tSpellData.name] or self.summoners["summonerteleport"])[2])--0xFF2E8B57)
                end
                local strCooldown = tostring(tSpellData.currentCd < 10 and round(tSpellData.currentCd, 1) or ceil(tSpellData.currentCd))
                DrawText(strCooldown, 14, spellPos.x - 1 - GetTextArea(strCooldown, 14).x, spellPos.y - 6, 0xFFFFFFFF)
              end
              DrawLine(spellPos.x, spellPos.y + 1, spellPos.x + 25, spellPos.y + 1, 1, 0x3F000000)
            end
          end
        end
      end
    end
    if self.Config.cd.cds then
      local k = myHero -- cba to rename
      if not k.dead then
        local nextOffset = 0
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        do -- For some reason the x offset never exists
          local t = {
          ["Darius"] = -0.05,
          ["Renekton"] = -0.05,
          ["Sion"] = -0.05,
          ["Thresh"] = 0.03,
          }
          barOffset.x = t[k.charName] or 0
        end
        local framePos = {x = barPos.x - 44 + barOffset.x * 150, y = barPos.y + barOffset.y * 50 + 7 + 5}
        DrawRectangle(framePos.x, framePos.y - 1, 110, 9, 0xFF000000)
        self:DrawRectangleOutline(framePos.x, framePos.y - 1, 109, 9, 0xFF737173, 1)
        self:DrawRectangleOutline(framePos.x + 1, framePos.y, 107, 7, 0xFF4A494A, 1)
        for _=0, 3 do
          local tSpellData = k:GetSpellData(_)
          local spellPos = {x = framePos.x + 3 + (_ * 26), y = framePos.y + 3}
          if tSpellData.isToggleSpell and tSpellData.toggleState > 0 then
            DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, tSpellData.toggleState == 2 and 0xFF32CD32 or 0xFF2E8B57)
          elseif tSpellData.level >= 1 then
            if tSpellData.currentCd == 0 then
             DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF32CD32)
            else
              DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF800000)
              if tSpellData.totalCooldown > 0 then
                DrawLine(spellPos.x, spellPos.y, spellPos.x + (tSpellData.totalCooldown - tSpellData.currentCd) / tSpellData.totalCooldown * 25, spellPos.y, 3, 0xFF2E8B57)
              end
              local strCooldown = tostring(tSpellData.currentCd < 10 and round(tSpellData.currentCd, 1) or ceil(tSpellData.currentCd))
              DrawText(strCooldown, 14, spellPos.x - GetTextArea(strCooldown, 14).x * 0.5 + 12.5, spellPos.y + 5, 0xFFFFFFFF)
            end
          end
          DrawLine(spellPos.x, spellPos.y + 1, spellPos.x + 25, spellPos.y + 1, 1, 0x3F000000)
        end
        framePos = {x = barPos.x - 44 + barOffset.x * 150, y = barPos.y + barOffset.y * 50 + 7}
        for _=0, 1 do
          DrawRectangle(framePos.x + 107, framePos.y - 13 + (_ * 11), 28, 9, 0xFF000000)
          self:DrawRectangleOutline(framePos.x + 107, framePos.y - 13 + (_ * 11), 27, 9, 0xFF737173, 1)
          self:DrawRectangleOutline(framePos.x + 108, framePos.y - 12 + (_ * 11), 25, 7, 0xFF4A494A, 1)
          local tSpellData = k:GetSpellData(_+4)
          local spellPos = {x = framePos.x + 108, y = framePos.y - 12 + 3 + (_ * 11)}
          if tSpellData.currentCd == 0 then
            DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, (self.summoners[tSpellData.name] or self.summoners["summonerteleport"])[2])
          else
            DrawLine(spellPos.x, spellPos.y, spellPos.x + 25, spellPos.y, 3, 0xFF800000)
            if tSpellData.totalCooldown > 0 then
              DrawLine(spellPos.x, spellPos.y, spellPos.x + (tSpellData.totalCooldown - tSpellData.currentCd) / tSpellData.totalCooldown * 25, spellPos.y, 3, (self.summoners[tSpellData.name] or self.summoners["summonerteleport"])[2])--0xFF2E8B57)
            end
            local strCooldown = tostring(tSpellData.currentCd < 10 and round(tSpellData.currentCd, 1) or ceil(tSpellData.currentCd))
            DrawText(strCooldown, 14, spellPos.x + 29, spellPos.y - 6, 0xFFFFFFFF)
          end
          DrawLine(spellPos.x, spellPos.y + 1, spellPos.x + 25, spellPos.y + 1, 1, 0x3F000000)
        end
      end
    end
  end

  function Awareness:DrawRectangleOutline(x, y, width, height, color, borderWidth)
    local x = math.min(x, x + width)
    local y = math.min(y, y + width)
    local width = math.abs(width)
    local height = math.abs(height)-1
    DrawLine(x, y, x+width, y, borderWidth, color)
    DrawLine(x, y, x, y+height, borderWidth, color)
    DrawLine(x+width, y, x+width, y+height, borderWidth, color)
    DrawLine(x+width, y+height, x, y+height, borderWidth, color)
  end

  function Awareness:DrawWP()
    if self.Config.wp.wpe or self.Config.wp.wpa or self.Config.wp.wps then
      for i=1,heroManager.iCount do 
        k = heroManager:GetHero(i)
        if (self.Config.wp.wps or not k.isMe) and (k.team == myHero.team and self.Config.cd.cda) or (k.team ~= myHero.team and self.Config.cd.cde) then
          if k and k.hasMovePath and k.pathCount >= 2 then
            local IndexPath = k:GetPath(k.pathIndex)
            local travelDistance = 0
            local endPath = nil
            if IndexPath then
              DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
              DrawLine3D(k.x, k.y, k.z, IndexPath.x, IndexPath.y, IndexPath.z, 1, ARGB(105, 255, 255, 255))
              travelDistance = travelDistance + GetDistance(IndexPath, k)
              endPath = IndexPath
            end
            for i=k.pathIndex, k.pathCount-1 do
              local Path = k:GetPath(i)
              local Path2 = k:GetPath(i+1)
              travelDistance = travelDistance + GetDistance(Path, Path2)
              endPath = Vector(Path2)
              DrawLine3D(Path.x, Path.y, Path.z, Path2.x, Path2.y, Path2.z, 1, ARGB(105, 255, 255, 255))
            end
            if endPath then
              local barPos = WorldToScreen(D3DXVECTOR3(endPath.x, endPath.y, endPath.z))
              local posX = barPos.x
              local posY = barPos.y
              DrawText(""..k.charName, 15, posX, posY-10, ARGB(155, 255, 255, 255))
              DrawText((floor(travelDistance/k.ms*10)/10).."s", 15, posX, posY+10, ARGB(155, 255, 255, 255))
              DrawCircle3D(endPath.x, endPath.y, endPath.z, 18, 1, ARGB(105,255,255,255), 32)
            end
          end
        end
      end
    end
  end

-- }

-- { Azir

  function Azir:__init()
    objHolder = {}
    objTimeHolder = {}
    self.soldierToDash = nil
  end

  function Azir:Load()
    self:Menu()
  end

  function Azir:CreateObj(object)
    if object and object.valid and object.name then
      if object.name == "AzirSoldier" then
        objHolder[object.networkID] = object
        objTimeHolder[object.networkID] = os.clock() + 9
      end
    end
  end

  function Azir:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name == "AzirQ" then
        for _,obj in pairs(objHolder) do
          if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] < huge and objTimeHolder[obj.networkID]>os.clock() then 
            objTimeHolder[obj.networkID] = objTimeHolder[obj.networkID] + 1
          end
        end
      end
    end
  end

  function Azir:CountSoldiers(unit)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID] > os.clock() and (not unit or GetDistance(obj, unit) < 350) then 
        soldiers = soldiers + 1
      end
    end
    return soldiers
  end

  function Azir:GetSoldier(i)
    soldiers = 0
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID]>os.clock() then 
        soldiers = soldiers + 1
        if i == soldiers then return obj end
      end
    end
  end

  function Azir:GetSoldiers()
    soldiers = {}
    for _,obj in pairs(objHolder) do
      if objTimeHolder[obj.networkID] and objTimeHolder[obj.networkID]>os.clock() then 
        table.insert(soldiers, obj)
      end
    end
    return soldiers
  end

  function Azir:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Azir:Tick()
    if Config.Misc.Flee then
      self:Flee()
    end
    if Config.Misc.Insec then
      self:Insec()
    end
  end

  function Azir:Flee()
    myHero:MoveTo(mousePos.x, mousePos.z)
    if self.soldierToDash then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * myHeroSpellData[0].range
      if movePos then
        DelayAction(function() CastSpell(_E, self.soldierToDash) end, 0)
        DelayAction(function() CastSpell(_E, self.soldierToDash) end, 0.1)
        DelayAction(function() CastSpell(_E, self.soldierToDash) end, 0.2)
        DelayAction(function() CastSpell(_E, self.soldierToDash) self.soldierToDash = nil end, 0.3)
        CastSpell(_Q, movePos.x, movePos.z)
      end
    elseif self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        if not self.soldierToDash then
          self.soldierToDash = k
        elseif self.soldierToDash and GetDistanceSqr(k,mousePos) < GetDistanceSqr(self.soldierToDash,mousePos) then
          self.soldierToDash = k
        end
      end
    elseif myHero:GetSpellData(_W).currentCd == READY and myHero:GetSpellData(_E).currentCd == 0 and myHero:GetSpellData(_Q).currentCd == 0 then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * myHeroSpellData[1].range
      CastSpell(_W, movePos.x, movePos.z)
    end
  end

  function Azir:Insec()
    local enemy = GetClosestEnemy(mousePos)
    if not enemy or GetDistance(enemy) > 750 then
      myHero:MoveTo(mousePos.x, mousePos.z)
      return 
    end
    if myHero:CanUseSpell(_R) ~= READY then return end
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
      local movePos = myHero + (Vector(enemy) - myHero):normalized() * myHeroSpellData[0].range
      if movePos then
        CastSpell(_Q, movePos.x, movePos.z)
        CastSpell(_E, self.soldierToDash)
        self:DoR(Vector(myHero), enemy)
        DelayAction(function() self.soldierToDash = nil end, 2)
      end
    end
  end

  function Azir:DoR(pos, obj)
    if ValidTarget(obj) and GetDistance(obj) < 250 then
      CastSpell(_R, pos.x, pos.z)
    else
      DelayAction(function() self:DoR(pos, obj) end, 0.03)
    end
  end

  function Azir:LaneClear()
    pos, hit = GetLineFarmPosition(myHeroSpellData[0].range,myHeroSpellData[0].width,k)
    if pos and hit > 0 and self:CountSoldiers() < 2 and sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      CastSpell(_W, pos.x, pos.z)
    end
    if Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        pos, hit = GetLineFarmPosition(myHeroSpellData[0].range,myHeroSpellData[0].width,k)
        if pos and hit > 0 then
          Cast(_Q, pos)
        end
      end
    end
  end

  function Azir:Combo()
    if Config.Combo.Q and Config.Combo.W and myHero:GetSpellData(_Q).currentCd == 0 and sReady[_W] and GetDistance(Target) < myHeroSpellData[_Q].range then
      CastSpell(_W, Target.x, Target.z)
      DelayAction(function() Cast(_Q, Target) end, 0.25)
    end
    if Config.Combo.W then
      CastSpell(_W, Target.x, Target.z)
    end
    if Config.Combo.Q and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, Target, k)
      end
    end
    if Config.Combo.E and GetRealHealth(Target) < GetDmg(_E,myHero,Target)+self:CountSoldiers()*GetDmg(_W,myHero,Target)+GetDmg(_Q,myHero,Target) then
      for _,k in pairs(self:GetSoldiers()) do
        local x, y, z = VectorPointProjectionOnLineSegment(myHero, k, Target)
        if z and GetDistanceSqr(Target, x) < myHeroSpellData[_E].width^2 then
          Cast(_E, k)
        end
      end
    end
    if Target and Config.Combo.R and GetRealHealth(Target) < GetDmg(_R, myHero, Target)+GetDmg(_E, myHero, Target)+self:CountSoldiers()*GetDmg(_W, myHero, Target)+GetDmg(_Q, myHero, Target) then
      Cast(_R,Target)
    end
  end

  function Azir:Harass()
    if Config.Harass.Q and Config.Harass.W and myHero:GetSpellData(_Q).currentCd == 0 and sReady[_W] and GetDistance(Target) < myHeroSpellData[_Q].range then
      CastSpell(_W, Target.x, Target.z)
      DelayAction(function() Cast(_Q, Target) end, 0.25)
    end
    if Config.Harass.W then
      CastSpell(_W, Target.x, Target.z)
    end
    if Config.Harass.Q and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, Target, k)
      end
    end
  end

  function Azir:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if self:CountSoldiers(enemy)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < myHeroSpellData[1].range+350 then 
          myHero:Attack(enemy)
        elseif (self:CountSoldiers(enemy)+1)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < myHeroSpellData[1].range+350 then 
          Cast(_W, enemy)
          myHero:Attack(enemy)
        elseif GetDmg(_R, myHero, enemy) > GetRealHealth(enemy) and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[3].range then
          Cast(_R, enemy, 1)
        end
      end
    end
  end

-- }

-- { Blitzcrank

  function Blitzcrank:__init()
    UpdateWindow()
    self.grabsThrown = 0
    self.grabsLanded = 0
  end

  function Blitzcrank:Load()
    self:Menu()
  end

  function Blitzcrank:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LaneClear", "LaneClear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.kConfig:addDynamicParam("LastHit", "LastHit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.Draws:addParam("Qhc", "Draw Q HitChance", SCRIPT_PARAM_ONOFF, true)
    if Smite ~= nil then Config.Misc:addParam("S", "Smitegrab", SCRIPT_PARAM_ONOFF, true) end
    for _, enemy in pairs(GetEnemyHeroes()) do
      Config.Misc:addParam(enemy.charName, "Don't Grab "..enemy.charName, SCRIPT_PARAM_ONOFF, false)
    end
    AddGapcloseCallback(_Q, myHeroSpellData[0].range, false, Config.Misc)
  end

  function Blitzcrank:Draw()
    if Config.Draws.Q and Config.Draws.Qhc and sReady[_Q] and Target ~= nil then
      local activeMode = nil
      if not mode then
        local modes = {"Combo", "Harass", "LaneClear", "LastHit"}
        for m, mode in pairs(modes) do
          if Config.kConfig[mode] then
          activeMode = ScriptologyConfig.Prediction[mode]
          end
        end
        if not activeMode then
          activeMode = "Combo"
        end
      else
        activeMode = mode
      end
      local CastPosition, HitChance, HeroPosition = Predict(_Q, myHero, Target, activeMode)
      if CastPosition then
        DrawLine3D(myHero.x, myHero.y, myHero.z, CastPosition.x, CastPosition.y, CastPosition.z, 1, ARGB(155,55,255,55))
        DrawLine3D(myHero.x, myHero.y, myHero.z, Target.x,   Target.y,   Target.z,   1, ARGB(255,55,55,255))
        DrawLFC(CastPosition.x, CastPosition.y, CastPosition.z, myHeroSpellData[0].width, ARGB(255, 0, 255, 0))
        DrawLFC(Target.x, Target.y,  Target.z,  myHeroSpellData[0].width, ARGB(255, 255, 0, 0))
        DrawText("Active Prediction: "..predictionStringTable[activeMode.predQ], 25, WINDOW_W/8, WINDOW_H/4+75, ARGB(255, 255, 255, 255))
        HitChance = ceil((HitChance > 3 and 300 or HitChance*100)/3)
        DrawText("Current HitChance: "..(HitChance < 0 and 0 or HitChance).."%", 25, WINDOW_W/8, WINDOW_H/4+100, ARGB(255, 255, 255, 255))
      end
    end
    if self.grabsThrown > 0 and self.grabsLanded > 0 then
      DrawText("Total HitChance: "..(ceil(100*self.grabsLanded/self.grabsThrown)).."%", 25, WINDOW_W/8, WINDOW_H/4, ARGB(255, 255, 255, 255))
    end
    DrawText("Grabs thrown: "..self.grabsThrown, 25, WINDOW_W/8, WINDOW_H/4 + 25, ARGB(255, 255, 255, 255))
    DrawText("Grabs landed: "..self.grabsLanded, 25, WINDOW_W/8, WINDOW_H/4 + 50, ARGB(255, 255, 255, 255))
  end

  function Blitzcrank:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name:lower():find("rocketgrabmissile") then
      self.grabsThrown = self.grabsThrown + 1
    end
  end

  function Blitzcrank:ApplyBuff(unit, source, buff)
    if unit and buff and unit.team == myHero.team and unit.type == myHero.type and buff.name:lower():find("rocketgrab2") then
      self.grabsLanded = self.grabsLanded + 1
      if (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harass and Config.Harass.E and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100) then
        Cast(_E)
      end
    end
  end

  function Blitzcrank:GrabSomeone()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable and not Config.Misc[enemy.charName] and GetDistanceSqr(enemy) < myHeroSpellData[_Q].range^2 then
        Cast(_Q, enemy)
      end
    end
  end

  function Blitzcrank:Combo()
    if sReady[_Q] and Config.Combo.Q then
      if Target == Forcetarget then
        Cast(_Q, Target)
      else
        self:GrabSomeone()
      end
    end
    if sReady[_W] and Config.Combo.W and GetDistanceSqr(Target) > myHeroSpellData[_Q].range^2 then
      Cast(_W)
    end
    if sReady[_R] and Config.Combo.R and GetDistanceSqr(Target) < (myHeroSpellData[_R].width*0.85)^2 then
      Cast(_R)
    end
  end

  function Blitzcrank:Harass()
    if sReady[_Q] and Config.Combo.Q then
      if Target == Forcetarget then
        Cast(_Q, Target)
      else
        self:GrabSomeone()
      end
    end
    if sReady[_W] and Config.Combo.W and GetDistanceSqr(Target) > myHeroSpellData[_Q].range^2 then
      Cast(_W)
    end
  end

  function Blitzcrank:Killsteal()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and GetDistanceSqr(Target) <= myHeroSpellData[_Q].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and GetDistanceSqr(enemy) <= (myHeroSpellData[_R].width*0.85)^2 then
          Cast(_R)
        end
      end
    end
  end

-- }

-- { Brand

  function Brand:__init()
  end

  function Brand:Load()
    self:Menu()
  end

  function Brand:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Brand:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, myHeroSpellData[0].range) and GetDistance(winion) < myHeroSpellData[0].range then
          Cast(_Q, winion)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, myHeroSpellData[1].range) and GetDistance(winion) < myHeroSpellData[1].range then
          Cast(_W, Target)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, myHeroSpellData[2].range) and GetDistance(winion) < myHeroSpellData[2].range then
          Cast(_E, winion)
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
        elseif minionTarget.health < winion.health and ValidTarget(winion, myHeroSpellData[0].range) and GetDistance(winion) <= 100*myHeroSpellData[0].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil then
        Cast(_Q, minionTarget)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif minionTarget.health < winion.health and ValidTarget(winion, myHeroSpellData[2].range) and GetDistance(winion) < myHeroSpellData[2].range then
          minionTarget = winion
        end
      end
      if minionTarget ~= nil and (stackTable[minionTarget.networkID] and stackTable[minionTarget.networkID] > 0) then
        Cast(_E, winion)
      end
    end
  end

  function Brand:Combo()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, myHeroSpellData[2].range) then
        Cast(_E, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, myHeroSpellData[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, myHeroSpellData[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Combo.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, myHeroSpellData[1].range) then
        Cast(_W, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, myHeroSpellData[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, myHeroSpellData[0].range) then
        Cast(_Q, Target)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 500) > 1 and stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and ValidTarget(Target, myHeroSpellData[3].range) then
      Cast(_R, Target)
    end
  end

  function Brand:Harass()
    if (myHero:CanUseSpell(_E) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harass.E then
      if myHero:CanUseSpell(_E) == READY and ValidTarget(Target, myHeroSpellData[2].range) and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, myHeroSpellData[0].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target)
        end
      end
      if myHero:CanUseSpell(_W) == READY and Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana and ValidTarget(Target, myHeroSpellData[1].range) then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_W, Target)
        end
      end
    elseif (myHero:CanUseSpell(_W) == READY or (stackTable[Target.networkID] and stackTable[Target.networkID] > 0)) and Config.Harass.W then
      if myHero:CanUseSpell(_W) == READY and ValidTarget(Target, myHeroSpellData[1].range) and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W, Target)
      end
      if myHero:CanUseSpell(_Q) == READY and Config.Harass.Q and ValidTarget(Target, myHeroSpellData[0].range) and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
        if stackTable[Target.networkID] and stackTable[Target.networkID] > 0 then
          Cast(_Q, Target)
        end
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harass.Q and ValidTarget(Target, myHeroSpellData[0].range) and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target)
      end
    end
  end

  function Brand:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, enemy)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, myHeroSpellData[1].range) then
          Cast(_W, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Cassiopeia

  function Cassiopeia:__init()
    self.lastE = 0
  end

  function Cassiopeia:Load()
    self:Menu()
  end

  function Cassiopeia:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Enp", "Use E on not poisoned", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Misc:addParam("Humanizer", "Humanizer (E every X seconds)", SCRIPT_PARAM_SLICE, 0.5, 0.5, 1, 2)
    Config.Misc:addParam("E", "Auto E-Kill poisoned minions", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Enp", "Auto E-Kill minions", SCRIPT_PARAM_ONOFF, false)
  end

  function Cassiopeia:Tick()
    if self.lastE > os.clock() or not sReady[_E] or not Config.Misc.E or Config.kConfig.Combo or Config.kConfig.Harass then return end
    for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and minion.bTargetable then  
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if (UnitHaveBuff(minion, "poison") or Config.Misc.Enp) and EMinionDmg >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[2].range^2 then
          CastSpell(_E, minion)
        end
      end
    end
  end

  function Cassiopeia:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name == "CassiopeiaTwinFang" then
      self.lastE = os.clock() + Config.Misc.Humanizer - GetLatency() / 2000 - 0.07
    end
  end

  function Cassiopeia:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestHit > 0 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
      if BestHit > 0 then 
        CastSpell(_W, BestPos.x, BestPos.z)
      end
    end
    if self.lastE > os.clock() then return end
      if sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        if winion ~= nil and UnitHaveBuff(winion, "poison") then
          CastSpell(_E, winion)
        end
      end
    end
  end

  function Cassiopeia:LastHit()
    if self.lastE > os.clock() or not Config.kConfig.LastHit then return end
    if Config.LastHit.E then  
      for i, minion in pairs(Mobs.objects) do 
        if minion and not minion.dead and minion.visible and minion.bTargetable then
          local EMinionDmg = GetDmg(_E, myHero, minion)  
          if (UnitHaveBuff(minion, "poison") or Config.LastHit.Enp) and EMinionDmg >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[2].range^2 then
            CastSpell(_E, minion)
          end   
        end
      end
    end  
  end

  function Cassiopeia:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and GetDistance(Target) < myHeroSpellData[0].range then
      Cast(_Q, Target)
    end
    if UnitHaveBuff(Target, "poison") then
      if myHero:CanUseSpell(_E) == READY and self.lastE < os.clock() and Config.Combo.E and GetDistance(Target) < myHeroSpellData[2].range then
        CastSpell(_E, Target)
      end
    else
      if myHero:CanUseSpell(_W) == READY and Config.Combo.W and GetDistance(Target) < myHeroSpellData[1].range then
        Cast(_W, Target)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) + 2*GetDmg(_E, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 350) > 1 and UnitHaveBuff(Target, "poison"))) and GetDistance(Target) < myHeroSpellData[3].range then
      Cast(_R, Target)
    end
  end

  function Cassiopeia:Harass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harass.Q and GetDistance(Target) < myHeroSpellData[0].range and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harass.W and GetDistance(Target) < myHeroSpellData[1].range and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < os.clock() and Config.Harass.E and GetDistance(Target) < myHeroSpellData[2].range and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
      if UnitHaveBuff(Target, "poison") then
        CastSpell(_E, Target)
      end
    end
  end

  function Cassiopeia:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistance(enemy) < myHeroSpellData[0].range then
          CastSpell(_Q, enemy)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistance(enemy) < myHeroSpellData[1].range then
          Cast(_W, enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistance(enemy) < myHeroSpellData[2].range then
          CastSpell(_E, enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy)*2 and UnitHaveBuff(enemy, "poison") and Config.Killsteal.E and GetDistance(enemy) < myHeroSpellData[2].range then
          CastSpell(_E, enemy)
          DelayAction(CastSpell, 0.545, {_E, enemy})
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[3].range then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistance(enemy) < 600 then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Darius

  function Darius:__init()
  end

  function Darius:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    self:Menu()
  end

  function Darius:Menu()
    Config.Combo:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetQ", "Max Q range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
  end

  function Darius:Tick()
    self.doW = (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harass and Config.Harass.W and Config.Harass.manaW < myHero.mana/myHero.maxMana*100) or (Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana*100) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100)
  end

  function Darius:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doW then
        DelayAction(function() Cast(_W) end, spell.windUpTime + GetLatency() / 2000)
      end
    end
  end

  function Darius:Draw()
    if Config.Draws.Q and sReady[_Q] then
      DrawLFC(myHero.x, myHero.y, myHero.z, 270, ARGB(table.unpack(Config.Draws.ColorQ)))
    end
  end

  function Darius:Combo()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local CastPosition, HitChance, Position = Predict(_Q, myHero, enemy, ScriptologyConfig.Prediction["Combo"])
        if Config.Combo.Qd and HitChance and sReady[_Q] and CastPosition and GetDistance(CastPosition) >= 250 and HitChance >= ScriptologyConfig.Prediction["Combo"]["pred"..str[_Q].."val"] then
          CastSpell(_Q)
        elseif Config.Combo.Qs and HitChance and sReady[_Q] and CastPosition and GetDistance(CastPosition) < 250 and HitChance >= ScriptologyConfig.Prediction["Combo"]["pred"..str[_Q].."val"] then
          CastSpell(_Q)
        end
      end
    end
    if Config.Combo.E and sReady[_E] and (GetDistance(Target) > 450 or not sReady[_Q] and GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox)) then
      Cast(_E, Target)
    end
    if Config.Combo.R and sReady[_R] and GetDmg(_R, myHero, Target) > GetRealHealth(Target) then
      Cast(_R, Target)
    end
  end

  function Darius:Harass()
    if sReady[_Q] and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100 then
      for _, enemy in pairs(GetEnemyHeroes()) do
        if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
          local CastPosition, HitChance, Position = Predict(_Q, myHero, enemy, ScriptologyConfig.Prediction["Harass"])
          if Config.Harass.Qd and sReady[_Q] and CastPosition and GetDistance(CastPosition) >= 250 and HitChance >= ScriptologyConfig.Prediction["Harass"]["pred"..str[_Q].."val"] then
            CastSpell(_Q)
          elseif Config.Harass.Qs and sReady[_Q] and CastPosition and GetDistance(CastPosition) < 250 and HitChance >= ScriptologyConfig.Prediction["Harass"]["pred"..str[_Q].."val"] then
            CastSpell(_Q)
          end
        end
      end
    end
  end

  function Darius:LaneClear()
    if sReady[_Q] and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[0].width, myHeroSpellData[0].width)
      if BestHit > 0 and GetDistance(BestPos) < myHero.ms*0.75 then 
        CastSpell(_Q)
      end
    end
  end

  function Darius:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = GetDmg(_Q, myHero, winion)
        local MinionDmg2 = GetDmg(_Q, myHero, winion)/1
        local health = GetRealHealth(winion)
        if MinionDmg2 and MinionDmg2 >= health and ValidTarget(winion, 450) then
          CastSpell(_Q)
        elseif MinionDmg1 and MinionDmg1 >= health and ValidTarget(winion, 450) then
          self:CastQOuter(winion)
        end
      end
    end
  end

  function Darius:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local qDmg = ((GetDmg(_Q, myHero, enemy)*1.5) or 0) 
        local q1Dmg = ((GetDmg(_Q, myHero, enemy)) or 0)  
        local wDmg = ((GetDmg(_W, myHero, enemy)) or 0)   
        local rDmg = ((GetDmg(_R, myHero, enemy)) or 0)
        local iDmg = (50 + 20 * myHero.level)
        local health = GetRealHealth(enemy)
        if myHero:GetSpellData(_R).level == 3 and myHero:CanUseSpell(_R) == READY and health < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy)
        elseif sReady[_Q] and health < qDmg and Config.Killsteal.Q and ValidTarget(enemy, 450) then
          self:CastQOuter(enemy)
        elseif sReady[_Q] and health < q1Dmg and Config.Killsteal.Q and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif sReady[_W] and health < wDmg and Config.Killsteal.W then
          if GetDistanceSqr(enemy) < (myHero.range+GetDistance(myHero.minBBox))^2 then
          CastSpell(_W, myHero:Attack(enemy))
          elseif GetDistanceSqr(enemy) < (myHeroSpellData[_E].range)^2 and sReady[_E] then
          Cast(_E, enemy)
          DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif myHero:CanUseSpell(_R) == READY and health < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy)
        elseif health < iDmg and Config.Killsteal.I and ValidTarget(enemy, 600) and myHero:CanUseSpell(Ignite) == READY then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Darius:CastQOuter(target)
    if target == nil then return end
    local dist = target.ms < 350 and 0 or (Vector(myHero.x-target.x, myHero.y-target.y, myHero.z-target.z):len() < 0 and 25 or 0)
    if GetDistance(target) < myHeroSpellData[0].width*(Config.Misc.offsetQ/100)-dist and GetDistance(target) >= 250 then
      CastSpell(_Q)
    end
  end

-- }

-- { Diana

  function Diana:__init()
    self.passiveTracker = 0
  end

  function Diana:Load()
    self:Menu()
  end

  function Diana:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Diana:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == "dianapassivemarker" then
      self.passiveTracker = 1
    end
    if unit and unit == source and unit.isMe and buff.name == "dianaarcready" then
      self.passiveTracker = 2
    end
  end

  function Diana:RemoveBuff(unit,buff)
    if unit and unit.isMe and (buff.name == "dianapassivemarker" or buff.name == "dianaarcready") then
      self.passiveTracker = 0
    end
  end

  function Diana:Combo()
    if sReady[_Q] and sReady[_R] then
      if GetDistance(Target,myHero) < 790+Target.boundingRadius and GetDistance(Target,myHero) > 825-Target.boundingRadius then
        local target, cPos, CastPosition, HitChance, Position
        local LessToKill, LessToKilli = 100, 0
        for _,enemy in pairs(GetEnemyHeroes()) do
          if ValidTarget(enemy) and GetDistance(enemy, Target) < myHeroSpellData[0].range and enemy ~= Target then
          DamageToHero = GetDmg(_Q, myHero, enemy)
          ToKill = GetRealHealth(enemy) / DamageToHero
          if ((ToKill < LessToKill) or (LessToKilli == 0)) then
            LessToKill = ToKill
            LessToKilli = i
            target = enemy
          end
          end
        end
        if target then
          CastPosition, HitChance, Position = Predict(_Q, Target, target, ScriptologyConfig.Prediction["Combo"])
          cPos = Target+(Vector(CastPosition)-Target):normalized()*GetDistance(Target,target)
        else
          HitChance = 2
          cPos = Target
        end
        if HitChance and HitChance >= 1 then
          Cast(_R, Target)
          Cast(_Q, cPos.pos)
        end
        elseif sReady[_Q] and GetDistance(Target) < 830-Target.boundingRadius then
        local CastPosition, HitChance, Position = Predict(_Q, myHero, Target, ScriptologyConfig.Prediction["Combo"])
        if HitChance and HitChance >= 1 then
          CastSpell(_Q, CastPosition.x, CastPosition.z)
        end
        if HitChance and HitChance >= 2 then
          DelayAction(function() Cast(_R, Target) end, 0.25 + GetLatency() / 2000)
        end
      end
    elseif sReady[_Q] and GetDistance(Target) < 830-Target.boundingRadius then
      Cast(_Q, Target)
    end
    if sReady[_R] and UnitHaveBuff(Target, "dianamoonlight") and GetDistance(Target) < myHeroSpellData[_R].range then
      Cast(_R, Target)
    end
    if sReady[_W] and GetDistance(Target) < myHeroSpellData[_W].range then
      Cast(_W)
    end
    if sReady[_E] and GetDistance(Target) < myHeroSpellData[_E].range then
      Cast(_E, Target)
    end
  end

  function Diana:Harass()
    if sReady[_Q] and Config.Harass.Q and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100 then
      Cast(_Q, Target)
    end
    if sReady[_W] and Config.Harass.W and Config.Harass.manaW < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < myHeroSpellData[_W].range then
      Cast(_W)
    end
    if sReady[_E] and Config.Harass.E and Config.Harass.manaE < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < myHeroSpellData[_E].range then
      Cast(_E, Target)
    end
  end

  function Diana:LastHit()
    if sReady[_Q] and Config.Harass.Q and Config.kConfig.LastHit and Config.LastHit.manaQ < myHero.mana/myHero.maxMana*100 then
      for minion,winion in pairs(Mobs.objects) do
        if winion and not winion.dead and winion.visible and winion.bTargetable then
          local MinionDmg = GetDmg(_Q, myHero, winion)
          if MinionDmg and MinionDmg >= GetRealHealth(winion) and GetDistance(winion) < myHeroSpellData[0].range then
            Cast(_Q, winion)
          end
        end
      end
    end
  end

  function Diana:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestHit > 0 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].range)
      if BestHit > 0 and BestPos and GetDistance(BestPos) < 250 then 
        CastSpell(_W)
      end
    end
  end

  function Diana:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          Cast(_W, enemy)
        elseif sReady[_R] and sReady[_Q] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_Q, enemy)
          DelayAction(function() if not sReady[_Q] then Cast(_R, enemy) end end, 0.25 + GetLatency() / 2000)
        elseif sReady[_R] and EnemiesAround(enemy, 1000) <= 3 and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_R, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and health < 20 + 8 * myHero.level and Config.Killsteal.S and GetDistanceSqr(enemy) < 600^2 then
          CastSpell(Smite, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistanceSqr(enemy) < 575^2 then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Draven

  function Draven:__init()
    self.axes = { nil, nil, nil}
  end

  function Draven:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    targetSel.range = 900
    self:Menu()
  end

  function Draven:Menu()
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
  end

  function Draven:Tick()
    for _, axe in pairs(self.axes) do
      if axe[2] + 1.2 < os.clock() then
        table.remove(self.axes, _)
      end
    end
  end

  function Draven:Draw()
    for _, axe in pairs(self.axes) do
      if axe[2] + 1.2 > os.clock() then
        DrawCircle3D(axe[1].x, axe[1].y, axe[1].z, 125, 1, 0xFFFFFFFF, 32)
      end
    end
  end

  function Draven:Combo()
    if sReady[_Q] then
      CastSpell(_Q)
    end
    if sReady[_W] then
      CastSpell(_W)
    end
    local axew = nil
    for _, axe in pairs(self.axes) do if not axew then axew = axe[1] end end
    if axew then
      if GetDistance(axew) > 135 then
        _G.NebelwolfisOrbWalker:ForcePos(axew)
        _G.NebelwolfisOrbWalker:SetMove(true)
      else
        _G.NebelwolfisOrbWalker:ForcePos(axew)
        _G.NebelwolfisOrbWalker:SetMove(false)
      end
    else
      if GetDistance(Target) < myHero.range+myHero.boundingRadius+Target.boundingRadius then
        _G.NebelwolfisOrbWalker:ForcePos(myHero + (Vector(mousePos) - myHero):normalized()*75)
      else
        _G.NebelwolfisOrbWalker:ForcePos(nil)
      end
      _G.NebelwolfisOrbWalker:SetMove(true)
    end
  end

  function Draven:CreateObj(obj)
    if obj.name == "Draven_Base_Q_reticle.troy" then
      table.insert( self.axes, { obj, os.clock() })
    end
  end

-- }

  function DrMundo:__init()
  end

-- {

  function EmoteSpammer:__init()
    self.offsets = { 0x97, 0xFD, 0x7D, 0x8B, 0xDC, }
    ScriptologyConfig:addSubMenu("EmoteSpammer", "EmoteSpammer")
    self.Config = ScriptologyConfig.EmoteSpammer
    self.Config:addDynamicParam("joke", "Joke", SCRIPT_PARAM_ONOFF, false)
    self.Config:addDynamicParam("taunt", "Taunt", SCRIPT_PARAM_ONOFF, false)
    self.Config:addDynamicParam("dance", "Dance", SCRIPT_PARAM_ONOFF, false)
    self.Config:addDynamicParam("laugh", "Laugh", SCRIPT_PARAM_ONOFF, false)
    self.Config:addDynamicParam("toggle", "Toggle", SCRIPT_PARAM_ONOFF, false)
    self.Config:addParam("time", "Time between", SCRIPT_PARAM_SLICE, 0, 0, 5, 2)
    self.tick = 0
    AddTickCallback(function() self:Tick() end)
  end

  function EmoteSpammer:Tick()
    if self.tick + self.Config.time > os.clock() then return end
    self.tick = os.clock()
    local emote = 0
    if self.Config.joke then
      emote = 1
      self:Cast(emote)
    end
    if self.Config.taunt then
      emote = 2
      self:Cast(emote)
    end
    if self.Config.dance then
      emote = 3
      self:Cast(emote)
    end
    if self.Config.laugh then
      emote = 4
      self:Cast(emote)
    end
    if self.Config.toggle then
      emote = 5
      self:Cast(emote)
    end
  end

  function EmoteSpammer:Cast(emote)
    local p = CLoLPacket(0x003B)
    p.vTable = 0xE432B0
    p:EncodeF(myHero.networkID)
    p:Encode1(self.offsets[emote])
    p:Encode2(0x2807)
    p:Encode2(0xA5EF)
    SendPacket(p)
  end

-- }

-- { Ekko

  function Ekko:__init()
    objTrackList = { 
      "Ekko", 
      "Ekko_Base_Q_Aoe_Dilation.troy", 
      "Ekko_Base_W_Detonate_Slow.troy", 
      "Ekko_Base_W_Indicator.troy", 
      "Ekko_Base_W_Cas.troy"
    }
    objTimeTrackList = { 
      huge,
      1.565, 
      1.70, 
      3, 
      1
    }
    objHolder = {}
    objTimeHolder = {}
  end

  function Ekko:Load()
    for k=1,objManager.maxObjects,1 do
      local object = objManager:getObject(k)
      for _,name in pairs(objTrackList) do
        if object and object.valid and object.name and object.team == myHero.team and object.name == name then
          objHolder[object.networkID] = object
        end
      end
    end
    self:Menu()
  end

  function Ekko:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Ekko:CreateObj(object)
    if object and object.valid and object.name then
      for _=1, #objTrackList do
        if object.name == objTrackList[_] then
          objHolder[object.networkID] = object
          objTimeHolder[object.networkID] = os.clock() + objTimeTrackList[_]
        end
      end
    end
  end

  function Ekko:DeleteObj(object)
    if object and object.name and objHolder[object.networkID] then 
      objHolder[object.networkID] = nil
      objTimeHolder[object.networkID] = nil
    end
  end

  function Ekko:Draw()
    for _, obj in pairs(objHolder) do
      if objTimeHolder[_] and objTimeHolder[_] < huge then
        if objTimeHolder[_] > os.clock() then 
          local pos = WorldToScreen(D3DXVECTOR3(obj.x, obj.y, obj.z))
          if (obj.name:find("Ekko_Base_Q") and Config.Draws.Q) or (obj.name:find("Ekko_Base_W") and Config.Draws.W) then 
            DrawText((floor((objTimeHolder[_]-os.clock())*100)/100).."s", 25, pos.x-35, pos.y-50, ARGB(255, 255, 0, 0)) 
          end
        else
          objHolder[_] = nil
          objTimeHolder[_] = nil
        end
      end
      if obj.name == "Ekko" and Config.Draws.R then 
        DrawLFC(obj.x, obj.y, obj.z, myHeroSpellData[3].width, ARGB(155, 155, 150, 250)) 
        DrawLFC(obj.x, obj.y, obj.z, myHeroSpellData[3].width, ARGB(255, 155, 150, 250))
      elseif obj.name:find("Ekko_Base_Q") and Config.Draws.Q then 
        DrawLine3D(myHero.x, myHero.y, myHero.z, obj.x, obj.y, obj.z, 1, ARGB(255, 155, 150, 250)) 
        DrawLFC(obj.x, obj.y, obj.z, myHeroSpellData[0].width, ARGB(255, 155, 150, 250))
      elseif obj.name:find("Ekko_Base_W") and Config.Draws.W then
        DrawLFC(obj.x, obj.y, obj.z, myHeroSpellData[1].width, ARGB(255, 155, 150, 250))
      end
    end
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
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        if winion and not winion.dead and winion.visible and winion.bTargetable then
          local QMinionDmg = GetDmg(_Q, myHero, winion)
          if QMinionDmg and QMinionDmg >= GetRealHealth(winion) and GetDistanceSqr(winion) < myHeroSpellData[0].range^2 then
            Cast(_Q, winion)
          end
        end
      end
    end
  end

  function Ekko:LaneClear()
    if sReady[_Q] and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      pos, hit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if hit > 0 then
        CastSpell(_Q, pos.x, pos.z)
      end
    end
  end

  function Ekko:Combo()
    if Config.Combo.Q and sReady[_Q] and GetDistanceSqr(Target) < (myHeroSpellData[0].range)^2 then
      Cast(_Q, Target)
    end
    if Config.Combo.W and sReady[_W] and GetDistanceSqr(Target) < (myHeroSpellData[1].range)^2 then
      Cast(_W, Target)
    end
    local slot = GetLichSlot()
    if slot then
      if myHero:GetSpellData(slot).currentCd == 0 and Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 then
        CastSpell(_E, Target.x, Target.z)
      elseif myHero:GetSpellData(slot).currentCd > 0 and Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        CastSpell(_E, Target.x, Target.z)
      end
    else
      if Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 then
        CastSpell(_E, Target.x, Target.z)
      end
    end
  end

  function Ekko:Harass()
    if Config.Combo.Q and sReady[_Q] and GetDistanceSqr(Target) < (myHeroSpellData[0].range)^2 then
      Cast(_Q, Target)
    end
    local slot = GetLichSlot()
    if slot then
      if myHero:GetSpellData(slot).currentCd == 0 and Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 then
        CastSpell(_E, Target.x, Target.z)
      elseif myHero:GetSpellData(slot).currentCd > 0 and Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        CastSpell(_E, Target.x, Target.z)
      end
    else
      if Config.Combo.E and GetDistanceSqr(Target) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 then
        CastSpell(_E, Target.x, Target.z)
      end
    end
  end

  function Ekko:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < (myHeroSpellData[0].range)^2 then
          Cast(_Q, enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < (myHeroSpellData[2].range+(myHero.range+myHero.boundingRadius)*2)^2 then
          CastSpell(_E, enemy.x, enemy.z)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and self:GetTwin() and GetDistanceSqr(self:GetTwin(),enemy) < 375^2 then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistanceSqr(enemy) < 600^2 then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

  function EvadeS:__init()
  end

  function Gangplank:__init()
  end

  function Gnar:__init()
  end

  function Hecarim:__init()
  end

  function Irelia:__init()
  end

  function Jarvan:__init()
  end

  function Jax:__init()
  end

  function Jayce:__init()
  end

  function Jinx:__init()
  end

-- { Kalista

  function Kalista:__init()
    self.jungleMinions = {"Crab", "Rift", "Baron", "Dragon", "Gromp", "Krug", "Murkwolf", "Razorbeak", "Red", "Blue" }
    self.soulMate = nil
    self.saveAlly = false
  end

  function Kalista:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    self:Menu()
    for k,v in pairs(GetAllyHeroes()) do
      if UnitHaveBuff(v, "kalistacoopstrikeally") then
        self.soulMate = v
        Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      end
    end
  end

  function Kalista:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Combo:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 10, 1, 20, 0)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Qa", "Use Q auto (if lasthit + harass)", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Harass:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 10, 1, 20, 0)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("Ea", "Execute X Minions", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("WallJump", "WallJump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ej", "Use E to steal Jungle", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Ed", "Use E if you are about to die", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Ea", "Use E if you cant make the lasthit", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("AAGap", "AAs as Gapcloser on minions", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("R", "Save ally with R (none bound)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rhp", "Save ally under X% hp", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
  end

  function Kalista:Draw()
    if sReady[_Q] and Config.Misc.WallJump then
      local MyPos = Vector(myHero.x, myHero.y, myHero.z)
      local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
      local drawPos = MyPos - (MyPos - MousePos):normalized() * 300
      local barPos = WorldToScreen(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z))
      DrawLFC(drawPos.x, drawPos.y, drawPos.z, myHero.boundingRadius*2, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
      DrawLFC(drawPos.x, drawPos.y, drawPos.z, 2*myHero.boundingRadius/3, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
      DrawText("WallJump", 15, barPos.x, barPos.y, ARGB(255, 155, 155, 155))
    end
    if not Config.Draws.DMG or not sReady[_E] then return end
    for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and GetDistanceSqr(minion) < 1000 * 1000 and GetStacks(minion) > 0 then
        local damageE = GetDmg(_E, myHero, minion)
        local health = GetRealHealth(minion)
        if damageE > health then
          DrawText3D("E Kill", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        else
          DrawText3D(floor(damageE/health*100).."%", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        end
      end
    end
  end

  function Kalista:Attack(unit, spell)
    self:ProcessSpell(unit, spell)
  end

  function Kalista:ProcessSpell(unit, spell)
    if not unit or not spell then return end
    if spell.name == "KalistaPSpellCast" and GetDistance(spell.target) < 1000 then 
      self.soulMate = spell.target
      Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      Msg("Soulmate found: "..spell.target.charName)
    end
    if Config.Misc.Ed and not myHero.dead and unit.team ~= myHero.team and ((myHero == spell.target and GetDmg("AD", spell.target, myHero) > myHero.health) or (GetDistance(spell.endPos,myHero) < myHero.boundingRadius*3 and myHero.health/myHero.maxHealth < 0.15)) then
      Cast(_E)
    end
      if not self.soulMate or unit.type ~= myHero.type then return end
    if Config.Misc.R and not myHero.dead and not self.soulMate.dead and self.saveAlly and GetDistanceSqr(self.soulMate) < myHeroSpellData[3].range^2 and unit.team ~= self.soulMate.team and (self.soulMate == spell.target or GetDistance(spell.endPos,self.soulMate) < self.soulMate.boundingRadius*3) then
      Cast(_R)
      Msg("Saving soulmate from spell: "..spell.name)
      self.saveAlly = false
    end
  end
  
  function Kalista:Tick()
    if Config.Misc.WallJump then
      local movePos1 = myHero + (Vector(mousePos) - myHero):normalized() * 150
      local movePos2 = myHero + (Vector(mousePos) - myHero):normalized() * 300
      local movePos3 = myHero + (Vector(mousePos) - myHero):normalized() * 65
      if IsWall(D3DXVECTOR3(movePos1.x, movePos1.y, movePos1.z)) then
        if not IsWall(D3DXVECTOR3(movePos2.x, movePos2.y, movePos2.z)) and mousePos.y-myHero.y < 225 then
          CastSpell(_Q, movePos2.x, movePos2.z)
          myHero:MoveTo(movePos2.x, movePos2.z)
        else
          myHero:MoveTo(movePos3.x, movePos3.z)
        end
      else
        myHero:MoveTo(movePos1.x, movePos1.z)
      end
    end
    if self.soulMate and self.soulMate.health/self.soulMate.maxHealth < Config.Misc.Rhp/100 then
      self.saveAlly = true
    else
      self.saveAlly = false
    end
    local jkillableCount = 0
    if sReady[_E] and Config.Misc.Ej then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.visible and minion.team == 300 and minion.health < 100000 and GetStacks(minion) > 0 and GetDistanceSqr(minion) < 1000 * 1000 then
          for _, winion in pairs(self.jungleMinions) do
            if minion.charName:lower():find(winion:lower()) and not minion.charName:lower():find("mini") then
              local damageE = GetDmg(_E, myHero, minion)
              local health = GetRealHealth(minion)
              if damageE > health then
              jkillableCount = jkillableCount + 1
              end
            end
          end
        end
      end
    end
    if jkillableCount >= 1 then
      Cast(_E)
    end
    if (Config.Misc.Ea and sReady[_E]) or (Config.Harass.Qa and sReady[_Q]) then
      local killableCount = 0
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.visible and GetDistanceSqr(minion) < 1000 * 1000 and GetStacks(minion) > 0 then
          local damageQ = GetDmg(_Q, myHero, minion)
          local damageE = GetDmg(_E, myHero, minion)
          local health = GetRealHealth(minion)
          if (Config.Misc.Ea and sReady[_E]) then
            if _G.HP then
              local hp1 = _G.HP:PredictHealth(minion, (min(myHero.range+GetDistance(myHero.minBBox), GetDistance(myHero, minion)) / (2000) + 0.07))
              local hp2 = _G.HP:PredictHealth(minion, (0.125))
              if damageE > health and hp1 < 0 and hp2 > 0 then
                killableCount = killableCount + 1
              end
            else
              if damageE > health and health < 35 then
                killableCount = killableCount + 1
              end
            end
          end
          if (Config.Harass.Qa and sReady[_Q] and Target and not Target.dead and Target.visible) then
            if damageQ > health then
              local pointSegment, _, isOnSegment = VectorPointProjectionOnLineSegment(myHero, Target, minion)
              if isOnSegment and GetDistance(pointSegment,minion) < 50 then
                Cast(_Q, minion.pos)
              end
            end
          end
        end
      end
      if killableCount > 0 then
        Cast(_E)
      end
    end
  end

  function Kalista:Combo()
    if sReady[_Q] and Config.Combo.Q and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target)
    end
    if sReady[_E] and Config.Combo.E and GetStacks(Target) > 0 and (self:CountKillableMinions() > 0 or GetDmg(_E, myHero, Target) > GetRealHealth(Target)) then
      Cast(_E)
    end
    if Config.Misc.AAGap and GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox) then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.health > 55 then
          myHero:Attack(minion)
          myHero:MoveTo(mousePos.x, mousePos.z)
        end
      end
    end
  end

  function Kalista:Harass()
    if sReady[_Q] and Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, Target)
    end
    if sReady[_E] and Config.Harass.E and GetStacks(Target) > 0 and self:CountKillableMinions() > 0 and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
      Cast(_E)
    end
  end

  function Kalista:LastHit()
    local killableCount = self:CountKillableMinions()
    if sReady[_E] and ((Config.kConfig.LastHit and Config.LastHit.E and killableCount >= Config.LastHit.Ea) or (Config.kConfig.LaneClear and Config.LaneClear.E and killableCount >= Config.LaneClear.Ea)) then
      Cast(_E)
    end
  end

  function Kalista:CountKillableMinions()
    local killableCount = 0
    if sReady[_E] and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and GetDistanceSqr(minion) < 1000 * 1000 and GetStacks(minion) > 0 then
          local damageE = GetDmg(_E, myHero, minion)
          local health = GetRealHealth(minion)
          if damageE > health then
            killableCount = killableCount + 1
          end
        end
      end
    end
    return killableCount
  end

  function Kalista:Killsteal()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.valid then
        local health = GetRealHealth(enemy)
        if Config.Killsteal.E and health <= GetDmg(_E, myHero, enemy) and GetDistanceSqr(enemy) < 1000*1000 then
          Cast(_E)
        elseif Config.Killsteal.Q and health <= GetDmg(_Q, myHero, enemy) and GetDistanceSqr(enemy) < myHeroSpellData[_Q].range^2 then
          Cast(_Q, enemy)
        elseif Config.Killsteal.I and health < GetDmg("IGNITE", myHero, enemy) and GetDistanceSqr(enemy) < 600*600 then
          Cast(Ignite, enemy)
        elseif Config.Killsteal.S and health <= 20+8*myHero.level and GetDistanceSqr(enemy) < 600*600 then
          Cast(Smite, enemy)
        end
      end
    end
  end

-- }

-- { Katarina

  function Katarina:__init()
    ultOn = 0
    ultTarget = nil
    WardJump()
  end

  function Katarina:Load()
    self:Menu()
  end

  function Katarina:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Katarina:Attack(unit, spell)
    self:ProcessSpell(unit, spell)
  end

  function Katarina:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name:lower():find("katarinar") then
        DisableOrbwalker()
        ultOn = os.clock()+2.5
        ultTarget = Target
        DelayAction(function() 
          EnableOrbwalker()
        end, 2.5)
      end
    end
  end

  function Katarina:Tick()
    if ultTarget and not ultTarget.dead and ultTarget.visible then 
      return
    else
      EnableOrbwalker()
    end
  end

  function Katarina:LastHit()
    if ultOn >= os.clock() then
      if ultTarget and not ultTarget.dead and ultTarget.visible then 
        return;
      else
        EnableOrbwalker()
      end
    end
    for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        local health = GetRealHealth(minion)
        if sReady[_Q] and Config.LastHit.Q and health <= GetDmg(_Q, myHero, minion) and GetDistanceSqr(minion) < myHeroSpellData[_Q].range^2 then
          CastSpell(_Q, minion)
          break;
        end
        if sReady[_W] and Config.LastHit.W and health <= GetDmg(_W, myHero, minion) and GetDistanceSqr(minion) < myHeroSpellData[_W].range^2 then
          CastSpell(_W)
          break;
        end
        if sReady[_E] and Config.LastHit.E and health <= GetDmg(_E, myHero, minion) and GetDistanceSqr(minion) < myHeroSpellData[_E].range^2 then
          CastSpell(_E, minion)
          break;
        end
      end
    end
  end

  function Katarina:LaneClear()
    if ultOn >= os.clock() then
      if ultTarget and not ultTarget.dead and ultTarget.visible then 
        return;
      else
        EnableOrbwalker()
      end
    end
    for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        local health = GetRealHealth(minion)
        if sReady[_Q] and Config.LastHit.Q and GetDistanceSqr(minion) < myHeroSpellData[_Q].range^2 then
          CastSpell(_Q, minion)
          break;
        end
        if sReady[_W] and Config.LastHit.W and GetDistanceSqr(minion) < myHeroSpellData[_W].range^2 then
          CastSpell(_W)
          break;
        end
      end
    end
  end

  function Katarina:Combo()
    if ultOn >= os.clock() then
      if ultTarget and not ultTarget.dead and ultTarget.visible then 
        return;
      else
        EnableOrbwalker()
      end
    end
    if Config.Combo.R and sReady[_R] and GetDistance(Target) < 225 then
      ultTarget = Target
      DisableOrbwalker()
      CastSpell(_R)
      return;
    end
    if Config.Combo.Q and sReady[_Q] and GetDistance(Target) < myHeroSpellData[0].range then
      CastSpell(_Q, Target)
      return;
    end
    if Config.Combo.E and sReady[_E] and GetDistance(Target) < myHeroSpellData[2].range then
      CastSpell(_E, Target)
      return;
    end
    if Config.Combo.W and sReady[_W] and GetDistance(Target) < myHeroSpellData[1].range*0.85 then
      CastSpell(_W)
      return;
    end
  end

  function Katarina:Harass()
    if ultOn >= os.clock() then
      if ultTarget and not ultTarget.dead and ultTarget.visible then 
      return;
      else
      EnableOrbwalker()
      end
    end
    if Config.Harass.Q and sReady[_Q] and GetDistance(Target) < myHeroSpellData[0].range then
      CastSpell(_Q, Target)
      return;
    end
    if Config.Harass.W and sReady[_W] and GetDistance(Target) < myHeroSpellData[1].range*0.85 then
      CastSpell(_W)
      return;
    end
    if Config.Harass.E and sReady[_E] and GetDistance(Target) < myHeroSpellData[2].range then
      CastSpell(_E, Target)
      return;
    end
  end

  function Katarina:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and GetDistanceSqr(enemy) < 700^2 then
        local dist = GetDistance(enemy)
        local health = GetRealHealth(enemy)
        local dmg = 0
        if Config.Killsteal.Q and sReady[_Q] then
          local d = GetDmg(_Q, myHero, enemy)
          dmg = dmg + d
          if d > health then
            CastSpell(_Q, enemy)
          end
        end
        if Config.Killsteal.W and sReady[_W] then
          local d = GetDmg(_W, myHero, enemy)
          dmg = dmg + d
          if d > health and dist < myHeroSpellData[1].range*0.85 then
            CastSpell(_E)
          end
        end
        if Config.Killsteal.E and sReady[_E] then
          local d = GetDmg(_E, myHero, enemy)
          dmg = dmg + d
          if d > health then
            CastSpell(_E, enemy)
          end
        end
        if dmg+((sReady[_Q] and Config.Killsteal.Q) and myHero:CalcMagicDamage(enemy,15*myHero:GetSpellData(_Q).level+0.15*myHero.ap) or 0)+((myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and Config.Killsteal.R) and GetDmg(_R, myHero, enemy)*10 or 0) >= health then
          if Config.Killsteal.Q and sReady[_Q] then
            Cast(_Q, enemy)
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy,})
              if Config.Killsteal.W and sReady[_W] then
                DelayAction(function() Cast(_W) end, 0.5)
                if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() 
                    DisableOrbwalker()
                    Cast(_R) 
                    ultTarget = enemy
                  end, 0.75)
                end
              end
            elseif Config.Killsteal.W and sReady[_W] then
              if dist < myHeroSpellData[1].range*0.85 then
                DelayAction(function() Cast(_W) end, 0.25)
                if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                  DelayAction(function() 
                    DisableOrbwalker() 
                    Cast(_R) 
                    ultTarget = enemy
                  end, 0.5)
                end
              end
            end
          elseif Config.Killsteal.E and sReady[_E] then
            Cast(_E, enemy)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() 
                  DisableOrbwalker() 
                  Cast(_R) 
                  ultTarget = enemy
                end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] then
            if dist < myHeroSpellData[1].range*0.85 then
              Cast(_W)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() 
                  DisableOrbwalker() 
                  Cast(_R) 
                  ultTarget = enemy
                end, 0.25)
              end
            end
          elseif dist < 250 and Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
            DisableOrbwalker()
            Cast(_R)
            ultTarget = enemy
          end
        end
      end
    end
  end

-- }

  function KhaZix:__init()
  end

-- { KogMaw

  function KogMaw:__init()
  end

  function KogMaw:Load()
    self:Menu()
  end

  function KogMaw:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function KogMaw:LastHit()
    for _, minionTarget in pairs(Mobs.objects) do
      if minionTarget and not minionTarget.dead and minionTarget.visible then
        if GetDmg(_Q, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
          Cast(_Q, minionTarget)
        elseif GetDmg(_W, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
          CastSpell(_W)
        elseif GetDmg(_E, myHero, minionTarget) > minionTarget.health and myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
          Cast(_E, minionTarget2)
        end
      end
    end
  end

  function KogMaw:LaneClear() 
    local minionTarget = GetClosestMinion(myHero)
    if minionTarget then
      if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, minionTarget)
      end
      if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        CastSpell(_W)
      end
    end
    minionTarget = GetLineFarmPosition(myHeroSpellData[2].range, myHeroSpellData[2].width)
    if minionTarget then
      if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, minionTarget)
      end
    end
  end

  function KogMaw:Combo()
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W, myHero:Attack(Target))
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
      Cast(_R, Target)
    end
  end

  function KogMaw:Harass()
    if Config.Harass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target)
    end
    if Config.Harass.W and myHero:CanUseSpell(_W) == READY and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      CastSpell(_W)
    end
    if Config.Harass.E and myHero:CanUseSpell(_E) == READY and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
      Cast(_E, Target)
    end
  end

  function KogMaw:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, enemy)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
          DelayAction(function() Cast(_E, enemy) end, myHeroSpellData[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
          DelayAction(function() Cast(_Q, enemy) DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[0].delay) end, myHeroSpellData[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
          DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, enemy)
          DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function KogMaw:Tick()
    targetSel.range = 900+myHero:GetSpellData(_R).level*300
  end

-- }

  function LeBlanc:__init()
  end

-- { LeeSin

  function LeeSin:__init()
    self.passiveTracker = 0
    self.passiveName = "blindmonkpassive_cosmetic"
    self.wj = WardJump()
  end

  function LeeSin:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    self:Menu()
  end

  function LeeSin:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Qf", "Safe Q to lasthit (jungle)", SCRIPT_PARAM_ONOFF, true)
    if Smite ~= nil then Config.LaneClear:addParam("S", "Smite (jungle)", SCRIPT_PARAM_ONOFF, true) end
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("info1", "Leftclick an enemy to select insect target", SCRIPT_PARAM_INFO, "")
    Config.Misc:addParam("info2", "Leftclick an object to select insect direction", SCRIPT_PARAM_INFO, "")
  end

  function LeeSin:Tick()
    if Config.Misc.Insec then
      if sReady[_R] then
        for _, enemy in pairs(GetEnemyHeroes()) do
          if enemy and not enemy.dead and enemy.visible and GetDistanceSqr(enemy) < 475*475 then
            CastSpell(_R, enemy)
            return;
          end
        end
      end
      myHero:MoveTo(mousePos.x, mousePos.z)
    end
  end

  function LeeSin:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = 2
    end
  end

  function LeeSin:UpdateBuff(unit,buff,stacks)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = stacks
    end
  end

  function LeeSin:RemoveBuff(unit,buff)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = 0
    end
  end

  function LeeSin:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and Config.Misc.Insec then
      if "blindmonkwtwo" then
      elseif spell.name == "BlindMonkRKick" then
        if Flash and myHero:CanUseSpell(Flash) == READY then
          local pos = Vector(myHero) + Vector(Vector(spell.target.x, spell.target.y, spell.target.z) - Vector(myHero)):normalized()*550
          CastSpell(Flash, pos.x, pos.z)
          pos = Vector(myHero) - Vector(Vector(spell.target.x, spell.target.y, spell.target.z) - Vector(myHero)):normalized()*550
          DelayAction(function() CastSpell(_Q, pos.x, pos.z) end, 0.25)
          DelayAction(function() CastSpell(_Q, pos.x, pos.z) end, 0.33)
          DelayAction(function() CastSpell(_Q) end, 0.67)
          DelayAction(function() CastSpell(_Q) end, 1.17)
        else
          local pos = Vector(myHero) + Vector(Vector(spell.target.x, spell.target.y, spell.target.z) - Vector(myHero)):normalized()*550
          DelayAction(function() CastSpell(_Q, pos.x, pos.z) end, 0.25)
          DelayAction(function() CastSpell(_Q, pos.x, pos.z) end, 0.33)
          DelayAction(function() CastSpell(_Q) end, 0.67)
          DelayAction(function() CastSpell(_Q) end, 1.17)
        end
      end
    end
  end

  function LeeSin:QDmg(unit)
    return 2*GetDmg(_Q, myHero, unit)+myHero:CalcDamage(unit,(unit.maxHealth-unit.health)*0.08)
  end

  function LeeSin:LastHit()
    if ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) and sReady[_Q] then
      for minion,winion in pairs(Mobs.objects) do
        if winion and not winion.dead and winion.visible and winion.bTargetable then
          local MinionDmg1 = GetDmg(_Q, myHero, winion)
          local MinionDmg2 = self:QDmg(winion)
          local health = GetRealHealth(winion)
          if MinionDmg1 and MinionDmg1 >= health and GetDistance(winion) < 1100 then
            Cast(_Q, winion)
          elseif MinionDmg2 and UnitHaveBuff(winion, "BlindMonkQOne") and MinionDmg2-MinionDmg1 >= health and GetDistance(winion) < 250 then
            DelayAction(CastSpell, 0.33, {_Q})
          elseif MinionDmg2 and MinionDmg2 >= health and GetDistance(winion) < 1100 then
            Cast(_Q, winion)
            DelayAction(function() if UnitHaveBuff(winion, "BlindMonkQOne") then CastSpell(_Q) end end, 0.33)
          end
        end
      end
    end
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and sReady[_W] then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and GetDistance(winion) < 300 then
          Cast(_E)
        end
      end
    end
  end

  function LeeSin:LaneClear()
    if Config.LaneClear.Q and sReady[_Q] and self.passiveTracker == 0 then
      local minion = GetClosestMinion(myHero)
      if minion ~= nil and GetDistance(minion) < 1100 then
        Cast(_Q, minion)
      end
    end
    if Config.LaneClear.Q and sReady[_Q] then
      local minion = GetJMinion(1100)
      if minion ~= nil and Config.LaneClear.Qf then
        if self:QDmg(minion)+((Smite and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY) and max(20*myHero.level+370,30*myHero.level+330,40*myHero.level+240,50*myHero.level+100) or 0) > GetRealHealth(minion) then
          Cast(_Q, minion)
          if not self:IsFirstCast(_Q) and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY then
            DelayAction(function() 
              CastSpell(Smite, minion) 
            end, myHeroSpellData[0].delay)
          end
        end
      elseif minion ~= nil and not Config.LaneClear.Qf then
        Cast(_Q, minion)
      end
    end
    if Config.LaneClear.E and sReady[_E] and self.passiveTracker == 0 then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[2].range, myHeroSpellData[2].width)
      if BestHit >= 1 and GetDistance(BestPos) < 250 then 
        Cast(_E)
      end
    end
    if Config.LaneClear.W and sReady[_W] and self.passiveTracker == 0 then
      local minion = GetClosestMinion(myHero)
      if minion ~= nil and GetDistance(minion) < myHero.range+GetDistance(myHero.minBBox) then
        Cast(_W, myHero)
      end
    end
  end

  function LeeSin:IsFirstCast(x)
    return myHero:GetSpellData(x).name:find("One")
  end

  function LeeSin:Harass()
    if sReady[_Q] and self:IsFirstCast(_Q) then
      Cast(_Q, Target)
    end
    if not self.oldPos and UnitHaveBuff(Target, "BlindMonkQOne") and sReady[_W] and self:IsFirstCast(_W) then
      self.oldPos = Vector(myHero)
      Cast(_Q)
    end
    if self.oldPos and GetDistance(Target) < 250 and sReady[_W] and self:IsFirstCast(_W) then
      for _,winion in pairs(minionManager(MINION_ALLY, 450, self.oldPos, MINION_SORT_HEALTH_ASC).objects) do
        if GetDistance(self.oldPos) < GetDistance(winion) and GetDistance(winion) < 600 then
          self.oldPos = winion
        end
      end
      local jumpBack = function() 
        if self.wj:Jump(self.oldPos, 400) then
          self.oldPos = nil
        end
      end
      DelayAction(jumpBack, 0.33)
      DelayAction(jumpBack, 0.40)
      DelayAction(jumpBack, 0.47)
    end
    if sReady[_E] and GetDistance(Target) < myHeroSpellData[2].width then
      Cast(_E, Target)
    end
  end

  function LeeSin:Combo()
    if sReady[_E] and GetDistance(Target) < myHeroSpellData[2].width and self.passiveTracker == 0 then
      Cast(_E)
    end
    if GetRealHealth(Target) < self:QDmg(Target)+GetDmg(_R, myHero, Target) then
      if sReady[_Q] and self:IsFirstCast(_Q) then
        Cast(_Q, Target)
      elseif sReady[_Q] and UnitHaveBuff(Target, "BlindMonkQOne") then
        CastSpell(_R, Target)
        DelayAction(Cast, 0.33, {_Q})
      end
    elseif sReady[_Q] and self.passiveTracker == 0 then
      Cast(_Q, Target)
    elseif sReady[_Q] and UnitHaveBuff(Target, "BlindMonkQOne") and GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox) then
      Cast(_Q)
    end
  end

  function LeeSin:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_Q] and health < self:QDmg(enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
          DelayAction(function() if not self:IsFirstCast(_Q) and UnitHaveBuff(enemy, "BlindMonkQOne") then Cast(_Q) end end, myHeroSpellData[0].delay+GetDistance(enemy, myHero.pos)/myHeroSpellData[0].speed)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < (myHero.range+GetDistance(myHero.minBBox))^2 then
          Cast(_E)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          CastSpell(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistanceSqr(enemy) < 600^2 then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and health < 20+8*myHero.level and Config.Killsteal.S and GetDistanceSqr(enemy) < 600^2 then
          CastSpell(Smite, enemy)
        end
      end
    end
  end   

-- }

  function Lissandra:__init()
  end

-- { Lux

  function Lux:__init()
  end

  function Lux:Load()
    self:Menu()
  end

  function Lux:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("manaW", "Min Mana % for shield", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Misc:addParam("Ea", "Detonate E (auto)", SCRIPT_PARAM_ONOFF, true)
    DelayAction(function()
      Config.Misc:addParam("Wa", "Shield with W (auto)", SCRIPT_PARAM_ONOFF, true)
      for _,k in pairs(GetEnemyHeroes()) do
        Config.Misc:addParam(k.charName, k.charName, SCRIPT_PARAM_INFO, "")
        for i=0,3 do
          if spellData and spellData[k.charName] and spellData[k.charName][i] and spellData[k.charName][i].name and spellData[k.charName][i].name ~= "" then
            Config.Misc:addParam(k.charName..str[i], "Shield on "..str[i].." Cast", SCRIPT_PARAM_ONOFF, true)
          end
        end
        Config.Misc:addParam("info", "", SCRIPT_PARAM_INFO, "")
      end
    end, 3)
    AddGapcloseCallback(_Q, myHeroSpellData[0].range, false, Config.Misc)
  end

  function Lux:Tick()
    if myHero:GetSpellData(_E).name == "LuxLightstrikeToggle" and Config.Misc.Ea then
      CastSpell(_E)
    end
  end

  function Lux:Attack(unit, spell)
    self:ProcessSpell(unit, spell)
  end

  function Lux:ProcessSpell(unit, spell)
    if unit and spell and Config.Misc.Wa and unit.team ~= myHero.team and unit.type == myHero.type and not UnitHaveBuff(myHero, "recall") and Config.Misc.manaW <= 100*myHero.mana/myHero.maxMana then
      if myHero == spell.target and spell.name:lower():find("attack") and unit.range >= 450 and Config.Misc.Waa and GetDmg("AD",unit,myHero)/myHero.maxHealth > 0.1337 then
        local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
        Cast(_W, wPos)
      else
        if Config.Misc.Wa and spellData and spellData[unit.charName] then
          if spell.endPos and not spell.target and myHero.health/myHero.maxHealth < 0.85 then
            for _=0, 3 do
              local data = spellData[unit.charName]
              if Config.Misc[unit.charName..str[_]] and data[_] and data[_].name and data[_].name ~= "" and (data[_].name:lower():find(spell.name:lower()) or spell.name:lower():find(data[_].name:lower())) then
                local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
                if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
                  local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
                  Cast(_W, wPos)
                end
              end
            end
            elseif spell.target and spell.target.isMe then
            for _=0, 3 do
              local data = spellData[unit.charName]
              if Config.Misc[unit.charName..str[_]] and data[_] and data[_].name and data[_].name ~= "" and (data[_].name:lower():find(spell.name:lower()) or spell.name:lower():find(data[_].name:lower())) then
                local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
                Cast(_W, wPos)
              end
            end
          end
        end
      end
    end
  end

  function Lux:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, myHeroSpellData[0].range) then
          CastSpell(_Q, minion.x, minion.z)
        end
      end
    end
    if sReady[_E] and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, myHeroSpellData[2].range) then
          Cast(_E, minion)
        end
      end
    end 
  end

  function Lux:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetLineFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width, myHero)
      if BestHit > 0 then
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_E].range, myHeroSpellData[_E].width)
      if BestHit > 1 then 
        Cast(_E, BestPos)
      end
    end  
  end

  function Lux:Combo()
    if Cast((Config.Combo.E and sReady[_E]) and _E or (Config.Combo.Q and sReady[_Q]) and _Q or -1, Target) and Config.Combo.R and sReady[_R] and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= GetRealHealth(Target) and GetRealHealth(Target) >= GetDmg((Config.Combo.E and sReady[_E]) and _Q or (Config.Combo.Q and sReady[_Q]) and _W or "AD", myHero, Target) then
      DelayAction(function() Cast(_R, Target) end, 0.25)
    end
    if UnitHaveBuff(Target, "luxilluminati") and Config.Combo.R and sReady[_R] and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= GetRealHealth(Target) and (GetDistance(Target) > myHero.range+myHero.boundingRadius*2 or GetDmg("AD", myHero, Target)+myHero:CalcMagicDamage(Target, 10+8*myHero.level+0.2*myHero.ap) < GetRealHealth(Target)) then
      Cast(_R, Target)
    elseif Config.Combo.R and sReady[_R] and GetDmg(_R, myHero, Target) >= GetRealHealth(Target) and (GetDistance(Target) > myHero.range+myHero.boundingRadius*2 or (UnitHaveBuff(Target, "luxilluminati") and GetDmg("AD", myHero, Target)*2 < GetRealHealth(Target))) then
      Cast(_R, Target)
    end
  end

  function Lux:Harass()
    if not UnitHaveBuff(Target, "luxilluminati") then
      if Config.Harass.Q and sReady[_Q] and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target)
      end
      if Config.Harass.E and sReady[_E] and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistance(enemy) < myHeroSpellData[0].range then
          Cast(_Q, enemy)
        elseif sReady[_Q] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_E, enemy) end, myHeroSpellData[2].delay)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
        elseif sReady[_Q] and sReady[_R] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_Q, enemy) DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[0].delay) end, myHeroSpellData[2].delay)
        elseif sReady[_R] and sReady[_E] and health < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[2].delay)
        elseif sReady[_Q] and sReady[_R] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[0].range then
          Cast(_Q, enemy)
          DelayAction(function() Cast(_R, enemy) end, myHeroSpellData[0].delay)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistance(enemy) < myHeroSpellData[3].range then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistance(enemy) < 600 then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Malzahar

  function Malzahar:__init()
    ultOn = 0
  end

  function Malzahar:Load()
    self:Menu()
  end

  function Malzahar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 65, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Malzahar:Attack(unit, spell)
    self:ProcessSpell(unit, spell)
  end

  function Malzahar:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if spell.name:lower():find("nethergrasp") then
        DisableOrbwalker()
        ultOn = os.clock()+2.5
        ultTarget = Target
        DelayAction(function() 
          EnableOrbwalker()
        end, 2.5)
      end
    end
  end

  function Malzahar:LastHit()
    if ultOn > os.clock() then return end
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= minion.health and ValidTarget(minion, myHeroSpellData[0].range) then
          Cast(_Q, minion)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then    
      for i, minion in pairs(Mobs.objects) do    
        local WMinionDmg = GetDmg(_W, myHero, minion)      
        if WMinionDmg >= minion.health and ValidTarget(minion, myHeroSpellData[1].range) then
          Cast(_W, minion)
        end      
      end    
    end  
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= minion.health and ValidTarget(minion, myHeroSpellData[2].range) then
          Cast(_E, minion)
        end
      end
    end 
  end

  function Malzahar:LaneClear()
    if ultOn > os.clock() then return end
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetClosestMinion(myHero)
      if minionTarget ~= nil then
        Cast(_Q, minionTarget)
      end
    end
    if myHero:CanUseSpell(_W) == READY and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
      if BestHit > 1 then 
        Cast(_W, BestPos)
      end
    end  
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = GetClosestMinion(myHero)
      if minionTarget ~= nil then
        Cast(_E, minionTarget, true)
      end
    end 
  end

  function Malzahar:Combo()
    if ultOn > os.clock() then return end
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W, Target)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
      CastSpell(_R, Target)
    end
  end

  function Malzahar:Harass()
    if ultOn > os.clock() then return end
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W, Target)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_W, Target)
    end
  end

  function Malzahar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, enemy)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, myHeroSpellData[1].range) then
          Cast(_W, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)*2.5 and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) then
          CastSpell(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { MinionManager

  function MinionManager:__init()
    self.objects = {}
    self.maxObjects = 0
    for k=1,objManager.maxObjects,1 do
      local object = objManager:getObject(k)
      if object and object.valid and object.type == "obj_AI_Minion" and object.team ~= myHero.team and object.name and (object.name:find('Minion_T') or object.name:find('Blue') or object.name:find('Red') or object.team == TEAM_NEUTRAL or object.name:find('Bilge') or object.name:find('BW')) then
        self.maxObjects = self.maxObjects + 1
        self.objects[self.maxObjects] = object
      end
    end
    AddCreateObjCallback(function(o) self:CreateObj(o) end)
    return self
  end

  function MinionManager:CreateObj(object)
    if object and object.valid and object.type == "obj_AI_Minion" and object.team ~= myHero.team and object.name and (object.name:find('Minion_T') or object.name:find('Blue') or object.name:find('Red') or object.team == TEAM_NEUTRAL or object.name:find('Bilge') or object.name:find('BW')) then
      local deadPlace = self:FindDeadPlace()
      if deadPlace then
        self.objects[deadPlace] = object
      else
        self.maxObjects = self.maxObjects + 1
        self.objects[self.maxObjects] = object
      end
    end
  end

  function MinionManager:FindDeadPlace()
    for i=1, self.maxObjects do
      local object = self.objects[i]
      if not object or not object.valid or object.dead then
        return i
      end
    end
  end

-- }

-- { Nidalee

  function Nidalee:__init()
    self.data = {
      Human  = {
      [_Q] = { speed = 1337, delay = 0.25, range = 1500, width = 37.5, collision = true, aoe = false, type = "linear"},
      [_W] = { range = 900},
      [_E] = { range = 600}
    },
      Cougar = {
      [_W] = { range = 350, width = 175},
      [_E] = { range = 350}}
    }
    self.ludenStacks = 0
    self.spearCooldownUntil = 0
  end

  function Nidalee:Load()
    self:Menu()
  end

  function Nidalee:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Dw", "Use W to dodge", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("Eas", "Heal with E (self)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("Eaa", "Heal with E (allies)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("manaEs", "Mana E (self)", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
    Config.Misc:addParam("healthEs", "Health E (self)", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addParam("manaEa", "Mana E (allies)", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Misc:addParam("healthEa", "Health E (allies)", SCRIPT_PARAM_SLICE, 35, 0, 100, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("WallJump", "WallJump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Nidalee:UpdateBuff(unit, buff, stacks)
    if unit and unit.isMe and buff and buff.name and buff.name == "itemmagicshankcharge" then self.ludenStacks = stacks end
  end

  function Nidalee:RemoveBuff(unit, buff)
    if unit and unit.isMe and buff and buff.name and buff.name == "itemmagicshankcharge" then self.ludenStacks = 0 end
  end

  function Nidalee:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name and spell.name == "JavelinToss" then self.spearCooldownUntil = os.clock()+6*(1+unit.cdr) end
  end

  function Nidalee:Tick()
    if not UnitHaveBuff(myHero, "recall") and self:IsHuman() and Config.Misc.Eas and Config.Misc.manaEs <= myHero.mana/myHero.maxMana*100 and myHero.maxHealth-myHero.health > 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and myHero.health/myHero.maxHealth <= Config.Misc.healthEs/100 then
      Cast(_E, myHero)
    end
    if not UnitHaveBuff(myHero, "recall") and self:IsHuman() and Config.Misc.Eaa and Config.Misc.manaEa <= myHero.mana/myHero.maxMana*100 then
      for _,k in pairs(GetAllyHeroes()) do
        if GetDistance(k) < self.data.Human[2].range and k.maxHealth-GetRealHealth(k) < 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and GetRealHealth(k)/k.maxHealth <= Config.Misc.healthEa/100 then
          Cast(_E, k)
        end
      end
    end
    if Config.Misc.Flee then
      if self:IsHuman() then
        Cast(_R)
      else
        Cast(_W, mousePos)
        myHero:MoveTo(mousePos.x, mousePos.z)
      end
    end
    if Config.Misc.WallJump then
      local movePos1 = myHero + (Vector(mousePos) - myHero):normalized() * 150
      local movePos2 = myHero + (Vector(mousePos) - myHero):normalized() * 350
      if IsWall(D3DXVECTOR3(movePos1.x, movePos1.y, movePos1.z)) and not IsWall(D3DXVECTOR3(movePos2.x, movePos2.y, movePos2.z)) then
        CastSpell(_W, movePos2.x, movePos2.z)
      else
        myHero:MoveTo(mousePos.x, mousePos.z)
      end
    end
  end

  function Nidalee:IsHuman()
    return myHero:GetSpellData(_Q).name == "JavelinToss"
  end

  function Nidalee:GetAARange()
    return myHero.range+GetDistance(myHero.minBBox)
  end

  function Nidalee:getMousePos()
    local MyPos = Vector(myHero.x, myHero.y, myHero.z)
    local MousePos = Vector(mousePos.x, mousePos.y, mousePos.z)
    return MyPos - (MyPos - MousePos):normalized() * self.data.Cougar[1].range
  end

  function Nidalee:Draw()
    if self:IsHuman() then
      if Config.Draws.Q and sReady[_Q] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[0].range, ARGB(table.unpack(Config.Draws.ColorQ)))
      end
      if Config.Draws.W and sReady[_W] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[1].range, ARGB(table.unpack(Config.Draws.ColorW)))
      end
      if Config.Draws.E and sReady[_E] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[2].range, ARGB(table.unpack(Config.Draws.ColorE)))
      end
    else
      if Config.Draws.Q and sReady[_Q] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self:GetAARange(), ARGB(table.unpack(Config.Draws.ColorQ)))
      end
      if Config.Draws.W and sReady[_W] then
        local drawPos = self:getMousePos()
        local barPos = WorldToScreen(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawLFC(drawPos.x, drawPos.y, drawPos.z, self.data.Cougar[1].width/3, IsWall(D3DXVECTOR3(drawPos.x, drawPos.y, drawPos.z)) and ARGB(255,255,0,0) or ARGB(255, 155, 155, 155))
        DrawText("W Jump", 15, barPos.x, barPos.y, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.E and sReady[_E] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Cougar[2].range, ARGB(255, 155, 155, 155))
      end
    end
  end

  function Nidalee:DoRWEQCombo(unit)
    if not unit then return end
    if unit and sReady[_R] and UnitHaveBuff(unit, "nidaleepassivehunted") and self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.R then
      Cast(_R)
    end
    if unit and sReady[_W] and UnitHaveBuff(unit, "nidaleepassivehunted") and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.W then
      CastSpell(_W, unit.x, unit.z)
    end
    if unit and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range <= 0 then
      if self:GetDmg(_Q,unit) >= unit.health and sReady[_Q] and Config.Combo.Q and not Config.Combo.E then
        CastSpell(_Q)
      elseif self:GetRWEQComboDmg(unit,-self:GetDmg(_W,unit)) >= unit.health then
        if sReady[_E] and Config.Combo.E then
          CastSpell(_E, unit.x, unit.z)
        end
        if sReady[_Q] and myHero:CanUseSpell(_E) ~= READY and Config.Combo.Q and Config.Combo.E then
          Cast(_Q)
        end
        if sReady[_Q] and Config.Combo.Q and not Config.Combo.E then
          Cast(_Q)
        end
      else
        if sReady[_E] and Config.Combo.E then
          CastSpell(_E, unit.x, unit.z)
        elseif sReady[_Q] and Config.Combo.Q then
          Cast(_Q)
        end
      end
      if unit and sReady[_W] and Config.Combo.W then
        if unit and GetDistance(unit) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(unit) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
          CastSpell(_W, unit.x, unit.z)
        end
      end
    end
  end

  function Nidalee:CalculateDamage()
    if not Config.Draws.DMG then return end
    for i, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        self:GetRWEQComboDmg(enemy, 0, true)
      end
    end
  end

  function Nidalee:GetRWEQComboDmg(target,damage,insert)
    if not target then return end
    local unit = {pos = target.pos, armor = target.armor, magicArmor = target.magicArmor, maxHealth = target.maxHealth, health = target.health}
    local dmg = damage or 0
    local damageQ, damageW, damageE, damageR = 0, 0, 0, 0
    if sReady[_W] then
      local d = self:GetDmg(_W, unit)
      damageW = d
      dmg = dmg + d
    end
    if sReady[_E] then
      local d = self:GetDmg(_E, unit)
      damageE = d
      dmg = dmg + d
    end
    if sReady[_Q] then
      unit.health = unit.health-dmg
      local d = self:GetDmg(_Q,unit)+self:GetDmg("Lichbane", unit)
      damageQ = d + (self.spearCooldownUntil < os.clock() and self:GetDmg(_Q, unit, true) or 0)
      dmg = dmg + d
    end
    if insert then
      killTable[target.networkID] = {damageQ, damageW, damageE, damageR}
    end
    return dmg
  end

  function Nidalee:GetDmg(spell, target, human)
    if target == nil then
      return
    end
    local source     = myHero
    local ADDmg  = 0
    local APDmg  = 0
    local AP     = source.ap
    local Level  = source.level
    local TotalDmg   = source.totalDamage
    local ArmorPen   = floor(source.armorPen)
    local ArmorPenPercent  = floor(source.armorPenPercent*100)/100
    local MagicPen   = floor(source.magicPen)
    local MagicPenPercent  = floor(source.magicPenPercent*100)/100

    local Armor   = target.armor*ArmorPenPercent-ArmorPen
    local ArmorPercent = Armor > 0 and floor(Armor*100/(100+Armor))/100 or ceil(Armor*100/(100-Armor))/100
    local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
    local MagicArmorPercent = MagicArmor > 0 and floor(MagicArmor*100/(100+MagicArmor))/100 or ceil(MagicArmor*100/(100-MagicArmor))/100

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
        APDmg = (30+20*QLevel+0.4*AP)*max(1,min(3,GetDistance(target.pos)/1250*3))--kanker
      elseif spell == _W then
      elseif spell == _E then
      end
    elseif not human then
      if spell == _Q then
        APDmg = ((({[1]=4,[2]=20,[3]=50,[4]=90})[RLevel])+0.36*AP+0.75*TotalDmg)*(1+(UnitHaveBuff(target, "nidaleepassivehunted") and 0.33 or 0))*2.5*(target.maxHealth-target.health)/target.maxHealth--kanker
      elseif spell == _W then
        APDmg = 50*RLevel+0.45*AP
      elseif spell == _E then
        APDmg = 10+60*RLevel+0.45*AP
      end
    end
    dmg = floor(ADDmg*(1-ArmorPercent))+floor(APDmg*(1-MagicArmorPercent))
    return floor(dmg)
  end

  function Nidalee:Combo()
    if sReady[_Q] and self:IsHuman() and Config.Combo.Q and GetDistanceSqr(Target) < myHeroSpellData[0].range^2 then
      Cast(_Q, Target)
    end
    if sReady[_W] and UnitHaveBuff(Target, "nidaleepassivehunted") and self:IsHuman() and Config.Combo.W and GetDistanceSqr(Target) < myHeroSpellData[0].range^2 then
      Cast(_W, Target)
    end
    self:DoRWEQCombo(Target)
    if not self:IsHuman() and GetDistance(Target) > 425 then
      Cast(_R)
    end
    if not self:IsHuman() and self.spearCooldownUntil < os.clock() then
      Cast(_R)
    end
  end

  function Nidalee:Harass()
    if self:IsHuman() and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100 then
      if sReady[_Q] and Config.Harass.Q and GetDistanceSqr(Target) < self.data.Human[0].range^2 then
        Cast(_Q, Target)
      end
    else
      if sReady[_Q] and Config.Harass.Q and GetDistanceSqr(Target) < self:GetAARange()^2 then
        CastSpell(_Q, myHero:Attack(Target))
      end
      if sReady[_E] and Config.Harass.E and GetDistanceSqr(Target) < self.data.Cougar[2].range^2 then
        CastSpell(_E, Target.x, Target.z)
      end
    end
  end

  function Nidalee:LastHit()
    if not self:IsHuman() then
      for _, minion in pairs(Mobs.objects) do
        local health = GetRealHealth(minion)
        if sReady[_Q] and GetDmg(_Q, myHero, minion) >= health and GetDistanceSqr(minion) < self:GetAARange()^2 then
          CastSpell(_Q, myHero:Attack(minion))
          return;
        end
        for _=1,2 do
          if sReady[_] and GetDmg(_, myHero, minion) >= health and GetDistanceSqr(minion) < self.data.Cougar[_].range^2 then
            Cast(_, minion)
            return;
          end
        end
      end
    end
  end

  function Nidalee:LaneClear()
    if self:IsHuman() then
      if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
        local minion = GetClosestMinion(myHero)
        if minion and GetDistanceSqr(minion) < self.data.Human[_Q].range^2 then
          Cast(_Q, minion)
        end
      elseif Config.LaneClear.R then
        Cast(_R)
      end
    end
    if not self:IsHuman() then
      for _, minion in pairs(Mobs.objects) do
        if sReady[_Q] and GetDistanceSqr(minion) < self:GetAARange()^2 then
          CastSpell(_Q, myHero:Attack(minion))
        end
      end
      if sReady[_W] and Config.LaneClear.W then
        local pos, hit = GetFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          CastSpell(_W, pos.x, pos.z)
        end
      end
      if sReady[_E] and Config.LaneClear.E then
        local pos, hit = GetFarmPosition(self.data.Cougar[2].range, self.data.Cougar[2].range)
        if pos and GetDistanceSqr(pos) < 275^2 and hit > 0 then
          CastSpell(_E, pos.x, pos.z)
        end
      end
      if not self:IsHuman() and not sReady[_Q] and not sReady[_E] and self.spearCooldownUntil < os.clock() and Config.LaneClear.R then
        Cast(_R)
      end
    end
  end

  function Nidalee:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and self:IsHuman() and health < self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          Cast(_Q, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
        if sReady[_Q] and not self:IsHuman() and health < self:GetDmg(_Q, enemy, true) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          local pos, chance, ppos = Predict(_Q, myHero, enemy)
          if chance >= 2 then
            Cast(_R)
            DelayAction(function() Cast(_Q, enemy) end, 0.125)
          end
        end
        if not self:IsHuman() and EnemiesAround(enemy, 500) < 3 then
          if sReady[_Q] and health < self:GetDmg(_Q, enemy) and Config.Killsteal.Q and ValidTarget(enemy, self:GetAARange()) then
            Cast(_Q, myHero:Attack(enemy))
          end
          if sReady[_W] and health < self:GetDmg(_W, enemy) and Config.Killsteal.W then 
            if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
              Cast(_W, enemy.pos)
            end
          end
          if sReady[_E] and health < self:GetDmg(_E, enemy) and Config.Killsteal.E and ValidTarget(enemy, self.data.Cougar[2].range) then
            Cast(_E, enemy.pos)
          end
        end
        if sReady[_Q] and EnemiesAround(enemy, 500) < 3 and self:IsHuman() and health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_Q, enemy)
          DelayAction(function() self:DoRWEQCombo(enemy) end, 0.05+self.data.Human[0].delay+GetDistance(enemy)/self.data.Human[0].speed)
        end
        if sReady[_Q] and EnemiesAround(enemy, 500) < 3 and not self:IsHuman() and health < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_R)
        end
        if UnitHaveBuff(enemy, "nidaleepassivehunted") and EnemiesAround(enemy, 500) < 3 and GetDistance(enemy)-self.data.Cougar[1].range*2 < 0 then
          if health < self:GetRWEQComboDmg(enemy,0) then
            self:DoRWEQCombo(enemy)
          end
        end
      end
    end
  end

-- }

  function Olaf:__init()
  end

-- { Orianna

  function Orianna:__init()
    self.Ball = nil
    for k=1,objManager.maxObjects,1 do
      local object = objManager:getObject(k)
      if object and object.valid and object.name and object.team == myHero.team and object.name:lower():find("ball") then
        self.Ball = object
      end
    end
  end

  function Orianna:Load()
    self:Menu()
  end

  function Orianna:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes()+1, 0)
    DelayAction(function() if #GetEnemyHeroes() == 1 then Config.Misc.Re = 2 else Config.Misc.Re = ceil(#GetEnemyHeroes()/2) end end, 1)
  end

  function Orianna:Tick()
    if self.Ball and (GetDistance(self.Ball) <= myHero.boundingRadius*2+7 or GetDistance(self.Ball) > 1250) then
      self.Ball = nil
    end
    if Config.Misc.Ra then
      if Config.Misc.Re <= EnemiesAround(self.Ball or myHero, myHeroSpellData[3].width-myHero.boundingRadius) then
        CastSpell(_R)
      end   
    end
  end

  function Orianna:Draw()
    if self.Ball then
      DrawCircle(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 0x111111)
      for i=0,2 do
        self:LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (pi/4.5)*(i))
      end 
      self:LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
    end
  end

  function Orianna:LagFree(x, y, z, radius, width, color, quality, degree)
    local radius = radius or 300
    local screenMin = WorldToScreen(D3DXVECTOR3(x - radius, y, z + radius))
    if OnScreen({x = screenMin.x + 200, y = screenMin.y + 200}, {x = screenMin.x + 200, y = screenMin.y + 200}) then
      radius = radius*.92
      local quality = quality and 2 * pi / quality or 2 * pi / floor(radius / 10)
      local width = width and width or 1
      local a = WorldToScreen(D3DXVECTOR3(x + radius * cos(degree), y, z - radius * sin(degree)))
      for theta = quality, 2 * pi + quality, quality do
        local b = WorldToScreen(D3DXVECTOR3(x + radius * cos(theta+degree), y, z - radius * sin(theta+degree)))
        DrawLine(a.x, a.y, b.x, b.y, width, color)
        a = b
      end
    end
  end

  function Orianna:CreateObj(obj)
    if obj and obj.name and obj.valid and obj.name == "TheDoomBall" and obj.team == myHero.team then
      self.Ball = Vector(obj)
    end
  end

  function Orianna:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe then
      if spell.name == "OrianaIzunaCommand" then
        self.Ball = nil
      end
      if spell.name == "OrianaRedactCommand" then
        self.Ball = spell.target
      end
    end
  end

  function Orianna:Combo()
    if sReady[_Q] and Config.Combo.Q then
      local CastPosition, HitChance, Pos = Predict(_Q, self.Ball or myHero, Target)
      if HitChance and HitChance >= ScriptologyConfig.Prediction.Combo["pred"..str[_Q].."val"] then
        local tPos = CastPosition + (Vector(CastPosition) - (self.Ball or myHero)):normalized()*(Target.boundingRadius/2)
        CastSpell(_Q, tPos.x, tPos.z)
      end
    end
    if sReady[_W] and not (Config.Combo.WE == 2 and sReady[_E]) and Config.Combo.W then
      self:CastW(Target)
    end
    if sReady[_E] and not (Config.Combo.WE == 1 and sReady[_W]) and Config.Combo.E and self.Ball then
      local ProjPoint,_,OnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, Target)
      if OnSegment then
        if GetDistanceSqr(ProjPoint, Target) < (myHeroSpellData[2].width + GetDistance(Target.minBBox)) ^ 2 then
          CastSpell(_E, myHero)
        end
      end
    end
    if sReady[_R] and GetRealHealth(Target) < self:CalcRComboDmg(Target) and Config.Combo.R then
      self:CastR(Target)
    end
  end

  function Orianna:Harass()
    if sReady[_Q] and Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, self.Ball)
    end
    if sReady[_W] and not (Config.Harass.WE == 2 and sReady[_E]) and Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:CastW(Target)
    end
    if sReady[_E] and not (Config.Harass.WE == 1 and sReady[_W]) and Config.Harass.E and self.Ball and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
      local ProjPoint,_,OnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, Target)
      if OnSegment then
        if GetDistanceSqr(ProjPoint, Target) < (myHeroSpellData[2].width + GetDistance(Target.minBBox)) ^ 2 then
          CastSpell(_E, myHero)
        end
      end
    end
  end

  function Orianna:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_W].width)
      if BestHit > 1 and self.Ball and GetDistance(self.Ball, BestPos) < 50 then 
        CastSpell(_W)
      end
    end
  end

  function Orianna:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, myHeroSpellData[0].range) and GetDistance(winion) < myHeroSpellData[0].range then
          CastSpell(_Q, winion.x, winion.z)
        end
      end
    end
    if sReady[_W] and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmgQ = GetDmg(_Q, myHero, winion)
        local MinionDmgW = GetDmg(_W, myHero, winion)
        if MinionDmgQ and MinionDmgW >= GetRealHealth(winion) and GetDistance(winion, self.Ball or myHero) < myHeroSpellData[1].width * 0.85 then
          CastSpell(_W)
        end
        if sReady[_Q] and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= GetRealHealth(winion) and (self.Ball and GetDistance(winion, self.Ball) < myHeroSpellData[1].width or GetDistance(winion) < myHeroSpellData[1].width) then
          CastSpell(_Q, winion.x, winion.z)
          DelayAction(CastSpell, 0.25, {_W})
        end
      end
    end
  end

  function Orianna:CalcRComboDmg(unit)
    dmg = 0
    if myHero:GetSpellData(_Q).currentCd < 1.5 then
      dmg = dmg + GetDmg(_Q, myHero, unit)
    end
    return GetDmg(_R, myHero, unit)+dmg
  end

  function Orianna:CastW(unit)
    if myHero:CanUseSpell(_W) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local a, b, c = Predict(_W, Ball, unit)
    if a and b >= ScriptologyConfig.Prediction.Combo["pred"..str[_W].."val"] then  
      CastSpell(_W) 
    end  
  end

  function Orianna:CastR(unit)
    if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local a, b, c = Predict(_R, Ball, unit)
    if a and b >= ScriptologyConfig.Prediction.Combo["pred"..str[_R].."val"] then  
      CastSpell(_R) 
    end  
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local Ball = self.Ball or myHero
        local health = GetRealHealth(enemy)
        local projPos, _, isOnSegment = nil, nil, false
        if Ball ~= myHero then
          projPos, _, isOnSegment = VectorPointProjectionOnLineSegment(Ball, myHero, enemy)
        end
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy, Ball)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].width^2 then
          self:CastW(enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and self.Ball and GetDistance(self.Ball) > 150 and isOnSegment and GetDistance(self.Ball,projPos) <= myHeroSpellData[_E].width then
          CastSpell(_E, myHero)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif sReady[_Q] and sReady[_W] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W then
          Cast(_Q, enemy, Ball)
          DelayAction(function()  
            if myHero:CanUseSpell(_Q) ~= READY then
              CastSpell(_W)
            end
          end, GetDistance(Ball,enemy)/myHeroSpellData[0].speed)
        elseif sReady[_Q] and sReady[_W] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E then
          local CastPosition, HitChance, Pos = Predict(_Q, Ball, enemy, ScriptologyConfig.Prediction.Combo)
          if HitChance and HitChance >= ScriptologyConfig.Prediction.Combo["pred"..str[_Q].."val"] then
            local tPos = CastPosition + (Vector(CastPosition) - Ball):normalized()*(enemy.boundingRadius/2)
            CastSpell(_Q, tPos.x, tPos.z)
            DelayAction(function()  
              if myHero:CanUseSpell(_Q) ~= READY then
                CastSpell(_W)
                CastSpell(_E, myHero)
              end
            end, GetDistance(Ball,enemy)/myHeroSpellData[0].speed)
          end
        elseif sReady[_R] and health < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
          Cast(_Q, enemy, Ball)
          DelayAction(function() 
            if myHero:CanUseSpell(_Q) ~= READY then
              CastSpell(_R) 
              DelayAction(function() CastSpell(_W) end, myHeroSpellData[3].delay)
            end
          end, GetDistance(Ball,enemy)/myHeroSpellData[0].speed)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

  function Quinn:__init()
  end

  function RekSai:__init()
  end

-- { Rengar

  function Rengar:__init()
  end

  function Rengar:Load()
    self:Menu()
    self.lastEmpChange = 0
  end

  function Rengar:Menu()
    targetSel._dmgType = DAMAGE_PHYSICAL
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Combo:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
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
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("Empower", "Empower", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    Config.Misc:addParam("Empower2", "Active Empower: ", SCRIPT_PARAM_LIST, 1, {"Q", "W", "E"})
    Config.Misc:setCallback("Empower", function(var) 
      if var then 
        local os = Config.Misc.Empower2
        Config.Misc.Empower2 = Config.Misc.Empower2 + 1
        if Config.Misc.Empower2 == 4 then Config.Misc.Empower2 = 1 end
        if os ~= Config.Misc.Empower2 then
          PrintAlert("Switched Empoweredmode! Now using: "..str[Config.Misc.Empower2-1], 0.25, 0xff, 0x00, 0x00)
        end
        Config.Misc.Empower = false
      else 
      end 
    end)
    DelayAction(function() Config.Misc.Empower = false end, 0.07)
  end

  function Rengar:Tick()
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    self.doQ = (myHero.mana == 5 and (Config.Misc.Empower2 == 1 and self.doQ) or self.doQ)
  end

  function Rengar:Animation(unit, ani)
    if unit and unit.isMe and ani then
      if ani == "Spell5" and (Config.kConfig.Combo or Config.kConfig.Harass) then
        if Target and Smite ~= nil and Config.Combo.S and Config.kConfig.Combo then CastSpell(Smite, Target) end
        if Target and Ignite ~= nil and Config.Combo.I and Config.kConfig.Combo then CastSpell(Ignite, Target) end
        if Target then DelayAction(function() self:CastHydra() end, 0.125 - GetLatency() / 2000) end
        if Target then DelayAction(function() self:CastYomuus() end, 0.125 - GetLatency() / 2000) end
        if Target then 
          cwhile(function() 
            return Target and not Target.dead and Target.visible and Target.bTargetable and GetDistanceSqr(Target) < 1337^2
          end, function()
            if myHero.mana == 5 then
              if Config.Misc.Empower2 == 1 then
                CastSpell(_Q)
              elseif Config.Misc.Empower2 == 2 then
                if GetDistance(Target) < myHeroSpellData[1].width then
                  CastSpell(_W)
                end
              elseif Config.Misc.Empower2 == 3 then
                CastSpell(_E, Target.x, Target.z)
              end
            else
              if qReady then
                CastSpell(_Q)
              elseif wReady then
                CastSpell(_W)
              elseif eReady then
                CastSpell(_E, Target.x, Target.z)
              end
            end
          end)
        end
      end
    end
  end

  --[[function Rengar:LeapCombo()
    local qReady, wReady, eReady = (myHero:CanUseSpell(_Q) == READY), (myHero:CanUseSpell(_W) == READY), (myHero:CanUseSpell(_E) == READY)
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        Cast(_Q)
      elseif Config.Misc.Empower2 == 2 then
        if GetDistance(Target) < myHeroSpellData[1].width then
          CastSpell(_W)
        end
      elseif Config.Misc.Empower2 == 3 then
        CastSpell(_E, Target.x, Target.z)
      end
    else
      if qReady then
        Cast(_Q)
      elseif wReady then
        CastSpell(_W)
      elseif eReady then
        CastSpell(_E, Target.x, Target.z)
      end
    end
    if Target and not Target.dead and Target.visible and (qReady or wReady or eReady) then
      DelayAction(function() self:LeapCombo() end, 0.07)
    end
  end]]--

  function Rengar:CastHydra()
    for slot = ITEM_1, ITEM_6 do
      if myHero:GetSpellData(slot).name:lower():find("tiamat") and myHero:CanUseSpell(slot) == READY then
        CastSpell(slot) 
      end
    end
  end

  function Rengar:CastYomuus()
    for slot = ITEM_1, ITEM_6 do
      if myHero:GetSpellData(slot).name:lower():find("youmusblade") and myHero:CanUseSpell(slot) == READY then
        CastSpell(slot) 
      end
    end
  end

  function Rengar:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doQ then
        DelayAction(function() CastSpell(_Q) end, spell.windUpTime + GetLatency() / 2000)
      end
    end
  end

  function Rengar:Combo()
    if UnitHaveBuff(myHero, "rengarpassivebuff") then 
      if IsWallOfGrass(D3DXVECTOR3(myHero.x, myHero.y, myHero.z)) and not IsWallOfGrass(D3DXVECTOR3(Target.x,Target.y,Target.z)) then
        return 
      elseif TargetHaveBuff("RengarR", myHero) then
        return 
      end
    end
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
      elseif Config.Misc.Empower2 == 2 then
      if GetDistance(Target) < myHeroSpellData[1].width then
        CastSpell(_W)
      end
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, Target)
      end
    else
      if Config.Combo.W and sReady[_W] and GetDistance(Target) < myHeroSpellData[1].width*0.85 then
        CastSpell(_W)
      end
      if Config.Combo.E and sReady[_E] then
        Cast(_E, Target)
      end
    end
  end

  function Rengar:Harass()
    if UnitHaveBuff(myHero, "rengarpassivebuff") then 
      if IsWallOfGrass(D3DXVECTOR3(myHero.x, myHero.y, myHero.z)) and not IsWallOfGrass(D3DXVECTOR3(Target.x,Target.y,Target.z)) then
        return 
      elseif TargetHaveBuff("RengarR", myHero) then
        return 
      end
    end
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        CastSpell(_Q)
      elseif Config.Misc.Empower2 == 2 then
      if GetDistance(Target) < myHeroSpellData[1].range then
        CastSpell(_W)
      end
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, Target)
      end
    else
      if Config.Combo.W and sReady[_W] and GetDistance(Target) < myHeroSpellData[1].range then
        CastSpell(_W)
      end
      if Config.Combo.E and sReady[_E] then
        Cast(_E, Target)
      end
    end
  end

  function Rengar:LastHit()
    if (Config.kConfig.LaneClear and ((Config.LaneClear.W and sReady[_W]) or (Config.LaneClear.E and sReady[_E]))) or (Config.kConfig.LastHit and ((Config.LastHit.W and sReady[_W]) or (Config.LastHit.E and sReady[_E]))) then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.visible and minion.bTargetable then
          local health = GetRealHealth(minion)
          if ((Config.kConfig.LaneClear and (Config.LaneClear.W and sReady[_W])) or (Config.kConfig.LastHit and (Config.LastHit.W and sReady[_W]))) and health < GetDmg(_W, myHero, minion) then
            Cast(_W)
          end
          if ((Config.kConfig.LaneClear and (Config.LaneClear.E and sReady[_E])) or (Config.kConfig.LastHit and (Config.LastHit.E and sReady[_E]))) and health < GetDmg(_E, myHero, minion) then
            Cast(_E, minion)
          end
        end
      end
    end
  end

  function Rengar:LaneClear()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) < 0.45 then
      Cast(_W)
    else
      if (Config.LaneClear.W and sReady[_W]) then
        local pos, hit = GetFarmPosition(myHero.range+myHero.boundingRadius*2, myHeroSpellData[1].width)
        if hit and hit > 0 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if (Config.LaneClear.E and sReady[_E]) then
        local minion = GetClosestMinion(myHero)
        if minion and not minion.dead and minion.visible and minion.bTargetable then
          CastSpell(_E, minion.x, minion.z)
        end
      end
    end
  end

  function Rengar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < (myHero.range+GetDistance(myHero.minBBox))^2 then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          CastSpell(_W)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistanceSqr(enemy) < 600^2 then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and health < (20+8*myHero.level) and Config.Killsteal.S and GetDistanceSqr(enemy) < 550^2 then
          CastSpell(Smite, enemy)
        end
      end
    end
  end

-- }

-- { Riven

  function Riven:__init()
    self:LoadOrb()
    self.QCast = 0
    self.doQ = false
    self.doW = false
    self.doR = false
  end

  function Riven:LoadOrb()
    if _G.NebelwolfisOrbWalkerInit then
      ScriptologyConfig:addSubMenu("Orbwalker", "Orbwalker")
      isNOW = true
      --NOW = NebelwolfisOrbWalker(ScriptologyConfig.Orbwalker)
    else
      if FileExist(LIB_PATH.."Nebelwolfi's Orb Walker.lua") then
        require "Nebelwolfi's Orb Walker"
        self:LoadOrb()
      else
        CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Nebelwolfi%27s%20Orb%20Walker.lua?rand="..random(1,10000), LIB_PATH.."Nebelwolfi's Orb Walker.lua", function() self:LoadOrb() end, function() end, function() end, function() self:LoadOrb() end)
      end
    end
  end

  function Riven:Load()
    self:Menu()
    targetSel._dmgType = DAMAGE_PHYSICAL
  end

  function Riven:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Rm", "Use R mode", SCRIPT_PARAM_LIST, 2, { "Never", "On hard kill", "Smart", "Always" })
    Config.Combo:addParam("Rf", "Force R", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("info", "^Increase if one AA is missing during QAA^", SCRIPT_PARAM_INFO, "")
    Config.Misc:addDynamicParam("Wa", "Auto stun with W", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Wae", "Auto stun if X enemies", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
    Config.Misc:addDynamicParam("Jump", "Wall Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
    AddGapcloseCallback(_W, myHeroSpellData[1].range, false, Config.Misc)
  end

  function Riven:Draw()
    if Config.Combo.Rf then
      local pos = WorldToScreen(myHero.pos)
      for i=-1,1 do
        for j=-1,1 do
          DrawText("Force R on!", 25, pos.x+i-45, pos.y+j, 0xFF000000)
        end
      end
      DrawText("Force R on!", 25, pos.x-45, pos.y, 0xFFFF0000)
    end
  end

  function Riven:Tick()
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    self.doW = (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harass and Config.Harass.W) or (Config.kConfig.LaneClear and Config.LaneClear.W)
    self.doR = Config.kConfig.Combo and (Config.Combo.Rm > 1 or Config.Combo.Rf)
    if Config.Misc.Flee then
      myHero:MoveTo(mousePos.x, mousePos.z)
      if sReady[_E] then
        Cast(_E, mousePos)
      end
      if not sReady[_E] and sReady[_Q] and self.EDelay + 350 < GetTickCount() then
        Cast(_Q, mousePos)
      end
    end
    if Config.Misc.Jump then
      self.jumpPos = myHero + (Vector(mousePos) - myHero):normalized() * 50
      self.movePos = myHero + (Vector(mousePos) - myHero):normalized() * 225
      if self.QCast < 2 then
        Cast(_Q, myHero.pos)
      end
      if not IsWall(D3DXVECTOR3(self.jumpPos.x,self.jumpPos.y,self.jumpPos.z)) then
        myHero:MoveTo(self.movePos.x, self.movePos.z)
      else
        if sReady[_Q] then
          Cast(_Q, mousePos)
        end
      end
    end
    for _,k in pairs(GetEnemyHeroes()) do
      if sReady[_W] and ValidTarget(k, myHeroSpellData[_W].range) and (Config.Misc.Wae <= EnemiesAround(k, myHeroSpellData[_W].range)) then
        Cast(_W)
      end
    end
    if Config.Combo.Rf and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then
      Config.Combo.Rf = false
    end
    if not (Config.kConfig.Combo or Config.kConfig.Harass or Config.kConfig.LastHit or Config.kConfig.LaneClear) then
      _G.NebelwolfisOrbWalker:SetOrb(true)
    end
  end

  function Riven:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name then
      local target = self:GetTarget()
      local windUp = 1/_G.NebelwolfisOrbWalker:GetWindUp()
      if spell.name:lower():find("attack") then
        DelayAction(function() 
          if Config.kConfig.Combo then
            if Config.Combo.Rf and myHero:CanUseSpell(_R) == READY and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
              if target and not target.dead and target.visible then
                CastSpell(_R)
              end
            elseif myHero:CanUseSpell(_R) == READY and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" and target and self.QCast < 3 and GetDmg(_R, myHero, target)+GetDmg(_Q, myHero, target)+self:DmgP(target, myHero.totalDamage)+GetDmg("AD", myHero, target) >= target.health then  
              if target and not target.dead and target.visible then
                Cast(_R, target)
              end
            end
          end
          if self.doQ and myHero:CanUseSpell(_Q) == READY then
            if target and not target.dead and target.visible then
              CastSpell(_Q, target.x, target.z)
            end
            return;
          end
          if self.doW and myHero:CanUseSpell(_W) == READY then 
            if target and not target.dead and target.visible then
              CastSpell(_W) 
            end
          end
        end, windUp + GetLatency() / 2000)
      elseif spell.name == "RivenMartyr" then
        DelayAction(function() 
          if Config.Combo.Rf and myHero:CanUseSpell(_R) == READY and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then
            if target and not target.dead and target.visible then
              CastSpell(_R)
            end
          end
        end, windUp + GetLatency() / 2000)
        _G.NebelwolfisOrbWalker.orbTable.lastAA = 0
      elseif spell.name == "RivenTriCleave" then
        self.QDelay = os.clock()
      elseif spell.name == "RivenFeint" then
        self.EDelay = GetTickCount()
        if target and Config.kConfig.Combo and myHero:CanUseSpell(_R) == READY and Config.Combo.Rm > 1 and (EnemiesAround(target, 450) > 1 or Config.Combo.Rm == 4 or self:CalcComboDmg(target, 0) * (Config.Combo.Rm == 2 and 1.67 or 1) >= GetRealHealth(target)) and (Config.Combo.Rm ~= 3 or self:CalcComboDmg(target, 0, true)*0.67 <= GetRealHealth(target)) and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
          CastSpell(_R)
          DelayAction(function() 
            if target and not target.dead and target.visible and GetDistance(target) < myHeroSpellData[0].range then
              CastSpell(_Q, target.x, target.z)
            end
          end, 0.137)
        end
      elseif spell.name == "RivenFengShuiEngine" then
        _G.NebelwolfisOrbWalker.orbTable.lastAA = 0
        DelayAction(function() 
          if target and not target.dead and target.visible and GetDistanceSqr(target) < myHeroSpellData[_Q].range^2 and self.doQ and myHero:CanUseSpell(_Q) == READY then
            CastSpell(_Q, target.x, target.z)
          end
        end, windUp + GetLatency() / 2000)
      elseif spell.name == "rivenizunablade" then
        _G.NebelwolfisOrbWalker.orbTable.lastAA = 0
        DelayAction(function() 
          if target and not target.dead and target.visible and GetDistanceSqr(target) < myHeroSpellData[_Q].range^2 and self.doQ and myHero:CanUseSpell(_Q) == READY then
            CastSpell(_Q, target.x, target.z)
          end
        end, windUp + GetLatency() / 2000)
      elseif spell.name == "ItemTiamatCleave" then
        _G.NebelwolfisOrbWalker.orbTable.lastAA = 0
        DelayAction(function()
          if target and not target.dead and target.visible and GetDistanceSqr(target) < myHeroSpellData[_Q].range^2 and self.doQ and myHero:CanUseSpell(_Q) == READY then
            CastSpell(_Q, target.x, target.z)
          end
        end, windUp + GetLatency() / 2000)
      end
    end
  end

  function Riven:GetTarget()
    if Config.kConfig.Combo or Config.kConfig.Harass then
      return Target
    elseif Config.kConfig.LaneClear then
      return GetClosestMinion(myHero)
    end
    return nil
  end

  function Riven:Animation(unit, ani)
    if unit and unit.isMe and ani then
      if (ani == "Spell1a" or ani == "Spell1b" or ani == "Spell1c") and self.doQ then
        self.QCast = ani:find("a") and 1 or ani:find("b") and 2 or ani:find("c") and 3 or nil
        DelayAction(function() if myHero:CanUseSpell(_Q) ~= READY then self.QCast = 0 end end, 4)
        DelayAction(function() 
          if VIP_USER and myHero.level >= 5 then
            self.CastDance() 
          else
            myHero:MoveTo(mousePos.x, mousePos.z)
          end
          _G.NebelwolfisOrbWalker.orbTable.lastAA = 0
        end, (ani:find("c") and 0.475 or 0.34))
      elseif ani == "Spell2" then
      elseif ani == "Spell3" then
      elseif ani == "Spell4a" then
      elseif ani == "Spell4b" then
      end
    end
  end

  function Riven:CastDance()
    local p = CLoLPacket(0x003B)
    p.vTable = 0xE432B0
    p:EncodeF(myHero.networkID)
    p:Encode1(0x7D)
    p:Encode2(0x2807)
    p:Encode2(0xA5EF)
    SendPacket(p)
  end

  function Riven:CalculateDamage()
    if not Config.Draws.DMG then return end
    for i, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
      self:CalcComboDmg(enemy, 0, (Config.Combo.Rm == 1), false, true)
      end
    end
  end

  function Riven:CalcComboDmg(target, damage, disableUlt, ignoreCd, insert)
    local unit = {pos = target.pos, armor = target.armor, magicArmor = target.magicArmor, maxHealth = target.maxHealth, health = target.health}
    local dmg = damage or 0
    local ad = myHero.totalDamage*((disableUlt and (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine")) and 1 or 1.2)
    local me = {ap = myHero.ap, level = myHero.level, totalDamage = ad, armorPen = myHero.armorPen, armorPenPercent = myHero.armorPenPercent, magicPen = myHero.magicPen, magicPenPercent = myHero.magicPenPercent, addDamage = myHero.addDamage}
    local damageQ, damageW, damageE, damageR = 0, 0, 0, 0
    if ignoreCd or (self.QCast > 0 and self.QCast < 3) or (self.QCast == 0 and myHero:CanUseSpell(_Q) == READY) then
      local d = GetDmg(_Q,me,unit)*(3-self.QCast)+GetDmg("Tiamat",me,unit)+GetDmg("AD",me,unit)*(3-self.QCast)+self:DmgP(target, ad)*(3-self.QCast)
      damageQ = d
      dmg = dmg + d
    end
    if ignoreCd or myHero:CanUseSpell(_W) == READY then
      local d = GetDmg(_W,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
      damageW = d
      dmg = dmg + d
    end
    if Ignite and myHero:CanUseSpell(Ignite) == READY then
      dmg = dmg + GetDmg("IGNITE", myHero, unit)
    end
    if ignoreCd or (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine") and not disableUlt then
      unit.health = unit.health-dmg
      local d = GetDmg(_R,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
      damageR = d
      dmg = dmg + d
    end
    if insert then
      killTable[target.networkID] = {damageQ, damageW, damageE, damageR}
    end
    return dmg
  end

  function Riven:DmgP(unit, ad)
    return myHero:CalcDamage(unit, 5+max(5*floor((myHero.level+2)/3)+10,10*floor((myHero.level+2)/3)-15)*ad/100)
  end

  function Riven:Combo()
    if GetDistance(Target) > _G.NebelwolfisOrbWalker.myRange + 30 and sReady[_E] and Config.Combo.E and GetDistance(Target) < myHeroSpellData[2].range then
      if Target and Config.kConfig.Combo and myHero:CanUseSpell(_R) == READY and Config.Combo.Rm > 1 and (EnemiesAround(Target, 450) > 1 or Config.Combo.Rm == 4 or self:CalcComboDmg(Target, 0) * (Config.Combo.Rm == 2 and 1.67 or 1) >= GetRealHealth(Target)) and (Config.Combo.Rm ~= 3 or self:CalcComboDmg(Target, 0, true)*0.67 <= GetRealHealth(Target)) and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
        CastSpell(_E, Target.x, Target.z)
        DelayAction(function() CastSpell(_R) end, 0.075) 
      else
        CastSpell(_E, Target.x, Target.z)
        DelayAction(function() CastSpell(_W) end, 0.075) 
      end
    end
    --if Config.Combo.Rm > 1 and (GetDmg(_R,myHero,Target)+GetDmg(_Q,myHero,Target)+GetDmg("AD",myHero,Target)+self:DmgP(Target,myHero.totalDamage*1.2) >= GetRealHealth(Target)) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, Target.pos) end
    if Config.Combo.Rm > 1 and GetDmg(_R,myHero,Target) >= GetRealHealth(Target) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, Target) end
  end

  function Riven:LaneClear()
    local minion = GetClosestMinion(myHero)
    if minion and not minion.dead and minion.visible and minion.bTargetable then
      if GetDistanceSqr(minion) > (myHero.range+GetDistance(myHero.minBBox))^2 then
        CastSpell(_E, minion.x, minion.z)
      end
    end
  end

  function Riven:LastHit()
    for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        if Config.LastHit.Q and sReady[_Q] and minion.health <= GetDmg(_Q, myHero, minion) and GetDistanceSqr(minion) < myHeroSpellData[_Q].range^2 then
          CastSpell(_Q, minion.x, minion.z)
        end
        if Config.LastHit.W and sReady[_W] and minion.health <= GetDmg(_W, myHero, minion) and GetDistanceSqr(minion) < myHeroSpellData[_W].range^2 then
          CastSpell(_W)
        end
      end
    end
  end

-- }

-- { Rumble

  function Rumble:__init()
  end

  function Rumble:Load()
    self:Menu()
  end

  function Rumble:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addParam("Ra", "Auto R", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Rae", "Auto R if X enemies", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
  end

  function Rumble:Tick()
    if Config.Misc.Wa and not IsRecalling(myHero) and myHero.mana < 40 then
      CastSpell(_W)
    end
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      if enemies >= Config.Misc.Rae then
        local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
        if CastPosition and HitChance >= 2 then
          CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
        end
      end
    end
    if Config.Misc.Ra then
      local enemies = EnemiesAround(Target, 250)
      local allies = AlliesAround(myHero, 500)
      if enemies >= Config.Misc.Rae-1 and allies >= Config.Misc.Rae-1 then
        local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
        if CastPosition and HitChance >= 2 then
          CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
        end
      end
    end
  end

  function Rumble:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, myHeroSpellData[0].range) and GetDistance(winion) < myHeroSpellData[0].range then
          Cast(_Q, winion)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= winion.health and ValidTarget(winion, myHeroSpellData[2].range) and GetDistance(winion) < myHeroSpellData[2].range then
          Cast(_E, winion)
        end
      end
    end
  end

  function Rumble:LaneClear()
    if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
      BestPos, BestHit = GetFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestHit > 1 then 
        Cast(_Q, BestPos)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E then
      local minionTarget = GetClosestMinion(myHero)
      if minionTarget ~= nil then
        Cast(_E, winion)
      end
    end
  end

  function Rumble:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, myHeroSpellData[0].range) then
      Cast(_Q, Target)
    end
    if Config.Combo.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, myHeroSpellData[2].range) then
      Cast(_E, Target)
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 500) > 2)) and ValidTarget(Target, myHeroSpellData[3].range) then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
      if CastPosition and HitChance >= 2 then
        CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
      end
    end
  end

  function Rumble:Harass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harass.Q and ValidTarget(Target, myHeroSpellData[0].range) then
      Cast(_Q, Target)
    end
    if Config.Harass.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Harass.E and ValidTarget(Target, myHeroSpellData[2].range) then
      Cast(_E, Target)
    end
  end

  function Rumble:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) then
          local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
          if CastPosition and HitChance >= 2 then
            CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
          end
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Ryze

  function Ryze:__init()
    self.passiveTracker = 0
  end

  function Ryze:Load()
    self:Menu()
    targetSel._range = 900
  end

  function Ryze:Draw()
    if self.passiveTracker then
      local pos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
      local str = self.passiveTracker < 5 and ""..self.passiveTracker or "COMBO!"
      for i = -1, 1 do
        for j = -1, 1 do
          DrawText(str, 35, pos.x - 15 + i - GetTextArea(str, 35).x/2, pos.y + 40 + j, ARGB(255, 0, 0, 0)) 
        end
      end
      DrawText(str, 35, pos.x - 15 - GetTextArea(str, 35).x/2, pos.y + 40, ARGB(255, 255, 0, 0)) 
    end
  end

  function Ryze:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Rs", "Force start Combo with R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    --[[Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end]]
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaR", "Mana R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    AddGapcloseCallback(_W, myHeroSpellData[1].range, true, Config.Misc)
  end

  function Ryze:ApplyBuff(unit, buff) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 1 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:UpdateBuff(unit, buff, stacks) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = stacks end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 5 end 
  end 

  function Ryze:RemoveBuff(unit, buff) 
    if unit == nil or not unit.isMe or buff == nil then return end 
    if buff.name == "ryzepassivestack" then self.passiveTracker = 0 end 
    if buff.name == "ryzepassivecharged" then self.passiveTracker = 0 end 
  end

  function Ryze:Combo()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 900) then
        local ready = 0
        for _=0, 3 do
          ready = ready + (sReady[_] and 1 or 0)
        end
        if self.passiveTracker + ready < 5 then
          if sReady[_Q] and Config.Combo.Q then
            Cast(_Q, enemy)
          end
          if sReady[_W] and Config.Combo.W and GetDistanceSqr(enemy) < myHeroSpellData[_W].range^2 then
            CastSpell(_W, enemy)
          end
          if sReady[_E] and Config.Combo.E and GetDistanceSqr(enemy) < myHeroSpellData[_E].range^2 then
            CastSpell(_E, enemy)
          end
        elseif self.passiveTracker >= 4 and (not sReady[_Q] or not Config.Combo.Q) and sReady[_R] and Config.Combo.R and Config.Combo.Rs then
          Cast(_R)
          return;
        else
          for _=0, 3 do
            if myHero:CanUseSpell(_) == READY and Config.Combo[str[_]] and GetDistanceSqr(enemy) < myHeroSpellData[_].range^2 then
              local tempPred = ScriptologyConfig.Prediction.Combo.Q
              ScriptologyConfig.Prediction.Combo.Q = 0
              Cast(_, enemy)
              ScriptologyConfig.Prediction.Combo.Q = tempPred
              break;
            end
          end
        end
      end
    end
  end

  function Ryze:Harass()
    local ready = 0
    for _=0, 3 do
      ready = ready + (sReady[_] and 1 or 0)
    end
    if self.passiveTracker + ready < 5 then
      if sReady[_Q] and Config.Harass.Q then
        Cast(_Q, Target)
      end
      if sReady[_W] and Config.Harass.W and GetDistanceSqr(Target) < myHeroSpellData[_W].range^2 then
        CastSpell(_W, Target)
      end
      if sReady[_E] and Config.Harass.E and GetDistanceSqr(Target) < myHeroSpellData[_E].range^2 then
        CastSpell(_E, Target)
      end
    else
      for _=0, 2 do
        if sReady[_] and Config.Harass[str[_]] and GetDistanceSqr(Target) < myHeroSpellData[_].range^2 then
          Cast(_, Target)
          break;
        end
      end
    end
  end

  function Ryze:LaneClear()
    local ready = 0
    for _=0, 3 do
      ready = ready + (sReady[_] and 1 or 0)
    end
    for _, target in pairs(Mobs.objects) do
      if target and not target.dead and target.visible then
        if self.passiveTracker + ready < 5 then
          if sReady[_Q] and Config.LaneClear.Q then
            Cast(_Q, target)
          end
          if sReady[_W] and Config.LaneClear.W and GetDistanceSqr(target) < myHeroSpellData[_W].range^2 then
            CastSpell(_W, target)
          end
          if sReady[_E] and Config.LaneClear.E and GetDistanceSqr(target) < myHeroSpellData[_E].range^2 then
            CastSpell(_E, target)
          end
        else
          for _=0, 3 do
            if sReady[_] and Config.LaneClear[str[_]] and Config.LaneClear["mana"..str[_]] < myHero.mana/myHero.maxMana*100 and GetDistanceSqr(target) < myHeroSpellData[_].range^2 then
              Cast(_, target)
              break;
            end
          end
        end
      end
    end
  end

  function Ryze:LastHit()
    for i, minion in pairs(Mobs.objects) do 
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        local health = GetRealHealth(minion) 
        for _=0,3 do
          if sReady[_] and GetDmg(_, myHero, minion) >= health and GetDistanceSqr(minion) < myHeroSpellData[_].range^2 and ((Config.kConfig.LastHit and Config.LastHit[str[_]] and Config.LastHit["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear[str[_]] and Config.LaneClear["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana)) then
          Cast(_, minion)
          return;
          end
        end
      end
    end
  end

-- }

  function Shen:__init()
  end

  function Shyvana:__init()
  end

  function Syndra:__init()
  end

-- { Talon

  function Talon:__init()
    self.doQ = false
  end

  function Talon:Load()
    self:Menu()
  end

  function Talon:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Talon:Tick()
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ/100 < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ/100 < myHero.mana/myHero.maxMana)
  end

  function Talon:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") then
        if self.doQ and sReady[_Q] then
          DelayAction(function() CastSpell(_Q) end, spell.windUpTime + GetLatency() / 2000)
        end
      end
    end
  end

  function Talon:LastHit()
    if sReady[_W] and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.visible and GetDmg(_W, myHero, minion) >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[1].range^2 then
          CastSpell(_W, minion.x, minion.z)
        end
      end
    end
  end

  function Talon:LaneClear()
    if sReady[_W] and Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      pos, hit = GetFarmPosition(myHeroSpellData[1].range, myHeroSpellData[1].width)
      if pos and hit > 0 then
        CastSpell(_W, pos.x, pos.z)
      end
    end
  end

  function Talon:Combo()
    if sReady[_E] and Config.Combo.E and GetDistanceSqr(Target) < myHeroSpellData[2].range^2 then
      CastSpell(_E, Target)
    end
    if sReady[_W] and (not sReady[_E] or not Config.Combo.E) and Config.Combo.W and GetDistanceSqr(Target) < myHeroSpellData[1].range^2 then
      Cast(_W, Target)
    end
    if (not sReady[_E] or not Config.Combo.E) and sReady[_R] and Config.Combo.R and GetDistanceSqr(Target) < myHeroSpellData[3].width^2 and GetRealHealth(Target) < GetDmg(_Q, myHero, Target)+GetDmg(_W, myHero, Target)+GetDmg("AD", myHero, Target)+GetDmg(_R, myHero, Target) then
      Cast(_R, Target)
    end
  end

  function Talon:Harass()
    if sReady[_W] and (not sReady[_E] or not Config.Harass.E) and Config.Harass.W and GetDistanceSqr(Target) < myHeroSpellData[1].range^2 and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target)
    end
  end

  function Talon:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
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
        if dmg >= GetRealHealth(enemy) and EnemiesAround(enemy,750) < 3 then
          if Config.Killsteal.Q and myHero:GetSpellData(_Q).currentCd == 0 and GetDistance(enemy) < myHeroSpellData[2].range then
          if GetDistance(enemy) < myHeroSpellData[0].range then CastSpell(_Q, myHero:Attack(enemy)) end
          if Config.Killsteal.E and sReady[_E] then
            DelayAction(CastSpell, 0.25, {_E, enemy})
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy) end, 0.5)
              if (Config.Killsteal.R and myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.75)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] then
            DelayAction(function() Cast(_W, enemy) end, 0.25)
            if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
              DelayAction(function() Cast(_R) end, 0.5)
            end
          end
          elseif Config.Killsteal.E and sReady[_E] and GetDistance(enemy) < myHeroSpellData[2].range then
            CastSpell(_E, enemy)
            if Config.Killsteal.W and sReady[_W] then
              DelayAction(function() Cast(_W, enemy) end, 0.25)
              if Config.Killsteal.R and (myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0) then
                DelayAction(function() Cast(_R) end, 0.5)
              end
            end
          elseif Config.Killsteal.W and sReady[_W] and GetDistance(enemy) < myHeroSpellData[1].range then
            Cast(_W, enemy)
            if Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
              DelayAction(function() Cast(_R) end, 0.25)
            end
          elseif GetDistance(enemy) < myHeroSpellData[3].width and Config.Killsteal.R and (sReady[_R] or myHero:GetSpellData(_R).name == "talonshadowassaulttoggle") then
            Cast(_R)
          end
        end
      end
    end
  end

-- }

-- { Teemo

  function Teemo:__init()
    self.doQ = false
    self.lastR = 0
  end

  function Teemo:Load()
    self:Menu()
  end

  function Teemo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Combo:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaR", "Mana R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  end

  function Teemo:Tick()
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ/100 < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ/100 < myHero.mana/myHero.maxMana)
    myHeroSpellData[_R].range = 300*myHero:GetSpellData(_R).level
  end

  function Teemo:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") then
        if self.doQ and sReady[_Q] then
          local target = spell.target
          DelayAction(function() CastSpell(_Q, target) end, spell.windUpTime + GetLatency() / 2000)
        end
      end
    end
  end

  function Teemo:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for _, minion in pairs(Mobs.objects) do
        if minion and not minion.dead and minion.visible and GetDmg(_Q, myHero, winion) >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[0].range^2 then
          CastSpell(_Q, minion)
        end
      end
    end
  end

  function Teemo:Combo()
    if Config.Combo.I and Ignite and myHero:CanUseSpell(Ignite) == READY and GetDistanceSqr(Target) < 600^2 and GetRealHealth(Target) < (50+20*myHero.level+GetDmg("AD",myHero,Target)*5*myHero.attackSpeed) then
      CastSpell(Ignite, Target)
    end
    if Config.Combo.R and GetDistanceSqr(Target) < myHeroSpellData[_R].range^2 and self.lastR < os.clock() then
      Cast(_R, Target)
      self.lastR = os.clock() + 2
    end
  end

  function Teemo:Harass()
    if Config.Harass.R and GetDistanceSqr(Target) < myHeroSpellData[_R].range^2 and Config.Harass.manaR <= 100*myHero.mana/myHero.maxMana then
      Cast(_R, Target)
      self.lastR = os.clock() + 2
    end
  end

  function Teemo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[_Q].range^2 then
          CastSpell(_Q, enemy)
        elseif health < GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < (myHero.range+GetDistance(myHero.minBBox))^2 then
          myHero:Attack(enemy)
        elseif sReady[_Q] and health < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy) and Config.Killsteal.E and Config.Killsteal.Q and GetDistanceSqr(enemy) < (myHero.range+GetDistance(myHero.minBBox))^2 then
          myHero:Attack(enemy)
          DelayAction(CastSpell, 0.25, {_Q, enemy})
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and GetDistanceSqr(enemy) < (600)^2 then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

  function Thresh:__init()
  end

-- { Tristana

  function Tristana:__init()
  end

  function Tristana:Load()
    self:Menu()
  end

  function Tristana:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function Tristana:Tick()
    myHeroSpellData[_Q].range = 543 + 7 * myHero.level + myHero.boundingRadius
    myHeroSpellData[_E].range = 543 + 7 * myHero.level + myHero.boundingRadius
    myHeroSpellData[_R].range = 543 + 7 * myHero.level + myHero.boundingRadius
    if Config.Misc.Flee then
      self:Flee()
    end
  end

  function Tristana:Flee()
    myHero:MoveTo(mousePos.x, mousePos.z)
    local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 900
    Cast(_W, movePos)
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable and GetDistanceSqr(enemy) < myHeroSpellData[_R].range^2 then
        Cast(_R, enemy)
      end
    end
  end

  function Tristana:Killsteal()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        local lDmg = (UnitHaveBuff(myHero, "itemmagicshankcharge") and myHero:CalcMagicDamage(enemy, 100+0.1*myHero.ap) or 0)
        --print(GetDmg(_W, myHero, enemy) + lDmg)
        if health < GetDmg(_E, myHero, enemy) and sReady[_E] and Config.Killsteal.E then
          Cast(_E, enemy)
        elseif health < GetDmg(_W, myHero, enemy) + lDmg and sReady[_W] and Config.Killsteal.W then
          self:JumpBack(enemy, Vector(myHero), os.clock())
          Cast(_W, enemy)
        elseif health < GetDmg(_W, myHero, enemy) + GetDmg(_E, myHero, enemy) + lDmg and sReady[_W] and Config.Killsteal.W then
          self:JumpBack(enemy, Vector(myHero), os.clock())
          Cast(_W, enemy)
          Cast(_E, enemy)
        elseif health < GetDmg(_R, myHero, enemy) + lDmg and sReady[_R] and Config.Killsteal.R then
          Cast(_R, enemy)
        elseif health < GetDmg(_W, myHero, enemy) + GetDmg(_R, myHero, enemy) + lDmg and sReady[_W] and sReady[_R] and Config.Killsteal.W and Config.Killsteal.R then
          self:JumpBack(enemy, Vector(myHero), os.clock())
          Cast(_W, enemy)
          Cast(_R, enemy)
        end
      end
    end
  end

  function Tristana:JumpBack(t, pos, time)
    if time + 2.5 < os.clock() then return end
    if t.dead then
      if myHero:CanUseSpell(_W) == READY then
        for i = 0.05, 0.5, 0.05 do
          DelayAction(function() CastSpell(_W, pos.x, pos.z) end, i)
        end
      else
        DelayAction(function() self:JumpBack(t, pos, time) end, 0.07)
      end
    else
      DelayAction(function() self:JumpBack(t, pos, time) end, 0.07)
    end
  end

-- }

-- { Vayne

  function Vayne:__init()
  end

  function Vayne:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    self:Menu()
    self.roll = false
    if not UPLloaded then 
      require("VPrediction") 
      VP = VPrediction() 
    else 
      VP = UPL.VP 
    end
    if not UPLloaded and not _G.HP then 
      require("HPrediction") 
      self.HP = HPrediction() 
      _G.HP = self.HP 
    else 
      if UPLloaded then
        self.HP = UPL.HP 
      elseif _G.HP then
        self.HP = _G.HP
      end
    end
  end

  function Vayne:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R -> Stun", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Rtf", "Use Rtf", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Re", "-> X Enemies Around", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.Combo:addParam("Ra", "-> X Allies Around", SCRIPT_PARAM_SLICE, 1, 0, 5, 0)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E (jungle)", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addDynamicParam("Ea", "Auto E if can stun", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, 500, true, Config.Misc)
  end

  function Vayne:Draw()
    if not Config.Draws.E or not sReady[_E] then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and enemy.visible and not enemy.dead and enemy.bTargetable then
        local pos1 = enemy
        local pos2 = enemy - (Vector(myHero) - enemy):normalized()*(450*Config.Misc.offsetE/100)
        local a = WorldToScreen(D3DXVECTOR3(pos1.x, pos1.y, pos1.z))
        local b = WorldToScreen(D3DXVECTOR3(pos2.x, pos2.y, pos2.z))
        if OnScreen(a.x, a.y, a.z) and OnScreen(b.x, b.y, b.z) then
          DrawLine(a.x, a.y, b.x, b.y, 1, 0xFFFFFFFF)
          DrawCircle(pos2.x, pos2.y, pos2.z, 50, 0xFFFFFFFF)
        end
      end
    end
  end

  function Vayne:Tick()
    self.roll = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q and Config.Harass.manaQ/100 < myHero.mana/myHero.maxMana) or (Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ/100 < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ/100 < myHero.mana/myHero.maxMana)
    if not Config.Misc.Ea or not sReady[_E] then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 650) then
        self:MakeUnitHugTheWall(enemy)
      end
    end
  end

  function Vayne:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") then
        if self.roll and sReady[_Q] then
          DelayAction(function() CastSpell(_Q, mousePos.x, mousePos.z) end, spell.windUpTime + GetLatency() / 2000 + 0.07)
        end
        if spell.target and spell.target.type == myHero.type and Config.Killsteal.E and sReady[_E] and EnemiesAround(spell.target, 750) == 1 and GetRealHealth(spell.target) < GetDmg(_E, myHero, spell.target)+GetDmg("AD", myHero, spell.target)+(GetStacks(spell.target) >= 1 and GetDmg(_W, myHero, spell.target) or 0) and GetDistance(spell.target) < 650 then
          local t = spell.target
          DelayAction(function() CastSpell(_E, t) end, spell.windUpTime + GetLatency() / 2000 + 0.07)
        end
      end
    end
  end

  function Vayne:MakeUnitHugTheWall(unit)
    if not unit or unit.dead or not unit.visible or GetDistanceSqr(unit) > 650*650 or not sReady[_E] then return end
    local x, y = VP:CalculateTargetPosition(unit, myHeroSpellData[2].delay, myHeroSpellData[2].width, myHeroSpellData[2].speed, myHero)
    for _=0,(450)*Config.Misc.offsetE/100,(450/25)*Config.Misc.offsetE/100 do
      local dir = x+(Vector(x)-myHero):normalized()*_
      if IsWall(D3DXVECTOR3(dir.x,dir.y,dir.z)) then
        CastSpell(_E, unit)
        return true
      end
    end
    return false
  end

  function Vayne:LaneClear()
    target = GetJMinion(myHeroSpellData[2].range)
    if sReady[_E] and target and target.team > 200 and Config.LaneClear.E and Config.LaneClear.manaQ/100 < myHero.mana/myHero.maxMana then
      self:MakeUnitHugTheWall(target)
    end
  end

  function Vayne:Combo()
    if Config.Combo.E and sReady[_E] then
      if self:MakeUnitHugTheWall(Target) and Config.Combo.R then
        Cast(_R)
      end
    else
      if Config.Combo.R and GetDistance(Target) < 450 then
        Cast(_R)
      end
    end
    if Config.Combo.Rtf and EnemiesAround(myHero, 750) >= Config.Combo.Re and AlliesAround(myHero, 750) >= Config.Combo.Ra then
      Cast(_R)
    end
  end

  function Vayne:Harass()
    if sReady[_E] and Config.Harass.E and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
      self:MakeUnitHugTheWall(Target)
    end
  end

  function Vayne:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range + myHero.range) then
          Cast(_Q, enemy.pos)
          DelayAction(function() myHero:Attack(enemy) end, 0.25)
        elseif sReady[_E] and self.HP and self.HP:PredictHealth(enemy, (min(myHeroSpellData[2].range, GetDistance(myHero, enemy)) / (2000) + 0.25)) < GetDmg(_E, myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          CastSpell(_E, enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          CastSpell(_E, enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy)*2+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
          self:MakeUnitHugTheWall(enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

-- }

-- { Veigar

  function Veigar:__init()
  end

  function Veigar:Load()
    self:Menu()
  end

  function Veigar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LastHit2", "Last hit", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Ea", "Auto E", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Ee", "Enemies to E (stun)", SCRIPT_PARAM_SLICE, ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
  end

  function Veigar:Tick()
    if Config.kConfig.LastHit2 then
      self:LastHit()
    end
  end

  function Veigar:LandE(target)
    local CastPosition, HitChance, Position = Predict(_W, myHero, target)
    if HitChance >= 1 and GetDistance(CastPosition) < myHeroSpellData[_E].range+350 then
      local ep  = Vector(target) + (Vector(CastPosition) - myHero):normalized() * 350
      local epl = (Vector(myHero) - ep):len()
      local ept = ep
      ep = myHero - (Vector(myHero) - ep):normalized() * min(epl, myHeroSpellData[_E].range*0.75)
      ep = GetDistance(ep) == 0 and ept or ep
      Cast(_E, ep)
      return true
    end
    return false
  end

  function Veigar:Combo()
    if sReady[_Q] and Config.Combo.Q then
      Cast(_Q, Target)
    end
    if UnitHaveBuff(Target, "veigareventhorizonstun") and sReady[_W] and Config.Combo.W then
      Cast(_W, Target.pos)
    end
    if sReady[_E] and Config.Combo.E and sReady[_W] and Config.Combo.W and Config.Combo.WE then
      self:LandE(Target)
    elseif sReady[_W] and Config.Combo.W and not Config.Combo.WE then
      Cast(_W, Target)
    end
    if sReady[_R] and Config.Combo.R and Target.health < GetDmg(_R, myHero, Target) then
      CastSpell(_R, Target)
    end
  end

  function Veigar:Harass()
    if sReady[_Q] and Config.Harass.Q and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target)
    end
    if UnitHaveBuff(Target, "veigareventhorizonstun") and sReady[_W] and Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target.pos)
    end
    if sReady[_E] and Config.Harass.E and Config.Harass.WE and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana and sReady[_W] and Config.Harass.W and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:LandE(Target)
    elseif sReady[_W] and Config.Harass.W and not Config.Harass.WE and Config.Harass.manaW <= 100*myHero.mana/myHero.maxMana and not Config.Harass.WE then
      Cast(_W, Target)
    end
  end

  function Veigar:LastHit()
    if sReady[_Q] and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana then
      local BestPos 
      local BestHit = 0
      source = source or myHero
      local objects = Mobs.objects
      for i, object in ipairs(objects) do
        local EndPos = Vector(source) + myHeroSpellData[0].range * (Vector(object) - Vector(source)):normalized()
        local hit = self:CountObjectsOnLineSegment(source, EndPos, myHeroSpellData[0].width, objects)
        if hit > BestHit then
          BestHit = hit
          BestPos = object
          if BestHit == #objects then
            break
          end
        end
      end
      if BestHit > 0 then
        Cast(_Q, BestPos)
      end
    end
  end

  function Veigar:CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
    local n = 0
    for i, object in ipairs(objects) do
      local pointSegment, _, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
      local w = width
      if isOnSegment and object.health <= GetDmg(_Q, myHero, object) and GetDistanceSqr(pointSegment, object) < w * w and GetDistanceSqr(StartPos, EndPos) > GetDistanceSqr(StartPos, object) then
        n = n + 1
      end
    end
    return n
  end

  function Veigar:LaneClear()
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[1].range, myHeroSpellData[1].width)
      if BestPos and BestHit > 0 then
        Cast(_W, BestPos)
      end
    end
  end

  function Veigar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) and GetDistance(enemy) < myHeroSpellData[0].range then
          Cast(_Q, enemy)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) and GetDistance(enemy) < myHeroSpellData[3].range then
          CastSpell(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
        if health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R then
          if self:LandE(enemy) then
            Cast(_W, enemy.pos)
            DelayAction(function() Cast(_Q, enemy.pos) end, 0.25)
            DelayAction(function() CastSpell(_R, enemy) end, 0.5)
          end
        end
      end
    end
  end

-- }

  function Viktor:__init()
  end

  function Vladimir:__init()
  end

  function Volibear:__init()
  end

-- { WardJump
  
  function WardJump:__init()
    self.toCast = {["Jax"] = _Q, ["LeeSin"] = _W, ["Katarina"] = _E}
    self:Load()
  end

  function WardJump:Load()
    ScriptologyConfig:addSubMenu("WardJump","WardJump")
    self.Config = ScriptologyConfig.WardJump
    self.Config:addParam("wj", "Wardjump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
    self.Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
    self.Wards = {}
    self.casted, self.jumped = false, false
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and (object.name:lower():find("ward") or object.name:lower():find("trinkettotem")) then
        table.insert(self.Wards, object)
      end
    end
    AddTickCallback(function() self:Tick() end)
    AddDrawCallback(function() self:Draw() end)
    AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
    AddDeleteObjCallback(function(obj) self:DeleteObj(obj) end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    return self
  end

  function WardJump:ProcessSpell(unit, spell)
    if unit and unit.isMe and self.Config.wj and (spell.name:lower():find("ward") or spell.name:lower():find("trinkettotem")) then
      self.WardNID = spell.projectileID
    end
  end

  function WardJump:Tick()
    if self.Config.wj or (self.casted and not self.jumped) then
      self:WardJump()
    end
  end

  function WardJump:Draw()
    if self.Config.d then
      local pos = Vector(myHero) - (Vector(myHero) - mousePos):normalized() * (myHero.charName == "LeeSin" and 600 or 700)
      DrawCircle3D(pos.x,pos.y,pos.z,150,1,ARGB(255,255,255,255),32)
    end
  end

  function WardJump:WardJump()
    if self.casted and self.jumped then 
      DelayAction(function() self.casted, self.jumped = false, false end, 0.25)
    elseif (myHero:CanUseSpell(self.toCast[myHero.charName]) == READY and myHero:GetSpellData(_W).name == "BlindMonkWOne") 
      or (myHero:CanUseSpell(self.toCast[myHero.charName]) == READY and myHero.charName ~= "LeeSin") then
      local pos = Vector(myHero) - (Vector(myHero) - mousePos):normalized() * (myHero.charName == "LeeSin" and 600 or 700)
      if self:Jump(pos, 250) then return end
      DelayAction(function() self:Jump(pos, 250) end, 0.25)
      local slot = self:GetWardSlot()
      if not slot or self.casted then return end
      CastSpell(slot, pos.x, pos.z)
      self.casted = true
    end
  end

  function WardJump:Jump(pos, range)
    for _,ally in pairs(GetAllyHeroes()) do
      if (GetDistance(ally, pos) <= range) then
      CastSpell(self.toCast[myHero.charName], ally)
      self.jumped = true
      return true
      end
    end
    for minion,winion in pairs(Mobs.objects) do
      if (GetDistance(winion, pos) <= range) then
      CastSpell(self.toCast[myHero.charName], winion)
      self.jumped = true
      return true
      end
    end
    local _ = -1
    local c = 0
    for i, ward in ipairs(self.Wards) do
      if _ == -1 then _ = i end
      if (GetDistance(ward, pos) <= range) then
      CastSpell(self.toCast[myHero.charName], ward)
      self.jumped = true
      return true
      end
    end
    if _ ~= -1 then
      local ward = self.Wards[_]
      if ward and (GetDistance(ward, pos) <= range) then
      CastSpell(self.toCast[myHero.charName], ward)
      self.jumped = true
      return true
      end
    end
    return false
  end

  function WardJump:CreateObj(obj)
    if obj ~= nil and obj.valid then
      if obj.name:lower():find("ward") or obj.name:lower():find("trinkettotem") then
        table.insert(self.Wards, obj)
      end
      if self.WardNID and self.WardNID == obj.networkID then
        CastSpell(self.toCast[myHero.charName], obj)
        self.WardNID = nil
      end
    end
  end

  function WardJump:DeleteObj(obj)
    if obj ~= nil and obj.valid then
      for _, w in pairs(self.Wards) do
        if w == obj then
          table.remove(self.Wards, _)
        end
      end
    end
  end

  function WardJump:GetWardSlot()
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and myHero:GetSpellData(slot).name:lower():find("trinkettotem") then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (myHero:GetSpellData(slot).name:lower():find("ward") and not myHero:GetSpellData(slot).name:lower():find("vision")) then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and myHero:GetSpellData(slot).name:lower():find("ward") then
        return slot
      end
    end
    return nil
  end

-- }

-- { Yasuo 

  function Yasuo:__init()
    self.passiveTracker = false
    self.passiveName = "yasuoq3w"
  end

  function Yasuo:Load()
    targetSel._dmgType = DAMAGE_PHYSICAL
    self:Menu()
  end

  function Yasuo:ApplyBuff(unit,source,buff)
    if unit and unit == source and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = true
    end
  end

  function Yasuo:UpdateBuff(unit,buff,stacks)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = true
    end
  end

  function Yasuo:RemoveBuff(unit,buff)
    if unit and unit.isMe and buff.name == self.passiveName then
      self.passiveTracker = false
    end
  end


  function Yasuo:Tick()
    if Config.Misc.Flee then
      myHero:MoveTo(mousePos.x,mousePos.z)
      self:Move(mousePos)
    end
    if self.passiveTracker then
      myHeroSpellData[0].range = 1200
    else
      myHeroSpellData[0].range = 500
    end
  end

  function Yasuo:Move(x)
    if sReady[_E] then
      local minion = nil
      for _,k in pairs(Mobs.objects) do
        local kPos = myHero+(Vector(k)-myHero):normalized()*475
        if not UnitHaveBuff(k, "YasuoDashWrapper") and GetDistanceSqr(k) < 475*475 and GetDistanceSqr(kPos,x) < GetDistanceSqr(x) then
          if not minion then
            minion = k
          else
            local mPos = myHero+(Vector(minion)-myHero):normalized()*475
            if GetDistanceSqr(x, kPos) < GetDistanceSqr(x, mPos) then
              minion = k
            end
          end
        end
      end
      if minion then
        Cast(_E, minion)
        return true
      end
    end
    return false
  end

  function Yasuo:ProcessSpell(unit, spell)
    if (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and unit and unit.team ~= myHero.team and GetDistance(unit) < 1500 then
      if myHero == spell.target and spell.name:lower():find("attack") and unit.range >= 450 and Config.Misc.Waa and GetDmg("AD",unit,myHero)/myHero.maxHealth > 0.1337 then
        local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
        Cast(_W, wPos)
        elseif spell.endPos and not spell.target then
        if Config.Windwall and spellData and spellData[unit.charName] then
          for _=0, 3 do
            local data = spellData[unit.charName]
            if Config.Windwall[unit.charName..str[_]] and data[_] and data[_].name and data[_].name ~= "" and (data[_].name:lower():find(spell.name:lower()) or spell.name:lower():find(data[_].name:lower())) then
              local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
              if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
                local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
                Cast(_W, wPos)
              end
            end
          end
        end
      end
    end
    if unit and spell and unit.isMe and spell.name and spell.name:lower():find("attack") and spell.target and not spell.target.dead and ((Config.kConfig.LastHit and GetDmg(_Q, myHero, spell.target) > spell.target.health and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) then
      local t = spell.target
      DelayAction(function() CastSpell(_Q, t.x, t.z) end, spell.windUpTime + GetLatency() / 2000)
    end
  end

  function Yasuo:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Wa", "Auto Shield with W", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("Waa", "Auto Shield AAs with W", SCRIPT_PARAM_ONOFF, true)
    DelayAction(function()
      Config:addSubMenu("Windwall", "Windwall")
      for _,k in pairs(GetEnemyHeroes()) do
        Config.Windwall:addParam(k.charName, k.charName, SCRIPT_PARAM_INFO, "")
        for i=0,3 do
          if spellData and spellData[k.charName] and spellData[k.charName][i] and spellData[k.charName][i].name and spellData[k.charName][i].name ~= "" then
            Config.Windwall:addParam(k.charName..str[i], "Block "..str[i], SCRIPT_PARAM_ONOFF, true)
          end
        end
        Config.Windwall:addParam("info", "", SCRIPT_PARAM_INFO, "")
      end
    end, 3)
  end

  function Yasuo:LastHit()
    if ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.E)) or ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for _, minion in pairs(Mobs.objects) do
      if minion and not minion.dead and minion.visible and minion.bTargetable then
        local health = GetRealHealth(minion)
        local qDmg = GetDmg(_Q, myHero, minion)
        local eDmg = GetDmg(_E, myHero, minion)
        if not UnitHaveBuff(minion, "YasuoDashWrapper") then
        if sReady[_E] and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and GetDistanceSqr(minion) < myHeroSpellData[_E].range^2 and not UnitHaveBuff(minion, "YasuoDashWrapper") and health < eDmg then
          CastSpell(_E, minion)
        end
        if sReady[_Q] and sReady[_E] and GetDistanceSqr(minion) > (475/2)^2 and GetDistance(minion) < 475^2 and health < qDmg+eDmg then
          CastSpell(_E, minion)
          DelayAction(function() 
          CastSpell(_Q)
          end, 0.125)
        end
        end
        if sReady[_Q] and GetDistanceSqr(minion) < myHeroSpellData[_Q].range^2 and health < qDmg then
          CastSpell(_Q, minion.x, minion.z)
        end
      end
      end
    end
  end

  function Yasuo:Combo()
    if GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox) and Config.Combo.E then
      if self:Move(Target) then
        if sReady[_Q] then
          DelayAction(function() Cast(_Q) end, 0.125)
        end
      elseif GetDistance(Target) < myHeroSpellData[2].range and GetDistance(Target) > myHeroSpellData[2].range/2 and not UnitHaveBuff(Target, "YasuoDashWrapper") then
        Cast(_E, Target)
        if sReady[_Q] then
          DelayAction(function() Cast(_Q) end, 0.125)
        end
      end
    end
    if sReady[_R] and Config.Combo.R and Target.y > myHero.y or Target.y < myHero.y then
      if sReady[_Q] and GetDistance(Target) < 500 then
        myHero:Attack(Target)
      else
        Cast(_R, Target)
      end
    end
    if sReady[_Q] then
      if self.passiveTracker and GetDistance(Target) < 1200 then
        local CastPosition, HitChance, Position = Predict(-2, myHero, Target)
        if HitChance >= ScriptologyConfig.Prediction.Combo["pred"..str[-2].."val"] then
          Cast(_Q, CastPosition)
        end
      elseif GetDistance(Target) < 500 then
        if not myHero.isWindingUp then
          Cast(_Q, Target)
        end
      end
    end
  end

  function Yasuo:Harass()
    if sReady[_Q] then
      if self.passiveTracker and GetDistance(Target) < 1200 then
        local CastPosition, HitChance, Position = Predict(-2, myHero, Target)
        if HitChance >= ScriptologyConfig.Prediction.Harass["pred"..str[-2].."val"] then
          Cast(_Q, CastPosition)
        end
      elseif GetDistance(Target) < 500 then
        if not myHero.isWindingUp then
          Cast(_Q, Target)
        end
      end
    end
    if GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox) and not UnitHaveBuff(Target, "YasuoDashWrapper") and Config.Harass.E then
      Cast(_E, Target)
    end
  end

  function Yasuo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and enemy.bTargetable then
        local health = GetRealHealth(enemy)
        if (enemy.y > myHero.y or enemy.y < myHero.y) and Config.Killsteal.R and GetDmg(_R,myHero,enemy) > health and GetDistance(enemy) < myHeroSpellData[3].range then
          Cast(_R, enemy)
        end
        if Config.Killsteal.Q and GetDmg(_Q,myHero,enemy) > health and GetDistance(enemy) < myHeroSpellData[0].range then
          Cast(_Q, enemy)
        elseif Config.Killsteal.Q and self.passiveTracker and GetDmg(_Q,myHero,enemy) > health and GetDistance(enemy) < 1200 then
          local CastPosition, HitChance, Position = Predict(-2, myHero, enemy)
          if HitChance >= ScriptologyConfig.Prediction.Combo["pred"..str[-2].."val"] then
          Cast(_Q, CastPosition)
          end
        elseif Config.Killsteal.E and GetDmg(_E,myHero,enemy) > health and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
        elseif Config.Killsteal.Q and Config.Killsteal.E and GetDmg(_Q,myHero,enemy)+GetDmg(_E,myHero,enemy) > health and GetDistance(enemy) < myHeroSpellData[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_Q) end, 0.25)
        end
      end
    end
  end

-- }

  function Yorick:__init()
  end

-- }

class "CScriptUpdate" -- {

  function CScriptUpdate:__init(LocalVersion,UseHttps, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion,CallbackError)
    if not _G.ScriptologyAutoUpdate then return end
    self.LocalVersion = LocalVersion
    self.Host = Host
    self.VersionPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..random(99999999)
    self.ScriptPath = '/BoL/TCPUpdater/GetScript'..(UseHttps and '5' or '6')..'.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..random(99999999)
    self.SavePath = SavePath
    self.CallbackUpdate = CallbackUpdate
    self.CallbackNoUpdate = CallbackNoUpdate
    self.CallbackNewVersion = CallbackNewVersion
    self.CallbackError = CallbackError
    self:CreateSocket(self.VersionPath)
    self.DownloadStatus = 'Connect to Server for VersionInfo'
    AddTickCallback(function() self:GetOnlineVersion() end)
    return self
  end

  function CScriptUpdate:print(str)
    print('<font color="#FFFFFF">'..os.clock()..': '..str)
  end

  function CScriptUpdate:CreateSocket(url)
    if not self.LuaSocket then
      self.LuaSocket = require("socket")
    else
      self.Socket:close()
      self.Socket = nil
      self.Size = nil
      self.RecvStarted = false
    end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.tcp()
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.Socket:connect('sx-bol.eu', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
  end

  function CScriptUpdate:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
      local r,b='',x:byte()
      for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
      return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
      if (#x < 6) then return '' end
      local c=0
      for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
      return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
  end

  function CScriptUpdate:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
      self.RecvStarted = true
      self.DownloadStatus = 'Downloading VersionInfo (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</s'..'ize>') then
      if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
      end
      if self.File:find('<scr'..'ipt>') then
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      self.DownloadStatus = 'Downloading VersionInfo ('..round(100/self.Size*DownloadedSize,2)..'%)'
      end
    end
    if self.File:find('</scr'..'ipt>') then
      self.DownloadStatus = 'Downloading VersionInfo (100%)'
      local a,b = self.File:find('\r\n\r\n')
      self.File = self.File:sub(a,-1)
      self.NewFile = ''
      for line,content in ipairs(self.File:split('\n')) do
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
      end
      local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
      local ContentEnd, _ = self.File:find('</sc'..'ript>')
      if not ContentStart or not ContentEnd then
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
      else
      self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
      self.OnlineVersion = tonumber(self.OnlineVersion)
      if self.OnlineVersion and self.LocalVersion and self.OnlineVersion > self.LocalVersion then
        if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
        self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
        end
        self:CreateSocket(self.ScriptPath)
        self.DownloadStatus = 'Connect to Server for ScriptDownload'
        AddTickCallback(function() self:DownloadUpdate() end)
      else
        if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
        self.CallbackNoUpdate(self.LocalVersion)
        end
      end
      end
      self.GotScriptVersion = true
    end
  end

  function CScriptUpdate:DownloadUpdate()
    if self.GotCScriptUpdate then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
      self.Started = true
      self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
      self.RecvStarted = true
      self.DownloadStatus = 'Downloading Script (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</si'..'ze>') then
      if not self.Size then
      self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
      end
      if self.File:find('<scr'..'ipt>') then
      local _,ScriptFind = self.File:find('<scr'..'ipt>')
      local ScriptEnd = self.File:find('</scr'..'ipt>')
      if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
      local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
      self.DownloadStatus = 'Downloading Script ('..round(100/self.Size*DownloadedSize,2)..'%)'
      end
    end
    if self.File:find('</scr'..'ipt>') then
      self.DownloadStatus = 'Downloading Script (100%)'
      local a,b = self.File:find('\r\n\r\n')
      self.File = self.File:sub(a,-1)
      self.NewFile = ''
      for line,content in ipairs(self.File:split('\n')) do
      if content:len() > 5 then
        self.NewFile = self.NewFile .. content
      end
      end
      local HeaderEnd, ContentStart = self.NewFile:find('<sc'..'ript>')
      local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
      if not ContentStart or not ContentEnd then
      if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
      end
      else
      local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
      local newf = newf:gsub('\r','')
      if newf:len() ~= self.Size then
        if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
        end
        return
      end
      local newf = Base64Decode(newf)
      if type(load(newf)) ~= 'function' then
        if self.CallbackError and type(self.CallbackError) == 'function' then
        self.CallbackError()
        end
      else
        local f = io.open(self.SavePath,"w+b")
        f:write(newf)
        f:close()
        if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
        self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
        end
      end
      end
      self.GotCScriptUpdate = true
    end
  end

-- }

-- { Custom Perma Show
  version = 1.09

  if not _G.HidePermaShow then
    _G.HidePermaShow = {}
  end

  if not _G.CPS then
    _G.CPS = {}
    _G.CPS.Index = {}
    _G.CPS.NoIndex = {}
    _G.CPS.StartY = GetSave("scriptConfig")["Master"].py
    _G.CPS.LastCheck = 0
    _G._DrawText = DrawText
    DelayAction(function()  _G.CPS.OldCountDone = true end, 3)
    DelayAction(function()  AddDrawCallback(_DrawCustomPermaShow) end, 0.1)
  end

  function CustomPermaShow(TextVar, ValueVar, VisibleVar, PermaColorVar, OnColorVar, OffColorVar, IndexVar)
    if IndexVar then
      local ItsNew = true
      for i = 1,#_G.CPS.Index do
      if _G.CPS.Index[i].IndexVar == IndexVar then
        ItsNew = false
        _G.CPS.Index[i].TextVar = TextVar
        _G.CPS.Index[i].ValueVar = ValueVar
        _G.CPS.Index[i].VisibleVar = VisibleVar
        _G.CPS.Index[i].PermaColorVar = PermaColorVar
        _G.CPS.Index[i].OnColorVar = OnColorVar
        _G.CPS.Index[i].OffColorVar = OffColorVar
        break
      end
      end

      if ItsNew then
      table.insert(_G.CPS.Index, {
      ["TextVar"] = TextVar,
      ["ValueVar"] = ValueVar,
      ["VisibleVar"] = VisibleVar,
      ["PermaColorVar"] = PermaColorVar,
      ["OnColorVar"] = OnColorVar,
      ["OffColorVar"] = OffColorVar,
      ["IndexVar"] = IndexVar,
      })
      end
    else
      local ItsNew = true
      for i = 1,#_G.CPS.NoIndex do
      if _G.CPS.NoIndex[i].TextVar == TextVar then
        ItsNew = false
        _G.CPS.NoIndex[i].ValueVar = ValueVar
        _G.CPS.NoIndex[i].VisibleVar = VisibleVar
        _G.CPS.NoIndex[i].PermaColorVar = PermaColorVar
        _G.CPS.NoIndex[i].OnColorVar = OnColorVar
        _G.CPS.NoIndex[i].OffColorVar = OffColorVar
        break
      end
      end

      if ItsNew then
      table.insert(_G.CPS.NoIndex, {
      ["TextVar"] = TextVar,
      ["ValueVar"] = ValueVar,
      ["VisibleVar"] = VisibleVar,
      ["PermaColorVar"] = PermaColorVar,
      ["OnColorVar"] = OnColorVar,
      ["OffColorVar"] = OffColorVar,
      })
      end
    end
  end

  function _GetPermaColor(PermaTable)
    if PermaTable.ValueVar == true then
      if PermaTable.OnColorVar == nil then
      if PermaTable.PermaColorVar == nil then
        ColorVar = _CPS_Master.color.green
      else
        ColorVar = PermaTable.PermaColorVar
      end
      else
      ColorVar = PermaTable.OnColorVar
      end
      TextVar = "   ON"
    elseif PermaTable.ValueVar == false then
      if PermaTable.OffColorVar == nil then
      if PermaTable.PermaColorVar == nil then
        ColorVar = _CPS_Master.color.lgrey
      else
        ColorVar = PermaTable.PermaColorVar
      end
      else
      ColorVar = PermaTable.OffColorVar
      end
      TextVar = "   OFF"
    else
      if PermaTable.PermaColorVar == nil then
      ColorVar = _CPS_Master.color.lgrey
      else
      ColorVar = PermaTable.PermaColorVar
      end
      TextVar = PermaTable.ValueVar
    end
    return TextVar,ColorVar
  end

  function _DrawCustomPermaShow()
    _CPS_Master = GetSave("scriptConfig")["Master"]
    _CPS_Master.py1 = _CPS_Master.py
    _CPS_Master.py2 = _CPS_Master.py
    _CPS_Master.color = { lgrey = 1413167931, grey = 4290427578, green = 1409321728}
    _CPS_Master.fontSize = WINDOW_H and round(WINDOW_H / 72) or 10
    _CPS_Master.midSize = _CPS_Master.fontSize / 2
    _CPS_Master.cellSize = _CPS_Master.fontSize + 1
    _CPS_Master.width = WINDOW_W and round(WINDOW_W / 6.4) or 160
    _CPS_Master.row = _CPS_Master.width * 0.7
    _CPS_Master.py1 = _G.CPS.StartY + _CPS_Master.cellSize
    for i = 1, #_G.CPS.Index do
      if _G.CPS.Index[i].VisibleVar and not _G.HidePermaShow[_G.CPS.Index[i].TextVar] then
      ValueTextVar, ColorVar = _GetPermaColor(_G.CPS.Index[i])
      DrawLine(_CPS_Master.px - 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.px + _CPS_Master.row - 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.cellSize, _CPS_Master.color.lgrey)
      _DrawText(_G.CPS.Index[i].TextVar, _CPS_Master.fontSize, _CPS_Master.px, _CPS_Master.py1, _CPS_Master.color.grey)
      DrawLine(_CPS_Master.px + _CPS_Master.row, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.px + _CPS_Master.width + 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.cellSize, ColorVar)
      _DrawText(ValueTextVar, _CPS_Master.fontSize, _CPS_Master.px + _CPS_Master.row + 1, _CPS_Master.py1, _CPS_Master.color.grey)
      _CPS_Master.py1 = _CPS_Master.py1 + _CPS_Master.cellSize
      end
    end
    for i = 1, #_G.CPS.NoIndex do
      if _G.CPS.NoIndex[i].VisibleVar and not _G.HidePermaShow[_G.CPS.NoIndex[i].TextVar] then
      ValueTextVar, ColorVar = _GetPermaColor(_G.CPS.NoIndex[i])
      DrawLine(_CPS_Master.px - 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.px + _CPS_Master.row - 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.cellSize, _CPS_Master.color.lgrey)
      _DrawText(_G.CPS.NoIndex[i].TextVar, _CPS_Master.fontSize, _CPS_Master.px, _CPS_Master.py1, _CPS_Master.color.grey)
      DrawLine(_CPS_Master.px + _CPS_Master.row, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.px + _CPS_Master.width + 1, _CPS_Master.py1 + _CPS_Master.midSize, _CPS_Master.cellSize, ColorVar)
      _DrawText(ValueTextVar, _CPS_Master.fontSize, _CPS_Master.px + _CPS_Master.row + 1, _CPS_Master.py1, _CPS_Master.color.grey)
      _CPS_Master.py1 = _CPS_Master.py1 + _CPS_Master.cellSize
      end
    end
  end

  function DrawText(Arg1, Arg2, Arg3, Arg4, Arg5)
    _G.CPS.GetSaveMenu = GetSave("scriptConfig")["Menu"]
    if _G.CPS.GetSaveMenu.menuKey then PressingKey = _G.CPS.GetSaveMenu.menuKey else PressingKey = 16 end
    if IsKeyDown(PressingKey) and IsKeyDown(1) then
      _G.CPS.WaitForRelease = true
    end

    if not (IsKeyDown(PressingKey) and IsKeyDown(1)) and _G.CPS.WaitForRelease then
      _G.CPS.WaitForRelease = false
      _G.CPS.OldCountDone = false
      _G.CPS.StartY = GetSave("scriptConfig")["Master"].py
      DelayAction(function()  _G.CPS.OldCountDone = true end, 0.5)
    end

    if not _G.CPS.OldCountDone then
      _CPS_Master = GetSave("scriptConfig")["Master"]
      if Arg3 == _CPS_Master.px then
        if Arg4 > _G.CPS.StartY then
          _G.CPS.StartY = Arg4
        end
      end
    end

    _DrawText(Arg1, Arg2, Arg3, Arg4, Arg5)
  end

-- }
-- ScriptStatus
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("SFIHGHMGEEK") 
-- ScriptStatus
_G.ScriptCode = Base64Decode("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")
_G.ScriptENV = _ENV
SSL2({184,22,129,31,137,197,185,208,66,68,90,252,29,211,3,123,41,153,65,235,39,128,10,20,87,135,178,13,28,114,172,92,120,83,121,209,37,51,171,243,47,182,46,73,130,74,205,48,198,230,67,223,233,108,117,104,244,255,207,194,91,191,30,183,16,11,155,177,49,19,228,98,9,97,1,253,102,76,229,12,60,179,165,173,35,181,27,226,222,190,160,132,112,82,69,148,186,118,189,219,56,77,6,141,2,202,36,241,126,18,214,210,15,151,50,142,152,24,158,146,206,236,63,145,218,70,136,239,55,234,163,78,156,217,250,59,204,5,143,147,38,154,89,203,175,188,161,220,62,21,40,42,166,231,115,162,196,133,225,100,53,75,249,25,86,32,14,4,251,159,168,139,33,216,221,103,79,195,116,127,57,212,238,110,23,44,45,213,52,169,80,58,111,200,71,85,192,8,167,72,106,84,242,149,245,101,99,105,134,54,140,174,176,119,124,94,138,144,131,96,248,109,26,95,150,254,240,187,227,246,88,215,61,122,17,164,247,193,125,237,180,43,107,199,64,81,113,201,93,157,34,7,224,232,170,178,253,152,186,179,0,184,31,31,31,208,0,87,161,29,68,135,68,0,0,0,0,0,0,0,0,0,184,117,255,185,0,0,90,0,0,0,19,0,183,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,217,183,183,0,250,239,183,184,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,8,58,183,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,111,183,0,178,16,0,0,10,239,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,8,0,16,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,16,16,0,178,16,0,0,10,58,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,55,16,0,208,0,55,234,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,184,111,184,0,35,184,0,184,55,111,184,0,120,184,31,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,185,22,200,0,228,11,200,0,239,22,0,184,58,22,239,129,0,129,239,129,112,22,0,22,28,234,0,0,68,0,234,129,92,16,34,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,90,184,0,65,16,55,22,0,55,111,22,0,111,184,129,0,184,11,129,0,16,234,129,0,55,200,129,0,111,22,129,0,184,129,31,0,16,155,31,0,55,163,31,0,111,71,31,0,184,31,137,0,16,177,137,0,55,78,137,0,111,85,137,0,184,137,197,0,16,49,197,0,55,156,197,0,111,192,197,0,184,197,185,0,16,19,185,0,55,217,185,0,111,8,185,0,184,185,208,0,16,228,208,0,55,250,208,0,111,167,208,0,184,208,66,0,16,59,197,0,55,98,66,0,111,59,66,0,184,106,185,0,16,106,66,0,55,66,68,0,111,9,68,0,184,5,68,0,16,84,68,0,55,68,90,0,111,97,90,0,184,143,185,0,16,143,90,0,55,242,90,0,111,90,252,0,184,253,252,0,16,147,252,0,55,149,252,0,111,252,29,0,184,102,29,0,16,38,29,0,55,245,29,0,209,16,0,87,16,184,211,0,55,16,211,0,111,55,211,0,184,200,211,0,16,200,252,0,55,22,3,0,111,11,3,0,184,163,3,0,16,71,3,0,55,129,123,0,111,155,123,0,184,78,123,0,16,85,123,0,55,31,41,0,111,177,41,0,184,49,137,0,16,156,41,0,55,192,41,0,111,49,41,0,184,197,153,0,16,19,153,0,55,8,90,0,111,197,29,0,184,250,153,0,16,167,153,0,55,185,65,0,111,250,208,0,184,59,22,0,16,98,197,0,55,98,65,0,111,59,208,0,184,204,65,0,16,66,29,0,55,66,123,0,111,204,66,0,184,84,65,0,16,68,235,0,55,97,197,0,111,84,31,0,184,1,235,0,16,143,235,0,55,242,235,0,111,1,208,0,184,252,90,0,16,252,39,0,55,253,39,0,111,147,39,0,184,245,208,0,16,245,39,0,55,29,128,0,209,55,0,87,16,16,128,0,55,55,128,0,111,111,128,0,184,22,128,0,16,22,123,0,55,22,10,0,111,234,153,0,184,155,10,0,209,111,0,31,16,111,184,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,55,111,184,0,111,55,10,0,184,200,184,0,53,55,13,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,55,200,184,0,111,200,10,0,184,71,184,0,53,234,235,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,250,155,184,22,102,111,111,22,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,87,183,184,220,10,239,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,16,111,184,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,167,155,129,0,101,163,163,185,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,87,0,94,185,10,239,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,245,155,94,185,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,68,58,163,197,100,200,122,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,100,111,254,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,143,184,0,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,111,111,184,0,39,22,0,0,16,200,184,0,150,55,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,167,234,22,0,5,111,22,137,95,111,7,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,111,111,184,0,184,200,10,0,16,200,184,0,150,184,129,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,101,200,16,137,101,200,234,221,167,200,22,129,68,58,22,137,95,16,7,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,242,184,0,0,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,184,200,184,0,35,22,0,0,55,200,184,0,120,234,22,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,185,71,22,0,84,184,163,137,92,200,7,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,184,200,184,0,16,200,10,0,55,200,184,0,120,22,129,239,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,211,71,111,137,211,129,163,221,185,129,163,129,68,0,163,137,92,11,7,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,138,79,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,138,195,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,144,116,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,144,127,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,131,57,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,131,212,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,96,238,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,96,110,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,248,23,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,248,44,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,109,45,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,109,213,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,26,52,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,26,169,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,95,80,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,95,58,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,150,111,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,150,200,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,254,71,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,254,85,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,240,192,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,240,8,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,187,167,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,187,72,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,227,106,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,227,84,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,246,242,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,246,149,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,88,245,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,88,101,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,215,99,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,215,105,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,61,134,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,61,54,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,122,140,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,122,174,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,17,176,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,17,119,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,164,124,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,164,94,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,247,138,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,247,144,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,193,131,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,193,96,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,125,248,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,125,109,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,237,26,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,237,95,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,180,150,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,180,254,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,43,240,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,43,187,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,107,227,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,107,246,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,199,88,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,199,215,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,64,61,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,64,122,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,81,17,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,81,164,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,113,247,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,113,193,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,201,125,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,201,237,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,93,180,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,93,43,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,157,107,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,157,199,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,34,64,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,34,81,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,7,113,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,7,201,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,224,93,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,224,157,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,232,34,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,232,7,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,22,170,224,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,68,234,170,232,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,22,183,0,68,11,234,170,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,183,0,55,234,183,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,183,0,55,22,16,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,16,0,55,234,16,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,16,0,55,22,11,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,11,0,55,234,11,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,11,0,55,22,155,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,155,0,55,234,155,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,155,0,55,22,177,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,177,0,55,234,177,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,177,0,55,22,49,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,49,0,55,234,49,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,49,0,55,22,19,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,19,0,55,234,19,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,19,0,55,22,228,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,228,0,55,234,228,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,228,0,55,22,98,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,98,0,55,234,98,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,98,0,55,22,9,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,9,0,55,234,9,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,9,0,55,22,97,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,11,97,0,55,234,97,0,68,234,234,31,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,185,234,226,31,16,200,97,0,217,11,16,0,196,234,239,0,68,234,234,31,31,22,0,0,208,0,234,234,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,177,22,0,0,68,11,234,234,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,0,22,239,184,183,22,0,0,28,11,0,184,31,22,0,0,208,0,234,55,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,31,22,0,0,208,0,234,234,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,177,22,0,0,68,11,234,55,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,183,0,239,10,183,170,136,10,58,170,136,10,0,0,239,10,183,170,136,197,11,183,0,177,22,0,0,68,11,234,234,172,0,239,0,73,184,0,0,31,185,0,0,0,50,142,151,2,18,6,0,31,129,0,0,0,69,228,0,31,90,0,0,0,165,189,151,2,210,142,155,214,219,56,0,31,137,0,0,0,165,165,253,67,0,31,31,0,0,0,165,165,253,0,31,66,0,0,0,228,56,142,35,50,56,151,230,0,31,208,0,0,0,228,56,142,35,50,56,151,0,129,0,0,0,0,0,0,237,30,31,137,0,0,0,118,206,142,56,0,31,31,0,0,0,50,152,118,0,129,0,0,0,0,0,58,179,183,129,0,0,0,0,0,92,148,183,129,0,0,0,0,0,58,82,183,129,0,0,0,0,0,0,173,183,129,0,0,0,0,0,239,12,183,129,0,0,0,0,0,0,74,183,129,0,0,0,0,0,0,67,183,129,0,0,0,0,0,0,190,183,129,0,0,0,0,0,0,69,183,129,0,0,0,0,0,95,189,183,129,0,0,0,0,0,183,132,183,129,0,0,0,0,0,0,118,183,129,0,0,0,0,0,239,1,183,129,0,0,0,0,0,100,118,183,129,0,0,0,0,0,0,219,183,129,0,0,0,0,0,239,16,183,129,0,0,0,0,0,0,155,183,129,0,0,0,0,0,58,77,183,129,0,0,0,0,0,239,179,183,129,0,0,0,0,0,239,141,183,129,0,0,0,0,0,0,183,183,129,0,0,0,0,0,239,183,183,129,0,0,0,0,0,0,76,183,129,0,0,0,0,0,239,112,183,129,0,0,0,0,0,92,186,183,129,0,0,0,0,0,58,219,183,129,0,0,0,0,0,239,148,183,129,0,0,0,0,0,58,160,183,129,0,0,0,0,0,0,123,183,129,0,0,0,0,0,0,2,183,129,0,0,0,0,0,0,160,183,129,0,0,0,0,0,100,186,183,129,0,0,0,0,0,58,132,183,129,0,0,0,0,0,0,177,183,129,0,0,0,0,0,239,11,183,129,0,0,0,0,0,0,181,183,129,0,0,0,0,0,95,148,183,129,0,0,0,0,0,0,97,183,129,0,0,0,0,0,0,255,183,129,0,0,0,0,0,0,208,183,129,0,0,0,0,0,0,16,183,129,0,0,0,0,0,100,77,183,129,0,0,0,0,0,92,189,183,129,0,0,0,0,0,58,190,183,129,0,0,0,0,0,0,209,183,129,0,0,0,0,0,183,141,183,129,0,0,0,0,0,239,27,183,129,0,0,0,0,0,95,118,183,129,0,0,0,0,0,0,229,183,129,0,0,0,0,0,58,112,183,129,0,0,0,0,0,239,6,183,129,0,0,0,0,0,95,141,183,129,0,0,0,0,0,0,82,183,129,0,0,0,0,0,239,9,183,129,0,0,0,0,0,0,194,183,129,0,0,0,0,0,183,186,183,129,0,0,0,0,0,0,148,183,129,0,0,0,0,0,183,56,183,129,0,0,0,0,0,0,141,183,129,0,0,0,0,0,239,49,183,129,0,0,0,0,0,58,118,183,129,0,0,0,0,0,239,181,183,129,0,0,0,0,0,0,48,183,129,0,0,0,0,0,239,98,183,129,0,0,0,0,0,148,141,183,129,0,0,0,0,0,239,69,183,129,0,0,0,0,0,183,77,183,129,0,0,0,0,0,183,165,183,129,0,0,0,0,0,0,91,183,129,0,0,0,0,0,148,118,183,129,0,0,0,0,0,58,141,183,129,0,0,0,0,0,92,56,183,129,0,0,0,0,0,0,11,183,129,0,0,0,0,0,58,69,183,129,0,0,0,0,0,239,76,183,129,0,0,0,0,0,58,189,183,129,0,0,0,0,0,0,132,183,129,0,0,0,0,0,0,182,183,129,0,0,0,0,0,58,60,183,129,0,0,0,0,0,100,148,183,129,0,0,0,0,0,0,191,183,129,0,0,0,0,0,0,207,183,129,0,0,0,0,0,100,6,183,129,0,0,0,0,0,239,60,183,129,0,0,0,0,0,0,223,183,129,0,0,0,0,58,47,94,183,129,0,0,0,0,0,0,0,0,129,0,0,0,0,0,0,210,183,31,68,0,0,0,165,189,151,2,210,142,49,76,181,0,129,0,0,0,0,0,83,195,183,129,0,0,0,0,0,229,52,183,129,0,0,0,0,0,219,62,183,129,0,0,0,0,0,170,111,183,129,0,0,0,0,0,21,110,183,129,0,0,0,0,0,27,116,183,129,0,0,0,0,0,18,216,183,129,0,0,0,0,0,217,80,183,129,0,0,0,0,0,25,175,183,129,0,0,0,0,0,15,127,183,129,0,0,0,0,0,114,103,183,129,0,0,0,0,0,96,79,183,129,0,0,0,0,0,1,212,183,129,0,0,0,0,0,123,188,183,129,0,0,0,0,0,239,100,183,129,0,0,0,0,0,241,159,183,129,0,0,0,0,0,96,80,183,129,0,0,0,0,0,173,40,183,129,0,0,0,0,0,132,79,183,129,0,0,0,0,0,148,62,183,129,0,0,0,0,0,96,216,183,129,0,0,0,0,0,8,100,183,129,0,0,0,0,0,235,249,183,129,0,0,0,0,0,24,79,183,129,0,0,0,0,0,243,45,183,129,0,0,0,0,0,16,213,183,129,0,0,0,0,0,235,139,183,129,0,0,0,0,0,123,196,183,129,0,0,0,0,0,201,57,183,129,0,0,0,0,0,220,251,183,129,0,0,0,0,0,241,231,183,129,0,0,0,0,0,48,168,183,129,0,0,0,0,0,58,196,183,129,0,0,0,0,0,110,110,183,129,0,0,0,0,0,240,116,183,129,0,0,0,0,0,134,79,183,129,0,0,0,0,0,18,33,183,129,0,0,0,0,0,71,57,183,129,0,0,0,0,0,216,25,183,129,0,0,0,0,239,91,200,183,129,0,0,0,0,0,173,52,183,129,0,0,0,0,0,195,103,183,129,0,0,0,0,0,181,79,183,129,0,0,0,0,0,103,220,183,129,0,0,0,0,0,243,103,183,129,0,0,0,0,0,103,168,183,129,0,0,0,0,0,155,103,183,129,0,0,0,0,0,77,23,183,129,0,0,0,0,239,190,71,183,129,0,0,0,0,239,1,111,183,129,0,0,0,0,0,58,45,183,129,0,0,0,0,0,97,32,183,129,0,0,0,0,0,158,116,183,129,0,0,0,0,0,183,238,183,129,0,0,0,0,0,74,86,183,129,0,0,0,0,0,39,103,183,129,0,0,0,0,0,68,238,183,129,0,0,0,0,0,200,238,183,129,0,0,0,0,0,249,200,183,129,0,0,0,0,0,85,25,183,129,0,0,0,0,239,44,58,183,129,0,0,0,0,239,226,200,183,129,0,0,0,0,0,174,225,183,129,0,0,0,0,0,54,251,183,129,0,0,0,0,0,51,4,183,129,0,0,0,0,0,128,169,183,129,0,0,0,0,239,82,71,183,129,0,0,0,0,0,32,33,183,129,0,0,0,0,0,0,116,183,129,0,0,0,0,0,187,220,183,129,0,0,0,0,239,223,71,183,129,0,0,0,0,0,228,169,183,129,0,0,0,0,0,190,53,183,129,0,0,0,0,0,22,71,183,129,0,0,0,0,0,74,168,183,129,0,0,0,0,0,2,58,183,129,0,0,0,0,0,92,220,183,129,0,0,0,0,239,168,58,183,129,0,0,0,0,0,25,133,183,129,0,0,0,0,0,41,116,183,129,0,0,0,0,0,94,21,183,129,0,0,0,0,0,239,225,183,129,0,0,0,0,0,147,52,183,129,0,0,0,0,239,239,58,183,129,0,0,0,0,0,251,116,183,129,0,0,0,0,0,119,221,183,129,0,0,0,0,0,212,200,183,129,0,0,0,0,0,165,44,183,129,0,0,0,0,0,77,100,183,129,0,0,0,0,0,209,79,183,129,0,0,0,0,0,95,196,183,129,0,0,0,0,0,73,25,183,129,0,0,0,0,0,28,57,183,129,0,0,0,0,0,80,213,183,129,0,0,0,0,0,121,110,183,129,0,0,0,0,0,140,45,183,129,0,0,0,0,0,138,79,183,129,0,0,0,0,239,230,111,183,129,0,0,0,0,0,84,195,183,129,0,0,0,0,0,100,42,183,129,0,0,0,0,239,64,58,183,129,0,0,0,0,0,70,100,183,129,0,0,0,0,0,139,40,183,129,0,0,0,0,0,24,4,183,129,0,0,0,0,0,138,212,183,129,0,0,0,0,0,76,249,183,129,0,0,0,0,0,171,71,183,129,0,0,0,0,239,25,58,183,129,0,0,0,0,0,45,79,183,129,0,0,0,0,0,108,86,183,129,0,0,0,0,0,60,80,183,129,0,0,0,0,0,205,116,183,129,0,0,0,0,0,210,251,183,129,0,0,0,0,0,139,103,183,129,0,0,0,0,0,180,200,183,129,0,0,0,0,239,209,71,183,129,0,0,0,0,0,66,200,183,129,0,0,0,0,0,123,111,183,129,0,0,0,0,0,166,116,183,129,0,0,0,0,0,177,33,183,129,0,0,0,0,0,135,116,183,129,0,0,0,0,0,232,44,183,129,0,0,0,0,0,48,159,183,129,0,0,0,0,0,59,200,183,129,0,0,0,0,0,186,127,183,129,0,0,0,0,0,223,100,183,129,0,0,0,0,0,56,80,183,129,0,0,0,0,0,160,238,183,129,0,0,0,0,0,241,203,183,129,0,0,0,0,0,151,14,183,129,0,0,0,0,0,174,33,183,129,0,0,0,0,0,84,33,183,129,0,0,0,0,0,100,216,183,129,0,0,0,0,0,179,200,183,129,0,0,0,0,0,92,169,183,129,0,0,0,0,0,209,4,183,129,0,0,0,0,239,87,200,183,129,0,0,0,0,0,33,103,183,129,0,0,0,0,0,144,110,183,129,0,0,0,0,0,133,100,183,129,0,0,0,0,0,65,111,183,129,0,0,0,0,0,233,110,183,129,0,0,0,0,0,220,103,183,129,0,0,0,0,0,10,127,183,129,0,0,0,0,239,104,111,183,129,0,0,0,0,0,192,110,183,129,0,0,0,0,0,109,216,183,129,0,0,0,0,0,145,225,183,129,0,0,0,0,239,196,200,183,129,0,0,0,0,0,61,212,183,129,0,0,0,0,239,196,58,183,129,0,0,0,0,0,248,103,183,129,0,0,0,0,0,1,80,183,129,0,0,0,0,0,145,238,183,129,0,0,0,0,0,117,213,183,129,0,0,0,0,0,188,23,183,129,0,0,0,0,0,92,225,183,129,0,0,0,0,0,223,139,183,129,0,0,0,0,0,92,14,183,129,0,0,0,0,239,40,200,183,129,0,0,0,0,0,152,79,183,129,0,0,0,0,0,252,166,183,129,0,0,0,0,0,162,14,183,129,0,0,0,0,0,209,200,183,129,0,0,0,0,0,151,4,183,129,0,0,0,0,0,216,4,183,129,0,0,0,0,0,128,45,183,129,0,0,0,0,0,208,62,183,129,0,0,0,0,0,189,71,183,129,0,0,0,0,239,90,200,183,129,0,0,0,0,0,172,127,183,129,0,0,0,0,0,216,168,183,129,0,0,0,0,0,58,220,183,129,0,0,0,0,0,103,238,183,129,0,0,0,0,0,104,42,183,129,0,0,0,0,0,73,221,183,129,0,0,0,0,0,132,58,183,129,0,0,0,0,0,107,58,183,129,0,0,0,0,0,114,249,183,129,0,0,0,0,0,146,216,183,129,0,0,0,0,0,73,127,183,129,0,0,0,0,0,51,212,183,129,0,0,0,0,239,186,71,183,129,0,0,0,0,0,213,110,183,129,0,0,0,0,0,191,14,183,129,0,0,0,0,0,191,159,183,129,0,0,0,0,0,154,45,183,129,0,0,0,0,0,203,231,183,129,0,0,0,0,0,202,52,183,129,0,0,0,0,0,115,169,183,129,0,0,0,0,0,45,52,183,129,0,0,0,0,0,177,221,183,129,0,0,0,0,0,236,45,183,129,0,0,0,0,0,209,53,183,129,0,0,0,0,0,70,4,183,129,0,0,0,0,0,249,213,183,129,0,0,0,0,0,7,42,183,129,0,0,0,0,0,92,166,183,129,0,0,0,0,0,151,79,183,129,0,0,0,0,0,14,23,183,31,66,0,0,0,35,50,56,151,76,186,126,56,0,0,0,0,0,184,0,0,0,184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,188,31,133,26,5,161,54,4,180,113,68,202,177,96,244,58,170,55,128,58,74,230,218,255,69,235,147,13,212,15,250,216,26,112,19,167,77,181,60,244,234,36,69,96,161,63,59,58,107,208,203,136,148,176,212,69,65,95,224,212,169,87,188,57,189,84,96,59,137,21,209,90,232,96,46,59,81,154,208,147,90,113,47,148,26,204,38,239,144,96,244,130,23,61,224,227,108,197,8,104,128,200,22,55,6,170,248,100,155,168,161,181,41,216,92,74,35,56,31,182,1,75,102,47,195,119,78,210,136,63,148,163,109,45,81,97,18,221,28,89,102,34,180,189,88,237,146,203,9,199,195,71,228,40,185,184,227,49,81,219,244,200,20,59,93,135,105,68,89,80,21,35,203,162,92,223,30,249,24,222,68,4,228,252,126,112,232,225,55,127,85,62,103,131,105,69,18,71,71,76,67,200,220,133,125,115,70,216,232,152,23,102,143,4,110,206,255,226,137,149,26,16,13,37,25,45,107,228,174,31,91,102,82,38,146,228,185,33,32,228,242,236,130,43,75,83,196,111,44,140,205,178,74,1,255})
--