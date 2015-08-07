_G.NebelwolfisOrbWalkerVersion = 0.3
_G.NebelwolfisOrbWalkerInit    = true
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("VILKPOHMQNO") 

DelayAction(function()
  if not _G.NebelwolfisOrbWalkerLoaded then
    now = NebelwolfisOrbWalker()
  end
end, 0)

class "NebelwolfisOrbWalker" -- {

  function NebelwolfisOrbWalker:__init(Cfg)
    _G.NebelwolfisOrbWalkerLoaded = true
    self.altAttacks = Set { "caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", "renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "xenzhaothrust2", "xenzhaothrust3" }
    self.resetAttacks = Set { "dariusnoxiantacticsonh", "fioraflurry", "garenq", "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", "luciane", "lucianq", "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade", "parley", "poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack", "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", "vaynetumble", "vie", "volibearq", "xenzhaocombotarget", "yorickspectral", "reksaiq" }
    if not UPLloaded then require("HPrediction") self.HP = HPrediction() else self.HP = UPL.HP end
    if not UPLloaded then require("VPrediction") self.VP = VPrediction() else self.VP = UPL.VP end
    self:Load(Cfg)
    print("<font color=\"#6699ff\"><b>[Nebelwolfi's Orb Walker]: </b></font> <font color=\"#FFFFFF\">loaded.</font>") 
    self:Update()
    _G.NebelwolfisOrbWalker = self
    return self
  end

  function NebelwolfisOrbWalker:Update()
    local NebelwolfisOrbWalkerServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/Nebelwolfi's Orb Walker.version?no-cache="..math.random(1, 25000))
    if NebelwolfisOrbWalkerServerData then
      local NebelwolfisOrbWalkerServerVersion = type(tonumber(NebelwolfisOrbWalkerServerData)) == "number" and tonumber(NebelwolfisOrbWalkerServerData) or nil
      if NebelwolfisOrbWalkerServerVersion then
        if tonumber(NebelwolfisOrbWalkerVersion) < NebelwolfisOrbWalkerServerVersion then
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Nebelwolfi's Orb Walker.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH.."Nebelwolfi's Orb Walker.lua", function() end)
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Nebelwolfi's Orb Walker.lua?no-cache="..math.random(1, 25000), LIB_PATH.."Nebelwolfi's Orb Walker.lua", function() end)
          print("<font color=\"#6699ff\"><b>[Nebelwolfi's Orb Walker]: </b></font> <font color=\"#FFFFFF\">Updated. (v"..NebelwolfisOrbWalkerVersion.." -> v"..NebelwolfisOrbWalkerServerVersion..")</font>")
          return true
        end
      end
    else
      print("<font color=\"#6699ff\"><b>[Nebelwolfi's Orb Walker]: </b></font> <font color=\"#FFFFFF\">Error downloading version info</font>")
    end
    return false
  end

  function NebelwolfisOrbWalker:Load(Cfg)
    self:LoadVars(Cfg)
    self:LoadMenu()
    self:LoadCallbacks()
  end

  function NebelwolfisOrbWalker:LoadVars(Cfg)
    self.melee = myHero.range < 450 or myHero.charName == "Rengar"
    self.orbDisabled = false
    self.orbTable = { lastAA = 0, windUp = 13.37, animation = 13.37 }
    self.doAA = true
    self.doMove = true
    self.myRange = myHero.range+myHero.boundingRadius*2
    self.ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, self.myRange, DAMAGE_PHYSICAL, false, true)
    self.Target = nil
    ArrangeTSPriorities()
    if Cfg then
      Cfg:addSubMenu("NebelwolfisOrbWalker", "NebelwolfisOrbWalker")
      self.Config = Cfg.NebelwolfisOrbWalker
    else
      self.Config = scriptConfig("NebelwolfisOrbWalker", "SW"..myHero.charName)
    end    
  end

  function NebelwolfisOrbWalker:LoadMenu()
    self.Config:addSubMenu("Modes", "m")
      self.Config.m:addSubMenu("Carry Mode", "Combo")
        self.Config.m.Combo:addParam("Attack", "Attack", SCRIPT_PARAM_ONOFF, true)
        self.Config.m.Combo:addParam("Move", "Move", SCRIPT_PARAM_ONOFF, true)
      self.Config.m:addSubMenu("Harass Mode", "Harass")
        self.Config.m.Harass:addParam("Priority", "Priority", SCRIPT_PARAM_LIST, 1, {"LastHit", "Harass"})
        self.Config.m.Harass:addParam("Attack", "Attack", SCRIPT_PARAM_ONOFF, true)
        self.Config.m.Harass:addParam("Move", "Move", SCRIPT_PARAM_ONOFF, true)
      self.Config.m:addSubMenu("LastHit Mode", "LastHit")
        self.Config.m.LastHit:addParam("AttackE", "Attack Enemy on Lasthit (Anti-Farm)", SCRIPT_PARAM_ONOFF, true)
        self.Config.m.LastHit:addParam("Attack", "Attack", SCRIPT_PARAM_ONOFF, true)
        self.Config.m.LastHit:addParam("Move", "Move", SCRIPT_PARAM_ONOFF, true)
      self.Config.m:addSubMenu("LaneClear Mode", "LaneClear")
        --self.Config.m.LaneClear:addParam("AttackW", "Attack Wards", SCRIPT_PARAM_ONOFF, true) -- soon
        self.Config.m.LaneClear:addParam("Attack", "Attack", SCRIPT_PARAM_ONOFF, true)
        self.Config.m.LaneClear:addParam("Move", "Move", SCRIPT_PARAM_ONOFF, true)
    self.Config:addSubMenu("Hotkeys", "k")
      self.Config.k:addParam("info", "                    Mode Hotkeys", SCRIPT_PARAM_INFO, "")
      self.Config.k:addDynamicParam("Combo", "Carry Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
      self.Config.k:addDynamicParam("Harass", "Harass Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
      self.Config.k:addDynamicParam("LastHit", "LastHit Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
      self.Config.k:addDynamicParam("LaneClear", "LaneClear Mode", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
      self.Config.k:addParam("info", "", SCRIPT_PARAM_INFO, "")
      self.Config.k:addParam("info", "                    Other Hotkeys", SCRIPT_PARAM_INFO, "")
      self.Config.k:addParam("Mouse", "Left-Click Action", SCRIPT_PARAM_LIST, 1, {"None", "Carry Mode", "Target Lock"})
      self.Config.k:addParam("TargetLock", "Target Lock", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("G"))
      self.Config.k:addParam("LaneFreeze", "Lane Freeze (F1)", SCRIPT_PARAM_ONKEYTOGGLE, false, 112)
    self.Config:addSubMenu("Settings", "s")
      self.Config.s:addParam("Buildings", "Attack Selected Buildings", SCRIPT_PARAM_ONOFF, true)
      self.Config.s:addParam("WindUpNoticeStart", "Show AA notice on GameStart", SCRIPT_PARAM_ONOFF, true)
      self.Config.s:addParam("OverHeroStopMove", "Mouse over Hero to stop move", SCRIPT_PARAM_ONOFF, false)
    self.Config:addSubMenu("Target Selector", "ts")
      self.Config.ts:addTS(self.ts)
    self.Config:addSubMenu("Items", "i")
      self.Config.i:addSubMenu("Carry Mode", "Combo")
        self.Config.i.Combo:addParam("BRK", "Blade of the Ruined King", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("BWC", "Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("HXG", "Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("HYDRA", "Ravenous Hydra", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("TIAMAT", "Tiamat", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("ENT", "Entropy", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Combo:addParam("YGB", "Yomuu's Ghostblade", SCRIPT_PARAM_ONOFF, true)
      self.Config.i:addSubMenu("Harass Mode", "Harass")
        self.Config.i.Harass:addParam("BRK", "Blade of the Ruined King", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("BWC", "Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("HXG", "Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("HYDRA", "Ravenous Hydra", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("TIAMAT", "Tiamat", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("ENT", "Entropy", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Harass:addParam("YGB", "Yomuu's Ghostblade", SCRIPT_PARAM_ONOFF, true)
      self.Config.i:addSubMenu("Farm Modes", "Farm")
        self.Config.i.Farm:addParam("BRK", "Blade of the Ruined King", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("BWC", "Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("HXG", "Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("HYDRA", "Ravenous Hydra", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("TIAMAT", "Tiamat", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("ENT", "Entropy", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("YGB", "Yomuu's Ghostblade", SCRIPT_PARAM_ONOFF, true)
        self.Config.i.Farm:addParam("info", "", SCRIPT_PARAM_INFO, "")
        self.Config.i.Farm:addParam("tialast", "Use Tiamat/Hydra to Lasthit", SCRIPT_PARAM_ONOFF, true)
    self.Config:addSubMenu("Farm Settings", "f")
      self.Config.f:addSubMenu("Masteries", "m")
        self.Config.f.m:addParam("Butcher", "Butcher", SCRIPT_PARAM_ONOFF, false)
        self.Config.f.m:addParam("ArcaneBlade", "Arcane Blade", SCRIPT_PARAM_ONOFF, false)
        self.Config.f.m:addParam("Havoc", "Havoc", SCRIPT_PARAM_ONOFF, false)
        self.Config.f.m:addParam("DESword", "Double-Edged Sword", SCRIPT_PARAM_ONOFF, false)
        self.Config.f.m:addParam("Executioner", "Executioner", SCRIPT_PARAM_SLICE, 0, 0, 3, 0)
      self.Config.f:addParam("l", "LaneClear method", SCRIPT_PARAM_LIST, 1, {"Highest", "Stick to 1"})
    if self.melee then
      self.Config:addSubMenu("Melee Settings", "melee")
        self.Config.melee:addParam("wtt", "Walk/Stick to target", SCRIPT_PARAM_ONOFF, true)
    end
    self.Config:addSubMenu("Draw Settings", "d")
      self.Config.d:addSubMenu("Minion Drawing", "md")
      self.Config.d.md:addParam("HPB", "Draw Cut HP Bars (LastHit Mode)", SCRIPT_PARAM_ONOFF, true)
      self.Config.d.md:addParam("LHI", "Draw LastHit Indicator (LastHit Mode)", SCRIPT_PARAM_ONOFF, true)
      self.Config.d.md:addParam("HPBa", "Always Draw Cut HP Bars", SCRIPT_PARAM_ONOFF, true)
      self.Config.d.md:addParam("LHIa", "Always Draw LastHit Indicator", SCRIPT_PARAM_ONOFF, true)
      self.Config.d:addParam("AAS", "Own AA Circle", SCRIPT_PARAM_ONOFF, true)
      self.Config.d:addParam("AAE", "Enemy AA Circles", SCRIPT_PARAM_ONOFF, true)
      self.Config.d:addParam("LFC", "Lag Free Circles", SCRIPT_PARAM_ONOFF, true)
    self.Config:addSubMenu("Timing Settings", "t")
      self.Config.t:addParam("cadj", "Cancel AA adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
      self.Config.t:addParam("lhadj", "Lasthit adjustment", SCRIPT_PARAM_SLICE, 0, -100, 100, 0)
    self.Config:addParam("info1", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("info2", "Version:", SCRIPT_PARAM_INFO, "v"..NebelwolfisOrbWalkerVersion)
  end

  function NebelwolfisOrbWalker:LoadCallbacks()
    AddTickCallback(function() self:Tick() end)
    AddDrawCallback(function() self:Draw() end)
    AddProcessSpellCallback(function(x,y) self:ProcessSpell(x,y) end)
  end

  function NebelwolfisOrbWalker:Tick()
    self.Target = self:AcquireTarget()
    self.myRange = myHero.range+myHero.boundingRadius+(self.Target and self.Target.boundingRadius or myHero.boundingRadius)
    if self.fPos and GetDistance(self.fPos) < myHero.boundingRadius then
      self.fPos = nil
    end
    if self:DoOrb() then
      self:Orb(self.Target)
    end
  end

  function NebelwolfisOrbWalker:DoOrb()
    return self.Config.k.Combo or (IsKeyDown(1) and self.Config.k.Mouse == 2) or self.Config.k.Harass or self.Config.k.LastHit or self.Config.k.LaneClear
  end

  function NebelwolfisOrbWalker:DoAA()
    return self.doAA and ((self.Config.k.Combo or (IsKeyDown(1) and self.Config.k.Mouse == 2)) and self.Config.m.Combo.Attack) or (self.Config.k.Harass and self.Config.m.Harass.Attack) or (self.Config.k.LastHit and self.Config.m.LastHit.Attack) or (self.Config.k.LaneClear and self.Config.m.LaneClear.Attack)
  end

  function NebelwolfisOrbWalker:DoMove()
    return self.doMove and ((self.Config.k.Combo or (IsKeyDown(1) and self.Config.k.Mouse == 2)) and self.Config.m.Combo.Move) or (self.Config.k.Harass and self.Config.m.Harass.Move) or (self.Config.k.LastHit and self.Config.m.LastHit.Move) or (self.Config.k.LaneClear and self.Config.m.LaneClear.Move)
  end

  function NebelwolfisOrbWalker:Orb(unit)
    if self:TimeToAttack() and unit then
      self:Attack(unit)
    elseif self:TimeToMove() then
      local pos = nil
      if self.melee and self.Config.melee.wtt and unit and unit.type == myHero.type then
        if GetDistance(unit) > GetDistance(myHero.minBBox) + GetDistance(unit.minBBox) then
          pos = unit.pos
        end
      else
        pos = mousePos
      end
      self:Move(self.fPos or pos)
    end
  end

  function NebelwolfisOrbWalker:TimeToAttack()
    return os.clock() - GetLatency() / 2000 > self.orbTable.lastAA + self.orbTable.animation and self:DoAA()
  end

  function NebelwolfisOrbWalker:TimeToMove()
    return os.clock() - GetLatency() / 2000 > self.orbTable.lastAA + self.orbTable.windUp + self.Config.t.cadj and self:DoMove()
  end

  function NebelwolfisOrbWalker:Draw()
    if (self.orbTable.windUp == 13.37 or self.orbTable.animation == 13.37) and self.Config.s.WindUpNoticeStart then
      DrawText("Please attack something with an unbuffed autoattack", 20, WINDOW_W/3, WINDOW_H/6, ARGB(255,255,255,255))
    end
    if self.Config.d.AAS then
      SCircle(myHero, myHero.range+GetDistance(myHero.minBBox), self.Config.d.LFC):Draw(0x7F00FF00)
    end
    if self.Config.d.AAE then
      for _, enemy in pairs(GetEnemyHeroes()) do
        if ValidTarget(enemy, self.myRange*2) then
          SCircle(enemy, enemy.range+GetDistance(enemy,enemy.minBBox), self.Config.d.LFC):Draw(0x7FFF0000)
        end
      end
    end
    if (self.Forcetarget or self.Locktarget) and self.Target then
      SCircle(self.Target, self.Target.boundingRadius*2-10, self.Config.d.LFC):Draw(0xFFFF0000)
      SCircle(self.Target, self.Target.boundingRadius*2-5, self.Config.d.LFC):Draw(0xFFFF0000)
      SCircle(self.Target, self.Target.boundingRadius*2, self.Config.d.LFC):Draw(0xFFFF0000)
      local barPos = WorldToScreen(D3DXVECTOR3(self.Target.x, self.Target.y, self.Target.z))
      DrawText("Target-Lock", 18, barPos.x - 35, barPos.y, ARGB(255, 255, 255, 255))
    end
    if self.Config.d.md.HPB and self.Config.k.LastHit or self.Config.d.md.HPBa then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1250, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local barPos = GetUnitHPBarPos(minion)
        local barOffset = GetUnitHPBarOffset(minion)
        local drawPos = {x = barPos.x + barOffset.x - 32, y = barPos.y + barOffset.y - 2.5}
        DrawRectangleOutline(drawPos.x, drawPos.y, 63, 5, 0x5f000000, 2)
        local dmg = self:GetDmg(myHero, minion)
        local width = 63 * dmg / minion.maxHealth
        local loss = 63 * (minion.maxHealth - minion.health) / minion.maxHealth
        for _ = 0, 63 - loss - width, width do
          DrawRectangleOutline(drawPos.x + _, drawPos.y, width, 5, 0x5f000000, 1)
        end
      end
    end
    if self.Config.d.md.LHI and self.Config.k.LastHit or self.Config.d.md.LHIa then
      for i, minion in pairs(minionManager(MINION_ENEMY, 1250, myHero, MINION_SORT_HEALTH_ASC).objects) do
        local hp = self.HP:PredictHealth(minion, (math.min(self.myRange, GetDistance(myHero, minion)) / (self.VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.t.lhadj/100 - 0.07))
        local hp2 = self.HP:PredictHealth(minion, 2 * (math.min(self.myRange, GetDistance(myHero, minion)) / (self.VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.t.lhadj/100 - 0.07))
        local barPos = GetUnitHPBarPos(minion)
        local barOffset = GetUnitHPBarOffset(minion)
        local drawPos = {x = barPos.x + barOffset.x - 62, y = barPos.y + barOffset.y - 15}
        dmg = self:GetDmg(myHero, minion)
        if dmg and (hp <= dmg or minion.health <= dmg) then
          DrawText(">>", 30, drawPos.x, drawPos.y, 0xFF00FF00)
          DrawText("<<", 30, drawPos.x+63+30, drawPos.y, 0xFF00FF00)
        elseif dmg and (hp2 <= dmg or minion.health <= dmg*2) then
          DrawText(">>", 30, drawPos.x, drawPos.y, 0xFFFFFFFF)
          DrawText("<<", 30, drawPos.x+63+30, drawPos.y, 0xFFFFFFFF)
        end
      end
    end
  end

  function NebelwolfisOrbWalker:ProcessSpell(unit, spell)
    if unit and spell and spell.name then
      if unit.isMe then
        if spell.name:lower():find("attack") or self.altAttacks[spell.name:lower()] then
          local windUp = spell.windUpTime
          self.orbTable.windUp = windUp
          self.orbTable.animation = spell.animationTime
          self.orbTable.lastAA = os.clock() + GetLatency() / 2000
          DelayAction(function() 
            self:WindUp(self.Target) 
          end, windUp)
        end
        if self.resetAttacks[spell.name:lower()] then
          self.orbTable.lastAA = os.clock() - GetLatency() / 2000 - self.orbTable.animation
        end
      elseif unit.team ~= myHero.team and unit.type == myHero.type then
        if ValidTarget(unit, self.myRange) and self:TimeToAttack() and (spell.name:lower():find("attack") or self.altAttacks[spell.name:lower()]) and spell.target.type ~= myHero.type and self.Config.m.LastHit.AttackE and self.Config.k.LastHit and spell.target.health <= self:GetDmg(unit, spell.target) then
          myHero:Attack(unit)
        end
      end
    end
  end

  function NebelwolfisOrbWalker:WindUp(unit)
    local Items = {
      ["ItemSwordOfFeastAndFamine"]   = { id = 3153, config = "BRK", range = 450, target = true},
      ["BilgewaterCutlass"]           = { id = 3144, config = "BWC", range = 450, target = true},
      ["HextechGunblade"]             = { id = 3146, config = "HXG", range = 700, target = true},
      ["OdinEntropicClaymore"]        = { id = 3184, config = "ENT", range = 350, target = false},
      ["ItemTiamatCleave"]            = { id = 3074, config = "HYDRA", range = 350, target = false},
      ["ItemTiamatCleave"]            = { id = 3077, config = "TIAMAT", range = 350, target = false},
      ["YoumusBlade"]                 = { id = 3142, config = "YGB", range = 600, target = false},
    }
    local Config = self.Config.k.Combo and self.Config.i.Combo or self.Config.k.Harass and self.Config.i.Harass or self.Config.k.LastHit and self.Config.i.LastHit or self.Config.k.LaneClear and self.Config.i.LaneClear or nil
    if Config and ValidTarget(unit, 700) then
      for slot = ITEM_1, ITEM_6 do
        local item = Items[myHero:GetSpellData(slot).name]
        if item then
          if Config[item.config] and GetDistance(unit) < item.range and myHero:CanUseSpell(slot) == READY then
            if item.target and unit.type == myHero.type then
              CastSpell(slot, unit)
            else
              if unit.type ~= myHero.type and (item.id == 3077 or item.id == 3074) and Config.tialast then
                if unit.health < GetDmg(myHero, unit)*0.6 then
                  CastSpell(slot)
                end
              else
                CastSpell(slot)
              end
            end
          end
        end
      end
    end
  end

  function NebelwolfisOrbWalker:AcquireTarget()
    local Target = nil
    self.ts:update()
    self.ts.range = self.Config.melee.wtt and self.myRange*2 or self.myRange
    Target = self.ts.target
    if self.Config.k.Harass then
      target, health = self:GetLowestPMinion(self.myRange)
      dmg = self:GetDmg(myHero, target)
      if target and dmg and health <= dmg and (self.Config.Priority == 1 or not Target) then
        Target = target
      end
    elseif self.Config.k.LastHit then
      target, health = self:GetLowestPMinion(self.myRange)
      dmg = self:GetDmg(myHero, target, self.Config.k.LaneFreeze)
      if target and dmg and health <= dmg then
        Target = target
      end
      if health < 0 then 
        Target = nil 
      end
    elseif self.Config.k.LaneClear then
      local t = GetTarget()
      if t and ValidTarget(t, self.myRange) and self.Config.s.Buildings and (t.type == "obj_AI_Turret" or t.type == "obj_HQ" or t.type == "obj_BarracksDampener") and t.team ~= myHero.team then
        Target, health = self:GetLowestPMinion(self.myRange)
        dmg = self:GetDmg(myHero, Target)
        if Target and dmg and health > dmg then
          Target = t
        end
        if health < 0 then Target = t end
      else
        Target = GetJMinion(self.myRange)
        if not Target then
          target, health, health2 = self:GetLowestPMinion(self.myRange)
          dmg = self:GetDmg(myHero,target)
          if dmg and health > dmg and health2 > dmg then
            if self.Config.f.l == 1 then
              mtarget, health, count = self:GetHighestPMinion(self.myRange)
              if mtarget == target and health ~= mtarget.health and count > 0 then
                Target = nil
              else
                Target = mtarget
              end
            elseif self.Config.f.l == 2 then
              if self.Target and self.Target.type == obj_AI_Minion then
                Target = self.Target
              else
                if health2 and health and dmg and health2 < dmg and health > dmg then
                  Target = nil
                else
                  Target = target
                end
              end
            end
          else
            if health2 and health and dmg and health2 <= dmg and health > dmg then
              Target = nil
            else
              Target = target
            end
          end
        end
      end
    else
      local t = GetTarget()
      if t and ValidTarget(t, self.myRange) and self.Config.k.Combo and self.Config.s.Buildings and (t.type == "obj_AI_Turret" or t.type == "obj_HQ" or t.type == "obj_BarracksDampener") and t.team ~= myHero.team then
        Target = t
      end
      if (self.Config.k.TargetLock or (IsKeyDown(1) and self.Config.k.Mouse == 3)) then
        if ValidTarget(Target) and not self.Locktarget then
          self.Locktarget = Target
        elseif self.Locktarget and ValidTarget(self.Locktarget, self.myRange*1.5) then
          Target = self.Locktarget
        else
          self.Locktarget = nil
        end
      else
        self.Locktarget = nil
      end
      if self.Forcetarget and ValidTarget(self.Forcetarget, self.myRange*1.5) then
        Target = self.Forcetarget
      else
        self.Forcetarget = nil
      end
    end
    return Target
  end

  function NebelwolfisOrbWalker:Attack(unit)
    if _G.Evade or _G.Evading or _G.evade or _G.evading or not self:DoAA() or not ValidTarget(unit) then return end
    myHero:Attack(unit)
  end

  function NebelwolfisOrbWalker:Move(pos)
    if _G.Evade or _G.Evading or _G.evade or _G.evading or not self:DoMove() or not pos then return end
    if self.Config.s.OverHeroStopMove then
      local movePos = myHero + (Vector(pos) - myHero):normalized() * myHero.boundingRadius * 2
      if GetDistance(pos) > myHero.boundingRadius then
        myHero:MoveTo(movePos.x, movePos.z)
      end
    else
      local movePos = myHero + (Vector(pos) - myHero):normalized() * 250
      if GetDistance(pos) > myHero.boundingRadius then
        myHero:MoveTo(movePos.x, movePos.z)
      else
        local movePos = myHero + (Vector(pos) - myHero):normalized() * 250
        myHero:MoveTo(movePos.x, movePos.z)
      end
    end
  end

  function NebelwolfisOrbWalker:SetAA(bool)
    self.doAA = bool
  end

  function NebelwolfisOrbWalker:SetMove(bool)
    self.doMove = bool
  end

  function NebelwolfisOrbWalker:SetOrb(bool)
    self.doAA = bool
    self.doMove = bool
  end

  function NebelwolfisOrbWalker:SetTarget(unit)
    self.Forcetarget = unit
  end

  function NebelwolfisOrbWalker:GetTarget()
    if not self.Target then
      self.Target = self:AcquireTarget()
    end
    return self.Target
  end

  function NebelwolfisOrbWalker:ForcePos(pos)
    self.fPos = pos
  end

  function NebelwolfisOrbWalker:GetLowestPMinion(range)
    local minionTarget = nil
    local health, health2 = 0, 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local hp = self.HP:PredictHealth(minion, (GetDistance(myHero, minion) / (self.VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.t.lhadj/100 - 0.07))
      local hp2 = self.HP:PredictHealth(minion, 2 * (GetDistance(myHero, minion) / (self.VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.t.lhadj/100 - 0.07))
      if minionTarget == nil and hp > 0 then 
        minionTarget = minion
        health = hp
        health2 = hp2
      elseif health >= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
        health2 = hp2
      end
    end
    return minionTarget, health, health2
  end

  function NebelwolfisOrbWalker:GetHighestPMinion(range)
    local minionTarget = nil
    local health = 0
    local count = 0
    for i, minion in pairs(minionManager(MINION_ENEMY, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      count = count + 1
      local hp = self.HP:PredictHealth(minion, (GetDistance(myHero, minion) / (self.VP.projectilespeeds[myHero.charName] or 1800) + self.orbTable.windUp + self.Config.t.lhadj/100 - 0.07))
      if minionTarget == nil then 
        minionTarget = minion
        health = hp
      elseif health <= hp and hp > 0 and ValidTarget(minion, range) then
        minionTarget = minion
        health = hp
      end
    end
    return minionTarget, health, count
  end

  function NebelwolfisOrbWalker:GetDmg(source, target, freeze)
    if target == nil or source == nil then
      return
    end
    local ADDmg            = 0
    local APDmg            = 0
    local TRUEDmg          = 0
    local AP               = source.ap
    local Level            = source.level
    local TotalDmg         = source.totalDamage
    local crit             = myHero.critChance
    local crdm             = myHero.critDmg
    local ArmorPen         = math.floor(source.armorPen)
    local ArmorPenPercent  = math.floor(source.armorPenPercent*100)/100
    local MagicPen         = math.floor(source.magicPen)
    local MagicPenPercent  = math.floor(source.magicPenPercent*100)/100

    local Armor             = target.armor*ArmorPenPercent-ArmorPen
    local ArmorPercent      = Armor > 0 and math.floor(Armor*100/(100+Armor))/100 or math.ceil(Armor*100/(100-Armor))/100
    local MagicArmor        = target.magicArmor*MagicPenPercent-MagicPen
    local MagicArmorPercent = MagicArmor > 0 and math.floor(MagicArmor*100/(100+MagicArmor))/100 or math.ceil(MagicArmor*100/(100-MagicArmor))/100

    ADDmg = freeze and source.damage or TotalDmg
    if source.charName == "Ashe" then
      ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
    elseif source.charName == "Kalista" then
      ADDmg = ADDmg * 0.9
    elseif source.charName == "Teemo" then
      APDmg = APDmg + 10*myHero:GetSpellData(_E).level+0.3*AP
    elseif source.charName == "Orianna" then
      APDmg = APDmg + 2 + 8 * math.ceil(Level/3) + 0.15*AP
    end
    if GetMaladySlot() then
      APDmg = 15 + 0.15*AP
    end

    dmgMod = 1
    if source == myHero and not freeze then
      if target.type ~= myHero.type then
        if self.Config.f.m.Butcher then
          TRUEDmg = TRUEDmg + 2
        end
      elseif self.Config.f.m.Executioner > 0 then
        if target.health/target.maxHealth < (.2 + .15 * self.Config.f.m.Executioner) then
          dmgMod = dmgMod + .05
        end
      end
      if self.Config.f.m.ArcaneBlade then
        APDmg = APDmg + 0.05*AP
      end
      if self.Config.f.m.Havoc then
        dmgMod = dmgMod + .03
      end
      if self.Config.f.m.DESword then
        dmgMod = dmgMod + (self.melee and .02 or .015)
      end
    end
    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
    dmg = math.floor(dmg*dmgMod) * (TargetHaveBuff("summonerexhaust", source) and 0.6 or 1)
    --print("[NebelwolfisOrbWalker] "..source.charName.." will do "..dmg.." dmg on "..target.charName)
    return dmg
  end

-- }

class 'SCircle' -- {

  function SCircle:__init(x, y, z, r, LFC)
    local pos = type(x) ~= "number" and x or nil
    self.x = pos and pos.x or x
    self.y = pos and pos.y or y
    self.z = pos and pos.z or z
    self.r = pos and y or r
    self.LFC = pos and z or LFC
  end

  function SCircle:Draw(color)
    if self.LFC then
      DrawCircle3D(self.x, self.y, self.z, self.r, 1, color or 0xffffffff, 32)
    else
      DrawCircle(self.x, self.y, self.z, self.r, color or 0xffffffff)
    end
  end

-- }

  function GetJMinion(range)
    local minionTarget = nil
    for i, minion in pairs(minionManager(MINION_JUNGLE, range, myHero, MINION_SORT_HEALTH_ASC).objects) do
      if minionTarget == nil then
        if minion.health < 100000 then 
          minionTarget = minion
        end
      elseif minionTarget.maxHealth < minion.maxHealth and ValidTarget(minion, range) and minion.health < 100000 then
        minionTarget = minion
      end
    end
    return minionTarget
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

  function GetMaladySlot()
    for slot = ITEM_1, ITEM_7, 1 do
      if myHero:GetSpellData(slot).name and myHero:GetSpellData(slot).name:lower():find("malady") then
        return slot
      end
    end
    return nil
  end