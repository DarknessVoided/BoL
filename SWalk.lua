_G.SWalkVersion = 0.1

function OnLoad()
  DelayAction(function()
    if not _G.SWalkLoaded then
      sw = SWalk()
    end
  end, 0.5)
end

class "SWalk"

  function SWalk:__init(Cfg)
    self.melee = myHero.range < 450 or myHero.charName == "Rengar"
    self.orbDisabled = false
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
    if self.melee and myHero.charName ~= "Elise" and myHero.charName ~= "Jayce" and myHero.charName ~= "Nidalee" then 
      self.Config:addParam("wtt", "Walk to Target", SCRIPT_PARAM_ONOFF, true) 
    end
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
    self.Config:addSubMenu("Target Selector", "ts")
    self.Config.ts:addTS(self.ts)
    ArrangeTSPriorities()
    sReady = {}
    self.Config:addSubMenu("Key Settings", "kConfig")
    self.Config.kConfig:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
    self.Config.kConfig:addDynamicParam("Harrass", "Harrass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
    self.Config.kConfig:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
    self.Config.kConfig:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
    self.altAttacks = Set { "caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", "renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "xenzhaothrust2", "xenzhaothrust3" }
    self.resetAttacks = Set { "dariusnoxiantacticsonh", "fioraflurry", "garenq", "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", "luciane", "lucianq", "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade", "parley", "poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack", "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", "vaynetumble", "vie", "volibearq", "xenzhaocombotarget", "yorickspectral", "reksaiq" }
    if not UPLloaded then require("HPrediction") HP = HPrediction() else HP = UPL.HP end
    if not UPLloaded then require("VPrediction") VP = VPrediction() else VP = UPL.VP end
    _G.SWalkLoaded = true
    print("<font color=\"#6699ff\"><b>[Scriptology Walker]: </b></font> <font color=\"#FFFFFF\">loaded.</font>") 
    self:Update()
    return self
  end

  function SWalk:Update()
    local SWalkServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/SWalk.version?no-cache="..math.random(1, 25000))
    if SWalkServerData then
      local SWalkServerVersion = type(tonumber(SWalkServerData)) == "number" and tonumber(SWalkServerData) or nil
      if SWalkServerVersion then
        if tonumber(SWalkVersion) < SWalkServerVersion then
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SWalk.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH..GetCurrentEnv().FILE_NAME, function() end)
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SWalk.lua?no-cache="..math.random(1, 25000), LUA_PATH..GetCurrentEnv().FILE_NAME, function() end)
          print("<font color=\"#6699ff\"><b>[Scriptology Walker]: </b></font> <font color=\"#FFFFFF\">Updated. (v"..SWalkVersion.." -> v"..SWalkServerVersion..")</font>")
          return true
        end
      end
    else
      print("<font color=\"#6699ff\"><b>[Scriptology Walker]: </b></font> <font color=\"#FFFFFF\">Error downloading version info</font>")
    end
    return false
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
    local t = GetTarget()
    if t and ValidTarget(t, self.myRange) and (self.Config.kConfig.LaneClear or self.Config.kConfig.Combo) then
      self.Target = t
    end
    if self:DoOrb() then
      self:Orb(self.Target) 
    end
  end

  function SWalk:Orb(unit)
    if _G.Evade or _G.Evading or _G.evade or _G.evading or self.orbDisabled then return end
    local valid = ValidTarget(unit, self.myRange)
    if self.Config.a and os.clock() > self.orbTable.lastAA + self.orbTable.animation and valid then
      myHero:Attack(unit)
    elseif self.Config.m and GetDistance(mousePos) > myHero.boundingRadius and (self.Config.pc and os.clock() > self.orbTable.lastAA or os.clock() > self.orbTable.lastAA + self.orbTable.windUp) then
      local movePos = myHero + (Vector(mousePos) - myHero):normalized() * 250
      if self:DoOrb() and ValidTarget(unit, self.myRange) and unit.type == myHero.type and self.melee and self.Config.wtt then
        if GetDistance(unit) > myHero.boundingRadius + unit.boundingRadius then
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
    self.IState = self.Config.kConfig.Combo or self.Config.kConfig.Harrass
    return self.Config.kConfig.Combo or self.Config.kConfig.Harrass or self.Config.kConfig.LastHit or self.Config.kConfig.LaneClear
  end

  function SWalk:GetLowestPMinion(range)
    local minionTarget = nil
    local health = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = HP:PredictHealth(minion,  GetDistance(myHero, minion) / (VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.lhadj/100 - 0.07)
      if minionTarget == nil and hp > 0 then 
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

  function SWalk:WindUp(unit)
    if ValidTarget(unit) then
      if self.IState and self.Config.i then 
        if self:CastItems(unit) then
          self.orbTable.lastAA = 0
        end
      end
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

  function ArrangeTSPriorities() -- last seen at "I don't even know who"
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
        _SetPriority(priorityTable2.p3, enemy, math.min(3, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p4, enemy, math.min(4, #GetEnemyHeroes()))
        _SetPriority(priorityTable2.p5, enemy, math.min(5, #GetEnemyHeroes()))
      end
    end
  end

  function Set(list)
    local set = {}
    for _, l in ipairs(list) do 
      set[l] = true 
    end
    return set
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
    local ArmorPercent = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or math.ceil(Armor*100/(100-Armor))/100
    local MagicArmor   = target.magicArmor*MagicPenPercent-MagicPen
    local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

    ADDmg = TotalDmg
    if myHero.charName == "Ashe" then
      ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
    elseif myHero.charName == "Teemo" then
      APDmg = APDmg + 10*myHero:GetSpellData(_E).level+0.3*AP
    elseif myHero.charName == "Orianna" then
      APDmg = APDmg + 2 + 8 * math.ceil(Level/3) + 0.15*AP
    end
    if GetMaladySlot() then
      APDmg = 15 + 0.15*AP
    end

    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
    return math.floor(dmg) * (TargetHaveBuff("summonerexhaust", source) and 0.6 or 1)
  end

  function GetMaladySlot()
    for slot = ITEM_1, ITEM_7, 1 do
      if myHero:GetSpellData(slot).name and (string.find(string.lower(myHero:GetSpellData(slot).name), "malady")) then
        return slot
      end
    end
    return nil
  end