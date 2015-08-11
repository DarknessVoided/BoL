--[[
     ____        _      __       __                 ___   ___ 
    / __/_______(_)__  / /____  / /__  ___ ___ __  |_  | / _ \
   _\ \/ __/ __/ / _ \/ __/ _ \/ / _ \/ _ `/ // / / __/_/ // /
  /___/\__/_/ /_/ .__/\__/\___/_/\___/\_, /\_, / /____(_)___/ 
               /_/                   /___//___/               
               
    By Nebelwolfi

]]--

--Scriptstatus Tracker
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("XKNMLMRLJJP") ScriptStatus("TGJIHINHFFL") 
--Scriptstatus Tracker

_G.ScriptologyVersion       = 2.08
_G.ScriptologyAutoUpdate    = true
_G.ScriptologyDebug         = false
_G.ScriptologyLoaded        = false
_G.ScriptologyConfig        = scriptConfig("Scriptology Loader", "Scriptology"..myHero.charName)

-- { Scriptology Loader

  AddLoadCallback(function()
    if Update() then
      DelayAction(Load, 2)
    else
      Load()
    end
  end)

  function Load()
    if pcall(function() loadedSPlugin = _G[myHero.charName]() end) then
      Vars()
      ScriptologyMsg("Plugin: '"..myHero.charName.."' loaded")
      _G.ScriptologyLoaded = true
      AfterLoad()
    else
      DelayAction(ArrangeTSPriorities, 2)
      ScriptologyMsg("Failed to load! (Champion not supported?)")
      ScriptologyConfig:addParam("info", "Champion not supported", SCRIPT_PARAM_INFO, "")
    end
  end

  function AfterLoad()
    if loadedSPlugin then
      ScriptologyConfig:addSubMenu(myHero.charName, myHero.charName)
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
    if loadedSPlugin then
      if loadedSPlugin.Load then
        loadedSPlugin:Load()
      end

      if loadedSPlugin.ApplyBuff ~= nil then
        AddApplyBuffCallback(function(source, unit, buff)
          loadedSPlugin:ApplyBuff(source, unit, buff)
        end)
      end

      if loadedSPlugin.UpdateBuff ~= nil then
        AddUpdateBuffCallback(function(unit, buff, stacks)
          loadedSPlugin:UpdateBuff(unit, buff, stacks)
        end)
      end

      if loadedSPlugin.RemoveBuff ~= nil then
        AddRemoveBuffCallback(function(unit, buff)
          loadedSPlugin:RemoveBuff(unit, buff)
        end)
      end

      if loadedSPlugin.ProcessSpell ~= nil then
        AddProcessSpellCallback(function(unit, spell)
          loadedSPlugin:ProcessSpell(unit, spell)
        end)
      end

      if loadedSPlugin.Animation ~= nil then
        AddAnimationCallback(function(unit, ani)
          loadedSPlugin:Animation(unit, ani)
        end)
      end

      if loadedSPlugin.CreateObj ~= nil then
        AddCreateObjCallback(function(obj)
          loadedSPlugin:CreateObj(obj)
        end)
      end

      if loadedSPlugin.DeleteObj ~= nil then
        AddDeleteObjCallback(function(obj)
          loadedSPlugin:DeleteObj(obj)
        end)
      end

      if loadedSPlugin and loadedSPlugin.WndMsg then
        AddMsgCallback(function(msg, key)
          loadedSPlugin:WndMsg(msg, key)
        end)
      end

      if loadedSPlugin and loadedSPlugin.Msg then
        AddMsgCallback(function(msg, key)
          loadedSPlugin:Msg(msg, key)
        end)
      end
    end
    LoadAwareness()
    LoadEvade()
    LoadOrb()
  end

  function LoadAwareness()
    if _G.PrinceViewVersion == nil then
      ScriptologyMsg("Plugin: 'Awareness' loaded")
      SAwareness()
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
    ScriptologyMsg("Plugin: 'Evade' loaded")
    SEvade()
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
    elseif _G.NebelwolfisOrbWalkerInit then
      DelayAction(LoadOrb, 1)
    elseif _G.NebelwolfisOrbWalkerLoaded then
      ScriptologyMsg("Found NOW")
    else
      if not FileExist(LIB_PATH .. "Nebelwolfi's Orb Walker.lua") then
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Nebelwolfi's Orb Walker.lua?no-cache="..math.random(1, 25000), LIB_PATH.."Nebelwolfi's Orb Walker.lua", function() end)
        DelayAction(LoadOrb, 1)
      else
        if myHero.charName == "Azir" or myHero.charName == "Riven" or myHero.charName == "Katarina" or myHero.charName == "Malzahar" then
          ScriptologyMsg("Plugin: 'Walk' loaded")
          _G.loadedOrb = SWalk(nil, ScriptologyConfig)
          loadedAnWalker = true
        elseif not NebelwolfisOrbWalkerInit then
          require("Nebelwolfi's Orb Walker")
          myNOW = NebelwolfisOrbWalker()
        end
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

  gTick=0;AddTickCallback(function()
    if loadedSPlugin.Tick then loadedSPlugin:Tick() end
    if loadedSPlugin.Killsteal then loadedSPlugin:Killsteal() end
    if loadedSPlugin and gTick < GetTickCount() then
      gTick = GetTickCount() + 100
      if targetSel then
        targetSel:update()
        _G.Target = targetSel.target
        loadedSPlugin.Target = targetSel.target
      end
      if Config.kConfig.Combo and loadedSPlugin.Combo and ValidTarget(Target) then
        loadedSPlugin:Combo()
      end
      if Config.kConfig.Harrass and loadedSPlugin.Harrass and ValidTarget(Target) then
        loadedSPlugin:Harrass()
      end
      if Config.kConfig.LaneClear and loadedSPlugin.LaneClear then
        loadedSPlugin:LaneClear()
      end
      if (Config.kConfig.LastHit or Config.kConfig.LaneClear) and loadedSPlugin.LastHit then
        loadedSPlugin:LastHit()
      end
    end
  end)

  dTick=0;AddDrawCallback(function()
    if ScriptologyLoaded then
      if dTick < GetTickCount() then
        dTick = GetTickCount() + 250
        DmgCalc()
        if loadedSPlugin.DmgCalc then
          loadedSPlugin:DmgCalc()
        end
      end
      Draw()
      if loadedSPlugin.Draw then
        loadedSPlugin:Draw()
      end
    end
  end)

-- }

class "Ahri"

  function Ahri:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { range = 880, delay = 0.25, speed = 2500, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
      [_E] = { range = 975, delay = 0.25, speed = 1200, width = 60, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
      [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+30+0.3*AP end}
    }
  end

  function Ahri:Load()
    SetupMenu()
    self.Orb = nil
    self.ultOn = 0
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
    Config.Misc:addDynamicParam("Qc", "Catch Q", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, data[2].range, false, Config.Misc)
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
      if minion and GetRealHealth(minion) < GetDmg(_Q, myHero, minion) then 
        Cast(_Q, minion)
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetClosestMinion(data[_W].range)
      if minion and GetRealHealth(minion) < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      minion = GetLowestMinion(data[_E].range)
      if minion and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then 
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
      if minion and GetRealHealth(minion) < GetDmg(_W, myHero, minion) then 
        Cast(_W)
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      minion = GetLowestMinion(data[_E].range)
      if minion and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then 
        Cast(_E, minion)
      end
    end
  end

  function Ahri:Combo()
    if not Target then return end
    if sReady[_E] and Config.Combo.E and GetDistance(Target) < data[2].range then
      Cast(_E, Target, 2)
    end
    if UnitHaveBuff(Target, "ahriseduce") then
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Combo.Q and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, 2)
      end
      if sReady[_W] and Config.Combo.W and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
      if Config.Combo.R then
        self:CatchQ()
      end
    end
    if Config.Combo.R and GetRealHealth(Target) < GetDmg(_Q,myHero,Target)+GetDmg(_W,myHero,Target)+GetDmg(_E,myHero,Target)+GetDmg(_R,myHero,Target) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    elseif Config.Combo.R and self.ultOn > GetInGameTimer()-10 and (not self.Orb or self.Orb.time < GetInGameTimer()-1.5) and GetDistance(Target) < data[3].range then
      local ultPos = Vector(Target.x, Target.y, Target.z) - ( Vector(Target.x, Target.y, Target.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
      Cast(_R, ultPos)
    end
  end

  function Ahri:CatchQ()
    if Target and self.Orb and self.Orb.dir and self.Orb.time > GetInGameTimer()-1.5  then
      local x,y,z = UPL.VP:GetLineCastPosition(Target, data[0].delay, data[0].width, data[0].range, data[0].speed, Vector(Vector(self.Orb.dir)+(Vector(self.Orb.dir)-myHero):normalized()*(data[0].range-GetDistance(self.Orb.dir))), data[0].collision)
      local x = Vector(self.Orb.dir)+(x-Vector(self.Orb.dir)):normalized()*(data[0].range)
      if self.ultOn > GetInGameTimer()-10 then
        x = Vector(x)-(Vector(Target)-myHero):normalized()*data[3].range
        Cast(_R,x)
      end
    end
  end

  function Ahri:Harrass()
    if not Target then return end
    if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[2].range then
      Cast(_E, Target, 2)
    end
    if UnitHaveBuff(Target, "ahriseduce") then
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    else
      if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[0].range then
        Cast(_Q, Target, 2)
      end
      if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and GetDistance(Target) < data[1].range then
        Cast(_W)
      end
    end
  end

  function Ahri:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local ultPos = Vector(enemy.x, enemy.y, enemy.z) - ( Vector(enemy.x, enemy.y, enemy.z) - Vector(myHero.x, myHero.y, myHero.z)):perpendicular():normalized() * 350
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)*2 and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_Q, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.Q and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, 1.5)
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.W and ValidTarget(enemy, data[3].range) then
          Cast(_W)
          Cast(_R, ultPos)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.R and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_Q, enemy, 1.5)
          Cast(_W)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, 1.5) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, 1.5) Cast(_W) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
          DelayAction(function() if UnitHaveBuff(enemy, "ahriseduce") then Cast(_Q, enemy, 1.5) Cast(_W) Cast(_R, ultPos) end end, data[2].delay+GetDistance(enemy)/data[2].speed)
        end
      end
    end
  end
  
class "Ashe"

  function Ashe:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (0.05*level+1.1)*TotalDmg end},
      [_W] = { speed = 902, delay = 0.25, range = 1200, width = 100, collision = true, aoe = false, type = "cone", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 10*level+30+TotalDmg end},
      [_E] = { speed = 1500, delay = 0.5, range = 25000, width = 1400, collision = false, aoe = false, type = "linear"},
      [_R] = { speed = 1600, delay = 0.5, range = 25000, width = 130, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 175*level+75+AP end}
    }
  end

  function Ashe:Load()
    SetupMenu()
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

  function Ashe:Tick()
    if Config.Misc.AimR then
      for _,k in pairs(GetEnemyHeroes()) do
        if not k.dead and GetDistance(k,mousePos) < 750 then
          Cast(_R, k, 2)
        end
      end
    end
  end

  function Ashe:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, data[0].range, player, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[0].range) then
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
        if WMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[1].range+data[1].width) then
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
        elseif GetRealHealth(minionTarget) >= GetRealHealth(minion) and ValidTarget(minion, data[1].range) then
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
      Cast(_W, Target, 1.5)
    end
    if Config.Combo.R and GetDistance(Target) < myHero.range*2+myHero.boundingRadius*4 and GetDmg(_R, myHero, Target)+GetDmg("AD", myHero, Target)+GetDmg(_W, myHero, Target) < GetRealHealth(Target) then
      Cast(_R, Target, 1.5)
    end
  end

  function Ashe:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      if self:QReady() then
        CastSpell(_Q, myHero:Attack(Target))
      end
    end
    if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, 1.5)
    end
  end

  function Ashe:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and self:QReady() and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and GetDistance(enemy) < 2500 then
          Cast(_R, enemy, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Ashe:QReady()
    return UnitHaveBuff(myHero, "asheqcastready")
  end

class "SAwareness"

  function SAwareness:__init()
    ScriptologyConfig:addSubMenu("SAwareness", "SAwareness")
    self.Config = ScriptologyConfig.SAwareness
    self.Config:addParam("i", "Cooldowns", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("cde", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("cda", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("i", "Hud:", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("sce", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("sizee", "-> Size", SCRIPT_PARAM_SLICE, 1, 0.25, 2.25, 2)
    self.Config:addParam("sca", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("sizea", "-> Size", SCRIPT_PARAM_SLICE, 1, 0.25, 2.25, 2)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("i", "Waypoints", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("wpe", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("wpa", "Allies:", SCRIPT_PARAM_ONOFF, false)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("war", "Enemy Wards", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("jdt", "Jungletimer", SCRIPT_PARAM_ONOFF, true)
    AddDrawCallback(function() self:Draw() end)
    AddUnloadCallback(function() self:Unload() end)
    AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
    AddDeleteObjCallback(function(obj) self:DeleteObj(obj) end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    UpdateWindow()
    self.offset = 18
    self.enemyWards = {}
    self:Load()
    self:LoadJungletable()
    self.allyTable = {table.unpack(GetAllyHeroes())}
    table.insert(self.allyTable, myHero)
    return self
  end

  function SAwareness:Load()
    self.Sprites = {}
    for _, k in pairs({"", "champs", "summoners"}) do
      if not DirectoryExist(SPRITE_PATH.."SAwareness//"..k) then
        CreateDirectory(SPRITE_PATH.."SAwareness//"..k)
      end
    end
    for _=1, heroManager.iCount do
      local k = heroManager:GetHero(_)
      if FileExist(SPRITE_PATH.."SAwareness//champs//"..k.charName..".png") then
        self.Sprites[k.charName] = createSprite(SPRITE_PATH.."SAwareness//champs//"..k.charName..".png")
      else
        DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SAwareness/champs/"..k.charName..".png?no-cache="..math.random(1, 25000), SPRITE_PATH.."SAwareness//champs//"..k.charName..".png", function() end)
        DelayAction(function() self:Load() end, 0.5)
        return
      end
      for i = 0, 1 do 
        local v = k:GetSpellData(4+i).name
        if FileExist(SPRITE_PATH.."SAwareness//summoners//"..v..".png") then
          self.Sprites[v] = createSprite(SPRITE_PATH.."SAwareness//summoners//"..v..".png")
        else
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SAwareness/summoners/"..v..".png?no-cache="..math.random(1, 25000), SPRITE_PATH.."SAwareness//summoners//"..v..".png", function() end)
          DelayAction(function() self:Load() end, 0.5)
          return
        end
      end
    end
    self.loadedSprites = true
  end

  function SAwareness:Unload()
    for _,k in pairs(self.Sprites) do
        k:Release()
    end
  end

  function SAwareness:CreateObj(obj)
    local objName = obj.name:lower()
    if obj and obj.team ~= myHero.team and objName:find("ward") and not objName:find("idle") then
      if objName:find("sight") or (objName:find("vision") and obj.maxMana == 180) then
        table.insert(self.enemyWards, {object = obj, time = GetInGameTimer()})
      elseif objName:find("vision") and obj.maxMana == 5 then
        table.insert(self.enemyWards, {object = obj, time = math.huge})
      end
    end
  end

  function SAwareness:DeleteObj(obj)
    local objName = obj.name:lower()
    if obj and obj.team ~= myHero.team and objName:find("ward") then
      for _, k in pairs(self.enemyWards) do
        if k.object == obj then
          k = nil
        end
      end
    end
  end

  function SAwareness:ProcessSpell(unit, spell)
    if self.Config.ssr and self.loadedSSR and unit and spell and spell.name and unit.team ~= myHero.team then
      if spell.name:lower():find("attack") or spell.target then return end
      if self.data and self.data[unit.charName] then
        for i=0,3 do
          if (not self.data[unit.charName][i] or self.data[unit.charName][i].name == "" or not self.data[unit.charName][i].name) then
            --print("Unsupported spell found!! "..unit.charName.." "..spell.name)
          elseif spell.name:find(self.data[unit.charName][i].name) then
            s = {slot = i, source = unit, startTime = GetInGameTimer(), startPos = Vector(unit), endPos = Vector(spell.endPos), windUpTime = spell.windUpTime, name = spell.name}
            table.insert(self.activeSpells, s)
          end
        end
      end
    end
  end

  function SAwareness:Draw()
    self:DrawCDE()
    self:DrawCDA()
    self:DrawWPE()
    self:DrawWPA()
    self:DrawSCE()
    self:DrawSCA()
    self:DrawWAR()
    self:DrawJDT()
  end

  function SAwareness:DrawCDE()
    if self.Config.cde then
      for _,k in pairs(GetEnemyHeroes()) do
        local nextOffset = 0
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", self.offset, drawPos[1]+nextOffset+i*self.offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + self.offset/2 end
              if cd > 99 then nextOffset = nextOffset + self.offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", self.offset, drawPos[1]+nextOffset+4*self.offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
  end
  
  function SAwareness:DrawCDA()
    if self.Config.cda then
      for _,k in pairs(GetAllyHeroes()) do
        local nextOffset = 0
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", self.offset, drawPos[1]+nextOffset+i*self.offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + self.offset/2 end
              if cd > 99 then nextOffset = nextOffset + self.offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", self.offset, drawPos[1]+nextOffset+self.offset/2+i*self.offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", self.offset, drawPos[1]+nextOffset+4*self.offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
  end
  
  function SAwareness:DrawWPE()
    if self.Config.wpe then
      for i, k in pairs(GetEnemyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
            local barPos = WorldToScreen(D3DXVECTOR3(IndexPath.x, IndexPath.y, IndexPath.z))
            local posX = barPos.x
            local posY = barPos.y
            DrawText(""..k.charName, 15, posX, posY-10, ARGB(155, 255, 255, 255))
            DrawText((math.floor(GetDistance(k,IndexPath)/k.ms*10)/10).."s", 15, posX, posY+10, ARGB(155, 255, 255, 255))
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
  
  function SAwareness:DrawWPA()
    if self.Config.wpa then
      for i, k in pairs(GetAllyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
            local barPos = WorldToScreen(D3DXVECTOR3(IndexPath.x, IndexPath.y, IndexPath.z))
            local posX = barPos.x
            local posY = barPos.y
            DrawText(""..k.charName, 15, posX, posY-10, ARGB(155, 255, 255, 255))
            DrawText((math.floor(GetDistance(k,IndexPath)/k.ms*10)/10).."s", 15, posX, posY+10, ARGB(155, 255, 255, 255))
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

  function SAwareness:DrawSCE()
    if self.Config.sce and self.loadedSprites then
      local i = 0
      for _, k in pairs(GetEnemyHeroes()) do
        local scale = 0.85*self.Config.sizee
        local s = self.Sprites[k.charName]
        s:SetScale(self.Config.sizee, self.Config.sizee)
        s:Draw(WINDOW_W-s.width*self.Config.sizee,WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee,255)
        DrawRectangle(WINDOW_W-s.width*self.Config.sizee, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee, s.width*self.Config.sizee, 10*self.Config.sizee, ARGB(255, 255, 0, 0))
        DrawRectangle(WINDOW_W-s.width*self.Config.sizee, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee, s.width*self.Config.sizee*(GetRealHealth(k)/k.maxHealth), 10*self.Config.sizee, ARGB(255, 0x62, 0x98, 0x00))
        for j = -1*self.Config.sizee, 1*self.Config.sizee do
            for l = -1*self.Config.sizee, 1*self.Config.sizee do
                DrawText(""..math.ceil(GetRealHealth(k)), 12*self.Config.sizee, math.floor(WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4+j), math.floor(WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee-1+l), ARGB(255, 0, 0, 0))
            end
        end
        DrawText(""..math.ceil(GetRealHealth(k)), 12*self.Config.sizee, WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee-1, ARGB(255,255,255,255))
        if k.maxMana > 0 then
          DrawRectangle(WINDOW_W-s.width*self.Config.sizee, WINDOW_H/4+s.height*self.Config.sizee-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizee, s.width*self.Config.sizee, 10*self.Config.sizee, ARGB(155, 105, 105, 105))
          DrawRectangle(WINDOW_W-s.width*self.Config.sizee, WINDOW_H/4+s.height*self.Config.sizee-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizee, s.width*self.Config.sizee*(k.mana/k.maxMana), 10*self.Config.sizee, (k.charName == "Rumble" and k.mana >= 50 and k.mana < 100) and ARGB(255, 0xEA, 0x72, 0x0C) or (k.charName == "Aatrox" or k.charName == "Shyvana" or k.charName == "Tryndamere" or (k.charName == "Rengar" and k.mana == 5) or (k.charName == "Rumble" and k.mana == 100)) and ARGB(255, 0xDD, 0x25, 0x00) or (k.charName == "Yasuo" or k.charName == "Mordekaiser" or (k.charName == "Rengar" and k.mana < 5) or (k.charName == "Rumble" and k.mana < 50)) and ARGB(255, 255, 255, 255) or k.maxMana == 200 and ARGB(255, 0xE5, 0xBB, 0x05) or ARGB(255, 0x03, 0x41, 0xCB))
          for j = -1*self.Config.sizee, 1*self.Config.sizee do
              for l = -1*self.Config.sizee, 1*self.Config.sizee do
                  DrawText(""..math.ceil(k.mana), 12*self.Config.sizee, math.floor(WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4+j), math.floor(WINDOW_H/4+s.height*self.Config.sizee-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizee-1+l), ARGB(255, 0, 0, 0))
              end
          end
          DrawText(""..math.ceil(k.mana), 12*self.Config.sizee, WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4, WINDOW_H/4+s.height*self.Config.sizee-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizee-1, ARGB(255,255,255,255))
        end
        for j = 4, 5 do
          local si = self.Sprites[k:GetSpellData(j).name] or self.Sprites["summonerteleport"]
          local cd = k:GetSpellData(j).currentCd
          si:SetScale(scale,scale)
          si:Draw(WINDOW_W-s.width*self.Config.sizee-si.width*scale,WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee+(j-4)*si.height*scale,255)
          if cd > 0 then
            local x = WINDOW_W-s.width*self.Config.sizee-si.width*scale+2
            local y = WINDOW_H/4+s.height*scale*i+6+15*i*self.Config.sizee+(j-4)*si.height*scale
            for j = -1, 1 do
                for k = -1, 1 do
                    DrawText(""..math.ceil(cd), self.offset, math.floor(x+j), math.floor(y+k), ARGB(255, 0, 0, 0))
                end
            end
            DrawText(""..math.ceil(cd), self.offset, x, y, ARGB(255,255,0,0))
          end
        end
        i = i + 1
      end
    end
  end

  function SAwareness:DrawSCA()
    if self.Config.sca and self.loadedSprites then
      local i = 0
      for _, k in pairs(self.allyTable) do
        local scale = 0.85*self.Config.sizea
        local s = self.Sprites[k.charName]
        s:SetScale(self.Config.sizea, self.Config.sizea)
        s:Draw(0,WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea,255)
        DrawRectangle(0, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea, 10*self.Config.sizea, ARGB(255, 255, 0, 0))
        DrawRectangle(0, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea*(GetRealHealth(k)/k.maxHealth), 10*self.Config.sizea, ARGB(255, 0x62, 0x98, 0x00))
        DrawRectangle(0+s.width*self.Config.sizea*(GetRealHealth(k)/k.maxHealth), WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea*(k.shield/k.maxHealth), 10*self.Config.sizea, ARGB(255, 255, 255, 255))
        for j = -1*self.Config.sizea, 1*self.Config.sizea do
            for l = -1*self.Config.sizea, 1*self.Config.sizea do
                DrawText(""..math.ceil(GetRealHealth(k)), 12*self.Config.sizea, math.floor(s.width*self.Config.sizea/4+j), math.floor(WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea-1+l), ARGB(255, 0, 0, 0))
            end
        end
        DrawText(""..math.ceil(GetRealHealth(k)), 12*self.Config.sizea, s.width*self.Config.sizea/4, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea-1, ARGB(255,255,255,255))
        if k.maxMana > 0 then
          DrawRectangle(0, WINDOW_H/4+s.height*self.Config.sizea-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea, 10*self.Config.sizea, ARGB(155, 105, 105, 105))
          DrawRectangle(0, WINDOW_H/4+s.height*self.Config.sizea-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea*(k.mana/k.maxMana), 10*self.Config.sizea, (k.charName == "Rumble" and k.mana >= 50 and k.mana < 100) and ARGB(255, 0xEA, 0x72, 0x0C) or (k.charName == "Aatrox" or k.charName == "Shyvana" or k.charName == "Tryndamere" or (k.charName == "Rengar" and k.mana == 5) or (k.charName == "Rumble" and k.mana == 100)) and ARGB(255, 0xDD, 0x25, 0x00) or (k.charName == "Yasuo" or k.charName == "Mordekaiser" or (k.charName == "Rengar" and k.mana < 5) or (k.charName == "Rumble" and k.mana < 50)) and ARGB(255, 255, 255, 255) or k.maxMana == 200 and ARGB(255, 0xE5, 0xBB, 0x05) or ARGB(255, 0x03, 0x41, 0xCB))
          for j = -1*self.Config.sizea, 1*self.Config.sizea do
              for l = -1*self.Config.sizea, 1*self.Config.sizea do
                  DrawText(""..math.ceil(k.mana), 12*self.Config.sizea, math.floor(s.width*self.Config.sizea/4+j), math.floor(WINDOW_H/4+s.height*self.Config.sizea-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizea-1+l), ARGB(255, 0, 0, 0))
              end
          end
          DrawText(""..math.ceil(k.mana), 12*self.Config.sizea, s.width*self.Config.sizea/4, WINDOW_H/4+s.height*self.Config.sizea-10*self.Config.sizea+s.height*scale*i+15*i*self.Config.sizea-1, ARGB(255,255,255,255))
        end
        for j = 4, 5 do
          local si = self.Sprites[k:GetSpellData(j).name] or self.Sprites["summonerteleport"]
          local cd = k:GetSpellData(j).currentCd
          si:SetScale(scale,scale)
          si:Draw(s.width*self.Config.sizea,WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea+(j-4)*si.height*scale,255)
          if cd > 0 then
            local x = s.width*self.Config.sizea+2
            local y = WINDOW_H/4+s.height*scale*i+6+15*i*self.Config.sizea+(j-4)*si.height*scale
            for j = -1, 1 do
                for k = -1, 1 do
                    DrawText(""..math.ceil(cd), self.offset, math.floor(x+j), math.floor(y+k), ARGB(255, 0, 0, 0))
                end
            end
            DrawText(""..math.ceil(cd), self.offset, x, y, ARGB(255,255,0,0))
          end
        end
        i = i + 1
      end
    end
  end

  function SAwareness:DrawWAR()
    if self.Config.war and self.enemyWards then
      for _, k in pairs(self.enemyWards) do
        if k.time ~= math.huge then
          if k.time + 180 >= GetInGameTimer() then
            DrawCircle3D(k.object.x, k.object.y, k.object.z, 100, 1, ARGB(105,255,255,255), 32)
            local barPos = WorldToScreen(D3DXVECTOR3(k.object.x, k.object.y, k.object.z))
            local posX = barPos.x
            local posY = barPos.y
            DrawText((math.floor((k.time+180-GetInGameTimer()))).."s", 25, posX, posY, ARGB(255, 255, 0, 0))
          else
            k = nil
          end
        else
          DrawCircle3D(k.object.x, k.object.y, k.object.z, 100, 1, ARGB(105,255,255,255), 32)
          local barPos = WorldToScreen(D3DXVECTOR3(k.object.x, k.object.y, k.object.z))
          local posX = barPos.x
          local posY = barPos.y
          DrawText("Vision Ward", 20, posX, posY, ARGB(255, 255, 0, 0))
        end
      end
    end
  end

  function SAwareness:DrawJDT()
    if self.Config.jdt then
    end
  end

  function SAwareness:GetGroundTime(unit, spell)
    if unit.charName == "Lux" and spell == 2 then return 1 end
    if unit.charName == "Lux" and spell == 3 then return 0.25 end
    if unit.charName == "Ziggs" and spell == 1 then return 1 end
    if unit.charName == "Ziggs" and spell == 2 then return 1 end
    return 0
  end

  function SAwareness:DrawRectangleOutline(startPos, endPos, pos, width)
    local c1 = startPos+Vector(Vector(endPos)-startPos):perpendicular():normalized()*width/2
    local c2 = startPos+Vector(Vector(endPos)-startPos):perpendicular2():normalized()*width/2
    local c3 = endPos+Vector(Vector(startPos)-endPos):perpendicular():normalized()*width/2
    local c4 = endPos+Vector(Vector(startPos)-endPos):perpendicular2():normalized()*width/2
    DrawLine3D(c1.x,c1.y,c1.z,c2.x,c2.y,c2.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c2.x,c2.y,c2.z,c3.x,c3.y,c3.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c3.x,c3.y,c3.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c1.x,c1.y,c1.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    local c1 = startPos+Vector(Vector(endPos)-startPos):perpendicular():normalized()*width
    local c2 = startPos+Vector(Vector(endPos)-startPos):perpendicular2():normalized()*width
    local c3 = endPos+Vector(Vector(startPos)-endPos):perpendicular():normalized()*width
    local c4 = endPos+Vector(Vector(startPos)-endPos):perpendicular2():normalized()*width
    DrawLine3D(c1.x,c1.y,c1.z,c2.x,c2.y,c2.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c2.x,c2.y,c2.z,c3.x,c3.y,c3.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c3.x,c3.y,c3.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c1.x,c1.y,c1.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    if pos then
      DrawCircle3D(pos.x, pos.y, pos.z, width/2, 1, ARGB(155, 255, 255, 255), 8)
    end
  end

  function SAwareness:LoadJungletable()
    self.jungleTable = { -- ty PewPewPew
        { ['time'] = 300, ['mapPos'] = GetMinimap(Vector(3850, 60, 7880)),  }, --Blue Side Blue Buff
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(3800, 60, 6500)),  }, --Blue Side Wolves
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(7000, 60, 5400)),  }, --Blue Side Raptors
        { ['time'] = 300, ['mapPos'] = GetMinimap(Vector(7800, 60, 4000)),  }, --Blue Side Red Buff
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(8400, 60, 2700)),  }, --Blue Side Krugs
        { ['time'] = 360, ['mapPos'] = GetMinimap(Vector(9866, 60, 4414)),  }, --Dragon
        { ['time'] = 300, ['mapPos'] = GetMinimap(Vector(10950, 60, 7030)), }, --Red Side Blue Buff
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(11000, 60, 8400)), }, --Red Side Wolves
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(7850, 60, 9500)),  }, --Red Side Raptors
        { ['time'] = 300, ['mapPos'] = GetMinimap(Vector(7100, 60, 10900)), }, --Red Side Red Buff
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(6400, 60, 12250)), }, --Red Side Krugs
        { ['time'] = 420, ['mapPos'] = GetMinimap(Vector(4950, 60, 10400)), }, --Baron
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(2200, 60, 8500)),  }, --Blue Side Gromp
        { ['time'] = 100, ['mapPos'] = GetMinimap(Vector(12600, 60, 6400)), }, --Red Side Gromp
        { ['time'] = 180, ['mapPos'] = GetMinimap(Vector(10500, 60, 5170)), }, --Dragon Crab
        { ['time'] = 180, ['mapPos'] = GetMinimap(Vector(4400, 60, 9600)),  }, --Baron Crab
    }
  end

class "Azir"

  function Azir:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 975, DAMAGE_MAGICAL)
    data = {
      [_Q] = { range = 880, delay = 0.25, speed = 2500, width = 100, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.35*AP end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+25*level+0.4*AP end},
      [_E] = { range = 975, delay = 0.25, speed = 1200, width = 60, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.5*AP end},
      [_R] = { range = 750, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+30+0.3*AP end}
    }
    self.Target = nil
    objHolder = {}
    objTimeHolder = {}
  end

  function CreateObj(object)
    if object and object.valid and object.name then
      if object.name == "AzirSoldier" then
        objHolder[object.networkID] = object
        objTimeHolder[object.networkID] = GetInGameTimer() + objTimeTrackList[myHero.charName][_]
      end
    end
  end

  function Azir:Load()
    SetupMenu()
    self.soldierToDash = nil
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

  function Azir:LastHit()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and ((Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, self.Target.pos)
    end
    if ((Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) and self.Target and self:CountSoldiers() > 0 and GetDmg(_Q, myHero, self.Target)*self:CountSoldiers() > GetRealHealth(self.Target) then
      Cast(_Q, self.Target.pos)
    end
  end

  function Azir:LaneClear()
    if self.Target and self.Target.type ~= myHero.type and self:CountSoldiers() < 1 and sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target.pos)
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
    if Config.Combo.Q and Config.Combo.W and myHero:GetSpellData(_Q).currentCd == 0 and sReady[_W] and GetDistance(self.Target) < data[_Q].range then
      Cast(_W, self.Target.pos)
      DelayAction(function() Cast(_Q, self.Target.pos) end, 0.25)
    end
    if sReady[_W] and Config.Combo.W then
      Cast(_W, self.Target.pos)
    end
    if Config.Combo.Q and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target)
      end
    end
    if self.Target and Config.Combo.E and GetRealHealth(self.Target) < GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      for _,k in pairs(self:GetSoldiers()) do
        local x, y, z = VectorPointProjectionOnLineSegment(myHero, k, self.Target)
        if x and y and z then
          Cast(_E,k)
        end
      end
    end
    if self.Target and Config.Combo.R and GetRealHealth(self.Target) < GetDmg(_R,myHero,self.Target)+GetDmg(_E,myHero,self.Target)+self:CountSoldiers()*GetDmg(_W,myHero,self.Target)+GetDmg(_Q,myHero,self.Target) then
      Cast(_R,self.Target,2)
    end
  end

  function Azir:Harrass()
    if self:CountSoldiers() <= 1 and sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, self.Target.pos)
    end
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and self:CountSoldiers() > 0 then
      for _,k in pairs(self:GetSoldiers()) do
        Cast(_Q, self.Target, 2, k)
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
        Cast(_E, self.soldierToDash, true)
        DelayAction(function() Cast(_Q, movePos) end, 0.25)
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
      local movePos = myHero + (Vector(enemy) - myHero):normalized() * data[0].range + (Vector(enemy) - myHero):normalized() * data[1].width
      if movePos then
        Cast(_Q, movePos)
        Cast(_E, self.soldierToDash)
        DelayAction(function() Cast(_R, mousePos) end, 1)
        DelayAction(function() self.soldierToDash = nil end, 2)
      end
    end
  end

  function Azir:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if self:CountSoldiers(enemy)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          myHero:Attack(enemy)
        elseif (self:CountSoldiers(enemy)+1)*GetDmg(_W,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.W and GetDistance(enemy) < data[1].range+data[1].width then 
          Cast(_W, enemy)
          myHero:Attack(enemy)
        elseif GetDmg(_R,myHero,enemy) > GetRealHealth(enemy) and Config.Killsteal.R and GetDistance(enemy) < data[3].range then
          Cast(_R, enemy, 1)
        end
      end
    end
  end

class "Blitzcrank"

  function Blitzcrank:__init()
    require "Collision"
    self.Forcetarget = nil
    data = {
      [_Q] = { speed = 1800, delay = 0.25, range = 1150, width = 70, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 55*level+25+AP end},
      [_W] = { range = 25000},
      [_E] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*TotalDmg end},
      [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 600, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 125*level+125+AP end}
    }
    self.Col = Collision(data[0].range, data[0].speed, data[0].delay, data[0].width+30)
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[0].range, DAMAGE_MAGIC, false, true)
  end

  function Blitzcrank:Load()
    SetupMenu()
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
    AddGapcloseCallback(_Q, data[0].range, false, Config.Misc)
  end

  function Blitzcrank:Combo()
    local target = self.Target
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance >= 1 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        if not Mcol then
          Cast(_Q, CastPosition)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and Config.Misc.S and Mcol and #mcol == 1 then
          local minion = mcol[1]
          if minion and GetDistance(minion) < 600 then
            Cast(_Q, CastPosition)
            DelayAction(function() Cast(Smite, minion) end, (GetDistance(minion) / 2) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Combo.E and (GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (UnitHaveBuff(target, "rocketgrab2") and GetDistance(target, myHero) < data[0].range)) then
      Cast(_E)
    end

    if target and myHero:CanUseSpell(_R) == READY and Config.Combo.R then
      if GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (UnitHaveBuff(target, "rocketgrab2") and GetDistance(target, myHero) < data[0].range) then
        Cast(_R)
      end
    end
  end

  function Blitzcrank:Harrass()
    local target = self.Target
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end
    
    if target and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.5 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        if not Mcol then
          Cast(_Q, CastPosition)
        elseif Smite and Config.Misc.S and #mcol == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = mcol[1]
          if minion and GetDistance(minion) < 600 then
            Cast(_Q, CastPosition)
            DelayAction(function() Cast(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and (GetDistance(target, myHero) <= myHero.range+myHero.boundingRadius+target.boundingRadius or (UnitHaveBuff(target, "rocketgrab2") and GetDistance(target, myHero) < data[0].range)) then
      Cast(_E)
    end
  end

  function Blitzcrank:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range-enemy.boundingRadius) then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
      
      if starget and minD < starget.boundingRadius*2 then
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

class "Cassiopeia"

  function Cassiopeia:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST, 900, DAMAGE_MAGICAL, false, true)
    self.lastE = 0
    data = {
      [_Q] = { speed = math.huge, delay = 0.25, range = 850, width = 100, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45+30*level+0.45*AP end},
      [_W] = { speed = 2500, delay = 0.5, range = 925, width = 90, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+5*level+0.1*AP end},
      [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+25*level+0.55*AP end},
      [_R] = { speed = math.huge, delay = 0.5, range = 825, width = 410, collision = false, aoe = true, type = "cone", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+10*level+0.5*AP end}
    }
  end

  function Cassiopeia:Load()
    SetupMenu()
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
    Config.Misc:addParam("Humanizer", "Humanizer (% add time on E)", SCRIPT_PARAM_SLICE, 0, 0, 200, 0)
  end

  function Cassiopeia:Tick() -- LastHitSomethingPoisonedWithE
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E and not Config.kConfig.Combo and not Config.kConfig.Harrass then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= GetRealHealth(minion) and UnitHaveBuff(minion, "poison") and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= GetRealHealth(minion) and UnitHaveBuff(minion, "poison") and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end    
    end  
  end

  function Cassiopeia:LastHit()
    if self.lastE > GetInGameTimer() then return end
    if Config.LastHit.E then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end      
      end   
      for i, minion in pairs(minionManager(MINION_JUNGLE, 825, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local EMinionDmg = GetDmg(_E, myHero, minion)  
        if EMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
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
          elseif GetRealHealth(minionTarget) < GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
            minionTarget = winion
          end
        end
        for minion,winion in pairs(JMobs.objects) do
          if minionTarget == nil then 
            minionTarget = winion
          elseif GetRealHealth(minionTarget) < GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
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
        if winion ~= nil and UnitHaveBuff(winion, "poison") then
          Cast(_E, winion)
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        if winion ~= nil and UnitHaveBuff(winion, "poison") then
          Cast(_E, winion)
        end
      end
    end
  end

  function Cassiopeia:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Combo.E and ValidTarget(Target, data[2].range) then
      if UnitHaveBuff(Target, "poison") then
        Cast(_E, Target)
      end
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) + 2*GetDmg(_E, myHero, Target) >= GetRealHealth(Target) or (EnemiesAroundAndFacingMe(Target, 500) > 1 and UnitHaveBuff(Target, "poison"))) and ValidTarget(Target, data[3].range) then
      Cast(_R, Target)
    end
  end

  function Cassiopeia:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and Config.Harrass.W and ValidTarget(Target, data[1].range) and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W, Target, 1.5)
    end
    if myHero:CanUseSpell(_E) == READY and self.lastE < GetInGameTimer() and Config.Harrass.E and ValidTarget(Target, data[2].range) and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      if UnitHaveBuff(Target, "poison") then
        Cast(_E, Target)
      end
    end
  end

  function Cassiopeia:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)*2 and UnitHaveBuff(enemy, "poison") and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
          DelayAction(Cast, 0.55, {_E, enemy})
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "Darius"

  function Darius:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, math.max(550,myHero.range+myHero.boundingRadius*2), DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 0, width = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 35*level+35+0.7*TotalDmg end},
      [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+0.2*level*TotalDmg end},
      [_E] = { range = 550},
      [_R] = { range = 450, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return math.floor(70+90*level+0.75*myHero.addDamage+0.2*GetStacks(target)*(70+90*level+0.75*myHero.addDamage)) end}
    }
    stackTable = {}
    self.doW = false
  end

  function Darius:Load()
    SetupMenu(true)
  end

  function Darius:Menu()
    Config.Combo:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Qd", "Use Q (outer)", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Qs", "Use Q (inner)", SCRIPT_PARAM_ONOFF, true)
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
        if MinionDmg1 and MinionDmg1 >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 450) then
          CastQ(winion)
        elseif MinionDmg2 and MinionDmg2 >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          Cast(_Q)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = self:GetDmg("W", myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, myHero.range+myHero.boundingRadius) then
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
        elseif GetRealHealth(minionTarget)+minionTarget.shield >= GetRealHealth(minion)+minion.shield and ValidTarget(minion, 250) then
          minionTarget = minion
        end
      end
      if minionTarget ~= nil then
        CastSpell(_W, myHero:Attack(minionTarget))
      end
    end
  end

  function Darius:Combo()
    if Config.Combo.Qd and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) >= 250 then
      self:CastQ(Target)
    elseif Config.Combo.Qs and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) < 250 then
      Cast(_Q)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      self:CastE(Target)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) > GetRealHealth(Target) then
      Cast(_R, Target)
    end
  end

  function Darius:Tick()
    self.doW = (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harrass and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana*100) or (Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW < myHero.mana/myHero.maxMana*100) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100)
  end

  function Darius:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doW then
        DelayAction(function() Cast(_W) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Darius:Harrass()
    if Config.Harrass.Qd and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) >= 250 then
      self:CastQ(Target)
    elseif Config.Harrass.Qs and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 and myHero:CanUseSpell(_Q) == READY and GetDistance(Target) < 250 then
      Cast(_Q)
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
        if myHero:GetSpellData(_R).level == 3 and myHero:CanUseSpell(_R) and GetRealHealth(enemy) < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          Cast(_R, enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and GetRealHealth(enemy) < qDmg and Config.Killsteal.Q and ValidTarget(enemy, 450) then
          self:CastQ(enemy)
        elseif myHero:CanUseSpell(_Q) and sReady[_Q] and GetRealHealth(enemy) < q1Dmg and Config.Killsteal.Q and ValidTarget(enemy, 300) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) and sReady[_W] and GetRealHealth(enemy) < wDmg and Config.Killsteal.W then
          if ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
            CastSpell(_W, myHero:Attack(enemy))
          elseif ValidTarget(enemy, data[2].range*(Config.Misc.offsetE/100)) and sReady[_E] then
            self:CastE(enemy)
            DelayAction(function() CastSpell(_W, myHero:Attack(enemy)) end, 0.38)
          end
        elseif myHero:CanUseSpell(_R) and sReady[_R] and GetRealHealth(enemy) < rDmg and Config.Killsteal.R and ValidTarget(enemy, 450) then
          if ScriptologyDebug then print(rDmg)  end
          Cast(_R, enemy)
        elseif GetRealHealth(enemy) < iDmg and Config.Killsteal.I and ValidTarget(enemy, 600) and myHero:CanUseSpell(self.Ignite) == READY then
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
      Cast(_E, target.pos)
    end
  end

  function Darius:ApplyBuff(unit, source, buff)
    if unit and source and source.isMe and buff and buff.name == "dariushemo" then
      stackTable[unit.networkID] = 1
    end
  end

  function Darius:UpdateBuff(unit, buff, stacks)
    if unit and buff and stacks and buff.name == "dariushemo" then
      stackTable[unit.networkID] = stacks
    end
  end

  function Darius:RemoveBuff(unit, buff)
    if unit and buff and buff.name == "dariushemo" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end

class "Diana"

  function Diana:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 835, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { speed = 1500, delay = 0.250, range = 835, width = 130, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35*level+45+0.2*AP end },
      [_W] = { range = 250, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 12*level+10+0.2*AP end },
      [_E] = { range = 395 },
      [_R] = { range = 825, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 60*level+40+0.6*AP end }
    }
  end

  function Diana:Load()
    SetupMenu()
    self.passiveTracker = 0
  end

  function Diana:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
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

  function Diana:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe then
      if spell.name == "DianaTeleport" then
      end
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
          if ValidTarget(enemy) and GetDistance(enemy, Target) < data[0].range and enemy ~= Target then
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
          CastPosition, HitChance, Position = UPL:Predict(_Q, Target, target)
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
        local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Target)
        if HitChance and HitChance >= 1 then
          Cast(_Q, CastPosition)
        end
        if HitChance and HitChance >= 2 then
          DelayAction(function() Cast(_R, Target) end, 0.25 + GetLatency() / 2000)
        end
      end
    elseif sReady[_Q] and GetDistance(Target) < 830-Target.boundingRadius then
      local CastPosition, HitChance, Position = UPL:Predict(_Q, myHero, Target)
      if HitChance and HitChance >= 1 then
        Cast(_Q, CastPosition)
      end
    end
    if sReady[_R] and UnitHaveBuff(target, "dianamoonlight") and GetDistance(Target) < data[_R].range then
      Cast(_R, Target)
    end
    if sReady[_W] and GetDistance(Target) < data[_W].range then
      Cast(_W)
    end
    if sReady[_E] and GetDistance(Target) < data[_E].range then
      Cast(_E)
    end
  end

  function Diana:Harrass()
    if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
      Cast(_Q, Target, 1.5)
    end
    if sReady[_W] and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < data[_W].range then
      Cast(_W)
    end
    if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < data[_E].range then
      Cast(_E)
    end
  end

  function Diana:LastHit()
    if sReady[_Q] and Config.Harrass.Q and Config.LastHit.manaQ < myHero.mana/myHero.maxMana*100 then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1)
        end
      end
    end
  end

  function Diana:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 and GetDistance(Target) < data[_W].range then
      BestPos, BestHit = GetFarmPosition(data[_W].range, data[_W].width)
      if BestHit > 1 and GetDistance(BestPos) < 250 then 
        CastSpell(_W)
      end
    end
  end

  function Diana:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_Q, enemy, 1)
          DelayAction(function() Cast(_R, enemy) end, 0.25 + GetLatency() / 2000)
        elseif myHero:CanUseSpell(_R) == READY and EnemiesAround(enemy, 1000) <= 3 and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20 + 8 * myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "Ekko"

  function Ekko:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { speed = 1050, delay = 0.25, range = 825, width = 140, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15*level+45+0.2*AP end},
      [_W] = { speed = math.huge, delay = 2, range = 1050, width = 450, collision = false, aoe = true, type = "circular"},
      [_E] = { delay = 0.50, range = 350, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30*level+20+0.2*AP+TotalDmg end},
      [_R] = { speed = math.huge, delay = 0.5, range = 0, width = 400, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 150*level+50+1.3*AP end}
    }
    objTrackList = { 
      "Ekko", 
      "Ekko_Base_Q_Aoe_Dilation.troy", 
      "Ekko_Base_W_Detonate_Slow.troy", 
      "Ekko_Base_W_Indicator.troy", 
      "Ekko_Base_W_Cas.troy"
    }
    objTimeTrackList = { 
      math.huge,
      1.565, 
      1.70, 
      3, 
      1
    }
    objHolder = {}
    objTimeHolder = {}
  end

  function Ekko:Load()
    SetupMenu()
    table.insert(objHolder, myHero)
    for k=1,objManager.maxObjects,1 do
      local object = objManager:getObject(k)
      for _,name in pairs(objTrackList) do
        if object and object.valid and object.name and object.team == myHero.team and object.name == name then
          objHolder[name] = object
          if ScriptologyDebug then print("Object "..object.name.." already created. Now tracking!") end
        end
      end
    end
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

  function Ekko:CreateObj(object)
    if object and object.valid and object.name then
      for _,name in pairs(objTrackList) do
        if object.name == name then
          objHolder[object.networkID] = object
          objTimeHolder[object.networkID] = GetInGameTimer() + objTimeTrackList[_]
          if ScriptologyDebug then print("Object "..object.name.." created. Now tracking!") end
        end
      end
    end
  end
   
  function Ekko:DeleteObj(object)
    if object and object.name then 
      for _,name in pairs(objTrackList) do
        if object.name == name then
          objHolder[object.networkID] = nil
          if ScriptologyDebug then print("Object "..object.name.." destroyed. No longer tracking! "..#objHolder) end
        end
      end
    end
  end

  function Ekko:Draw()
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
        if QMinionDmg and QMinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[2].range+myHero.range+myHero.boundingRadius) and GetDistance(winion) < data[2].range+myHero.range+myHero.boundingRadius then
          Cast(_E, winion.pos)
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
      Cast(_Q, Target, 1.2)
    end
    if Config.Combo.W and ValidTarget(Target, data[1].range) then
      Cast(_W, Target, 1)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target.pos)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target.pos)
      end
    else
      if Config.Combo.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target.pos)
      end
    end
  end

  function Ekko:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.5)
    end
    if GetLichSlot() then
      if myHero:GetSpellData(GetLichSlot()).currentCd == 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) then
        Cast(_E, Target.pos)
      elseif myHero:GetSpellData(GetLichSlot()).currentCd > 0 and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and Config.Harrass.E and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius*2)*2) and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
        Cast(_E, Target.pos)
      end
    else
      if Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 and ValidTarget(Target, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
        Cast(_E, Target.pos)
      end
    end
  end

  function Ekko:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range+(myHero.range+myHero.boundingRadius)*2) then
          Cast(_E, enemy.pos)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy) and self:GetTwin() and GetDistance(self:GetTwin(), enemy) < 375 then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "SEvade"

  function SEvade:__init()
    _G.Evade = false
    ScriptologyConfig:addSubMenu("SEvade", "SEvade")
    self.Config = ScriptologyConfig.SEvade
    self.str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    self.activeSpells = {}
    self.lastDrawn = 0
    AddTickCallback(function() self:Dodge() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    DelayAction(function() self:Load() end, 0)
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    return self
  end

  function SEvade:Load()
    if FileExist(LIB_PATH .. "SpellData.lua") then
      self.data = loadfile(LIB_PATH .. "SpellData.lua")()
    else
      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/SpellData.lua".."?rand="..math.random(1,10000), LIB_PATH.."SpellData.lua", function () end)
      DelayAction(function() self:Load() end, 0.5)
      return
    end
    for _,k in pairs(GetEnemyHeroes()) do
      self.Config:addSubMenu(k.charName, k.charName)
      for i=0,3 do
        if self.data and self.data[k.charName] and self.data[k.charName][i] then
          self.Config[k.charName]:addParam(self.str[i], "Evade "..self.str[i], SCRIPT_PARAM_ONOFF, true)
        end
      end
    end
    self.Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("e", "Evade", SCRIPT_PARAM_ONOFF, false)
    self.Config:addDynamicParam("se", "Stop Evade", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("N"))
    self.Config:addParam("ew", "Extrawidth", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    self.Config:addParam("er", "Extrarange", SCRIPT_PARAM_SLICE, 20, 0, 100, 0)
    self.Config:addParam("p", "Pathfinding", SCRIPT_PARAM_LIST, 1, {"Basic", "", "", ""})
  end

  function SEvade:Dodge()
    if not self.Config.e then _G.Evade = false end
    if _G.Evade and self.m ~= nil then
      if GetDistanceSqr(self.m,myHero) > myHero.boundingRadius*myHero.boundingRadius and GetDistanceSqr(self.m,myHero) < myHero.ms*myHero.ms and self.m.time > GetInGameTimer() and not self.Config.se then
        myHero:MoveTo(self.m.x,self.m.z)
        return
      else
        _G.Evade = false
      end
    end
    for _,spell in pairs(self.activeSpells) do
      local width = self.data[spell.source.charName][spell.slot].width
      local range = self.data[spell.source.charName][spell.slot].range
      local speed = self.data[spell.source.charName][spell.slot].speed
      local delay = self.data[spell.source.charName][spell.slot].delay
      local type  = self.data[spell.source.charName][spell.slot].type
      local b     = myHero.boundingRadius
      if speed and speed ~= math.huge and type then
        if type == "linear" then
          if spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(spell.startPos,spell.endPos) < range * range + width * width + self.Config.er * self.Config.er then
              spell.endPos = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*(range+width)
            end
            local p = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*(speed*(GetInGameTimer()+delay-spell.startTime)-width+self.Config.ew)
            if GetDistanceSqr(myHero,p) <= (width+self.Config.ew+b)^2 then
              _G.Evade = true
              self.m = self:FindSafeSpot(spell.startPos,p,width,b)
              self.m.speed = speed
              self.m.startPos = Vector(spell.startPos)
              self.m.source = spell.source
              self.m.slot = spell.slot
              self.m.time = spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot)
            end
          else
            table.remove(self.activeSpells, _)
          end
        end
        if type == "circular" then
          if spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(myHero,spell.endPos) <= (width/2+self.Config.ew+b)^2 then
              _G.Evade = true
              self.m = self:FindSafeSpot(spell.startPos,spell.endPos,width/2,b)
              self.m.speed = speed
              self.m.startPos = Vector(spell.startPos)
              self.m.source = spell.source
              self.m.slot = spell.slot
              self.m.time = spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot)
            end
          else
            table.remove(self.activeSpells, _)
          end
        end
      elseif speed and speed == math.huge and type then
        if type == "circular" then
          if spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(myHero,spell.endPos) <= (width/2+self.Config.ew+b)^2 then
              _G.Evade = true
              self.m = self:FindSafeSpot(spell.startPos,spell.endPos,width/2,b)
              self.m.speed = speed
              self.m.startPos = Vector(spell.startPos)
              self.m.source = spell.source
              self.m.slot = spell.slot
              self.m.time = spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot)
            end
          else
            table.remove(self.activeSpells, _)
          end
        end
        if type == "linear" then
          if spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(spell.startPos,spell.endPos) < range * range + self.Config.er * self.Config.er then
              spell.endPos = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*GetDistance(spell.startPos,myHero)
            end
            if GetDistanceSqr(myHero,spell.endPos) < (width+self.Config.ew+b)^2 then
              _G.Evade = true
              self.m = self:FindSafeSpot(spell.startPos,spell.endPos,width,b)
              self.m.speed = speed
              self.m.startPos = Vector(spell.startPos)
              self.m.source = spell.source
              self.m.slot = spell.slot
              self.m.time = spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot)
            end
          else
            table.remove(self.activeSpells, _)
          end
        end
      end
    end
  end

  function SEvade:FindSafeSpot(s,p,w,b)
    if Target then
      local pos1 = myHero+Vector(Vector(myHero)-p):normalized():perpendicular()*(w+b)*0.75+Vector(Vector(Target)-myHero):normalized():perpendicular2()*(w+b+self.Config.ew)*0.75
      local pos2 = myHero+Vector(Vector(myHero)-p):normalized():perpendicular2()*(w+b)*0.75+Vector(Vector(Target)-myHero):normalized():perpendicular()*(w+b+self.Config.ew)*0.75
      if GetDistanceSqr(pos1,Target) < GetDistanceSqr(pos2,Target) and not IsWall(D3DXVECTOR3(pos1.x,pos1.y,pos1.z)) then
        return pos1
      else
        return pos2
      end
    else
      local pos1 = myHero+Vector(Vector(myHero)-p):normalized():perpendicular()*(w+b+self.Config.ew)
      local pos2 = myHero+Vector(Vector(myHero)-p):normalized():perpendicular2()*(w+b+self.Config.ew)
      if GetDistanceSqr(pos1,s) < GetDistanceSqr(pos2,s) and not IsWall(D3DXVECTOR3(pos1.x,pos1.y,pos1.z)) then
        return pos1
      else
        return pos2
      end
    end
  end

  function SEvade:Draw()
    if _G.Evade and self.m then
      DrawCircle3D(self.m.x, self.m.y, self.m.z, myHero.boundingRadius, 2, ARGB(255, 255, 255, 255), 32)
    end
    if self.Config.se then
      UpdateWindow()
      DrawText("Evading Disabled", 20, WINDOW_W/2, WINDOW_H/4, ARGB(255, 255, 0, 0))
    end
    for _,spell in pairs(self.activeSpells) do
      local range = self.data[spell.source.charName][spell.slot].range
      local width = self.data[spell.source.charName][spell.slot].width
      local speed = self.data[spell.source.charName][spell.slot].speed
      local delay = self.data[spell.source.charName][spell.slot].delay
      local type  = self.data[spell.source.charName][spell.slot].type
      if speed ~= math.huge then
        if type == "linear" then
          if spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(spell.startPos,spell.endPos) < range * range then
              spell.endPos = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*range
            end
            local pos = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*(speed*(GetInGameTimer()-delay-spell.startTime)-width)
            self:DrawRectangleOutline(spell.startPos, spell.endPos, (spell.startTime+delay < GetInGameTimer() and pos or nil), width)
          else
            table.remove(self.activeSpells, _)
          end
        end
        if type == "circular" then
          if spell.startTime+range/speed+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            DrawCircle3D(spell.endPos.x, spell.endPos.y, spell.endPos.z, width, 2, ARGB(255, 255, 255, 255), 32)
            DrawCircle3D(spell.endPos.x, spell.endPos.y, spell.endPos.z, width-10, 2, ARGB(255, 255, 255, 255), 32)
          else
            table.remove(self.activeSpells, _)
          end
        end
      elseif speed == math.huge then
        if type == "circular" then
          if spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            DrawCircle3D(spell.endPos.x, spell.endPos.y, spell.endPos.z, width, 2, ARGB(255, 255, 255, 255), 32)
            DrawCircle3D(spell.endPos.x, spell.endPos.y, spell.endPos.z, width-10, 2, ARGB(255, 255, 255, 255), 32)
          else
            table.remove(self.activeSpells, _)
          end
        end
        if type == "linear" then
          if spell.startTime+delay+self:GetGroundTime(spell.source, spell.slot) > GetInGameTimer() then
            if GetDistanceSqr(spell.startPos,spell.endPos) < range * range then
              spell.endPos = spell.startPos+Vector(Vector(spell.endPos)-spell.startPos):normalized()*range
            end
            self:DrawRectangleOutline(spell.startPos, spell.endPos, nil, width)
          else
            table.remove(self.activeSpells, _)
          end
        end
      end
    end
  end

  function SEvade:DrawRectangleOutline(startPos, endPos, pos, width)
    local c1 = startPos+Vector(Vector(endPos)-startPos):perpendicular():normalized()*width/2
    local c2 = startPos+Vector(Vector(endPos)-startPos):perpendicular2():normalized()*width/2
    local c3 = endPos+Vector(Vector(startPos)-endPos):perpendicular():normalized()*width/2
    local c4 = endPos+Vector(Vector(startPos)-endPos):perpendicular2():normalized()*width/2
    DrawLine3D(c1.x,c1.y,c1.z,c2.x,c2.y,c2.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c2.x,c2.y,c2.z,c3.x,c3.y,c3.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c3.x,c3.y,c3.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    DrawLine3D(c1.x,c1.y,c1.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(55, 255, 255, 255))
    local c1 = startPos+Vector(Vector(endPos)-startPos):perpendicular():normalized()*width
    local c2 = startPos+Vector(Vector(endPos)-startPos):perpendicular2():normalized()*width
    local c3 = endPos+Vector(Vector(startPos)-endPos):perpendicular():normalized()*width
    local c4 = endPos+Vector(Vector(startPos)-endPos):perpendicular2():normalized()*width
    DrawLine3D(c1.x,c1.y,c1.z,c2.x,c2.y,c2.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c2.x,c2.y,c2.z,c3.x,c3.y,c3.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c3.x,c3.y,c3.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    DrawLine3D(c1.x,c1.y,c1.z,c4.x,c4.y,c4.z,math.ceil(width/100),ARGB(25, 255, 255, 255))
    if pos then
      DrawCircle3D(pos.x, pos.y, pos.z, width/2, 1, ARGB(155, 255, 255, 255), 8)
    end
  end

  function SEvade:GetGroundTime(unit, spell)
    if unit.charName == "Lux" and spell == 2 then return 1 end
    if unit.charName == "Lux" and spell == 3 then return 0.25 end
    if unit.charName == "Ziggs" and spell == 1 then return 1 end
    if unit.charName == "Ziggs" and spell == 2 then return 1 end
    return 0
  end

  function SEvade:ProcessSpell(unit, spell)
    if self.Config and unit and spell and spell.name and unit.team ~= myHero.team then
      if spell.name:lower():find("attack") then return end
      if self.data and self.data[unit.charName] then
        for i=0,3 do
          if self.Config[unit.charName][self.str[i]] and (not self.data[unit.charName][i] or self.data[unit.charName][i].name == "" or not self.data[unit.charName][i].name) then
            --print("Unsupported spell found!! "..unit.charName.." "..spell.name)
          elseif self.Config[unit.charName][self.str[i]] and spell.name:find(self.data[unit.charName][i].name) then
            s = {slot = i, source = unit, startTime = GetInGameTimer(), startPos = Vector(unit), endPos = Vector(spell.endPos), winUpTime = spell.windUpTime, name = spell.name}
            table.insert(self.activeSpells, s)
          end
        end
      end
    end
  end

class "Gangplank"

  function Gangplank:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 625},
      [_W] = { range = 25000},
      [_E] = { range = 1000, speed = math.huge, delay = 1, width = 125, type = "circular"},
      [_R] = { range = 2000}
    }
    barrels = {}
    self.Target = nil
  end

  function Gangplank:Load()
    SetupMenu()
  end

  function Gangplank:Menu()
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
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
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
    Config.Misc:addDynamicParam("Q", "Auto Q barrels (1hp)", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addDynamicParam("W", "Anti-CC W", SCRIPT_PARAM_ONOFF, true)
  end

  function Gangplank:Tick()
    local ccType = {[5] = true, [8] = true, [11] = true, [21] = true, [22] = true, [24] = true}
    if Config.Misc.W then
    for i = 1, myHero.buffCount, 1 do      
      local buff = myHero:getBuff(i) -- partially from summoner item usage - ralphlol
      if buff.valid and buff.name and ccType[buff.type] or (buff.type == 10 and buff.name and buff.name:lower():find("fleeslow")) or buff.name and buff.name:lower():find("summonerexhaust") then
        Cast(_W)
      end                    
    end
  end
  if Config.Misc.Q then
      for _,k in pairs(barrels) do
      if GetDistance(k.barrel) < data[0].range and GetInGameTimer() >= k.time + (myHero.level >= 13 and 1.25 or myHero.level >= 7 and 2.25 or 3.25) - GetDistance(k.barrel)/1000 - GetLatency() / 2000 then
        Cast(_Q, k.barrel)
      end
      end
    end
  end

  function Gangplank:CreateObj(obj)
    if GetDistance(obj) < data[2].range and obj.name == "Barrel" then
      table.insert(barrels, {barrel = obj, time = GetInGameTimer()})
    end
  end

  function Gangplank:Combo()
    if myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and Config.Combo.E and GetDistance(self.Target) <= data[2].range and #GetBarrelsAround(self.Target) < 1 then
      Cast(_E, self.Target, 2)
    elseif myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and GetDistance(self.Target) <= data[0].range then
      Cast(_Q, self.Target)
    end
  end

  function Gangplank:Harrass()
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.E and GetDistance(self.Target) <= data[2].range and #GetBarrelsAround(self.Target) < 1 then
      Cast(_E, self.Target, 2)
    elseif myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and Config.Harrass.Q and GetDistance(self.Target) <= data[0].range then
      Cast(_Q, self.Target)
    end
  end

  function Gangplank:GetBarrelsAround(unit)
    local result = {}
    for _,k in pairs(barrels) do
      if k.barrel.health > 0 and GetDistance(k.barrel, unit) < data[2].width then
        table.insert(result, k.barrel)
      end
    end
    return result
  end

class "Kalista"

  function Kalista:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { speed = 1200, delay = 0.5, range = 1150, width = 40, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-50+60*level+TotalDmg end},
      [_W] = { delay = 1.5, range = 5000},
      [_E] = { range = 1000, dmgAD = function(AP, level, Level, TotalDmg, source, target) return GetStacks(target) > 0 and (10 + (10 * level) + (TotalDmg * 0.6)) + (GetStacks(target)-1) * (kalE(level) + (0.175 + 0.025 * level)*TotalDmg) or 0 end},
      [_R] = { range = 2000}
    }
    stackTable = {}
    self.Target = nil
  end

  function Kalista:Load()
    SetupMenu()
    self.soulMate = nil
    self.saveAlly = false
    for k,v in pairs(GetAllyHeroes()) do
      if UnitHaveBuff(v, "kalistacoopstrikeally") then
        self.soulMate = v
        Config.Misc:modifyParam("R", "text", "Save ally with R ("..self.soulMate.charName..")")
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
    if Config.Misc.stackMethod == 2 then
      if spell.name:lower():find("attack") and unit.isMe then
        stackTable[spell.target.networkID] = GetStacks(spell.target) + 1
      elseif spell.name:lower():find("kalistaexpunge") then
        stackTable = {}
      end
    end
    if not self.soulMate or unit.type ~= myHero.type then return end
    if Config.Misc.R and self.saveAlly and GetDistance(self.soulMate) < data[3].range and unit.team ~= self.soulMate.team and (self.soulMate == spell.target or GetDistance(spell.endPos,self.soulMate) < self.soulMate.boundingRadius*3) then
      Cast(_R)
      ScriptologyMsg("Saving soulmate from spell: "..spell.name)
      self.saveAlly = false
    end
  end

  function Kalista:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Combo:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 10, 1, 20, 0)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Er", "E if target walks out of range", SCRIPT_PARAM_ONOFF, false)
    Config.Harrass:addParam("Es", "-> at X stacks", SCRIPT_PARAM_SLICE, 5, 1, 20, 0)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    if Smite ~= nil then Config.Killsteal:addParam("S", "Smite", SCRIPT_PARAM_ONOFF, true) end
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
    Config.Misc:addParam("stackMethod", "Method to count stacks:", SCRIPT_PARAM_LIST, 1, {"BuffCallbacks", "Count + Buff"})--, "Objects"})
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
        if winion ~= nil and winion.health > 0 and EMinionDmg-5 > GetRealHealth(winion) and GetDistance(winion) < data[2].range then    
          killableCounter = killableCounter + 1
        end
      end
      for minion,winion in pairs(JMobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)  
        if winion ~= nil and winion.health > 0 and EMinionDmg-5 > GetRealHealth(winion) and GetDistance(winion) < data[2].range then
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
    if Config.Misc.stackMethod == 2 then
      for _, unit in pairs(GetEnemyHeroes()) do
        if not UnitHaveBuff(unit, "kalistaexpungemarker") then
          stackTable[unit.networkID] = 0
        end
      end
    end
  end

  function Kalista:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
  end

  function Kalista:LaneClear()
    -- soon
  end

  function Kalista:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(self.Target, data[0].range) and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, self.Target, 2)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(self.Target, data[2].range) then
      if GetDmg(_E, myHero, self.Target) >= GetRealHealth(self.Target) then
        Cast(_E)
      end
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and winion.health > 0 and EMinionDmg and EMinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          killableCounter = killableCounter +1
        end   
      end   
      if killableCounter > 0 and GetStacks(self.Target) > 0 and self.Target.health > 0 then
        Cast(_E)
      end
      if Config.Combo.Er and GetStacks(self.Target) >= Config.Combo.Es then
        pos, b = PredictPos(self.Target,0.25)
        pos2, b = PredictPos(myHero,0.25)
        if pos and pos2 and GetDistance(self.Target) <= data[2].range and GetDistance(pos,pos2) > data[2].range then
          Cast(_E)
        end
      end
    end
  end
  
  function Kalista:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero.mana >= 75+myHero:GetSpellData(_Q).level*5 then
      Cast(_Q, self.Target, 2)
    end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(self.Target, data[2].range) then
      local harrassUnit = nil
      local killableCounter = 0
      for minion,winion in pairs(Mobs.objects) do
        local EMinionDmg = GetDmg(_E, myHero, winion)      
        if winion ~= nil and EMinionDmg and EMinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
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
      if Config.Harrass.Er and GetStacks(self.Target) > Config.Harrass.Es then
        pos, b = PredictPos(self.Target,0.25)
        pos2, b = PredictPos(myHero,0.25)
        pos2 = pos2 or myHero
        if pos and pos2 and GetDistance(self.Target) <= data[2].range and GetDistance(pos,pos2) > data[2].range then
          Cast(_E)
        end
      end
    end
  end

  function Kalista:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local health = GetRealHealth(enemy)
        if myHero:CanUseSpell(_E) == READY and GetStacks(enemy) > 0 and health < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) and GetDistance(enemy) < data[2].range then
          Cast(_E)
        elseif myHero:CanUseSpell(_Q) == READY and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) and GetDistance(enemy) < data[0].range then
          Cast(_Q, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end

  function Kalista:ApplyBuff(unit, source, buff)
    if Config.Misc.stackMethod == 1 and unit and source and source.isMe and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 1
    end
  end

  function Kalista:UpdateBuff(unit, buff, stacks)
    if Config.Misc.stackMethod == 1 and unit and buff and stacks and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = stacks
    end
  end

  function Kalista:RemoveBuff(unit, buff)
    if Config.Misc.stackMethod == 1 and unit and buff and buff.name == "kalistaexpungemarker" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end

class "Katarina"

  function Katarina:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST, 700, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 675, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+25*level+0.45*AP end},
      [_W] = { range = 375, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 5+35*level+0.25*AP+0.6*TotalDmg end},
      [_E] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+30*level+0.25*AP end},
      [_R] = { range = 550, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+10*level+0.2*AP+0.3*source.addDamage end}
    }
    self.Target = nil
    ultOn = 0
    ultTarget = nil
  end

  function Katarina:Load()
    SetupMenu(true)
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and (string.find(string.lower(object.name), "ward") or string.find(string.lower(object.name), "trinkettotem")) then
        table.insert(self.Wards, object)
      end
    end
  end

  function Katarina:Tick()
    if Config.Misc.Jump then self:WardJump() end
  end

  function Katarina:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if string.find(spell.name, "NetherGrasp") or spell.name:lower():find("katarinar") then
        _G.loadedOrb.orbDisabled = true
        ultOn = GetInGameTimer()+2.5
        ultTarget = self.Target
        DelayAction(function() _G.loadedOrb.orbDisabled = false end, 2.5)
      end
    end
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
      if string.find(string.lower(obj.name), "ward") or string.find(string.lower(obj.name), "trinkettotem") then
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
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "trinkettotem") then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (string.find(string.lower(myHero:GetSpellData(slot).name), "ward") and not string.find(string.lower(myHero:GetSpellData(slot).name), "vision")) then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "ward") then
        return slot
      end
    end
    return nil
  end

  function Katarina:LastHit()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LastHit.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range and GetRealHealth(self.Target) < GetDmg(_Q, myHero, self.Target) then
      Cast(_Q, self.Target)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LastHit.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 and GetRealHealth(self.Target) < GetDmg(_W, myHero, self.Target) then
      Cast(_W)
    end
    if Config.LastHit.E and sReady[_E] and GetDistance(self.Target) < data[2].range and GetRealHealth(self.Target) < GetDmg(_E, myHero, self.Target) then
      Cast(_E, self.Target)
    end
  end

  function Katarina:LaneClear()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.LaneClear.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.LaneClear.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.LaneClear.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target)
    end
  end

  function Katarina:Combo()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Combo.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Combo.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Combo.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target)
    end
    if Config.Combo.R and sReady[_R] and GetDistance(self.Target) < 200 and GetRealHealth(self.Target) < GetDmg(_R, myHero, self.Target)*10 then
      Cast(_R)
    end
  end

  function Katarina:Harrass()
    if ultOn >= GetInGameTimer() and ultTarget and not ultTarget.dead or not self.Target then return end
    if Config.Harrass.Q and sReady[_Q] and GetDistance(self.Target) < data[0].range then
      Cast(_Q, self.Target)
    end
    pos, b = PredictPos(self.Target,0.25)
    if pos and Config.Harrass.W and sReady[_W] and GetDistance(pos) < data[1].range+b/2 then
      Cast(_W)
    end
    if Config.Harrass.E and sReady[_E] and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target)
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
        if dmg+((sReady[_Q] and Config.Killsteal.Q) and myHero:CalcMagicDamage(enemy,15*myHero:GetSpellData(_Q).level+0.15*myHero.ap) or 0)+((myHero:GetSpellData(_R).currentCd == 0 and myHero:GetSpellData(_R).level > 0 and Config.Killsteal.R) and GetDmg(_R, myHero, enemy)*10 or 0) >= GetRealHealth(enemy) then
          if Config.Killsteal.Q and sReady[_Q] then
            Cast(_Q, enemy)
            if Config.Killsteal.E and sReady[_E] then
              DelayAction(Cast, 0.25, {_E, enemy,})
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
            Cast(_E, enemy)
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

class "KogMaw"
  
  function KogMaw:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 975, delay = 0.25, speed = 1600, width = 80, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+50*level+0.5*AP end},
      [_W] = { range = function() return myHero.range + myHero.boundingRadius*2 + 110+20*myHero:GetSpellData(_W).level end, dmgAP = function(AP, level, Level, TotalDmg, source, target) return target.maxHealth*0.01*(level+1)+0.01*AP+TotalDmg end},
      [_E] = { range = 1200, delay = 0.25, speed = 1300, width = 120, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
      [_R] = { range = 1500, speed = math.huge, delay = 1.1,  width = 250, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40+40*level+0.3*AP+0.5*TotalDmg end}
    }
  end

  function KogMaw:Load()
    SetupMenu()
  end

  function KogMaw:Tick()
    targetSel.range = 900+myHero:GetSpellData(_R).level*300
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
    if GetDmg(_Q, myHero, minionTarget) > GetRealHealth(minionTarget) and myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_Q, minionTarget, 2)
    elseif GetDmg(_W, myHero, minionTarget) > GetRealHealth(minionTarget) and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_W, myHero:Attack(minionTarget))
    elseif GetDmg(_E, myHero, minionTarget) > GetRealHealth(minionTarget) and myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      Cast(_E, minionTarget, 2)
    end
  end

  function KogMaw:LaneClear()
    local minionTarget = GetLowestMinion(math.min(data[0].range, data[1].range()))
    if minionTarget then
      if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, minionTarget, 2)
      end
      if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
        Cast(_W)
      end
    end
    minionTarget = GetLineFarmPosition(data[2].range, data[2].width)
    if minionTarget then
      if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, minionTarget, 2)
      end
    end
  end

  function KogMaw:Combo()
    if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
      Cast(_Q, Target, 2)
    end
    if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
      Cast(_W)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target, 2)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
      Cast(_R, Target, 2)
    end
  end

  function KogMaw:Harrass()
    if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 2)
    end
    if Config.Harrass.W and myHero:CanUseSpell(_W) == READY and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      Cast(_W)
    end
    if Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      Cast(_E, Target, 2)
    end
  end

  function KogMaw:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_E, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_Q, enemy, 1.2) DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "LeeSin"

  function LeeSin:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1100, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 1100, width = 50, delay = 0.25, speed = 1800, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.9*source.addDamage end},
      [_W] = { range = 600},
      [_E] = { range = 0, width = 450, delay = 0.25, speed = math.huge, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+source.addDamage end},
      [_R] = { range = 2000, width = 150, delay = 0.25, speed = 2000, collision = false, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 200*level+2*source.addDamage end}
    }
  end

  function LeeSin:Load()
    SetupMenu()
    self.Forcetarget = nil
    self.insecTarget = nil
    self.Wards = {}
    self.casted, self.jumped = false, false
    self.oldPos = nil
    self.passiveTracker = 0
    self.passiveName = "blindmonkpassive_cosmetic"
    for i = 1, objManager.maxObjects do
      local object = objManager:GetObject(i)
      if object ~= nil and object.valid and (string.find(string.lower(object.name), "ward") or string.find(string.lower(object.name), "trinkettotem")) then
        table.insert(self.Wards, object)
      end
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
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Insec", "Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("FInsec", "Flash Insec", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("Z"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
  end

  function LeeSin:Tick()
    if Config.Misc.Insec then
      self:Insec()
    end
    if Config.Misc.FInsec then
      self:FInsec()
    end
    if Config.Misc.Jump then
      self:WardJump()
    end
  end

  function LeeSin:Insec()
    if myHero:GetSpellData(_R).currentCd > 2 then return end
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
    end
    if insecTowards == nil then return end
    local pos, b = PredictPos(self.insecTarget)
    local pos = pos or self.insecTarget
    local movePos = self.insecTarget+(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    if GetDistance(movePos) < 250 then
      CastSpell(_R, self.insecTarget) 
      if sReady[_Q] then
        DelayAction(function() Cast(_Q, self.insecTarget) end, 0.33)
        DelayAction(function() Cast(_Q) end, 0.67)
      end
      if Smite then CastSpell(Smite, self.insecTarget) end
      return
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius and GetDistance(movePos) < 600 then
      if self:Jump(movePos, myHero.boundingRadius, true) then
        self.casted = false
      elseif not self.casted then
        slot = self:GetWardSlot()
        if not slot or self.casted then return end
        self.casted = true
        CastSpell(slot, movePos.x, movePos.z)
        DelayAction(function() Cast(_R, self.insecTarget) end, 0.05)
      end
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius then 
      myHero:MoveTo(movePos.x,movePos.z)
    end
  end

  function LeeSin:FInsec()
    if myHero:GetSpellData(_R).currentCd > 1 or not Flash or myHero:CanUseSpell(Flash) ~= READY then return end
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
    end
    if insecTowards == nil then return end
    local pos, b = PredictPos(self.insecTarget)
    local pos = pos or self.insecTarget
    local movePos = self.insecTarget-(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    local movePos2 = self.insecTarget+(pos-insecTowards):normalized()*(self.insecTarget.boundingRadius+myHero.boundingRadius)
    if GetDistance(movePos) < 150 then
      CastSpell(_R, self.insecTarget) 
      DelayAction(function() Cast(Flash, movePos2) end, 0)
      return
    elseif GetDistance(movePos) > self.insecTarget.boundingRadius+myHero.boundingRadius then 
      myHero:MoveTo(movePos.x,movePos.z)
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
      if starget and minD < starget.boundingRadius*2 then
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
      self.casted = true
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
      if string.find(string.lower(obj.name), "ward") or string.find(string.lower(obj.name), "trinkettotem") then
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
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "trinkettotem") then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and (string.find(string.lower(myHero:GetSpellData(slot).name), "ward") and not string.find(string.lower(myHero:GetSpellData(slot).name), "vision")) then
        return slot
      end
    end
    for slot = ITEM_7, ITEM_1, -1 do
      if myHero:GetSpellData(slot).name and myHero:CanUseSpell(slot) == READY and string.find(string.lower(myHero:GetSpellData(slot).name), "ward") then
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
        if MinionDmg1 and MinionDmg1 >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, 1.5)
        elseif MinionDmg2 and MinionDmg1 and MinionDmg1+MinionDmg2 >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 1100) then
          Cast(_Q, winion, 1.5)
          DelayAction(Cast, 0.33, {_Q})
        elseif MinionDmg2 and MinionDmg2 >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 250) and GetDistance(winion) < 250 then
          DelayAction(Cast, 0.33, {_Q})
        end
      end
    end
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and myHero:CanUseSpell(_W) == READY then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion)+winion.shield and ValidTarget(winion, 300) then
          Cast(_E)
        end
      end
    end
  end

  function LeeSin:LaneClear()
    if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY and self.passiveTracker == 0 then
      local minion = GetLowestMinion(1100)
      if minion ~= nil then
        Cast(_Q, minion, 1)
      end
    end
    if Config.LaneClear.Q and myHero:CanUseSpell(_Q) == READY then
      local minion = GetJMinion(1100)
      if minion ~= nil and Config.LaneClear.Qf then
        if self:QDmg(minion)+((Smite and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY) and math.max(20*myHero.level+370,30*myHero.level+330,40*myHero.level+240,50*myHero.level+100) or 0) > GetRealHealth(minion) then
          Cast(_Q, minion, 1)
          if not self:IsFirstCast(_Q) and Config.LaneClear.S and myHero:CanUseSpell(Smite) == READY then
            DelayAction(function() CastSpell(Smite, minion) end, data[0].delay)
          end
        end
      elseif minion ~= nil and not Config.LaneClear.Qf then
        Cast(_Q, minion, 1)
      end
    end
    if Config.LaneClear.E and myHero:CanUseSpell(_E) == READY and self.passiveTracker == 0 then
      local BestPos, BestHit = GetFarmPosition(data[2].range, data[2].width)
      if BestHit >= 1 and GetDistance(BestPos) < 250 then 
        Cast(_E)
      end
      local minion = GetJMinion(data[2].width)
      if minion and GetDistance(minion) < data[2].width then 
        Cast(_E)
      end
    end
    if Config.LaneClear.W and myHero:CanUseSpell(_W) == READY and self.passiveTracker == 0 then
      local minion = GetLowestMinion(myHero.range+myHero.boundingRadius)
      if minion ~= nil then
        Cast(_W, myHero)
      end
      local minion = GetJMinion(data[2].width)
      if minion and GetDistance(minion) < data[2].width then 
        Cast(_W, myHero)
      end
    end
  end

  function LeeSin:Combo()
    local pos, b = PredictPos(Target)
    if myHero:CanUseSpell(_E) == READY and pos and ValidTarget(Target, data[2].width) and GetDistanceSqr(pos,myHero) < data[2].width ^ 2 and self.passiveTracker == 0 then
      Cast(_E)
    end
    if GetRealHealth(Target) < GetDmg(_Q, myHero, Target)+GetDmg(_R, myHero, Target)+(Target.maxHealth-(Target.health-GetDmg(_R, myHero, Target)*0.08)) then
      if myHero:CanUseSpell(_Q) == READY and self:IsFirstCast(_Q) then
        Cast(_Q, Target, 1.5)
      elseif myHero:CanUseSpell(_Q) == READY and UnitHaveBuff(Target, "BlindMonkQOne") then
        Cast(_R, Target)
        DelayAction(Cast, 0.33, {_Q})
      end
    elseif myHero:CanUseSpell(_Q) == READY and self.passiveTracker == 0 then
      Cast(_Q, Target, 1.5)
    elseif Target ~= nil and UnitHaveBuff(Target, "BlindMonkQOne") and GetDistance(Target) > myHero.range+myHero.boundingRadius*2 then
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
      Cast(_Q, Target, 1.5)
    end
    if not self.oldPos and UnitHaveBuff(Target, "BlindMonkQOne") and myHero:CanUseSpell(_W) == READY and self:IsFirstCast(_W) then
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
      Cast(_E, Target, 1.2)
    end
  end

  function LeeSin:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+self:QDmg(enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
          DelayAction(function() if not self:IsFirstCast(_Q) then Cast(_Q) end end, data[0].delay+GetDistance(enemy, myHero.pos)/data[0].speed)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].width) then
          Cast(_E, enemy, 1.2)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end        

class "Lux"

  function Lux:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1350, delay = 0.25, range = 1300, width = 130, collision = true, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 10+50*level+0.7*AP end},
      [_W] = { speed = 1630, delay = 0.25, range = 1250, width = 210, collision = false, type = "linear"},
      [_E] = { speed = 1275, delay = 0.25, range = 1100, width = 325, collision = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 15+45*level+0.6*AP end},
      [_R] = { speed = math.huge, delay = 1, range = 3340, width = 200, collision = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 200+100*level+0.75*AP end}
    }
  end

  function Lux:Load()
    SetupMenu()
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
    AddGapcloseCallback(_Q, data[0].range, false, Config.Misc)
  end

  function Lux:Tick()
    if myHero:GetSpellData(_E).name == "luxlightstriketoggle" and Config.Misc.Ea then
      Cast(_E)
    end
  end

  function Lux:ProcessSpell(unit, spell)
    if unit and spell and not spell.name:lower():find("attack") and Config.Misc.Wa and unit.team ~= myHero.team and unit.type == myHero.type and not IsRecalling(myHero) and Config.Misc.manaW <= 100*myHero.mana/myHero.maxMana then
      if spell.target then
        if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
          Cast(_W, myHero)
        end
      else
        local makeUpPos = unit + (Vector(spell.endPos) - unit):normalized() * math.min(1250, GetDistance(unit))
        if GetDistance(spell.endPos) < GetDistance(myHero.pos, myHero.minBBox)*3 or GetDistance(makeUpPos) < GetDistance(myHero.pos, myHero.minBBox)*3 then
          if myHero:CanUseSpell(_W) == READY and myHero.health/myHero.maxHealth < 0.85 then
            Cast(_W, myHero)
          end
        end
      end
    end
  end

  function Lux:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[0].range) then
          Cast(_Q, winion, 2)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[2].range) then
          Cast(_E, winion)
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
    if UnitHaveBuff(Target, "luxilluminati") and Config.Combo.R and myHero:CanUseSpell(_R) == READY and myHero:CalcMagicDamage(Target, 200+150*myHero:GetSpellData(_R).level+0.75*myHero.ap) >= GetRealHealth(Target) then
      Cast(_R, Target, 2)
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
      Cast(_E, Target, 1.5)
    else
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY then
        Cast(_Q, Target, 2)
      end
      if Config.Combo.R and myHero:CanUseSpell(_R) == READY and GetDmg(_R, myHero, Target) >= GetRealHealth(Target) then
        Cast(_R, Target, 2)
      end
    end
  end

  function Lux:Harrass()
    if not UnitHaveBuff(Target, "luxilluminati") then
      if Config.Harrass.Q and myHero:CanUseSpell(_Q) == READY and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
        Cast(_Q, Target, 2)
      elseif Config.Harrass.E and myHero:CanUseSpell(_E) == READY and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
        Cast(_E, Target, 1.5)
      end
    end
  end

  function Lux:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, data[3].range) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_E, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_Q, enemy, 1.2) DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay) end, data[2].delay)
        elseif myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.2)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[2].delay)
        elseif myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg(_R, myHero, enemy) and Config.Killsteal.Q and Config.Killsteal.R and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
          DelayAction(function() Cast(_R, enemy, 1.2) end, data[0].delay)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy, 2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "Malzahar"

  function Malzahar:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = math.huge, delay = 1, range = 900, width = 85, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+55*level+0.8*AP end},
      [_W] = { speed = math.huge, delay = 0.5, range = 800, width = 250, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return (0.04+0.01*level)*target.maxHealth+AP/100 end},
      [_E] = { range = 650, dmgAP = function(AP, level, Level, TotalDmg, source, target) return (20+60*level)/8+0.1*AP end},
      [_R] = { range = 700, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.26*AP end}
    }
  end

  function Malzahar:Load()
    SetupMenu()
  end
  
  function Malzahar:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell then
      if string.find(spell.name, "NetherGrasp") or spell.name:lower():find("katarinar") then
        _G.loadedOrb.orbDisabled = true
        ultOn = GetInGameTimer()+2.5
        ultTarget = Target
        DelayAction(function() _G.loadedOrb.orbDisabled = false end, 2.5)
      end
    end
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

  function Malzahar:LastHit()
    if myHero:CanUseSpell(_Q) == READY and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local QMinionDmg = GetDmg(_Q, myHero, minion)
        if QMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[0].range) then
          Cast(_Q, minion, 1.2)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then    
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do    
        local WMinionDmg = GetDmg(_W, myHero, minion)      
        if WMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[1].range) then
          Cast(_W, minion, 1.5)
        end      
      end    
    end  
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaE <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local EMinionDmg = GetDmg(_E, myHero, minion)
        if EMinionDmg >= GetRealHealth(minion) and ValidTarget(minion, data[2].range) then
          Cast(_E, minion)
        end
      end
    end 
  end

  function Malzahar:LaneClear()
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
        local minionTarget = GetLowestMinion(data[0].range)
        if minionTarget ~= nil then
          Cast(_Q, minionTarget, 1.2)
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
          Cast(_E, minionTarget)
        end
      end 
  end

  function Malzahar:Combo()
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target)
      end
      if Config.Combo.R and myHero:CanUseSpell(_R) == READY then
        Cast(_R, Target)
      end
  end

  function Malzahar:Harrass()
      if Config.Combo.Q and myHero:CanUseSpell(_Q) == READY then
        Cast(_Q, Target, 1.5)
      end
      if Config.Combo.W and myHero:CanUseSpell(_W) == READY then
        Cast(_W, Target, 1.5)
      end
      if Config.Combo.E and myHero:CanUseSpell(_E) == READY then
        Cast(_E, Target)
      end
  end

  function Malzahar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.5)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1.5)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy)*2.5 and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
          Cast(_R, enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end        

class "Nidalee"

  function Nidalee:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
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
    data = {
          [_Q] = { speed = 1337, delay = 0.25, range = 1500, width = 37.5, collision = true, aoe = false, type = "linear"},
          [_W] = { speed = math.huge, delay = 0.25, range = 900, width = 120, collision = true, aoe = false, type = "circular"},
          [_E] = { range = 0},
          [_R] = { range = 0}
        }
    self.ludenStacks = 0
    self.spearCooldownUntil = 0
    self.Target = nil
  end

  function Nidalee:Load()
    SetupMenu()
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
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
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
    if loadedEvade and Config.Misc.Dw then
      if _G.Evade and loadedEvade.m then
        if sReady[_W] and not self:IsHuman() then
          Cast(_W, loadedEvade.m)
          if GetDistance(loadedEvade.m,myHero) < self.data.Cougar[_W].range then
            _G.Evade = false
            loadedEvade.m = nil
          end
        elseif sReady[_R] and self:IsHuman() then
          Cast(_R)
          DelayAction(function() Cast(_W, loadedEvade.m) end, 0.125)
          DelayAction(function() Cast(_R) end, 3*(1+unit.cdr))
          if GetDistance(loadedEvade.m,myHero) < self.data.Cougar[_W].range then
            _G.Evade = false
            loadedEvade.m = nil
          end
        end
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
        if GetRealHealth(enemy) < damageQ+damageC then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Killable"
        else
          local neededAA = math.floor(100 * (damageQ+damageC+damageI) / (GetRealHealth(enemy)))
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
    if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and Config.Combo.Q and ValidTarget(self.Target, data[0].range) then
      Cast(_Q, self.Target, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and UnitHaveBuff(Target, "nidaleepassivehunted") and self:IsHuman() and Config.Combo.W and ValidTarget(self.Target, data[0].range) then
      Cast(_W, self.Target, 1.5)
    end
    self:DoRWEQCombo(self.Target)
    if not self:IsHuman() and GetDistance(self.Target) > 425 then
      Cast(_R)
    end
    if not self:IsHuman() and self.spearCooldownUntil < GetInGameTimer() then
      Cast(_R)
    end
  end

  function Nidalee:DoRWEQCombo(unit)
    if not unit then return end
    if unit and myHero:CanUseSpell(_R) == READY and UnitHaveBuff(unit, "nidaleepassivehunted") and self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.R then
      Cast(_R)
    end
    if unit and myHero:CanUseSpell(_W) == READY and UnitHaveBuff(unit, "nidaleepassivehunted") and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.W then
      Cast(_W, unit.pos)
    end
    if unit and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range <= 0 then
      if self:GetDmg(_Q,unit) >= unit.health and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q)
      elseif self:GetRWEQComboDmg(unit,-self:GetDmg(_W,unit)) >= unit.health then
        if myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit.pos)
        end
        if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY and Config.Combo.Q and Config.Combo.E then
          CastSpell(_Q)
        end
        if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q)
        end
      else
        if myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit.pos)
        elseif myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
          CastSpell(_Q)
        end
      end
      if unit and myHero:CanUseSpell(_W) == READY and Config.Combo.W then
        if unit and GetDistance(unit) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(unit) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
          Cast(_W, unit.pos)
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
    if self:IsHuman() and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(self.Target, self.data.Human[0].range) then
        Cast(_Q, self.Target, 2)
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(self.Target, self:GetAARange()) then
        CastSpell(_Q, myHero:Attack(self.Target))
      end
      if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(self.Target, self.data.Cougar[2].range) then
        Cast(_E, self.Target.pos)
      end
    end
  end

  function Nidalee:LastHit()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LastHit.Q and ValidTarget(Target, data[0].range) then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and GetRealHealth(minionTarget) < self:GetDmg(_Q, minionTarget) then
          Cast(_Q, myHero:Attack(minionTarget))
        end
      end
    end
  end

  function Nidalee:LaneClear()
    if self:IsHuman() then
      if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
        local minion = GetJMinion(self.data.Human[0].range)
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minion then
          Cast(_Q, minion, 1)
        end
        if minionTarget then
          Cast(_Q, minionTarget, 1)
        end
      elseif Config.LaneClear.R then
        Cast(_R)
      end
    end
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and GetRealHealth(minionTarget) < self:GetDmg(_Q, minionTarget) then
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
      if not self:IsHuman() and not sReady[_Q] and not sReady[_E] and self.spearCooldownUntil < GetInGameTimer() and Config.LaneClear.R then
        Cast(_R)
      end
    end
  end

  function Nidalee:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and GetRealHealth(enemy) < self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
        if myHero:CanUseSpell(_Q) == READY and not self:IsHuman() and GetRealHealth(enemy) < self:GetDmg(_Q, enemy, true) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          local pos, chance, ppos = UPL:Predict(_Q, myHero, enemy)
          if chance >= 2 then
            Cast(_R)
            DelayAction(function() Cast(_Q, enemy, 1.5) end, 0.125)
          end
        end
        if not self:IsHuman() and EnemiesAround(enemy, 500) < 3 then
          if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < self:GetDmg(_Q, enemy) and Config.Killsteal.Q and ValidTarget(enemy, self:GetAARange()) then
            Cast(_Q, myHero:Attack(enemy))
          end
          if myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < self:GetDmg(_W, enemy) and Config.Killsteal.W then
            if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
              Cast(_W, enemy.pos)
            end
          end
          if myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < self:GetDmg(_E, enemy) and Config.Killsteal.E and ValidTarget(enemy, self.data.Cougar[2].range) then
            Cast(_E, enemy.pos)
          end
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and self:IsHuman() and GetRealHealth(enemy) < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_Q, enemy, 1.2)
          DelayAction(function() self:DoRWEQCombo(enemy) end, 0.05+self.data.Human[0].delay+GetDistance(enemy)/self.data.Human[0].speed)
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and not self:IsHuman() and GetRealHealth(enemy) < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_R)
        end
        if UnitHaveBuff(enemy, "nidaleepassivehunted") and EnemiesAround(enemy, 500) < 3 and GetDistance(enemy)-self.data.Cougar[1].range*2 < 0 then
          if GetRealHealth(enemy) < self:GetRWEQComboDmg(enemy,0) then
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

class "Orianna"

  function Orianna:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 900, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1200, delay = 0.250, range = 825, width = 175, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.5*AP end},
      [_W] = { speed = math.huge, delay = 0.250, range = 0, width = 225, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+45*level+0.7*AP end},
      [_E] = { speed = 1800, delay = 0.250, range = 825, width = 80, collision = false, aoe = false, type = "targeted", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 30+30*level+0.3*AP end},
      [_R] = { speed = math.huge, delay = 0.250, range = 0, width = 410, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 75+75*level+0.7*AP end}
    }
  end

  function Orianna:Load()
    SetupMenu()
  end

  function Orianna:Tick()
    if self.Ball and (GetDistance(self.Ball) <= myHero.boundingRadius*2+7 or GetDistance(self.Ball) > 1250) then
      self.Ball = nil
    end
    if Config.Misc.Ra then
      if enemies >= EnemiesAround(self.Ball or myHero, data[3].width-myHero.boundingRadius) then
        CastSpell(_R)
      end
    end
  end

  function Orianna:Draw()
    if self.Ball then
      DrawCircle(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 0x111111)
      for i=0,2 do
        LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 3, (math.pi/4.5)*(i))
      end 
      LagFree(self.Ball.x-8, self.Ball.y, self.Ball.z+87, data[0].width-50, 3, ARGB(255, 75, 0, 230), 9, 0)
    end
  end

  function Orianna:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("WE", "Prioritize", SCRIPT_PARAM_LIST, 1, {"W > E", "E > W"})
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
    Config.Misc:addParam("Re", "Enemies around ball to R", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
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

  function Orianna:LastHit()
    if sReady[_Q] and ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion, 1.2)
        end
      end
    end
    if sReady[_W] and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmgQ = GetDmg(_Q, myHero, winion)
        local MinionDmgW = GetDmg(_W, myHero, winion)
        if MinionDmgQ and MinionDmgW >= GetRealHealth(winion) and (self.Ball and GetDistance(winion, self.Ball) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_W)
        end
        if sReady[_Q] and MinionDmgQ and MinionDmgW and MinionDmgQ+MinionDmgW >= GetRealHealth(winion) and (self.Ball and GetDistance(winion, self.Ball) < data[1].width or GetDistance(winion) < data[1].width) then
          Cast(_Q, winion, 1.2)
          DelayAction(Cast, 0.25, {_W})
        end
      end
    end
  end

  function Orianna:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_Q].width)
      if BestHit > 1 then 
        CastSpell(_Q, BestPos)
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      BestPos, BestHit = GetFarmPosition(data[_Q].range, data[_W].width)
      if BestHit > 1 and self.Ball and GetDistance(self.Ball, BestPos) < 50 then 
        Cast(_W)
      end
    end
  end

  function Orianna:Combo()
    if sReady[_Q] and Config.Combo.Q then
      local CastPosition, HitChance, Pos = UPL:Predict(_Q, self.Ball or myHero, Target)
      if HitChance and HitChance >= 1.5 then
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
        if GetDistanceSqr(ProjPoint, Target) < (Target.boundingRadius + data[2].width) ^ 2 then
          Cast(_E, myHero)
        end
      end
    end
    if sReady[_R] and GetRealHealth(Target) < self:CalcRComboDmg(Target) and Config.Combo.R then
      self:CastR(Target)
    end
  end

  function Orianna:CalcRComboDmg(unit)
    dmg = 0
    if myHero:GetSpellData(_Q).currentCd < 1.5 then
      dmg = dmg + GetDmg(_Q, myHero, unit)
    end
    return GetDmg(_R, myHero, unit)+dmg
  end

  function Orianna:Harrass()
    if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, Target, 1.5, self.Ball)
    end
    if sReady[_W] and not (Config.Harrass.WE == 2 and sReady[_E]) and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
      self:CastW(Target)
    end
    if sReady[_E] and not (Config.Harrass.WE == 1 and sReady[_W]) and Config.Harrass.E and self.Ball and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana then
      local ProjPoint,_,OnSegment = VectorPointProjectionOnLineSegment(self.Ball, myHero, Target)
      if OnSegment then
        if GetDistanceSqr(ProjPoint, Target) < (Target.boundingRadius + data[2].width) ^ 2 then
          Cast(_E, myHero)
        end
      end
    end
  end

  function Orianna:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local Ball = self.Ball or myHero
        if sReady[_Q] and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, Target, 1.5, Ball)
        elseif sReady[_W] and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W then
          self:CastW(enemy)
        elseif sReady[_E] and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and self.Ball and GetDistance(self.Ball) > 150 and VectorPointProjectionOnLineSegment(self.Ball, myHero, enemy) and GetDistance(self.Ball)-self.Ball.boundingRadius > GetDistance(enemy) then
          Cast(_E, myHero)
        elseif sReady[_R] and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R then
          self:CastR(enemy)
        elseif sReady[_R] and GetRealHealth(enemy) < self:CalcRComboDmg(enemy) and Config.Killsteal.R and Config.Killsteal.Q and Config.Killsteal.W then
          self:CastR(enemy)
          DelayAction(Cast, data[3].delay, {_Q, Target, 1.5, Ball})
          DelayAction(function() self:CastW(enemy) end, data[3].delay+data[0].delay+GetDistance(Ball,enemy)/data[0].speed)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Orianna:CastW(unit)
    if myHero:CanUseSpell(_W) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local pos, b = PredictPos(unit)
    if pos and GetDistance(pos, Ball) < data[1].width-b then 
      Cast(_W)
    end  
  end

  function Orianna:CastR(unit)
    if myHero:CanUseSpell(_R) ~= READY or unit == nil or myHero.dead then return end
    local Ball = self.Ball or myHero
    local pos, b = PredictPos(unit, 0.5)
    if pos and GetDistance(pos, Ball) < data[3].width-b then 
      Cast(_R) 
    end  
  end

class "Rengar"

  function Rengar:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+(0.95+0.05*level)*TotalDmg end},
      [_W] = { speed = math.huge, delay = 0.5, range = 490, width = 490, collision = false, aoe = true, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+0.8*AP end},
      [_E] = { speed = 1375, delay = 0.25, range = 1000, width = 80, collision = true, aoe = false, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 50*level+0.7*TotalDmg end},
      [_R] = { range = 4000}
    }
    self.Target = nil
  end

  function Rengar:Load()
    SetupMenu()
    self.lastEmpChange = 0
    self.Target = nil
    self.keyStr = {[0] = "Q", [1] = "W", [2] = "E"}
    self.doQ = false
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
    self.doQ = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    self.doQ = (myHero.mana == 5 and (Config.Misc.Empower2 == 1 and self.doQ) or self.doQ)
    if Config.Misc.Empower and self.lastEmpChange < GetInGameTimer() then
      self.lastEmpChange = GetInGameTimer() + 0.33
      Config.Misc.Empower = false
      local os = Config.Misc.Empower2
      Config.Misc.Empower2 = Config.Misc.Empower2 + 1
      if Config.Misc.Empower2 == 4 then Config.Misc.Empower2 = 1 end
      if os ~= Config.Misc.Empower2 then
        PrintAlert("Switched Empoweredmode! Now using: "..self.keyStr[Config.Misc.Empower2-1], 0.25, 0xff, 0x00, 0x00)
      end
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
      
      if starget and minD < starget.boundingRadius*2 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
  end

  function Rengar:Animation(unit, ani)
    if unit and unit.isMe and ani then
      if ani == "Spell5" and (Config.kConfig.Combo or Config.kConfig.Harrass) then
        if not self.Target then self.Target = Target end
        if self.Target and Smite ~= nil and Config.Combo.S then CastSpell(Smite, self.Target) end
        if self.Target and Ignite ~= nil and Config.Combo.I then CastSpell(Ignite, self.Target) end
        if self.Target then DelayAction(function() self:CastHydra(self.Target) end, 0.1 - GetLatency() / 2000) end
        if loadedOrb then
          loadedOrb.orbTable.lastAA = 0
          loadedOrb.orbTable.animation = 0
        end
        if (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harrass and Config.Harrass.E) then DelayAction(function() if self.Target then CastSpell(_E, self.Target.x, self.Target.z) DelayAction(function() Cast(_W) end, 0.5) end end, GetDistance(self.Target) / (2500+myHero.ms) - GetLatency() / 2000) end
        if self.Target then Cast(_Q) end
      end
    end
  end

  function Rengar:CastHydra(unit)
    for slot = ITEM_1, ITEM_6 do
      if myHero:GetSpellData(slot).name:lower():find("tiamat") and myHero:CanUseSpell(slot) == READY then
        CastSpell(slot) 
      end
    end
  end

  function Rengar:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.doQ then
        DelayAction(function() Cast(_Q) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Rengar:Combo()
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        Cast(_Q)
      elseif Config.Misc.Empower2 == 2 and GetDistance(self.Target) < data[1].range then
        Cast(_W, self.Target, 1)
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, self.Target, 2)
      end
    else
      if Config.Combo.W and sReady[_W] and GetDistance(self.Target) < data[1].range then
        Cast(_W, self.Target, 1)
      end
      if Config.Combo.E and sReady[_E] then
        Cast(_E, self.Target, 1)
      end
    end
  end

  function Rengar:Harrass()
    if myHero.mana == 5 then
      if Config.Misc.Empower2 == 1 then
        Cast(_Q)
      elseif Config.Misc.Empower2 == 2 and GetDistance(self.Target) < data[1].range then
        Cast(_W, self.Target, 1)
      elseif Config.Misc.Empower2 == 3 then
        Cast(_E, self.Target, 2)
      end
    else
      if Config.Harrass.W and sReady[_W] and GetDistance(self.Target) < data[1].range then
        Cast(_W, self.Target, 1)
      end
      if Config.Harrass.E and sReady[_E] then
        Cast(_E, self.Target, 1)
      end
    end
  end

  function Rengar:LastHit()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local minionTarget = GetLowestMinion(data[1].range)
        if minionTarget ~= nil and GetRealHealth(minionTarget) < GetDmg(_W, myHero, minionTarget) then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil and GetRealHealth(minionTarget) < GetDmg(_E, myHero, minionTarget) then
          Cast(_E, minionTarget, 1)
        end
      end
    end
  end

  function Rengar:LaneClear()
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local pos, hit = GetFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetLowestMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, 1)
        end
      end
    end
    if myHero.mana == 5 and Config.LaneClear.W and (myHero.health / myHero.maxHealth) * 100 < 90 then
      Cast(_W)
    else
      if Config.LaneClear.W then
        local pos, hit = GetJFarmPosition(myHero.range+myHero.boundingRadius*2, data[1].width)
        if hit and hit > 1 and pos ~= nil and GetDistance(pos) < 150 then
          Cast(_W)
        end
      end
      if Config.LaneClear.E then
        local minionTarget = GetJMinion(data[2].range)
        if minionTarget ~= nil then
          Cast(_E, minionTarget, 1)
        end
      end
    end
  end

  function Rengar:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          CastSpell(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, 1)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end        

class "Riven"

  function Riven:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 310, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+(0.35+0.05*level)*TotalDmg end},
      [_W] = { range = 265, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+TotalDmg end},
      [_E] = { range = 390},
      [_R] = { range = 930, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (40+40*level+0.6*source.addDamage)*(math.min(3,math.max(1,4*(target.maxHealth-target.health)/target.maxHealth))) end},
    }
    self.Target = nil
    self.QAA = false
    self.QCast = 0
  end

  function Riven:Load()
    SetupMenu(true)
    DelayAction(function()      
      _G.loadedOrb:AddReset(_Q, RESET_PREDICT)
      _G.loadedOrb:AddReset(_W, RESET_SELF)
    end, 2.5)
  end

  function Riven:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Rm", "Use R mode", SCRIPT_PARAM_LIST, 3, { "Never", "On hard kill", "Smart", "Always" })
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
    Config.Misc:addDynamicParam("QAA", "Manual QAA", SCRIPT_PARAM_ONOFF, false)
    Config.Misc:addDynamicParam("Wa", "Auto stun with W", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Wae", "Auto stun if X enemies", SCRIPT_PARAM_SLICE, 2, 1, 5, 0)
    Config.Misc:addDynamicParam("Flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
    Config.Misc:addDynamicParam("Jump", "Jump", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
    AddGapcloseCallback(_W, data[1].range, false, Config.Misc)
  end

  function Riven:Tick()
    self.QAA = Config.Misc.QAA or (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
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
      if self.QCast < 3 then
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
      if sReady[_W] and ValidTarget(k, data[_W].range) and (Config.Misc.Wae <= EnemiesAround(k, data[_W].range)) then
        Cast(_W)
      end
    end
  end

  function Riven:ProcessSpell(unit,spell)
    if unit and unit.isMe and spell then
      if spell.name == "RivenTriCleave" then
        self.QCast = self.QCast + 1
        DelayAction(function() if not sReady[_Q] then self.QCast = 0 end end, 4)
        if self.QAA and self.QCast < 3 then 
          self:AfterQ()
        end
      elseif spell.name == "RivenFeint" then
        self.EDelay = GetTickCount()
        if self.Target and Config.kConfig.Combo and myHero:CanUseSpell(_R) == READY and Config.Combo.Rm > 1 and ((Config.Combo.Rm == 4 or EnemiesAround(self.Target, 450) > 1) or Config.Combo.Rm == 4 or self:CalcComboDmg(self.Target, 0) * (Config.Combo.Rm == 2 and 1.67 or 1) >= GetRealHealth(self.Target)) and (Config.Combo.Rm ~= 3 or self:CalcComboDmg(self.Target, 0, true) <= GetRealHealth(self.Target)) and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
          Cast(_R) 
          DelayAction(function() 
            if self.Target and GetDistance(self.Target) < data[0].range then
              Cast(_Q, self.Target.pos) 
            end
          end, 0.137)
        end
      elseif spell.name:lower():find("attack") then
        if self.QAA and self.QCast > 0 then 
          DelayAction(function() 
            if self:CastHydra() and ValidTarget(self.Target) then
              Cast(_Q, self.Target.pos) 
            else
            end
          end, spell.windUpTime - GetLatency() / 2000 + 0.07)
        end
      elseif spell.name:lower():find("rivenizunablade") then
        if self.Target and Config.kConfig.Combo and Config.Combo.Rm > 1 then
          Cast(_Q, self.Target.pos)
        end
      end
    end
  end

  function Riven:CastHydra()
    for slot = ITEM_1, ITEM_6 do
      if myHero:GetSpellData(slot).name == "ItemTiamatCleave" 
      and myHero:CanUseSpell(slot) == READY then
        CastSpell(slot) 
        return true
      end
    end
    return false
  end

  function Riven:AfterQ()
    local movePos = target+(Vector(myHero)-target):normalized()*(62)
    myHero:MoveTo(movePos.x, movePos.z)
    return true
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
      
      if starget and minD < starget.boundingRadius*2 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
  end

  function Riven:DmgCalc()
    if not Config.Draws.DMG then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        killTextTable[enemy.networkID].indicatorText = ""
        local damageC  = self:CalcComboDmg(enemy, 0, Config.Combo.Rm == 1)
        local damageI  = Ignite and (GetDmg("IGNITE", myHero, enemy)) or 0
        local damageS  = Smite and (20 + 8 * myHero.level) or 0
        if GetRealHealth(enemy) < damageC+damageI then
          killTextTable[enemy.networkID].indicatorText = "Kill!!"
        else
          local neededAA = math.floor(100 * (damageC+damageI) / (GetRealHealth(enemy)))
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

  function Riven:Draw()
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
    if self.Forcetarget and ValidTarget(self.Forcetarget) then
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(self.Forcetarget.x, self.Forcetarget.y, self.Forcetarget.z, self.Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
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

  function Riven:DmgP(unit, ad)
    return myHero:CalcDamage(unit, 5+math.max(5*math.floor((myHero.level+2)/3)+10,10*math.floor((myHero.level+2)/3)-15)*ad/100)
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
    if Ignite and myHero:CanUseSpell(Ignite) == READY then
      dmg = dmg + GetDmg("IGNITE", myHero, unit)
    end
    if (sReady[_R] or myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine") and not disableUlt then
      unit.health = unit.health-dmg
      dmg = dmg + GetDmg(_R,me,unit)+GetDmg("AD",me,unit)+self:DmgP(target, ad)
    end
    return dmg
  end

  function Riven:Combo()
    if GetDistance(self.Target) > loadedOrb.myRange + 30 and sReady[_E] and Config.Combo.E and GetDistance(self.Target) < data[2].range then
      if self.Target and Config.kConfig.Combo and myHero:CanUseSpell(_R) == READY and Config.Combo.Rm > 1 and ((Config.Combo.Rm == 4 or EnemiesAround(self.Target, 450) > 1) or Config.Combo.Rm == 4 or self:CalcComboDmg(self.Target, 0) * (Config.Combo.Rm == 2 and 1.67 or 1) >= GetRealHealth(self.Target)) and (Config.Combo.Rm ~= 3 or self:CalcComboDmg(self.Target, 0, true) <= GetRealHealth(self.Target)) and myHero:GetSpellData(_R).name == "RivenFengShuiEngine" then 
        Cast(_E, self.Target.pos)
        DelayAction(function() Cast(_R) end, 0.075) 
      else
        Cast(_E, self.Target.pos)
      end
    end
    if Config.Combo.Rm > 1 and (GetDmg(_R,myHero,self.Target)+GetDmg(_Q,myHero,self.Target)+GetDmg("AD",myHero,self.Target)+self:DmgP(self.Target,myHero.totalDamage*1.2) >= GetRealHealth(self.Target)) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target.pos) end
    if Config.Combo.Rm > 1 and GetDmg(_R,myHero,self.Target) >= GetRealHealth(self.Target) and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target.pos) end
    if Config.Combo.Rm > 1 and GetRealHealth(self.Target)/self.Target.maxHealth <= 0.25 and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target.pos) end
    if Config.Combo.Rm > 1 and self.QCast == 2 and myHero:GetSpellData(_R).name ~= "RivenFengShuiEngine" then Cast(_R, self.Target.pos) end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Combo.W then
      Cast(_W)
    end
    if sReady[_Q] and not sReady[_E] and GetDistance(self.Target) > loadedOrb.myRange + 30 then
      if self.EDelay + 300 < GetTickCount() and self.QDelay + 1.2 < os.clock() then
        Cast(_Q, self.Target.pos)
      end
    end
  end

  function Riven:Harrass()
    if GetDistance(self.Target) > loadedOrb.myRange + 30 and sReady[_E] and Config.Harrass.E and GetDistance(self.Target) < data[2].range then
      Cast(_E, self.Target.pos)
    end
    if sReady[_W] and GetDistance(self.Target) < data[1].range and Config.Harrass.W then
      Cast(_W)
    end
  end

  function Riven:LaneClear()
    local minion = GetJMinion(450)
    if not minion then
      minion = GetClosestMinion(450)
    end
    if GetDistance(minion) > loadedOrb.myRange + 30 and sReady[_E] and Config.LaneClear.E and GetDistance(minion) < data[2].range then
      Cast(_E, minion.pos)
    end
    if sReady[_E] and minion.team > 200 then
      Cast(_E, minion.pos)
    end
    if sReady[_W] and GetDistance(minion) < data[1].range and Config.LaneClear.W then
      Cast(_W)
    end
    if sReady[_Q] and GetDistance(minion) > loadedOrb.myRange + 36 then
      Cast(_Q, minion.pos)
    end
  end

  function Riven:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        local health = GetRealHealth(enemy)
        if Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
          CastSpell(Smite, enemy)
        end
      end
    end
  end

class "Rumble"

  function Rumble:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = 310, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 0-10+20*level+(0.35+0.05*level)*TotalDmg end},
      [_W] = { range = 265, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20+30*level+TotalDmg end},
      [_E] = { range = 390},
      [_R] = { range = 930, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (40+40*level+0.6*source.addDamage)*(math.min(3,math.max(1,4*(target.maxHealth-target.health)/target.maxHealth))) end},
    }
  end

  function Rumble:Load()
    SetupMenu()
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
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
          Cast(_E, winion, 1.2)
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
        Cast(_E, winion, 1.2)
      end
    end
  end

  function Rumble:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.2)
    end
    if Config.Combo.W then 
      Cast(_W) 
    end
    if myHero:CanUseSpell(_E) == READY and Config.Combo.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, 1.5)
    end
    if Config.Combo.R and (GetDmg(_R, myHero, Target) >= GetRealHealth(Target) or (EnemiesAround(Target, 500) > 2)) and ValidTarget(Target, data[3].range) then
      local CastPosition, HitChance, Position = UPL:Predict(_R, myHero, Target)
      if CastPosition and HitChance >= 2 then
        CastSpell3(_R, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))  
      end
    end
  end

  function Rumble:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, 1.2)
    end
    if Config.Harrass.W then Cast(_W) end
    if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, data[2].range) then
      Cast(_E, Target, 1.5)
    end
  end

  function Rumble:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 1.2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, 1.5)
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) then
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

class "Ryze"

  function Ryze:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 600, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 1875, delay = 0.25, range = 900, width = 55, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 25+35*level+0.55*AP+(0.015+0.05*level)*source.maxMana end},
      [_W] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 60+20*level+0.4*AP+0.025*myHero.maxMana end},
      [_E] = { range = 600, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 34+16*level+0.3*AP+0.02*myHero.maxMana end},
      [_R] = { range = 900}
    }
  end

  function Ryze:Load()
    SetupMenu()
    self.passiveTracker = 0
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
    AddGapcloseCallback(_W, data[1].range, true, Config.Misc)
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
      
      if starget and minD < starget.boundingRadius*2 then
        if self.Forcetarget and starget.charName == self.Forcetarget.charName then
          self.Forcetarget = nil
          ScriptologyMsg("Target un-selected.")
        else
          self.Forcetarget = starget
          ScriptologyMsg("New target selected: "..starget.charName.."")
        end
      end
    end
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
        if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_R] and Config.LaneClear.R and Config.LaneClear.manaR < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_R) 
        elseif sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.LaneClear.E and Config.LaneClear.manaE < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
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
        if sReady[_Q] and Config.Combo.Q then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_R] and Config.Combo.R then 
          CastSpell(_R) 
        elseif sReady[_W] and Config.Combo.W then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.Combo.E then 
          CastSpell(_E, target) 
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
        if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
          local x1, x2, x3 = UPL.VP:GetLineCastPosition(target, 0.25, 55, 900, 1875, myHero, false) 
          if x2 and x2 >= 2 then CastSpell(_Q, x1.x, x1.z) end 
        elseif sReady[_W] and Config.Harrass.W and Config.Harrass.manaW < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_W, target) 
        elseif sReady[_E] and Config.Harrass.E and Config.Harrass.manaE < myHero.mana/myHero.maxMana*100 then 
          CastSpell(_E, target) 
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
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, false, true, 2)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy, true)
        elseif myHero:CanUseSpell(_E) == READY and myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.W and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_W, enemy, true)
          DelayAction(function() Cast(_E, enemy, true) end, 0.25)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
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
        if GetRealHealth(enemy) < mult*(damageQ+damageW+damageE) then
          killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Kill"
        end
        if GetRealHealth(enemy) > mult*(damageQ+damageW+damageE) then
          local neededAA = math.ceil(100*(damageQ+damageW+damageE)/(GetRealHealth(enemy)))
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

class "Talon"

  function Talon:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return TotalDmg+30*level+0.3*(myHero.addDamage) end},
      [_W] = { speed = 900, delay = 0.5, range = 600, width = 200, collision = false, aoe = false, type = "cone", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(5+25*level+0.6*(myHero.addDamage)) end},
      [_E] = { range = 700},
      [_R] = { speed = math.huge, delay = 0.25, range = 0, width = 650, collision = false, aoe = false, type = "circular", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 2*(70+50*level+0.75*(myHero.addDamage)) end}
    }
  end

  function Talon:Load()
    SetupMenu()
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
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          CastSpell(_Q, myHero:Attack(winion))
        end
      end
    end
    if myHero:GetSpellData(_Q).currentCd > 0 and not self.Target and myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
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
    if myHero:CanUseSpell(_E) ~= READY and myHero:CanUseSpell(_R) == READY and Config.Combo.R and ValidTarget(self.Target, data[3].width) and GetRealHealth(self.Target) < GetDmg(_Q, myHero, self.Target)+GetDmg(_W, myHero, self.Target)+GetDmg("AD", myHero, self.Target)+GetDmg(_R, myHero, self.Target) then
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
        if dmg >= GetRealHealth(enemy) and EnemiesAround(enemy,750) < 3 then
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

class "Teemo"

  function Teemo:__init()
   targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, myHero.range+myHero.boundingRadius*3, DAMAGE_MAGICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*3, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.8*AP end},
      [_W] = { range = 25000},
      [_E] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 9*level+0.3*AP end},
      [_R] = { range = myHero.range, width = 250}
    }
  end

  function Teemo:Load()
    SetupMenu(true)
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
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
  end

  function Teemo:LaneClear()
    if Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_Q, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q, winion)
        end
      end
    end
  end

  function Teemo:Combo()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target)
    end
    if Config.Combo.I and Ignite and myHero:CanUseSpell(Ignite) == READY and ValidTarget(Target, 600) and (GetRealHealth(Target) < (50+20*myHero.level+GetDmg(_Q,myHero,Target)+GetDmg("AD",myHero,Target)*5*myHero.attackSpeed) or killTextTable[Target.networkID].indicatorText:find("Killable")) then
      CastSpell(Ignite, Target)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Harrass()
    if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target)
    end
    if Config.Combo.R and ValidTarget(Target, data[3].width) then
      Cast(_R, Target)
    end
  end

  function Teemo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy)
        elseif GetRealHealth(enemy) < GetDmg("AD", myHero, enemy)+GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
        elseif myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+GetDmg("AD", myHero, enemy) and Config.Killsteal.E and Config.Killsteal.Q and ValidTarget(enemy, myHero.range+myHero.boundingRadius) then
          myHero:Attack(enemy)
          DelayAction(Cast, 0.25, {_Q, enemy})
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

class "Thresh"

  function Thresh:__init()
    require "Collision"
    self.Forcetarget = nil
    data = {
      [_Q] = { speed = 1825, delay = 0.25, range = 1050, width = 70, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.8*AP end},
      [_W] = { range = 25000},
      [_E] = { speed = 2000, delay = 0.25, range = 450, width = 110, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 9*level+0.3*AP end},
      [_R] = { range = myHero.range, width = 250}
    }
    self.Col = Collision(data[0].range, data[0].speed, data[0].delay, data[0].width+30)
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[0].range, DAMAGE_MAGIC, false, true)
  end

  function Thresh:Load()
    SetupMenu()
  end

  function Thresh:Menu()
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
    AddGapcloseCallback(_Q, data[0].range, false, Config.Misc)
  end

  function Thresh:Combo()
    local target = self.Target
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Combo.E and GetDistance(target,myHero) < data[2].range then
      local flayTowards = nil
      if #GetAllyHeroes() > 0 then
        for _,unit in pairs(GetAllyHeroes()) do
          if GetDistance(unit) < 1000 then
            flayTowards = unit
          end
        end
      end
      if flayTowards then
        Cast(_E, flayTowards, 1, target)
      else
        Cast(_E, myHero, 1, target)
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
          Cast(_Q, CastPosition)
        elseif Smite and Config.Misc.S and mcol+mcol2 == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = nil
          for _,k in pairs(Mobs.objects) do
            if not minion and k and GetDistanceSqr(k) < data[2].range*data[2].range then minion = k end
            if minion and k and GetDistanceSqr(k,myHero)+GetDistanceSqr(k,CastPosition) < GetDistanceSqr(minion,myHero)+GetDistanceSqr(minion,CastPosition) and GetDistanceSqr(k) < data[2].range*data[2].range then
              minion = k
            end
          end
          if minion then
            Cast(_Q, CastPosition)
            DelayAction(function() CastSpell(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
  end

  function Thresh:Harrass()
    local target = self.Target
    local target = self:GetBestTarget(data[0].range)
    if self.Forcetarget ~= nil and ValidTarget(self.Forcetarget, data[0].range*2) then
      target = self.Forcetarget  
    end

    if target and myHero:CanUseSpell(_E) == READY and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and GetDistance(target,myHero) < data[2].range then
      Cast(_E, target, 1)
    end
    
    if target and myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      local CastPosition,  HitChance, HeroPosition = UPL:Predict(_Q, myHero, target)
      if HitChance > 1.5 and GetDistance(CastPosition) <= data[0].range  then
        local Mcol, mcol = self.Col:GetMinionCollision(myHero, CastPosition)
        local Mcol2, mcol2 = self.Col:GetMinionCollision(myHero, target)
        if not Mcol and not Mcol2 then
          Cast(_Q, CastPosition)
        elseif Smite and Config.Misc.S and mcol+mcol2 == 1 and myHero:CanUseSpell(Smite) == READY then
          local minion = nil
          for _,k in pairs(Mobs.objects) do
            if not minion and k and GetDistanceSqr(k) < data[2].range*data[2].range then minion = k end
            if minion and k and GetDistanceSqr(k,myHero)+GetDistanceSqr(k,CastPosition) < GetDistanceSqr(minion,myHero)+GetDistanceSqr(minion,CastPosition) and GetDistanceSqr(k) < data[2].range*data[2].range then
              minion = k
            end
          end
          if minion then
            Cast(_Q, CastPosition)
            DelayAction(function() CastSpell(Smite, minion) end, GetDistance(minion) / data[_Q].speed + data[_Q].delay)
          end
        end
      end
    end
  end

  function Thresh:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, enemy, 2)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          CastSpell(_E, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_R) == READY and GetRealHealth(enemy) < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range-enemy.boundingRadius) then
          Cast(_R)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Thresh:Draw()
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

  function Thresh:WndMsg(Msg, Key)
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
      
      if starget and minD < starget.boundingRadius*2 then
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

class "Vayne"

  function Vayne:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 450, dmgAD = function(AP, level, Level, TotalDmg, source, target) return (1.25+0.05*level)*TotalDmg end},
      [_W] = { range = myHero.range+myHero.boundingRadius*2, dmgTRUE = function(AP, level, Level, TotalDmg, source, target) return 10+10*level+((0.03+0.01*level)*target.maxHealth) end},
      [_E] = { speed = 2000, delay = 0.25, range = 1000, width = 0, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 10+35*level+0.5*source.addDamage end},
      [_R] = { range = 1000}
    }
    stackTable = {}
  end

  function Vayne:Load()
    SetupMenu(true)
    self.lastCalc = 0
    self.cdTable = {}
    self.roll = false
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
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
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, false)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addParam("offsetE", "Max E range %", SCRIPT_PARAM_SLICE, 100, 0, 100, 0)
    Config.Misc:addDynamicParam("Ea", "Auto E if can stun", SCRIPT_PARAM_ONOFF, true)
    AddGapcloseCallback(_E, 500, true, Config.Misc)
  end

  function Vayne:Tick()
    self.roll = (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    if not Config.Misc.Ea or not sReady[_E] then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy, 1000) and enemy ~= nil and not enemy.dead then
        self:MakeUnitHugTheWall(enemy)
      end
    end
  end

  function Vayne:ProcessSpell(unit, spell)
    if unit and spell and unit.isMe and spell.name then
      if spell.name:lower():find("attack") and self.roll then
        if sReady[_Q] then
          DelayAction(function() Cast(_Q, mousePos) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
        end
      end
      if spell.name:lower():find("attack") and spell.target.type == myHero.type and Config.Killsteal.E and myHero:CanUseSpell(_E) == READY and GetRealHealth(spell.target) < GetDmg(_E, myHero, spell.target)+GetDmg("AD", myHero, spell.target)+(GetStacks(spell.target) == 1 and GetDmg(_W, myHero, spell.target) or 0) and ValidTarget(spell.target, data[2].range) then
        local t = spell.target
        DelayAction(function() Cast(_E, t) end, spell.windUpTime - GetLatency() / 2000 + 0.07)
      end
    end
  end

  function Vayne:MakeUnitHugTheWall(unit)
    if not unit or unit.dead or not unit.visible or not sReady[_E] then return end
    local x, y = VP:CalculateTargetPosition(unit, data[2].delay, data[2].width, data[2].speed, myHero)
    local b = unit.boundingRadius
    for _=0,(450)*Config.Misc.offsetE/100,b do
      local dir = x+(Vector(x)-myHero):normalized()*_
      if IsWall(D3DXVECTOR3(dir.x,dir.y,dir.z)) then
        Cast(_E, unit)
        return true
      end
    end
    return false
  end

  function Vayne:LaneClear()
    target = GetJMinion(data[2].range)
    if not target then
      target = GetLowestMinion(data[2].range)
    end
    if sReady[_E] and Config.LaneClear.E then
      self:MakeUnitHugTheWall(target)
    end
  end

  function Vayne:Combo()
    if sReady[_E] and Config.Combo.E then
      self:MakeUnitHugTheWall(Target)
    end
  end

  function Vayne:Harrass()
    if sReady[_E] and Config.Harrass.E then
      self:MakeUnitHugTheWall(Target)
    end
  end

  function Vayne:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q, myHero:Attack(enemy))
        elseif myHero:CanUseSpell(_E) == READY and self.HP:PredictHealth(enemy, (math.min(data[2].range, GetDistance(myHero, enemy)) / (2000) + 0.25)) < GetDmg(_E, myHero, enemy)+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          Cast(_E, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy)*2+(GetStacks(enemy) == 2 and GetDmg(_W, myHero, enemy) or 0) and Config.Killsteal.E and ValidTarget(enemy, data[2].range) then
          self:MakeUnitHugTheWall(enemy)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end

  function Vayne:ApplyBuff(unit, source, buff)
    if unit and source and source.isMe and buff and buff.name == "vaynesilvereddebuff" then
      stackTable[unit.networkID] = 1
    end
  end

  function Vayne:UpdateBuff(unit, buff, stacks)
    if unit and buff and stacks and buff.name == "vaynesilvereddebuff" then
      stackTable[unit.networkID] = stacks
    end
  end

  function Vayne:RemoveBuff(unit, buff)
    if unit and buff and buff.name == "vaynesilvereddebuff" then
      stackTable[unit.networkID] = 0
    end
  end

  function GetStacks(x)
    return stackTable[x.networkID] or 0
  end

class "Veigar"
  function Veigar:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1150, DAMAGE_MAGIC, false, true)
    data = {
      [_Q] = { speed = 2000, delay = 0.25, range = 950, width = 70, collision = true, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 35+45*level+0.6*AP end},
      [_W] = { speed = math.huge, delay = 1.2, range = 900, width = 225, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 70+50*level+AP end},
      [_E] = { speed = math.huge, delay = 0.5, range = 725, width = 275, collision = false, aoe = false, type = "circular"},
      [_R] = { range = 650, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 125+125*level+AP+target.ap end} -- 250 / 375 / 500 (+ 100% AP) (+ 80% of target's AP)
    }
    self.Target = nil
  end

    function Veigar:Load()
      SetupMenu()
    end

  function Veigar:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
    Config.Harrass:addParam("WE", "Only E with W", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
    if Ignite ~= nil then Config.Killsteal:addParam("I", "Ignite", SCRIPT_PARAM_ONOFF, true) end
    Config.Harrass:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.Harrass:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.Harrass:addParam("manaE", "Mana E", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LaneClear:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.LaneClear:addParam("manaW", "Mana W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
    Config.LastHit:addParam("manaQ", "Mana Q", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)
    Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
    Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    Config.Misc:addDynamicParam("Ea", "Auto E", SCRIPT_PARAM_ONOFF, true)
    Config.Misc:addParam("Ee", "Enemies to E (stun)", SCRIPT_PARAM_SLICE, math.ceil(#GetEnemyHeroes()/2), 0, #GetEnemyHeroes(), 0)
  end

  function Veigar:Combo()
    if sReady[_Q] and Config.Combo.Q then
      Cast(_Q, self.Target, 2)
    end
    if sReady[_E] and Config.Combo.E and sReady[_W] and Config.Combo.W then
        local pos, b = PredictPos(self.Target)
        if GetDistance(pos) < data[_E].range+350 then
          local ep  = Vector(self.Target) + (Vector(pos) - (self.Target.isMoving and self.Target or myHero)):normalized() * 350
          local epl = (Vector(myHero) - ep):len()
          local ept = ep
          ep = ep + (Vector(myHero) - ep):normalized() * math.min(epl, data[_E].range)
          ep = GetDistance(ep) == 0 and ept or ep
          Cast(_E, ep)
        if sReady[_W] and Config.Combo.W then 
          DelayAction(function() Cast(_W, self.Target.pos) end, 0.33) 
        end
        end
    elseif sReady[_W] and Config.Combo.W and not Config.Combo.WE then
      Cast(_W, self.Target, 2)
    end
    if sReady[_R] and Config.Combo.R and target.health < GetDmg(_R, myHero, target) then
      Cast(_R, self.Target)
    end
  end

  function Veigar:Harrass()
    if sReady[_Q] and Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana then
      Cast(_Q, self.Target, 2)
    end
    if sReady[_E] and Config.Harrass.E and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana then
        local pos, b = PredictPos(self.Target)
        if GetDistance(pos) < data[_E].range+350 then
          local ep  = Vector(self.Target) + (Vector(pos) - (self.Target.isMoving and self.Target or myHero)):normalized() * 350
          local epl = (Vector(myHero) - ep):len()
          local ept = ep
          ep = ep + (Vector(myHero) - ep):normalized() * math.min(epl, data[_E].range)
          ep = GetDistance(ep) == 0 and ept or ep
          Cast(_E, ep)
        if sReady[_W] and Config.Combo.W then 
          DelayAction(function() Cast(_W, self.Target.pos) end, 0.33) 
        end
        end
    elseif sReady[_W] and Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and not Config.Harrass.WE then
      Cast(_W, self.Target, 2)
    end
  end

  function Veigar:LastHit()
    if sReady[_Q] and Config.LastHit.Q and Config.LastHit.manaQ <= 100*myHero.mana/myHero.maxMana then
        local BestPos 
        local BestHit = 0
        source = source or myHero
        local objects = minionManager(MINION_ENEMY, data[0].range, source, MINION_SORT_HEALTH_ASC).objects
        for i, object in ipairs(objects) do
          local EndPos = Vector(source) + data[0].range * (Vector(object) - Vector(source)):normalized()
          local hit = self:CountObjectsOnLineSegment(source, EndPos, data[0].width, objects)
          if hit > BestHit then
            BestHit = hit
            BestPos = object
            if BestHit == #objects then
              break
            end
          end
        end
        if BestHit > 0 then
        Cast(_Q, BestPos.pos) -- wat
        end
    end
  end

  function Veigar:CountObjectsOnLineSegment(StartPos, EndPos, width, objects)
      local n = 0
      for i, object in ipairs(objects) do
        local pointSegment, pointLine, isOnSegment = VectorPointProjectionOnLineSegment(StartPos, EndPos, object)
        local w = width
        if isOnSegment and object.health <= GetDmg(_Q, myHero, object) and GetDistanceSqr(pointSegment, object) < w * w and GetDistanceSqr(StartPos, EndPos) > GetDistanceSqr(StartPos, object) then
          n = n + 1
        end
      end
      return n
  end

  function Veigar:LaneClear()
    if sReady[_Q] and Config.LaneClear.Q and Config.LaneClear.manaQ <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetLineFarmPosition(data[0].range, data[0].width)
      if BestPos and BestHit > 0 then
        Cast(_Q, BestPos.pos) -- wat
      end
    end
    if sReady[_W] and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana then
      local BestPos, BestHit = GetFarmPosition(data[1].range, data[1].width)
      if BestPos and BestHit > 0 then
        Cast(_W, BestPos)
      end
    end
  end

  function Veigar:Killsteal()
      for k,enemy in pairs(GetEnemyHeroes()) do
        if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
          local health = GetRealHealth(enemy)
          if myHero:CanUseSpell(_Q) == READY and health < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) and GetDistance(enemy) < data[0].range then
            Cast(_Q, enemy, 2)
          elseif myHero:CanUseSpell(_R) == READY and health < GetDmg(_R, myHero, enemy) and Config.Killsteal.R and ValidTarget(enemy, data[3].range) and GetDistance(enemy) < data[3].range then
            Cast(_R, enemy)
          elseif Ignite and myHero:CanUseSpell(Ignite) == READY and health < (50 + 20 * myHero.level) / 5 and Config.Killsteal.I and ValidTarget(enemy, 600) then
            CastSpell(Ignite, enemy)
          elseif Smite and myHero:CanUseSpell(Smite) == READY and GetRealHealth(enemy) < 20+8*myHero.level and Config.Killsteal.S and ValidTarget(enemy, 600) then
            CastSpell(Smite, enemy)
          end
        end
      end
  end

class "Viktor"

  function Viktor:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = 666, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20*level+20+0.2*AP end},
      [_W] = { range = 700, speed = math.huge, delay = 0.25, width = 240, collision = false, aoe = false, type = "circular" },
      [_E] = { speed = 2000, delay = 0.25, range = 525, width = 80, collision = false, aoe = false, type = "linear", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45*level+25+0.7*AP end},
      [_R] = { range = 700, speed = math.huge, delay = 0.5, width = 240, collision = false, aoe = false, type = "circular", dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+115*level+0.65*AP end}
    }
  end

  function Viktor:Load()
    SetupMenu()
    UPL:AddSpell(_E, { speed = 2000, delay = 0.25, range = 875, width = 80, collision = false, aoe = false, type = "linear"})
  end

  function Viktor:Menu()
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

  function Viktor:Combo()
    if Config.Combo.Q and sReady[_Q] then
      Cast(_Q, Target)
    end
    if Config.Combo.E and sReady[_E] then
      local CastPosition, HitChance, Position = UPL:Predict(_E, myHero, Target)
      if CastPosition and HitChance >= 2 then
        if GetDistance(CastPosition) > 525 then
          local CastPosition2 = myHero - (Vector(CastPosition)-myHero):normalized()*525
          CastSpell3(_E, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))
        else
          CastSpell3(_E, D3DXVECTOR3(Target.x, Target.y, Target.z), D3DXVECTOR3(CastPosition.x, CastPosition.y, CastPosition.z))
        end
      end
    end
  end

class "Volibear"

  function Volibear:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_PHYSICAL, false, true)
    data = {
      [_Q] = { range = myHero.range+myHero.boundingRadius*2, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 30*level+TotalDmg end},
      [_W] = { range = myHero.range*2+myHero.boundingRadius+25, dmgAD = function(AP, level, Level, TotalDmg, source, target) return ((1+(target.maxHealth-target.health)/target.maxHealth))*(45*level+35+0.15*(source.maxHealth-(440+86*Level))) end},
      [_E] = { range = myHero.range*2+myHero.boundingRadius*2+10, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 45*level+15+0.6*AP end},
      [_R] = { range = myHero.range+myHero.boundingRadius, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 40*level+35+0.3*AP end}
    }
  end

  function Volibear:Load()
    SetupMenu(true)
  end

  function Volibear:Menu()
    Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
    Config.Combo:addParam("Ws", "Save W (execute)", SCRIPT_PARAM_ONOFF, true)
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
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
          Cast(_Q)
        end
      end
    end
    if myHero:CanUseSpell(_W) == READY and ((Config.kConfig.LastHit and Config.LastHit.W and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.W and Config.LaneClear.manaW <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_W, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          Cast(_W, winion)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and ((Config.kConfig.LastHit and Config.LastHit.E and Config.LastHit.manaW <= 100*myHero.mana/myHero.maxMana) or (Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana)) then
      for minion,winion in pairs(Mobs.objects) do
        local MinionDmg = GetDmg(_E, myHero, winion)
        if MinionDmg and MinionDmg >= GetRealHealth(winion) and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
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
        elseif GetRealHealth(minionTarget) < GetRealHealth(winion) and ValidTarget(winion, data[0].range) and GetDistance(winion) < data[0].range then
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
        elseif GetRealHealth(minionTarget) < GetRealHealth(winion) and ValidTarget(winion, data[1].range) and GetDistance(winion) < data[1].range then
          minionTarget = winion
        end
        if minionTarget ~= nil then
          Cast(_W, minionTarget)
        end
      end
    end
    if myHero:CanUseSpell(_E) == READY and Config.kConfig.LaneClear and Config.LaneClear.E and Config.LaneClear.manaE <= 100*myHero.mana/myHero.maxMana then
      local minionTarget = nil
      for minion,winion in pairs(Mobs.objects) do
        if minionTarget == nil then 
          minionTarget = winion
        elseif GetRealHealth(minionTarget) < GetRealHealth(winion) and ValidTarget(winion, data[2].range) and GetDistance(winion) < data[2].range then
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
      if Config.Combo.Ws then
        if GetDmg(_W, Target, myHero) >= GetRealHealth(Target) then
          Cast(_W, Target)
        end
      else
        Cast(_W, Target)
      end
    end
    if Config.Combo.E and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) and GetDistance(Target) < data[2].range then
      Cast(_E)
    end
    if Config.Combo.R and myHero:CanUseSpell(_R) == READY and ValidTarget(Target, data[3].range) then
      if EnemiesAround(myHero, 500) > 1 then
        Cast(_R)
      elseif GetDmg("AD", myHero, Target)*(5+1.337) <= Target.health then
        Cast(_R)
      end
    end
  end

  function Volibear:Harrass()
    if Config.Harrass.Q and Config.Harrass.manaQ <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_Q) == READY and ValidTarget(Target, data[0].range) then
      Cast(_Q)
    end
    if Config.Harrass.W and Config.Harrass.manaW <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_W) == READY and ValidTarget(Target, data[1].range) then
      Cast(_W, Target)
    end
    if Config.Harrass.E and GetDistance(pos) < data[2].range and Config.Harrass.manaE <= 100*myHero.mana/myHero.maxMana and myHero:CanUseSpell(_E) == READY and ValidTarget(Target, data[2].range) then
      Cast(_E)
    end
  end

  function Volibear:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < GetDmg(_Q, myHero, enemy) and Config.Killsteal.Q and ValidTarget(enemy, data[0].range) then
          Cast(_Q)
        elseif myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < GetDmg(_W, myHero, enemy) and Config.Killsteal.W and ValidTarget(enemy, data[1].range) then
          Cast(_W, enemy)
        elseif myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < GetDmg(_E, myHero, enemy) and Config.Killsteal.E and ValidTarget(enemy, data[2].range-enemy.boundingRadius) then
          Cast(_E)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
      end
    end
  end        

class "SWalk"

  function SWalk:__init(m, Cfg)
    self.melee = m or myHero.range < 450 or myHero.charName == "Rengar"
    self.aaResetTable, self.aaResetTable2, self.aaResetTable3, self.aaResetTable4 = {}, {}, {}, {}
    self.orbDisabled = false
    self.State = {}
    self.orbTable = { lastAA = 0, windUp = 13.37, animation = 13.37 }
    self.myRange = myHero.range+myHero.boundingRadius
    if Cfg then
      Cfg:addSubMenu("SWalk", "SWalk")
      self.Config = Cfg.SWalk
    else
      self.Config = scriptConfig("SWalk", "SW"..myHero.charName)
    end
    self.Config:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("radj", "Reset AA adjustment", SCRIPT_PARAM_ONOFF, false)
    self.Config:addParam("lhadj", "Lasthit adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("rlhadj", "Reset AA adjustment", SCRIPT_PARAM_ONOFF, false)
    self.Config:setCallback("radj", function(var) if var then self.Config.cadj = 0 self.Config.radj = false end end)
    self.Config:setCallback("rlhadj", function(var) if var then self.Config.lhadj = 0 self.Config.rlhadj = false end end)
    self.Config:addParam("i", "Use items", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("m", "Move", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("a", "Attack", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("d", "Draw", SCRIPT_PARAM_ONOFF, true)
    AddTickCallback(function() self:OrbWalk() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
    if self.melee and myHero.charName ~= "Jayce" and myHero.charName ~= "Nidalee" then 
      self.Config:addParam("wtt", "Walk to Target", SCRIPT_PARAM_ONOFF, true) 
    end
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
    self.Config:addSubMenu("Target Selector", "ts")
    self.Config.ts:addTS(self.ts)
    ArrangeTSPriorities()
    if not Cfg or not ScriptologyConfig[myHero.charName] or not ScriptologyConfig[myHero.charName].kConfig then
      sReady = {}
      self.Config:addSubMenu("Key Settings", "kConfig")
      self.Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
      self.Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    else
      self.Config.kConfig = ScriptologyConfig[myHero.charName].kConfig
    end
    self.altAttacks = Set { "caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", "renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "xenzhaothrust2", "xenzhaothrust3" }
    self.resetAttacks = Set { "dariusnoxiantacticsonh", "fioraflurry", "garenq", "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", "luciane", "lucianq", "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade", "parley", "poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack", "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", "vaynetumble", "vie", "volibearq", "xenzhaocombotarget", "yorickspectral", "reksaiq" }
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
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    return self
  end

  function Set(list)
    local set = {}
    for _, l in ipairs(list) do 
      set[l] = true 
    end
    return set
  end

  function SWalk:Draw()
    if self.orbTable.windUp == 13.37 or self.orbTable.animation == 13.37 then
      DrawText("Please attack something with an unbuffed autoattack", 20, WINDOW_W/3, WINDOW_H/8, ARGB(255,255,255,255))
    end
    if not self.Config.d then return end
    DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.range+myHero.boundingRadius, 1, ARGB(105,0,255,0), 32)
  end

  function SWalk:OrbWalk()
    self.ts.range = self.myRange
    self.ts:update()
    local Target = nil
    if self.ts.target then 
      Target = self.ts.target 
    end
    self.myRange = myHero.range+myHero.boundingRadius+(Target and Target.boundingRadius or 0)
    if not self.Config.kConfig then return end
    if self.Config.kConfig.LastHit then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      dmg = GetDmg("AD", myHero, self.Target)
      if self.Target and dmg and health > dmg then
        self.Target = nil
      end
      if health < 0 then self.Target = nil end
    end
    if self.Config.kConfig.LaneClear then
      self.Target, health = self:GetLowestPMinion(self.myRange)
      if not self.Target then
        self.Target = GetJMinion(self.myRange)
      else
        dmg = GetDmg("AD",myHero,self.Target)
        if dmg and health-dmg > 0 then
          mtarget, health = self:GetHighestPMinion(self.myRange)
          if mtarget == self.Target and health ~= mtarget.health and #minionManager(MINION_ENEMY, self.myRange, myHero, MINION_SORT_HEALTH_ASC).objects > 1 then
            self.Target = nil
          else
            self.Target = mtarget
          end
        end
        if health < 0 then self.Target = nil end
      end
    end 
    if self.Config.kConfig.Harrass then
      self.Target = Target
    end
    if self.Config.kConfig.Combo then
      self.Target = Target
    end
    if (self.Forcetarget or Forcetarget or (loadedClass and loadedClass.Forcetarget)) and (self.Config.kConfig.Harrass or self.Config.kConfig.Combo) then
      local t = self.Target
      self.Target = (loadedClass and loadedClass.Forcetarget or self.Forcetarget or Forcetarget)
      self.Target = ValidTarget(self.Target, self.myRange*1.25) and self.Target or t
    end
    local t = GetTarget()
    if t and ValidTarget(t, self.myRange) and (self.Config.kConfig.LaneClear or self.Config.kConfig.Combo) then
      self.Target = t
    end
    if self:DoOrb() then
      self:Orb(self.Target) 
    end
  end

  function SWalk:Orb(unit)
    if _G.Evade or self.orbDisabled then return end
    if not ValidTarget(unit, self.myRange) then unit = Target end
    local valid = false
    if myHero.charName == "Azir" and ScriptologyLoaded then 
      if ValidTarget(unit) then
        for _,k in pairs(loadedClass.GetSoldiers()) do
          if GetDistance(k,unit) < data[_W].width and GetDistance(k) <= 850 then
            valid = true
          end
        end
      end
    end
    if not valid then
      valid = ValidTarget(unit, self.myRange)
    end
    if self.Config.a and os.clock() > self.orbTable.lastAA + self.orbTable.animation and valid and ValidTarget(unit) then
      myHero:Attack(unit)
    elseif self.Config.m and GetDistance(mousePos) > myHero.boundingRadius and (self.Config.pc and os.clock() > self.orbTable.lastAA or os.clock() > self.orbTable.lastAA + self.orbTable.windUp) then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and ValidTarget(unit, self.myRange+125) and unit.type == myHero.type and self.melee and self.Config.wtt then
        if GetDistance(unit) > self.myRange then
          myHero:MoveTo(unit.x, unit.z)
        end
      elseif self:DoOrb() and GetDistance(mousePos) > myHero.boundingRadius then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function SWalk:DoOrb()
    for _=0,3 do
      sReady[_] = myHero:CanUseSpell(_) == READY
    end
    self.State[_Q] = not ScriptologyLoaded or (Config.kConfig.Combo and Config.Combo.Q) or (Config.kConfig.Harrass and Config.Harrass.Q) or (Config.kConfig.LastHit and Config.LastHit.Q) or (Config.kConfig.LaneClear and Config.LaneClear.Q)
    self.State[_W] = not ScriptologyLoaded or (Config.kConfig.Combo and Config.Combo.W) or (Config.kConfig.Harrass and Config.Harrass.W) or (Config.kConfig.LastHit and Config.LastHit.W) or (Config.kConfig.LaneClear and Config.LaneClear.W)
    self.State[_E] = not ScriptologyLoaded or (Config.kConfig.Combo and Config.Combo.E) or (Config.kConfig.Harrass and Config.Harrass.E) or (Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)
    self.IState = self.Config.kConfig.Combo or self.Config.kConfig.Harrass
    return self.Config.kConfig.Combo or self.Config.kConfig.Harrass or self.Config.kConfig.LastHit or self.Config.kConfig.LaneClear
  end

  function SWalk:GetLowestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = HP:PredictHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.lhadj/100 - 0.07)
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

  function SWalk:GetHighestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = HP:PredictHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.lhadj/100 - 0.07)
      if minionTarget == nil then 
        minionTarget = minion
        health = hp
      elseif health <= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
      end
    end
    return minionTarget, health
  end

  function SWalk:ProcessSpell(unit, spell)
    if unit and unit.isMe and spell and spell.name then
      if spell.name:lower():find("attack") or self.altAttacks[spell.name:lower()] then
        local windUp = spell.windUpTime + self.Config.cadj/1000
        self.orbTable.windUp = windUp + 0.07
        self.orbTable.animation = spell.animationTime
        self.orbTable.lastAA = os.clock()
        DelayAction(function() 
          self:WindUp(self.Target) 
        end, windUp - GetLatency() / 2000 + 0.07)
      end
      if self.resetAttacks[spell.name:lower()] then
        self.orbTable.lastAA = 0
      end
    end
  end

  RESET_SELF, RESET_PREDICT, RESET_TARGET, RESET_MOUSE = 111, 222, 333, 444
  function SWalk:AddReset(Spell, type)
    if type == RESET_SELF then
      table.insert(self.aaResetTable, Spell)
    elseif type == RESET_PREDICT then
      table.insert(self.aaResetTable2, Spell)
    elseif type == RESET_TARGET then
      table.insert(self.aaResetTable3, Spell)
    elseif type == RESET_MOUSE then
      table.insert(self.aaResetTable4, Spell)
    end
  end

  function SWalk:WindUp(unit)
    if ValidTarget(unit) then
      local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
      if (self.Config.aar and self.IState or true) then
        if self.aaResetTable then
          for _,k in pairs(self.aaResetTable) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k)
              return true
            end
          end
        end
        if self.aaResetTable2 then
          for _,k in pairs(self.aaResetTable2) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              if UPLloaded and data[k].type then
                if Cast(k, unit, 1) then
                  self.orbTable.lastAA = 0
                  return true
                end
              else
                self.orbTable.lastAA = 0
                CastSpell(k, unit.x, unit.z)
                return true
              end
            end
          end
        end
        if self.aaResetTable3 then
          for _,k in pairs(self.aaResetTable3) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, unit)
              return true
            end
          end
        end
        if self.aaResetTable4 then
          for _,k in pairs(self.aaResetTable4) do
            range = ScriptologyLoaded and (data[k].range > 0 and data[k].range or data[k].width) or self.myRange
            if sReady[k] and self.State[k] and GetDistanceSqr(unit) < range * range then
              self.orbTable.lastAA = 0
              CastSpell(k, mousePos.x, mousePos.z)
              return true
            end
          end
        end
      end
      if self.IState and self.Config.i then 
        if self:CastItems(unit) then
          self.orbTable.lastAA = 0
        end
      end
    end
    return false
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

class "Yasuo"

  function Yasuo:__init()
    data = {
      [_Q] = { range = 500, speed = math.huge, delay = 0.125, width = 55, type = "linear", dmgAD = function(AP, level, Level, TotalDmg, source, target) return 20*level+TotalDmg-10 end},
      [_W] = { range = 350},
      [_E] = { range = 475, dmgAP = function(AP, level, Level, TotalDmg, source, target) return 50+20*level+AP end},
      [_R] = { range = 1200, dmgAD = function(AP, level, Level, TotalDmg, source, target) return 100+100*level+1.5*TotalDmg end},
      [-2] = { range = 1200, speed = 1200, delay = 0.125, width = 65, type = "linear" }
    }
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, data[3].range, DAMAGE_PHYSICAL, false, true)
    self.Target = nil
  end

  function Yasuo:Load()
    SetupMenu()
    self.passiveTracker = false
    self.passiveName = "yasuoq3w"
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
      data[0].range = 1200
    else
      data[0].range = 500
    end
    if loadedEvade then
      if sReady[_W] and (Config.Misc.Wa or (Config.kConfig.Combo and Config.Combo.W)) and _G.Evade and loadedEvade.m and loadedEvade.m.speed ~= math.huge and Config.Windwall[loadedEvade.m.source.charName..loadedEvade.str[loadedEvade.m.slot]] then
        _G.Evade = false
        local wPos = myHero + (Vector(loadedEvade.m.startPos) - myHero):normalized() * data[1].range 
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
        local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
        Cast(_W, wPos)
      elseif spell.endPos and not spell.target and not loadedEvade or (_G.Evadeee_Loaded and _G.Evadeee_impossibleToEvade) then
        local makeUpPos = unit + (Vector(spell.endPos)-unit):normalized()*GetDistance(unit)
        if GetDistance(makeUpPos) < myHero.boundingRadius*3 or GetDistance(spell.endPos) < myHero.boundingRadius*3 then
          local wPos = myHero + (Vector(unit) - myHero):normalized() * data[1].range 
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
    Config.Misc:addDynamicParam("Waa", "Auto Shield AAs with W", SCRIPT_PARAM_ONOFF, true)
    DelayAction(function()
        if loadedEvade then
          Config:addSubMenu("Windwall", "Windwall")
          for _,k in pairs(GetEnemyHeroes()) do
            Config.Windwall:addParam(k.charName, k.charName, SCRIPT_PARAM_INFO, "")
            for i=0,3 do
              if loadedEvade.data and loadedEvade.data[k.charName] and loadedEvade.data[k.charName][i] and loadedEvade.data[k.charName][i].name and loadedEvade.data[k.charName][i].name ~= "" then
                Config.Windwall:addParam(k.charName..loadedEvade.str[i], "Block "..loadedEvade.str[i], SCRIPT_PARAM_ONOFF, true)
              end
            end
            Config.Windwall:addParam("info", "", SCRIPT_PARAM_INFO, "")
          end
        end
      end, 3)
  end

  function Yasuo:LastHit()
    local minion = GetLowestMinion(data[2].range)
    if ((Config.kConfig.LastHit and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.E)) and minion and not UnitHaveBuff(minion, "YasuoDashWrapper") and GetRealHealth(minion) < GetDmg(_E, myHero, minion) then
      Cast(_E, minion)
    end
    if ((Config.kConfig.LastHit and Config.LastHit.Q and Config.LastHit.E) or (Config.kConfig.LaneClear and Config.LaneClear.Q and Config.LaneClear.E)) and minion and GetDistance(minion) > 475/2 and GetDistance(minion) < 475 and not UnitHaveBuff(minion, "YasuoDashWrapper") and GetRealHealth(minion) < GetDmg(_Q, myHero, minion)+GetDmg(_E, myHero, minion) and sReady[_Q] and sReady[_E] then
      Cast(_E, minion)
      DelayAction(function() Cast(_Q) end, 0.125)
    end
  end

  function Yasuo:LaneClear()
    -- mad?
  end

  function Yasuo:Combo()
    if GetDistance(self.Target) > myHero.range+GetDistance(myHero.minBBox) and Config.Combo.E then
      if self:Move(self.Target) then
        if sReady[_Q] then
          DelayAction(function() Cast(_Q) end, 0.125)
        end
      elseif GetDistance(self.Target) < data[2].range and GetDistance(self.Target) > data[2].range/2 and not UnitHaveBuff(self.Target, "YasuoDashWrapper") then
        Cast(_E, self.Target)
        if sReady[_Q] then
          DelayAction(function() Cast(_Q) end, 0.125)
        end
      end
    end
    if sReady[_R] and Config.Combo.R and self.Target.y > myHero.y or self.Target.y < myHero.y then
      if sReady[_Q] and GetDistance(self.Target) < 500 then
        myHero:Attack(self.Target)
      else
        Cast(_R, self.Target)
      end
    end
    if sReady[_Q] then
      if self.passiveTracker and GetDistance(self.Target) < 1200 then
        local CastPosition, HitChance, Position = UPL:Predict(-2, myHero, self.Target)
        if HitChance >= 2 then
          Cast(_Q, CastPosition)
        end
      elseif GetDistance(self.Target) < 500 then
        if not myHero.isWindingUp then
          Cast(_Q, self.Target, 1)
        end
      end
    end
  end

  function Yasuo:Harrass()
    if sReady[_Q] then
      if self.passiveTracker and GetDistance(self.Target) < 1200 then
        local CastPosition, HitChance, Position = UPL:Predict(-2, myHero, self.Target)
        if HitChance >= 2 then
          Cast(_Q, CastPosition)
        end
      elseif GetDistance(self.Target) < 500 then
        if not myHero.isWindingUp then
          Cast(_Q, self.Target, 1)
        end
      end
    end
    if GetDistance(self.Target) > myHero.range+GetDistance(myHero.minBBox) and not UnitHaveBuff(self.Target, "YasuoDashWrapper") and Config.Harrass.E then
      Cast(_E, self.Target)
    end
  end

  function Yasuo:Killsteal()
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy ~= nil and not enemy.dead then
        if (enemy.y > myHero.y or enemy.y < myHero.y) and Config.Killsteal.R and GetDmg(_R,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[3].range then
          Cast(_R, enemy)
        end
        if Config.Killsteal.Q and GetDmg(_Q,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[0].range then
          Cast(_Q, enemy, 1)
        elseif Config.Killsteal.Q and self.passiveTracker and GetDmg(_Q,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < 1200 then
          local CastPosition, HitChance, Position = UPL:Predict(-2, myHero, enemy)
          if HitChance >= 2 then
            Cast(_Q, CastPosition)
          end
        elseif Config.Killsteal.E and GetDmg(_E,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[2].range then
          Cast(_E, enemy)
        elseif Config.Killsteal.Q and Config.Killsteal.E and GetDmg(_Q,myHero,enemy)+GetDmg(_E,myHero,enemy) > GetRealHealth(enemy) and GetDistance(enemy) < data[2].range then
          Cast(_E, enemy)
          DelayAction(function() Cast(_Q) end, 0.25)
        end
      end
    end
  end

-- { Scriptology Library

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

  function LoadUPL()
    if not _G.UPLloaded then
      if FileExist(LIB_PATH .. "/UPL.lua") then
        require("UPL")
        _G.UPL = UPL()
        UPL:AddToMenu2(ScriptologyConfig)
      end
    end
  end

  function FillUPL()
    if _G.UPLloaded then
      for k,v in pairs(data) do
        if v.type then 
          UPL:AddSpell(k, v)
        end
      end
    else
      DelayAction(FillUPL, 1)
    end
  end

  function SetupMenu(notUpl)
    if not notUpl then
      DelayAction(function()
        LoadUPL()
      end, 0.125)
      DelayAction(function()
        FillUPL()
      end, 0.25)
    end
    DelayAction(function()
      ScriptologyConfig:addSubMenu("Target Selector", "ts")
      ScriptologyConfig.ts:addTS(targetSel)
      ArrangeTSPriorities()
    end, 0.25)
    loadedSPlugin:Menu()
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
      if buff.name:lower():find("recall") or buff.name:lower():find("teleport") then return true end
     end
    end
    return false
  end

  function ArrangeTSPriorities()
    local priorityTable2 = {
        p5 = {"Alistar", "Amumu", "Blitzcrank", "Braum", "ChoGath", "DrMundo", "Garen", "Gnar", "Hecarim", "JarvanIV", "Leona", "Lulu", "Malphite", "Nasus", "Nautilus", "Nunu", "Olaf", "Rammus", "Renekton", "Sejuani", "Shen", "Shyvana", "Singed", "Sion", "Skarner", "Taric", "Thresh", "Volibear", "Warwick", "MonkeyKing", "Yorick", "Zac"},
        p4 = {"Aatrox", "Darius", "Elise", "Evelynn", "Galio", "Gangplank", "Gragas", "Irelia", "Jax","LeeSin", "Maokai", "Morgana", "Nocturne", "Pantheon", "Poppy", "Rengar", "Rumble", "Ryze", "Swain","Trundle", "Tryndamere", "Udyr", "Urgot", "Vi", "XinZhao", "RekSai"},
        p3 = {"Akali", "Diana", "Fiddlesticks", "Fiora", "Fizz", "Heimerdinger", "Janna", "Jayce", "Kassadin","Kayle", "KhaZix", "Lissandra", "Mordekaiser", "Nami", "Nidalee", "Riven", "Shaco", "Sona", "Soraka", "TahmKench", "Vladimir", "Yasuo", "Zilean", "Zyra"},
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

  function AddGapcloseCallback(spell, range, targeted, config)
    GapcloseSpell = spell
    GapcloseTime = 0
    GapcloseUnit = nil
    GapcloseTargeted = targeted
    GapcloseRange = range
    str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    config:addDynamicParam("antigap", "Auto "..str[spell].." on gapclose", SCRIPT_PARAM_ONOFF, true)
    for _,k in pairs(GetEnemyHeroes()) do
      if gapcloserTable[k.charName] then
        config:addParam(k.charName, "Use "..str[spell].." on "..k.charName.." "..(type(gapcloserTable[k.charName]) == 'number' and str[gapcloserTable[k.charName]] or (k.charName == "LeeSin" and "Q" or "E")), SCRIPT_PARAM_ONOFF, true)
      end
    end
    AddProcessSpellCallback(function(unit, spell)
      if not config.antigap or not gapcloserTable[unit.charName] or not config[unit.charName] or not unit then return end
      if spell.name == (type(gapcloserTable[unit.charName]) == 'number' and unit:GetSpellData(gapcloserTable[unit.charName]).name or gapcloserTable[unit.charName]) and (spell.target == myHero or GetDistanceSqr(spell.endPos) < GapcloseRange*GapcloseRange*4) then
        GapcloseTime = GetInGameTimer() + 2
        GapcloseUnit = unit
      end
    end)
    AddTickCallback(function()
      if sReady[GapcloseSpell] and GapcloseTime and GapcloseUnit and GapcloseTime > GetInGameTimer() then
        if GapcloseTargeted then
          if GetDistanceSqr(GapcloseUnit,myHero) < GapcloseRange*GapcloseRange then
            if myHero.charName == "Jayce" and loadedClass:IsRange() then Cast(_R) end
            Cast(GapcloseSpell, GapcloseUnit)
          end
        else 
          if GetDistanceSqr(GapcloseUnit,myHero) < GapcloseRange*GapcloseRange then
            if UPLloaded then
              Cast(GapcloseSpell, GapcloseUnit, 1)
            else
              Cast(GapcloseSpell, GapcloseUnit)
              Cast(GapcloseSpell)
            end
          end
        end
      else
        GapcloseTime = 0
        GapcloseUnit = nil
      end
    end)
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
    local crit = myHero.critChance
    local crdm = myHero.critDmg
    local ArmorPen         = math.floor(source.armorPen)
    local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
    local MagicPen         = math.floor(source.magicPen)
    local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

    local Armor        = target.armor*ArmorPenPercent-ArmorPen
    local ArmorPercent = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or 0--math.ceil(Armor*100/(100-Armor))/100
    local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
    local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

    if source ~= myHero then
      return TotalDmg*(1-ArmorPercent)
    end
    if spell == "IGNITE" then
      return 50+20*Level/2
    elseif spell == "Tiamat" then
      ADDmg = (GetHydraSlot() and source:CanUseSpell(GetHydraSlot()) == READY) and TotalDmg*0.8 or 0 
    elseif spell == "AD" then
      ADDmg = TotalDmg
      if source.charName == "Ashe" then
        ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
      elseif source.charName == "Teemo" then
        APDmg = APDmg + data[_E].dmgAP(AP, source:GetSpellData(_E).level, Level, TotalDmg, source, target)
      elseif source.charName == "Orianna" then
        APDmg = APDmg + 2 + 8 * math.ceil(Level/3) + 0.15*AP
      else
        ADDmg = ADDmg * (1 + crit)
      end
      if source.charName == "Vayne" and GetStacks(target) == 2 then
        TRUEDmg = TRUEDmg + data[_W].dmgTRUE(AP, source:GetSpellData(_W).level, Level, TotalDmg, source, target)
      end
      if GetMaladySlot() then
        APDmg = 15 + 0.15*AP
      end
    elseif type(spell) == "number" then
      if data[spell].dmgAD then ADDmg = data[spell].dmgAD(AP, source:GetSpellData(spell).level, Level, TotalDmg, source, target) end
      if data[spell].dmgAP then APDmg = data[spell].dmgAP(AP, source:GetSpellData(spell).level, Level, TotalDmg, source, target) end
      if data[spell].dmgTRUE then TRUEDmg = data[spell].dmgTRUE(AP, source:GetSpellData(spell).level, Level, TotalDmg, source, target) end
    end
    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
    dmgMod = (HaveBuff(source, "summonerexhaust") and 0.6 or 1) * (HaveBuff(target, "meditate") and 1-(target:GetSpellData(_W).level * 0.05 + 0.5) or 1)
    return math.floor(dmg) * dmgMod
  end

  function GetRealHealth(unit)
    if not unit then return math.huge end
    return math.ceil(unit.health + unit.shield)
  end

  function HaveBuff(unit, buffname)
    for i = 1, unit.buffCount do
      local buff = unit:getBuff(i)
      if buff and buff.valid and buff.name ~= nil and buff.name:lower():find(buffname) and buff.endT > GetInGameTimer() then 
        return true 
      end
    end
    return false
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

  function kalE(x) if x <= 1 then return 10 else return kalE(x-1) + 2 + x end end

  function Draw()
    if myHero.charName == "Jayce" or myHero.charName == "Nidalee" or myHero.charName == "Riven" then return end
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
    if Forcetarget and ValidTarget(Forcetarget) then
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
    end
    if loadedSPlugin and loadedSPlugin.Forcetarget ~= nil and ValidTarget(loadedSPlugin.Forcetarget) then
      local Forcetarget = loadedSPlugin.Forcetarget
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2-5, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2, ARGB(255,255,50,50))
      DrawLFC(Forcetarget.x, Forcetarget.y, Forcetarget.z, Forcetarget.boundingRadius*2+5, ARGB(255,255,50,50))
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
      if myHero.charName == "Kalista" and myHero:CanUseSpell(_E) == READY then
        for minion,winion in pairs(Mobs.objects) do
          damageE = GetDmg(_E, myHero, winion)
          if winion ~= nil and GetStacks(winion) > 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
            if damageE > GetRealHealth(winion) then
              DrawText3D("E Kill", winion.x-45, winion.y-45, winion.z+45, 20, ARGB(255,250,250,250), 0)
            else
              DrawText3D(math.floor(damageE/GetRealHealth(winion)*100).."%", winion.x-45, winion.y-45, winion.z+45, 20, ARGB(255,250,250,250), 0)
            end
          end
        end
        if Config.Misc.Ej then
          for minion,winion in pairs(JMobs.objects) do
            damageE = GetDmg(_E, myHero, winion)
            if winion ~= nil and GetStacks(winion) > 0 and GetDistance(winion) <= 1000 and not winion.dead and winion.team ~= myHero.team then
              if damageE > GetRealHealth(winion) then
                DrawText3D("E Kill", winion.x-45, winion.y-45, winion.z+45, 20, ARGB(255,250,250,250), 0)
              else
                DrawText3D(math.floor(damageE/GetRealHealth(winion)*100).."%", winion.x-45, winion.y-45, winion.z+45, 20, ARGB(255,250,250,250), 0)
              end
            end
          end
        end
      end
    end 
  end

  function Vars()
    if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
    if myHero:GetSpellData(SUMMONER_1).name:find("summonersmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonersmite") then Smite = SUMMONER_2 end
    if myHero:GetSpellData(SUMMONER_1).name:find("summonerflash") then Flash = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerflash") then Flash = SUMMONER_2 end
    killTextTable = {}
    for k,enemy in pairs(GetEnemyHeroes()) do
      killTextTable[enemy.networkID] = { indicatorText = "", damageGettingText = ""}
    end
    _G.Target = nil
    _G.Mobs = minionManager(MINION_ENEMY, 1500, myHero, MINION_SORT_HEALTH_ASC)
    _G.JMobs = minionManager(MINION_JUNGLE, 750, myHero, MINION_SORT_HEALTH_ASC)
    mobTick = 0
    AddTickCallback(function() 
      if mobTick < GetTickCount() then
        Mobs:update() 
        JMobs:update() 
        mobTick = GetTickCount() + 250
      end
    end)
    _G.sReady = {[_Q] = false, [_W] = false, [_E] = false, [_R] = false}
    AddTickCallback(function()for _=0,5 do;sReady[_]=(myHero:CanUseSpell(_)==READY)end;end)
  end

  function DmgCalc()
    if not Config or not Config.Draws or not Config.Draws.DMG then return end
    for k,enemy in pairs(GetEnemyHeroes()) do
      if ValidTarget(enemy) and enemy.visible then
        local health = GetRealHealth(enemy)
        killTextTable[enemy.networkID].indicatorText = ""
        if myHero.charName == "Kalista" then
          local damageAA = GetDmg("AD", myHero, enemy)
          local damageE  = GetDmg(_E, myHero, enemy)
          if health < damageE then
              killTextTable[enemy.networkID].indicatorText = "E Kill"
              killTextTable[enemy.networkID].ready = myHero:CanUseSpell(_E)
          end
          if myHero:CanUseSpell(_E) == READY and health > damageE and damageE > 0 then
            killTextTable[enemy.networkID].indicatorText = math.floor(damageE/health*100).."% E"
          else
            killTextTable[enemy.networkID].indicatorText = ""
          end
        else
          local damageAA = GetDmg("AD", myHero, enemy)
          local damageQ  = GetDmg(_Q, myHero, enemy)
          local damageW  = myHero.charName == "KogMaw" and 0 or (myHero.charName == "Azir" and loadedSPlugin:CountSoldiers(enemy) or 1) * GetDmg(_W, myHero, enemy)
          local damageE  = GetDmg(_E, myHero, enemy)
          local damageR  = GetDmg(_R, myHero, enemy)*(myHero.charName == "Katarina" and 10 or 1)
          local damageRC  = (myHero.charName == "Orianna" and loadedSPlugin:CalcRComboDmg(enemy) or 0)
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
          if health < (GetDmg(_Q, myHero, enemy)+GetDmg(_W, myHero, enemy)+GetDmg(_E, myHero, enemy)+GetDmg(_R, myHero, enemy)+damageRC+((myHero.charName == "Talon" and c > 0) and damageAA or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1) then
            killTextTable[enemy.networkID].indicatorText = killTextTable[enemy.networkID].indicatorText.." Killable"
          end
          if myHero.charName == "Teemo" and health > damageQ+damageE+damageAA then
            local neededAA = math.ceil((health) / (damageAA+damageE))
            neededAA = neededAA < 1 and 1 or neededAA
            killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
          elseif myHero.charName == "Ashe" or myHero.charName == "Vayne" then
            local neededAA = math.ceil((health-damageQ-damageW-damageE) / (damageAA))
            neededAA = neededAA < 1 and 1 or neededAA
            killTextTable[enemy.networkID].indicatorText = neededAA.." AA to Kill"
          elseif health > (damageQ+damageW+damageE+damageR+(myHero.charName == "Talon" and damageAA*c/2 or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1) then
            local neededAA = math.ceil(100*((damageQ+damageW+damageE+damageR+(myHero.charName == "Talon" and damageAA*c/2 or 0))*(myHero.charName == "Talon" and 1+0.03*myHero:GetSpellData(_E).level or 1))/(health))
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

  function EnemiesAroundAndFacingMe(Unit, range)
    local c=0
    if Unit == nil then return 0 end
    for i=1,heroManager.iCount do hero = heroManager:GetHero(i) 
      if hero ~= nil and hero.team ~= myHero.team and hero.x and hero.y and hero.z and GetDistance(hero, Unit) < range then pos, b = PredictPos(hero) if pos and GetDistance(pos, myHero) < GetDistance(hero, myHero) then c=c+1 end end end return c
  end

  function PredictPos(target,delay,speed)
    if not target then return end
    delay = delay or 0
    speed = speed or target.ms
    dir = GetTargetDirection(target)
    if dir and target.isMoving then
      return Vector(target)+Vector(dir.x, dir.y, dir.z):normalized()*speed/8+Vector(dir.x, dir.y, dir.z):normalized()*target.ms*delay, GetDistance(target.minBBox, target.pos)
    elseif not target.isMoving then
      return Vector(target), GetDistance(target.minBBox, target.pos)
    end
  end

  function contains(table, value)
    for _, n in pairs(table) do 
      if value == n then 
        return true 
      end 
    end 
    return false 
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

  _G.c3il = function(x) return math.ceil(x) end

  function GetLowestMinion(range)
    local minionTarget = nil
    for i, minion in pairs(Mobs.objects) do
      if minionTarget == nil then 
        minionTarget = minion
      elseif GetRealHealth(minionTarget) >= GetRealHealth(minion) and ValidTarget(minion, range) then
        minionTarget = minion
      end
    end
    return minionTarget
  end

  function GetClosestMinion(range)
    local minionTarget = nil
    for i, minion in pairs(Mobs.objects) do
      if minionTarget == nil and GetDistanceSqr(minion) < range * range then 
        minionTarget = minion
      elseif GetDistanceSqr(minionTarget) > GetDistanceSqr(minion) and ValidTarget(minion, range) then
        minionTarget = minion
      end
    end
    return minionTarget
  end

  function GetJMinion(range)
    local minionTarget = nil
    for i, minion in pairs(JMobs.objects) do
      if minionTarget == nil and GetDistanceSqr(minion) < range * range then
        if GetRealHealth(minion) < 100000 then 
          minionTarget = minion
        end
      elseif minionTarget.maxHealth < minion.maxHealth and ValidTarget(minion, range) and GetRealHealth(minion) < 100000 then
        minionTarget = minion
      end
    end
    return minionTarget
  end

  function Cast(Spell, target, hitchance, source) -- maybe the packetcast gets some functionality somewhen?
    local pred = (hitchance and type(hitchance) == "number")
    if not target and not pred then
      if VIP_USER then
        Packet("S_CAST", {spellId = Spell}):send()
        return true
      else
        CastSpell(Spell)
        return true
      end
    elseif target and target.networkID and not pred then
      if VIP_USER then
        Packet("S_CAST", {spellId = Spell, targetNetworkId = target.networkID}):send()
        return true
      else
        CastSpell(Spell, target)
        return true
      end
    elseif VectorType(target) and not pred then
      xPos = target.x
      zPos = target.z
      if VIP_USER then
        Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
        return true
      else
        CastSpell(Spell, xPos, zPos)
        return true
      end
    elseif target and pred then
      if not source then source = myHero end
      local CastPosition, HitChance, Position = UPL:Predict(Spell, source, target)
      if HitChance and HitChance >= hitchance then
        xPos = CastPosition.x
        zPos = CastPosition.z
        if VIP_USER then
          Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
          Packet("S_CAST", {spellId = Spell}):send()
        else
          CastSpell(Spell, xPos, zPos)
          Cast(Spell)
        end
        return true
      end
    end
    return false
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
-- }