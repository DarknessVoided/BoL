_G.ScriptologyVersion     = 2.201
_G.ScriptologyLoaded      = false
_G.ScriptologyLoadAwareness = true
_G.ScriptologyLoadEvade     = true
_G.ScriptologyAutoUpdate    = true
_G.ScriptologyConfig        = scriptConfig("Scriptology Loader", "Scriptology"..myHero.charName)

-- { Load

  function OnLoad()
    Update()
    LoadSpellData()
    LoadAwareness()
    LoadEvade()
    LoadOrbwalker()
    LoadChampion()
    Msg("Loaded!")
    OnAfterLoad()
  end

    function Update()
      local serverdata = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Scriptology.version?no-cache="..math.random(1, 25000))
      if serverdata and serverdata ~= nil and tonumber(serverdata) ~= nil and type(tonumber(serverdata)) == "number" and tonumber(serverdata) > ScriptologyVersion then
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Scriptology.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH.."Scriptology.lua", function() DelayAction(Msg, 3, {"Updated from v"..ScriptologyVersion.." to "..serverdata..". Please press F9 twice to reload."}) end)
      end
    end

    function LoadSpellData()
      if FileExist(LIB_PATH .. "SpellData.lua") then
        _G.spellData = loadfile(LIB_PATH .. "SpellData.lua")()
        _G.myHeroSpellData = spellData[myHero.charName]
      else
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/SpellData.lua".."?rand="..math.random(1,10000), LIB_PATH.."SpellData.lua", function() LoadSpellData() end)
      end
    end

    -- { Awareness 

      function LoadAwareness()
          if _G.PrinceViewVersion == nil then
          ScriptologyConfig:addSubMenu("Awareness", "Awareness")
          ScriptologyConfig.Awareness:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
          ScriptologyConfig.Awareness:setCallback("activate", function(var) if var then LoadAwareness2() else UnloadAwareness() end end)
          if ScriptologyConfig.Awareness.activate then LoadAwareness2() end
        end
      end

        function LoadAwareness2()
          Awarerino = Awareness()
          Msg("Plugin: 'Awareness' loaded")
        end

        function UnloadAwareness()
          Awarerino = nil
          package.loaded["Awareness"] = false
          Msg("Plugin: 'Awareness' unloaded")
        end

    -- }

    -- { Evade

      function LoadEvade()
        ScriptologyConfig:addSubMenu("Evade", "Evade")
        DelayAction(function()
          if _G.Evadeee_Loaded == nil and _G.Evade == nil and _G.Evading == nil and _G.evade == nil and _G.evading == nil and ScriptologyLoadEvade then
            ScriptologyConfig.Evade:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
            ScriptologyConfig.Evade:setCallback("activate", function(var) if var then LoadEvade2() else UnloadEvade() end end)
            if ScriptologyConfig.Evade.activate then LoadEvade2() end
          else
            ScriptologyConfig.Evade:addParam("info", "Evade script found!", SCRIPT_PARAM_INFO, "")
          end
        end, 10)
      end

        function LoadEvade2()
          Dodgerino = EvadeS()
          Msg("Plugin: 'Evade' loaded")
        end

        function UnloadEvade()
          Dodgerino = nil
          package.loaded["EvadeS"] = false
          Msg("Plugin: 'Evade' unloaded")
        end

    -- }

    -- { Orbwalker

      function LoadOrbwalker()
        if _G.AutoCarry then
          if _G.Reborn_Initialised then
            Msg("Found SAC: Reborn")
          else
            Msg("Found SAC: Revamped")
          end
        elseif _G.Reborn_Loaded then
          DelayAction(LoadOrbwalker, 1)
        elseif _G.MMA_Loaded then
          Msg("Found MMA")
        elseif _G.NebelwolfisOrbWalkerLoaded then
          Msg("Found NOW")
        elseif _G.NebelwolfisOrbWalkerInit then
          DelayAction(LoadOrbwalker, 1)
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
            NOW = NebelwolfisOrbWalker(ScriptologyConfig.Orbwalker)
            Msg("Nebelwolfi's Orb Walker loaded!")
          elseif ScriptologyConfig.Orbwalker.info == 2 then
            require "SxOrbwalk"
            isSxOrb = true
            SxOrb:LoadToMenu(ScriptologyConfig.Orbwalker)
            Msg("SxOrbWalk loaded!")
          elseif ScriptologyConfig.Orbwalker.info == 3 then
            require "SOW"
            require "VPrediction"
            isSOW = true
            _G.VP = VPrediction()
            SOWVP = SOW(VP)
            SOWVP:LoadToMenu(ScriptologyConfig.Orbwalker)
            Msg("Loaded Simple Orb Walker!")
          elseif ScriptologyConfig.Orbwalker.info == 4 then
            require "Big Fat Orbwalker"
            _G["BigFatOrb_DisableAttacks"] = false
            _G["BigFatOrb_DisableMove"] = false
            isBFW = true
            Msg("Loaded Big Fat Orbwalker!")
          end
        end

        local TICKER = Ticker()
        function scriptConfig:clear(clearParams, clearSubMenus, clearTargetSelectors)
          assert(type(clearParams) == "boolean" and type(clearSubMenus) == "boolean", "ImprovedScriptConfig: wrong argument types (<boolean>, <boolean> expected)")

          if clearParams then
            while #self._param > 0 do
              self:removeParam(self._param[1].var)
            end
          end

          if clearTargetSelectors then
            self._tsInstances = {}
          end

          if clearSubMenus then
            while #self._subInstances > 0 do
              local subMenu = self._subInstances[1]
              subMenu:clear(clearParams, clearSubMenus, clearTargetSelectors)
              subMenu._parent = nil
              table.remove(self._subInstances, self:getSubMenuIndex(subMenu.name))
            end
          end
        end

        function scriptConfig:removeSubMenu2(name)
          assert(type(name) == "string", "ImprovedScriptConfig: wrong argument types (<string> expected)")

          local subMenu = self[name]
          local subMenuName = self.name .. "_" .. name
          
          for _, k in pairs(subMenu._parent._subInstances) do
            if k.name:lower():find(name:lower()) then
              k:clear(true,true,true)
              k = nil
            end
          end

          subMenu = nil
          self[name] = nil
          return true
        end

        function UnloadOrb()
          if isNOW then
            NOW = nil
            package.loaded["Nebelwolfi's Orb Walker"] = false
          end
          if isSxOrb then
            _G.SxOrb = nil
            package.loaded["SxOrbwalk"] = false
          end
          if isSOW then
            SOWVP = nil
            package.loaded["SOW"] = false
          end
          if isBFW then
            _G["BigFatOrb_DisableAttacks"] = true
            _G["BigFatOrb_DisableMove"] = true
            package.loaded["Big Fat Orbwalker"] = false
          end
          Msg("OrbWalker unloaded!")
          ScriptologyConfig.Orbwalker:clear(true, true)
          --pcall(function() ScriptologyConfig:removeSubMenu2("Orbwalker") end)
          DelayAction(function()
            --ScriptologyConfig:addSubMenu("Orbwalker", "Orbwalker")
            ScriptologyConfig.Orbwalker:addParam("info", "Choose your Orbwalker", SCRIPT_PARAM_LIST, 1, {"Nebelwolfi's Orb Walker", "SxOrbWalk", "Simple Orb Walk", "Big Fat Walk"})
            ScriptologyConfig.Orbwalker:addParam("activate", "Activate the chosen one", SCRIPT_PARAM_ONOFF, false)
            ScriptologyConfig.Orbwalker:setCallback("activate", function(var) if var then LoadOrb() else UnloadOrb() end end)
          end, 0.5)
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
        SilentUpdate()
        if not Champerino then return end
        SetupPredictionMenu()
        SetupTargetSelector()
        InitMenu()
        InitVars()
        AddPluginTicks()
      end
        
        function SilentUpdate()
          DelayAction(function() DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/SpellData.lua".."?rand="..math.random(1,10000), LIB_PATH.."SpellData.lua", function() LoadSpellData() end) end, 5)
        end

        function SetupPredictionMenu()
          ScriptologyConfig:addSubMenu("Prediction", "Prediction")
          Prediction = {}
          predictionStringTable = {}
          for _, k in pairs({VP = "VPrediction", SP = "SPrediction", HP = "HPrediction"}) do
            if FileExist(LIB_PATH .. k .. ".lua") then
              require(k)
              if _G[_] then
                Prediction[_] = _G[_]
              else
                require(k)
                _G[_] = _G[k]()
                Prediction[_] = _G[_]
              end
              table.insert(predictionStringTable, k)
            end
          end
          table.sort(predictionStringTable)
          table.sort(Prediction)
          if VIP_USER and FileExist(LIB_PATH.."DivinePred.lua") and FileExist(LIB_PATH.."DivinePred.luac") then
            require "DivinePred"
            _G.DP = DivinePred()
            Prediction["DP"] = _G.DP
            table.insert(predictionStringTable, "DivinePred")
          end
          local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R", [-1] = "Q2", [-2] = "Q3"}
          local SetupHPredSpell = function(k)
              spell = myHeroSpellData[k]
              if not HPSpells then HPSpells = {} end
              if spell.type == "linear" then
                  if spell.speed ~= math.huge then 
                    if spell.collision then
                      HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay, collisionM = spell.collision, collisionH = spell.collision})
                    else
                      HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay})
                    end
                  else
                    HPSpells[k] = HPSkillshot({type = "PromptLine", range = spell.range, width = 2*spell.width, delay = spell.delay})
                  end
              elseif spell.type == "circular" then
                  if spell.speed ~= math.huge then 
                    HPSpells[k] = HPSkillshot({type = "DelayCircle", range = spell.range, speed = spell.speed, radius = spell.width, delay = spell.delay})
                  else
                    HPSpells[k] = HPSkillshot({type = "PromptCircle", range = spell.range, radius = spell.width, delay = spell.delay})
                  end
              else
                HPSpells[k] = HPSkillshot({type = "DelayLine", range = spell.range, speed = spell.speed, width = 2*spell.width, delay = spell.delay})
              end
            end
          for m, mode in pairs({Harass = {"Harass", 1.5}, LastHit = {"LastHit", 1.2}, Combo = {"Combo", 2}, LaneClear = {"LaneClear", 1}}) do
            ScriptologyConfig.Prediction:addSubMenu(mode[1].." Settings", mode[1])
            for _=-2, 3 do
              if myHeroSpellData[_] and myHeroSpellData[_].type then
                ScriptologyConfig.Prediction[mode[1]]:addParam("pred"..str[_], str[_].." Settings", SCRIPT_PARAM_LIST, 1, predictionStringTable)
                ScriptologyConfig.Prediction[mode[1]]:addParam("pred"..str[_].."val", "-> Accuracy", SCRIPT_PARAM_SLICE, mode[2], 0, 3, 1)
                if _G.HP ~= nil then
                  SetupHPredSpell(_)
                end
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
          Config:addSubMenu("Killsteal","Killsteal")
          Config:addSubMenu("Misc","Misc")
          Config:addSubMenu("Draws","Draws")
            Config.Draws:addParam("Q", "Draw Q", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("W", "Draw W", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("E", "Draw E", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("R", "Draw R", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("DMG", "Draw DMG", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("LFC", "Use LFC", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("PermaShow", "Perma Show", SCRIPT_PARAM_ONOFF, true)
            Config.Draws:addParam("OpacityQ", "Opacity Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
            Config.Draws:addParam("OpacityW", "Opacity W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
            Config.Draws:addParam("OpacityE", "Opacity E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
            Config.Draws:addParam("OpacityR", "Opacity R", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
          Config:addSubMenu("Key Settings","kConfig")
        end

        function InitVars()
          sReady = {}
          for _=0, 3 do
            sReady[_] = myHero:CanUseSpell(_) == 0
          end
          Mobs = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC)
          JMobs = minionManager(MINION_JUNGLE, 750, myHero, MINION_SORT_HEALTH_ASC)
          buffStackTrackList = { ["Darius"] = "dariushemo", ["Kalista"] = "kalistaexpungemarker", ["TahmKench"] = "tahmpassive", ["Vayne"] = "vaynesilvereddebuff" }
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
          if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
          if myHero:GetSpellData(SUMMONER_1).name:find("summonersmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonersmite") then Smite = SUMMONER_2 end
          str = {[-2] = "Q3", [-1] = "Q2", [_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R", [4] = "I", [5] = "S"}
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
          tickTable = {
            function() 
              targetSel:update()
              Target = ValidTarget(Forcetarget) and Forcetarget or targetSel.target
              Mobs:update()
              JMobs:update()
              for _=0, 12 do
                sReady[_] = myHero:CanUseSpell(_) == 0
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
                if Config.kConfig.Combo and ValidTarget(Target) then
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

    -- }

-- }

-- { Global functions

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
    local text = "<font color=\"#ff0000\">[</font><font color=\"#ff2a00\">S</font><font color=\"#ff5500\">c</font><font color=\"#ff7f00\">r</font><font color=\"#ff9f00\">i</font><font color=\"#ffbf00\">p</font><font color=\"#ffdf00\">t</font><font color=\"#ffff00\">o</font><font color=\"#aaff00\">l</font><font color=\"#55ff00\">o</font><font color=\"#00ff00\">g</font><font color=\"#00ff55\">y</font><font color=\"#00ffaa\"> </font><font color=\"#00ffff\">L</font><font color=\"#00bfff\">o</font><font color=\"#0080ff\">a</font><font color=\"#0040ff\">d</font><font color=\"#0000ff\">e</font><font color=\"#2e00ff\">r</font><font color=\"#5d00ff\">]</font><font color=\"#8b00ff\">:</font>"
    if not skip then
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
  end

  function DrawRange()
    if myHero.charName == "Jayce" or myHero.charName == "Nidalee" or myHero.charName == "Riven" then return end
    if Config.Draws.Q and sReady[_Q] and myHeroSpellData[0] then
      DrawLFC(myHero.x, myHero.y, myHero.z, myHero.charName == "Rengar" and myHero.range+myHero.boundingRadius*2 or myHeroSpellData[0].range > 0 and myHeroSpellData[0].range or myHeroSpellData[0].width, ARGB(255*Config.Draws.OpacityQ/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityQ/100)))
    end
    if myHero.charName ~= "Orianna" then
      if Config.Draws.W and sReady[_W] and myHeroSpellData[1] then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(myHeroSpellData[1].range) == "function" and myHeroSpellData[1].range() or myHeroSpellData[1].range > 0 and myHeroSpellData[1].range or myHeroSpellData[1].width, ARGB(255*Config.Draws.OpacityW/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityW/100)))
      end
      if Config.Draws.E and sReady[_E] and myHeroSpellData[2] then
        DrawLFC(myHero.x, myHero.y, myHero.z, myHeroSpellData[2].range > 0 and myHeroSpellData[2].range or myHeroSpellData[2].width, ARGB(255*Config.Draws.OpacityE/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityE/100)))
      end
      if Config.Draws.R and (sReady[_R] or myHero.charName == "Katarina") and myHeroSpellData[3] then
        DrawLFC(myHero.x, myHero.y, myHero.z, type(myHeroSpellData[3].range) == "function" and myHeroSpellData[3].range() or myHeroSpellData[3].range > 0 and myHeroSpellData[3].range or myHeroSpellData[3].width, ARGB(255*Config.Draws.OpacityR/100, (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100), (Config.Draws.LFC and 255 or 255*Config.Draws.OpacityR/100)))
      end
    end
  end

  function DrawDmgOnHpBar(hero)
    if not Config.Draws.DMG then return end
    if hero and not hero.dead and hero.visible then
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
    if Forcetarget ~= nil and Forcetarget.visible and not Forcetarget.dead then
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
    end
    end

  function DrawLFC(x, y, z, radius, color)
    if Config.Draws.LFC then
      DrawCircle3D(x, y, z, radius, 1, color, 32)
    else
      local radius = radius or 300
      DrawCircle(x, y, z, radius, color)
    end
  end

  function CalculateDamage()
    if not Config.Draws.DMG then return end
    for i, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible then
        local damageQ = not sReady[_Q] and 0 or myHero.charName == "Kalista" and 0 or GetDmg(_Q, myHero, enemy) or 0
        local damageW = not sReady[_W] and 0 or GetDmg(_W, myHero, enemy) or 0
        local damageE = not sReady[_E] and 0 or GetDmg(_E, myHero, enemy) or 0
        local damageR = not sReady[_R] and 0 or GetDmg(_R, myHero, enemy) or 0
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
      local ADDmg            = 0
      local APDmg            = 0
      local TRUEDmg          = 0
      local AP               = source.ap
      local Level            = source.level
      local TotalDmg         = source.totalDamage
      local crit         = myHero.critChance
      local crdm         = myHero.critDmg
      local ArmorPen         = math.floor(source.armorPen)
      local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
      local MagicPen         = math.floor(source.magicPen)
      local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

      local Armor        = target.armor*ArmorPenPercent-ArmorPen
      local ArmorPercent = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or 0--math.ceil(Armor*100/(100-Armor))/100
      local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
      local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

      if spell == "IGNITE" then
        return 50+20*Level/2
      elseif spell == "Tiamat" then
        ADDmg = (GetHydraSlot() and source:CanUseSpell(GetHydraSlot()) == READY) and TotalDmg*0.8 or 0 
      elseif spell == "AD" then
        ADDmg = TotalDmg
        if source.charName == "Ashe" then
          ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
        elseif source.charName == "Teemo" then
          APDmg = APDmg + myHeroSpellData[_E].dmgAP(source, target)
        elseif source.charName == "Orianna" then
          APDmg = APDmg + 2 + 8 * math.ceil(Level/3) + 0.15*AP
        else
          ADDmg = ADDmg * (1 + crit)
        end
        if source.charName == "Vayne" and GetStacks(target) == 2 then
          TRUEDmg = TRUEDmg + myHeroSpellData[_W].dmgTRUE(source, target)
        end
        if GetMaladySlot() then
          APDmg = 15 + 0.15*AP
        end
      elseif type(spell) == "number" and myHeroSpellData[spell] then
        if myHeroSpellData[spell].dmgAD then ADDmg = myHeroSpellData[spell].dmgAD(source, target, GetStacks(target)) end
        if myHeroSpellData[spell].dmgAP then APDmg = myHeroSpellData[spell].dmgAP(source, target, GetStacks(target)) end
        if myHeroSpellData[spell].dmgTRUE then TRUEDmg = myHeroSpellData[spell].dmgTRUE(source, target, GetStacks(target)) end
      end
      dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
      dmgMod = (UnitHaveBuff(source, "summonerexhaust") and 0.6 or 1) * (UnitHaveBuff(target, "meditate") and 1-(target:GetSpellData(_W).level * 0.05 + 0.5) or 1)
      return math.floor(dmg) * dmgMod
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
    if not spell then return end
    if not target then
      CastSpell(spell)
    elseif target and type(target) ~= "number" and not target.networkID then
      CastSpell(spell, target.x, target.z)
    elseif target and type(target) ~= "number" and target.networkID then
      if myHeroSpellData[spell] and myHeroSpellData[spell].type then
        local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R", [-1] = "Q2", [-2] = "Q3"}
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
          CastSpell(spell, target.x, target.z)
        end
      else
        CastSpell(spell, target)
      end
    end
  end

  function Predict(spell, from, to, mode)
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
      local col = myHeroSpellData[spell].collision and ((from.charName=="Lux" or from.charName=="Veigar") and 1 or 0) or math.huge
      local x1, x2, x3 = _G.HP:GetPredict(HPSpells[spell], to, from, col)
        return x1, x2*2, x3
    elseif predictionStringTable[activePrediction] == "DivinePred" then
      local spell = myHeroSpellData[spell]
      local unit = DPTarget(to)
      local col = spell.collision and ((from.charName=="Lux" or from.charName=="Veigar") and 1 or 0) or math.huge
      if spell.type == "linear" then
        Spell = LineSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
      elseif spell.type == "circular" then
        Spell = CircleSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
      elseif spell.type == "cone" then
        Spell = ConeSS(spell.speed, spell.range, spell.width, spell.delay * 1000, col)
      end
      local State, Position, perc = _G.DP:predict(unit, Spell, 1.2, Vector(from))
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

  function GetClosestMinion(range)
    local minionTarget = nil
    for i, minion in pairs(Mobs.objects) do
      if minion and minion.visible and not minion.dead and GetDistanceSqr(minion) < range*range then
        if minionTarget == nil then 
          minionTarget = minion
        elseif GetDistance(minionTarget) > GetDistance(minion) then
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

  function GetJFarmPosition(range, width)
    local BestPos 
    local BestHit = 0
    local objects = JMobs.objects
    for i, object in ipairs(objects) do
      local hit = CountObjectsNearPos(object.pos or object, range, width, objects)
      if hit > BestHit and object.health < 100000 and GetDistanceSqr(object) < range * range then
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
        _SetPriority(priorityTable2.p1, enemy, math.min(1, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p2, enemy, math.min(2, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p3,  enemy, math.min(3, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p4,  enemy, math.min(4, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p5,  enemy, math.min(5, #GetEnemyHeroes()))
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
    str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R", [-1] = "Q2", [-2] = "Q3"}
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

-- }

-- { classes

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
class "KogMax"
class "LeBlanc"
class "LeeSin"
class "Lissandra"
class "Lux"
class "Malzahar"
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
class "Vayne"
class "Veigar"
class "Viktor"
class "Vladimir"
class "Volibear"
class "Yasuo"
class "Yorick"

-- { Ahri

  function Ahri:__init()
    self.Orb = nil
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
    if unit and unit.isMe and not self.Orb then
      if spell.name == "AhriOrbofDeception" then
        self.Orb = {time = os.clock(), dir = Vector(spell.endPos)}
      end
      if spell.name == "AhriTumble" then
        if self.ultOn < os.clock()-10 then 
          self.ultOn = os.clock() 
        end
      end
    end
  end

  function Ahri:Tick()
    if Config.Misc.Qc then 
      self:CatchQ() 
    end
  end

  function Ahri:Draw()
    if self.Orb and self.Orb.time > os.clock()-2 then
      local draw = Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(myHeroSpellData[0].range-GetDistance(self.Orb.dir))
      DrawLine3D(myHero.x, myHero.y, myHero.z, draw.x, draw.y, draw.z, myHeroSpellData[0].width, ARGB(35, 255, 255, 255))
    else
      self.Orb = nil
    end
  end

  function Ahri:LastHit()
    for i, minion in pairs(Mobs.objects) do 
      if minion and not minion.dead and minion.visible then
        local health = GetRealHealth(minion) 
        for _=0,3 do
          if sReady[_] and GetDmg(_, myHero, minion) >= health and GetDistanceSqr(minion) < myHeroSpellData[_].range^2 and ((Config.kConfig.LastHit and Config.LastHit[str[_]] and Config.LastHit["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear[str[_]] and Config.LaneClear["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana)) then
            Cast(_, minion)
            return;
          end
        end
      end
    end
    for i, minion in pairs(JMobs.objects) do 
      if minion and not minion.dead and minion.visible then
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
      minion = GetClosestMinion(myHeroSpellData[_W].range)
      if minion and GetRealHealth(minion) < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      minion = GetLowestMinion(myHeroSpellData[_E].range)
      if minion and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_E] and Config.Combo.E and GetDistance(Target) < myHeroSpellData[2].range then
      Cast(_E, Target)
    end
    if UnitHaveBuff(Target, "ahriseduce") then
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < myHeroSpellData[0].range then
        Cast(_Q, Target)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < myHeroSpellData[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < myHeroSpellData[0].range then
        Cast(_Q, Target)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < myHeroSpellData[1].range then
        Cast(_W)
      end
      if Config.Combo.R then
        self:CatchQ()
      end
    end
    if Config.Combo.R and GetRealHealth(Target) < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < myHeroSpellData[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    elseif Config.Combo.R and self.ultOn > os.clock()-10 and (not self.Orb or self.Orb.time < os.clock()-1.5) and GetDistance(Target) < myHeroSpellData[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb and self.Orb.dir and self.Orb.time > os.clock()-1.5  then
      local x,y,z = _G.VP:GetLineCastPosition(Target, myHeroSpellData[0].delay, myHeroSpellData[0].width, myHeroSpellData[0].range, myHeroSpellData[0].speed, Vector(Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(myHeroSpellData[0].range-GetDistance(self.Orb.dir))), myHeroSpellData[0].collision)
      local x = Vector(self.Orb.dir)+(x-Vector(self.Orb.dir)):normalized()*(myHeroSpellData[0].range)
      if self.ultOn > os.clock()-10 then
        x = Vector(x)-(Vector(Target)-myHero):normalized()*myHeroSpellData[3].range
        Cast(_R,x)
      end
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_Q] and health < GetDmg(_Q, myHero, enemy)*2 and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[0].range^2 then
          Cast(_Q, enemy)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          Cast(_W)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_R, ultPos)
        elseif sReady[_Q] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.Q and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_Q, enemy)
          Cast(_R, enemy)
        elseif sReady[_W] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[3].range^2 then
          Cast(_W)
          Cast(_R, ultPos)
        elseif sReady[_E] and sReady[_R] and health < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_R, ultPos) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and GetDistanceSqr(enemy) < myHeroSpellData[1].range^2 then
          Cast(_Q, enemy)
          Cast(_W)
        elseif sReady[_Q] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_W] and sReady[_E] and health < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_W) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and sReady[_E] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) Cast(_W) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        elseif sReady[_Q] and sReady[_W] and sReady[_E] and sReady[_R] and health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and GetDistanceSqr(enemy) < myHeroSpellData[2].range^2 then
          Cast(_E, enemy)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy) Cast(_W) Cast(_R, ultPos) end end, myHeroSpellData[2].delay+GetDistance(enemy)/myHeroSpellData[2].speed)
        end
      end
    end
  end

-- }

  function Ashe:__init()
  end

  function Awareness:__init()
  end

  function Azir:__init()
  end

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
        DrawLine3D(myHero.x, myHero.y, myHero.z, Target.x,       Target.y,       Target.z,       1, ARGB(255,55,55,255))
        DrawLFC(CastPosition.x, CastPosition.y, CastPosition.z, myHeroSpellData[0].width, ARGB(255, 0, 255, 0))
        DrawLFC(Target.x,       Target.y,       Target.z,     myHeroSpellData[0].width, ARGB(255, 255, 0, 0))
              DrawText("Active Prediction: "..predictionStringTable[activeMode.predQ], 25, WINDOW_W/8, WINDOW_H/4+75, ARGB(255, 255, 255, 255))
              HitChance = math.ceil((HitChance > 3 and 300 or HitChance*100)/3)
              DrawText("Current HitChance: "..(HitChance < 0 and 0 or HitChance).."%", 25, WINDOW_W/8, WINDOW_H/4+100, ARGB(255, 255, 255, 255))
      end
    end
    if self.grabsThrown > 0 and self.grabsLanded > 0 then
      DrawText("Total HitChance: "..(math.ceil(100*self.grabsLanded/self.grabsThrown)).."%", 25, WINDOW_W/8, WINDOW_H/4, ARGB(255, 255, 255, 255))
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
    if unit and buff and unit.team == myHero.team and unit.type == myHero.type and buff.name:lower():find("grab") then
      self.grabsLanded = self.grabsLanded + 1
      if (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harass and Config.Harass.E and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100) then
        Cast(_E)
      end
    end
  end

  function Blitzcrank:GrabSomeone()
    for _, enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible and not Config.Misc[enemy.charName] and GetDistanceSqr(enemy) < myHeroSpellData[_Q].range^2 then
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
      if enemy and not enemy.dead and enemy.visible then
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

  function Brand:__init()
  end

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
      if minion and not minion.dead and minion.visible then   
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if (UnitHaveBuff(minion, "poison") or Config.Misc.Enp) and EMinionDmg >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[2].range^2 then
          CastSpell(_E, minion)
        end
      end
    end
    for _, minion in pairs(JMobs.objects) do
      if minion and not minion.dead and minion.visible then   
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
      BestPos, BestHit = GetJFarmPosition(myHeroSpellData[_Q].range, myHeroSpellData[_Q].width)
      if BestHit > 0 then 
        CastSpell(_Q, BestPos.x, BestPos.z)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
      if BestHit > 0 then 
        CastSpell(_W, BestPos.x, BestPos.z)
      end
      BestPos, BestHit = GetJFarmPosition(myHeroSpellData[_W].range, myHeroSpellData[_W].width)
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
      for minion,winion in pairs(JMobs.objects) do
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
        if minion and not minion.dead and minion.visible then
          local EMinionDmg = GetDmg(_E, myHero, minion)  
          if (UnitHaveBuff(minion, "poison") or Config.LastHit.Enp) and EMinionDmg >= GetRealHealth(minion) and GetDistanceSqr(minion) < myHeroSpellData[2].range^2 then
            CastSpell(_E, minion)
          end      
        end
      end   
      for i, minion in pairs(JMobs.objects) do 
        if minion and not minion.dead and minion.visible then   
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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
          Cast(_R, enemy, 2)
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
        DelayAction(function() Cast(_W) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Darius:Combo()
    if Config.Combo.Qd and sReady[_Q] and GetDistance(Target) >= 250 then
      self:CastQOuter(Target)
    elseif Config.Combo.Qs and sReady[_Q] and GetDistance(Target) < 250 then
      Cast(_Q)
    end
    if Config.Combo.E and sReady[_E] then
      Cast(_E, Target)
    end
    if Config.Combo.R and sReady[_R] and GetDmg(_R, myHero, Target) > GetRealHealth(Target) then
      Cast(_R, Target)
    end
  end

  function Darius:Harass()
    if Config.Harass.Qd and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100 and sReady[_Q] and GetDistance(Target) >= 250 then
      self:CastQOuter(Target)
    elseif Config.Harass.Qs and Config.Harass.manaQ < myHero.mana/myHero.maxMana*100 and sReady[_Q] and GetDistance(Target) < 250 then
      Cast(_Q)
    end
  end

  function Darius:LaneClear()
    if sReady[_Q] and Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(0, myHeroSpellData[0].width)
      if BestHit > 1 and GetDistance(BestPos) < 150 then 
        Cast(_Q)
      end
    end
  end

  function Darius:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg1 = GetDmg(_Q, myHero, winion)*1.5
        local MinionDmg2 = GetDmg(_Q, myHero, winion)
        local health = GetRealHealth(winion)
        if MinionDmg2 and MinionDmg2 >= health and ValidTarget(winion, 450) then
          Cast(_Q)
        elseif MinionDmg1 and MinionDmg1 >= health and ValidTarget(winion, 450) then
          CastQOuter(winion)
        end
      end
    end
  end

  function Darius:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local qDmg = ((GetDmg(_Q, myHero, enemy)*1.5) or 0) 
        local q1Dmg = ((GetDmg(_Q, myHero, enemy)) or 0)  
        local wDmg = ((GetDmg(_W, myHero, enemy)) or 0)   
        local rDmg = ((GetDmg(_R, myHero, enemy)) or 0)
        local iDmg = (50 + 20 * myHero.level)
        local health = GetRealHealth(enemy)
        if myHero:GetSpellData(_R).level == 3 and sReady[_R] and health < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and health < qDmg and Config.Killsteal.Q and ValidTarget(enemy, 450) then
          self:CastQ(enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and health < q1Dmg and Config.Killsteal.Q and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) and sReady[_W] and health < wDmg and Config.Killsteal.W then
          if ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
            CastSpell(_W, myHero:Attack(enemy))
          elseif ValidTarget(enemy, myHeroSpellData[2].range*(Config.Misc.offsetE/100)) and sReady[_E] then
            self:CastE(enemy)
            DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif myHero:CanUseSpell(_R) and sReady[_R] and health < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
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
      Cast(_Q)
    end
  end

-- }

  function Diana:__init() --
  end

  function Draven:__init()
  end

  function DrMundo:__init()
  end

  function Ekko:__init()
  end

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
      if minion and not minion.dead and GetDistanceSqr(minion) < 1000 * 1000 and GetStacks(minion) > 0 then
        local damageE = GetDmg(_E, myHero, minion)
        local health = GetRealHealth(minion)
        if damageE > health then
          DrawText3D("E Kill", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        else
          DrawText3D(math.floor(damageE/health*100).."%", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        end
      end
    end
    for _, minion in pairs(JMobs.objects) do
      if minion and not minion.dead and GetDistanceSqr(minion) < 1000 * 1000 and GetStacks(minion) > 0 then
        local damageE = GetDmg(_E, myHero, minion)
        local health = GetRealHealth(minion)
        if damageE > health then
          DrawText3D("E Kill", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        else
          DrawText3D(math.floor(damageE/health*100).."%", minion.x-45, minion.y-45, minion.z+45, 20, ARGB(255,250,250,250), 0)
        end
      end
    end
  end

  function Kalista:ProcessSpell(unit, spell)
    if not unit or not spell then return end
    if spell.name == "KalistaPSpellCast" and GetDistance(spell.target) < 1000 then 
      self.soulMate = spell.target
      Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
      ScriptologyMsg("Soulmate found: "..spell.target.charName)
    end
    if Config.Misc.Ed and not myHero.dead and unit.team ~= myHero.team and ((myHero == spell.target and GetDmg("AD", spell.target, myHero) > myHero.health) or (GetDistance(spell.endPos,myHero) < myHero.boundingRadius*3 and myHero.health/myHero.maxHealth < 0.15)) then
      Cast(_E)
    end
      if not self.soulMate or unit.type ~= myHero.type then return end
    if Config.Misc.R and not myHero.dead and not self.soulMate.dead and self.saveAlly and GetDistanceSqr(self.soulMate) < myHeroSpellData[3].range^2 and unit.team ~= self.soulMate.team and (self.soulMate == spell.target or GetDistance(spell.endPos,self.soulMate) < self.soulMate.boundingRadius*3) then
      Cast(_R)
      ScriptologyMsg("Saving soulmate from spell: "..spell.name)
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
      for _, minion in pairs(JMobs.objects) do
        if minion and not minion.dead and GetStacks(minion) > 0 and GetDistanceSqr(minion) < 1000 * 1000 then
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
              local hp1 = _G.HP:PredictHealth(minion, (math.min(myHero.range+GetDistance(myHero.minBBox), GetDistance(myHero, minion)) / (2000) + 0.07))
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

  function Katarina:__init() --
  end

  function KhaZix:__init()
  end

  function KogMax:__init()
  end

  function LeBlanc:__init()
  end

  function LeeSin:__init()
  end

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
    Config.Misc:addParam("Wa", "Shield with W (auto)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("manaW", "Min Mana % for shield", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Misc:addParam("Ea", "Detonate E (auto)", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_Q, myHeroSpellData[0].range, false, Config.Misc)
  end

  function Lux:Tick()
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" and Config.Misc.Ea then
      Cast(_E)
    end
  end

  function Lux:ProcessSpell(unit, spell)
    if unit and spell and not spell.name:lower():find("attack") and Config.Misc.Wa and unit.team ~= myHero.team and unit.type == myHero.type and not UnitHaveBuff(myHero, "recall") and Config.Misc.manaW <= 100*myHero.mana/myHero.maxMana then
      if spell.target then
        if sReady[_W] and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      else
        local makeUpPos = unit + (Vector(spell.endPos) - unit):normalized() * math.min(1000, GetDistance(unit))
        if GetDistance(spell.endPos) < GetDistance(myHero.pos, myHero.minBBox)*3 or GetDistance(makeUpPos) < GetDistance(myHero.pos, myHero.minBBox)*3 then
          if sReady[_W] and myHero.health/myHero.maxHealth < 0.85 then
            Cast(_W, myHero)
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
    if UnitHaveBuff(Target, "luxilluminati") and Config.Combo.R and sReady[_R] and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= GetRealHealth(Target) then
      Cast(_R, Target)
    end
    if Config.Combo.E and sReady[_E] then
      Cast(_E, Target)
    else
      if Config.Combo.Q and sReady[_Q] and not sReady[_E] then
        Cast(_Q, Target)
      end
      if Config.Combo.R and sReady[_R] and GetDmg(_R, myHero, Target) >= GetRealHealth(Target) then
        Cast(_R, Target)
      end
    end
  end

  function Lux:Harass()
    if not UnitHaveBuff(Target, "luxilluminati") then
      if Config.Harass.Q and sReady[_Q] and Config.Harass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target)
      elseif Config.Harass.E and sReady[_E] and Config.Harass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and enemy ~= nil and not enemy.dead and enemy.visible then
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

  function Malzahar:__init()
  end

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
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[0].range, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.W and sReady[_W] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[1].range, ARGB(255, 155, 155, 155))
      end
      if Config.Draws.E and sReady[_E] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self.data.Human[2].range, ARGB(255, 155, 155, 155))
      end
    else
      if Config.Draws.Q and sReady[_Q] then
        DrawLFC(myHero.x, myHero.y, myHero.z, self:GetAARange(), ARGB(255, 155, 155, 155))
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
      if enemy and not enemy.dead and enemy.visible then
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
        APDmg = (30+20*QLevel+0.4*AP)*math.max(1,math.min(3,GetDistance(target.pos)/1250*3))--kanker
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
    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))
    return math.floor(dmg)
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
        local minion = GetJMinion(self.data.Human[0].range) or GetClosestMinion(myHero)
        if minion and not minion.dead and minion.visible and GetDistanceSqr(minion) < self.data.Human[_Q].range^2 then
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
        if hit == 0 then
          pos, hit = GetJFarmPosition(self.data.Cougar[1].range, self.data.Cougar[1].width)
        end
        if pos and GetDistance(pos) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(pos) <= self.data.Cougar[1].range+self.data.Cougar[1].width and hit > 0 then
          Cast(_W, pos)
        end
      end
      if sReady[_E] and Config.LaneClear.E then
        local pos, hit = GetFarmPosition(self.data.Cougar[2].range, self.data.Cougar[2].range)
        if hit == 0 then
          pos, hit = GetJFarmPosition(self.data.Cougar[2].range, self.data.Cougar[2].range)
        end
        if pos and GetDistanceSqr(pos) < 275^2 and hit > 0 then
          Cast(_E, pos)
        end
      end
      if not self:IsHuman() and not sReady[_Q] and not sReady[_E] and self.spearCooldownUntil < os.clock() and Config.LaneClear.R then
        Cast(_R)
      end
    end
  end

  function Nidalee:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if enemy and not enemy.dead and enemy.visible then
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
          if sReady[_W] and health < self:GetDmg(_W, enemy) and Config.Killsteal.W then if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
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
    Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
  end

  function Orianna:Tick()
    if self.Ball and (GetDistance(self.Ball) <= myHero.boundingRadius*2+7 or GetDistance(self.Ball) > 1250) then
      self.Ball = nil
    end
    if Config.Misc.Ra then
      if Config.Misc.Re >= EnemiesAround(self.Ball or myHero, myHeroSpellData[3].width-myHero.boundingRadius) then
        CastSpell(_R)
      end   
    end
  end

  function Orianna:Draw()
    if self.Ball then
      DrawCircle(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 0x111111)
      for i=0,2 do
        self:LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (math.pi/4.5)*(i))
      end 
      self:LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, myHeroSpellData[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
    end
  end

  function Orianna:LagFree(x, y, z, radius, width, color, quality, degree)
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

  function Orianna:CreateObj(obj)
    if obj and obj.name and obj.valid and obj.name == "TheDoomBall" then
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
        Cast(_Q, tPos)
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
        Cast(_W)
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
          Cast(_W)
        end
        if sReady[_Q] and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= GetRealHealth(winion) and (self.Ball and GetDistance(winion, self.Ball) < myHeroSpellData[1].width or GetDistance(winion) < myHeroSpellData[1].width) then
          Cast(_Q, winion.x, winion.z)
          DelayAction(Cast, 0.25, {_W})
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
      Cast(_W) 
    end  
  end

  function Orianna:CastR(unit)
    if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local a, b, c = Predict(_R, Ball, unit)
    if a and b >= ScriptologyConfig.Prediction.Combo["pred"..str[_R].."val"] then  
      Cast(_R) 
    end  
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local Ball = self.Ball or myHero
        local health = GetRealHealth(enemy)
        local projPos, _, isOnSegment = nil, nil, false
        if self.Ball then
          projPos, _, isOnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, enemy)
        end
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) then
          Cast(_Q, Target, Ball)
        elseif sReady[_W] and health < GetDmg(_W, myHero, enemy) and Config.Killsteal.W then
          self:CastW(enemy)
        elseif sReady[_E] and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and self.Ball and GetDistance(self.Ball) > 150 and isOnSegment and GetDistance(self.Ball)-self.Ball.boundingRadius > GetDistance(enemy) then
          CastSpell(_E, myHero)
        elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif sReady[_R] and health < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
          self:CastR(enemy)
          DelayAction(Cast, myHeroSpellData[3].delay, {_Q, Target, 1.5, Ball})
          DelayAction(function() self:CastW(enemy) end, myHeroSpellData[3].delay+myHeroSpellData[0].delay+GetDistance(Ball,enemy)/myHeroSpellData[0].speed)
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

  function Rengar:__init()
  end

  function Riven:__init()
  end

  function Rumble:__init()
  end

-- { Ryze

  function Ryze:__init()
    self.passiveTracker = 0
  end

  function Ryze:Load()
    self:Menu()
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
    local ready = 0
    for _=0, 3 do
      ready = ready + (sReady[_] and 1 or 0)
    end
    if self.passiveTracker + ready < 5 then
      if sReady[_Q] and Config.Combo.Q then
        Cast(_Q, Target)
      end
      if sReady[_W] and Config.Combo.W and GetDistanceSqr(Target) < myHeroSpellData[_W].range^2 then
        CastSpell(_W, Target)
      end
      if sReady[_E] and Config.Combo.E and GetDistanceSqr(Target) < myHeroSpellData[_E].range^2 then
        CastSpell(_E, Target)
      end
    elseif self.passiveTracker >= 4 and (not sReady[_Q] or not Config.Combo.Q) and sReady[_R] and Config.Combo.R and Config.Combo.Rs then
      Cast(_R)
      return;
    else
      for _=0, 4 do
        if sReady[_] and Config.Combo[str[_]] and GetDistanceSqr(Target) < myHeroSpellData[_].range^2 then
          Cast(_, Target)
          break;
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
      for _=0, 3 do
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
    local target = GetClosestMinion(900)
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

  function Ryze:LastHit()
    for i, minion in pairs(Mobs.objects) do 
      if minion and not minion.dead and minion.visible then
        local health = GetRealHealth(minion) 
        for _=0,3 do
          if sReady[_] and GetDmg(_, myHero, minion) >= health and GetDistanceSqr(minion) < myHeroSpellData[_].range^2 and ((Config.kConfig.LastHit and Config.LastHit[str[_]] and Config.LastHit["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear[str[_]] and Config.LaneClear["mana"..str[_]] <= 100*myHero.mana/myHero.maxMana)) then
            Cast(_, minion)
            return;
          end
        end
      end
    end
    for i, minion in pairs(JMobs.objects) do 
      if minion and not minion.dead and minion.visible then
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

  function Talon:__init()
  end

  function Teemo:__init() --
  end

  function Thresh:__init()
  end

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
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, false)
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
      local pos1 = enemy
      local pos2 = enemy - (Vector(myHero) - enemy):normalized()*(450*Config.Misc.offsetE/100)
      local a = WorldToScreen(D3DXVECTOR3(pos1.x, pos1.y, pos1.z))
      local b = WorldToScreen(D3DXVECTOR3(pos2.x, pos2.y, pos2.z))
      DrawLine(a.x, a.y, b.x, b.y, 1, 0xFFFFFFFF)
      DrawCircle(pos2.x, pos2.y, pos2.z, 50, 0xFFFFFFFF)
    end
  end

  function Vayne:Tick()
    self.roll = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harass and Config.Harass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
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
          DelayAction(function() Cast(_Q, mousePos) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
        end
        if spell.target and spell.target.type == myHero.type and Config.Killsteal.E and sReady[_E] and EnemiesAround(spell.target, 750) == 1 and GetRealHealth(spell.target) < GetDmg(_E, myHero, spell.target)+GetDmg("AD", myHero, spell.target)+(GetStacks(spell.target) >= 1 and GetDmg(_W, myHero, spell.target) or 0) and GetDistance(spell.target) < 650 then
          local t = spell.target
          DelayAction(function() CastSpell(_E, t) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
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
    if not target then
      target = GetLowestMinion(myHeroSpellData[2].range)
    end
    if sReady[_E] and Config.LaneClear.E then
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
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local health = GetRealHealth(enemy)
        if sReady[_Q] and health < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range + myHero.range) then
          Cast(_Q, enemy.pos)
          DelayAction(function() myHero:Attack(enemy) end, 0.25)
        elseif sReady[_E] and self.HP and self.HP:PredictHealth(enemy, (math.min(myHeroSpellData[2].range, GetDistance(myHero, enemy)) / (2000) + 0.25)) < GetDmg(_E, myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, myHeroSpellData[2].range) then
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
      Config.Misc:addParam("Ee", "Enemies to E (stun)", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
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
      ep = myHero - (Vector(myHero) - ep):normalized() * math.min(epl, myHeroSpellData[_E].range*0.75)
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
        Cast(_R, Target)
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
          local objects = minionManager(MINION_ENEMY, myHeroSpellData[0].range, source, MINION_SORT_HEALTH_ASC).objects
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
        if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
          local health = GetRealHealth(enemy)
          if sReady[_Q] and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, myHeroSpellData[0].range) and GetDistance(enemy) < myHeroSpellData[0].range then
            Cast(_Q, enemy)
          elseif sReady[_R] and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHeroSpellData[3].range) and GetDistance(enemy) < myHeroSpellData[3].range then
            Cast(_R, enemy)
          elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
            CastSpell(Ignite, enemy)
          elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
            CastSpell(Smite, enemy)
          end
          if health < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R then
            if self:LandE(enemy) then
              Cast(_W, enemy.pos)
              DelayAction(function() Cast(_Q, enemy.pos) end, 0.25)
              DelayAction(function() Cast(_R, enemy) end, 0.5)
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
    if loadedEvade then
      if sReady[_W] and (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and _G.Evade and loadedEvade.m and loadedEvade.m.speed ~= math.huge and Config.Windwall[loadedEvade.m.source.charName..loadedEvade.str[loadedEvade.m.slot]] then
        _G.Evade = false
        local wPos = myHero + (Vector(loadedEvade.m.startPos) - myHero):normalized() * myHeroSpellData[1].range 
        loadedEvade.m = nil
        Cast(_W, wPos)
      end
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
      if myHero == spell.target and spell.name:lower():find("attack") and (unit.range >= 450 or unit.isRanged) and Config.Misc.Waa and GetDmg("AD",unit,myHero)/myHero.maxHealth > 0.1337 then
        local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
        Cast(_W, wPos)
      elseif spell.endPos and not spell.target and not loadedEvade or (_G.Evadeee_Loaded and _G.Evadeee_impossibleToEvade) then
        local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
        if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
          local wPos = myHero + (Vector(unit) - myHero):normalized() * myHeroSpellData[1].range 
          Cast(_W, wPos)
        end
      end
    end
    if unit and spell and unit.isMe and spell.name and spell.name:lower():find("attack") and ((Config.kConfig.LastHit and GetDmg(_Q, myHero, spell.target) > spell.target.health and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)) then
      local t = spell.target
      DelayAction(function() Cast(_Q, t.pos) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
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
      if loadedEvade then
        Config:addSubMenu("Windwall", "Windwall")
        for _,k in pairs(GetEnemyHeroes()) do
          Config.Windwall:addParam(k.charName, k.charName, SCRIPT_PARAM_INFO, "")
          for i=0,3 do
            if loadedEvade.data and loadedEvade.myHeroSpellData[k.charName] and loadedEvade.myHeroSpellData[k.charName][i] and loadedEvade.myHeroSpellData[k.charName][i].name and loadedEvade.myHeroSpellData[k.charName][i].name ~= "" then
              Config.Windwall:addParam(k.charName..loadedEvade.str[i], "Block "..loadedEvade.str[i], SCRIPT_PARAM_ONOFF, true)
            end
          end
          Config.Windwall:addParam("info", "", SCRIPT_PARAM_INFO, "")
        end
      end
    end, 3)
  end

  function Yasuo:LastHit()
    local minion = GetLowestMinion(myHeroSpellData[2].range)
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and minion and not UnitHaveBuff(minion, "YasuoDashWrapper") and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then
      Cast(_E, minion)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.E)) and minion and GetDistance(minion) > 475/2 and GetDistance(minion) < 475 and not UnitHaveBuff(minion, "YasuoDashWrapper") and GetRealHealth(minion) < GetDmg(_Q, myHero, minion)+GetDmg(_E, myHero, minion) and sReady[_Q] and sReady[_E] then
      Cast(_E, minion)
      DelayAction(function() Cast(_Q) end, 0.125)
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
          Cast(_Q, Target, 1)
        end
      end
    end
    if GetDistance(Target) > myHero.range+GetDistance(myHero.minBBox) and not UnitHaveBuff(Target, "YasuoDashWrapper") and Config.Harass.E then
      Cast(_E, Target)
    end
  end

  function Yasuo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
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