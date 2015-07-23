-- {
  function GetCustomTarget()
    if _G.MMA_Loaded and _G.MMA_Target() and _G.MMA_Target().type == myHero.type then return _G.MMA_Target() end
    if _G.AutoCarry and _G.AutoCarry.Crosshair and _G.AutoCarry.Attack_Crosshair and _G.AutoCarry.Attack_Crosshair.target and _G.AutoCarry.Attack_Crosshair.target.type == myHero.type then return _G.AutoCarry.Attack_Crosshair.target end
    if not targetSel then return nil end
    targetSel:update()
    return targetSel.target
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
            Cast(GapcloseSpell, GapcloseUnit, true)
          end
        else 
          if GetDistanceSqr(GapcloseUnit,myHero) < GapcloseRange*GapcloseRange*4 then
            Cast(GapcloseSpell, GapcloseUnit, false, true, 1)
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

  function TARGB(colorTable)
    return ARGB(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
  end

  function DmgCalc()
    if not Config.Draws.DMG or myHero.charName == "Rengar" then return end
    if myHero.charName == "Ryze" then loadedClass:DmgCalc() return end
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

    if source ~= myHero then
      return TotalDmg*(1-ArmorPercent)
    end
    if spell == "IGNITE" then
      return 50+20*Level/2
    elseif spell == "Tiamat" then
      ADDmg = (GetHydraSlot() and myHero:CanUseSpell(GetHydraSlot()) == READY) and TotalDmg*0.8 or 0 
    elseif spell == "AD" then
      ADDmg = TotalDmg
      if myHero.charName == "Ashe" then
        ADDmg = TotalDmg*1.1+(1+crit)*(1+crdm)
      elseif myHero.charName == "Teemo" then
        APDmg = APDmg + data[_E].dmgAP(AP, myHero:GetSpellData(_E).level, Level, TotalDmg, source, target)
      elseif myHero.charName == "Orianna" then
        APDmg = APDmg + 2 + 8 * math.ceil(Level/3) + 0.15*AP
      elseif crit >= 0.9 then
        ADDmg = ADDmg * 2
      elseif crit >= 0.8 then
        ADDmg = ADDmg * 1.8
      elseif crit > 0.7 then
        ADDmg = ADDmg * 1.6
      elseif crit > 0.6 then
        ADDmg = ADDmg * 1.4
      elseif crit > 0.5 then
        ADDmg = ADDmg * 1.33
      end
      if GetMaladySlot() then
        APDmg = 15 + 0.15*AP
      end
    elseif type(spell) == "number" then
      if data[spell].dmgAD then ADDmg = data[spell].dmgAD(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
      if data[spell].dmgAP then APDmg = data[spell].dmgAP(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
      if data[spell].dmgTRUE then TRUEDmg =  data[spell].dmgTRUE(AP, myHero:GetSpellData(spell).level, Level, TotalDmg, source, target) end
    end
    dmg = math.floor(ADDmg*(1-ArmorPercent))+math.floor(APDmg*(1-MagicArmorPercent))+TRUEDmg
    dmgMod = (HaveBuff(source, "summonerexhaust") and 0.6 or 1) * (HaveBuff(target, "meditate") and 1-(target:GetSpellData(_W).level * 0.05 + 0.5) or 1)
    return math.floor(dmg) * dmgMod
  end

  function GetRealHealth(unit)
    return unit.health
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
      if HitChance and HitChance >= hitchance then
        xPos = CastPosition.x
        zPos = CastPosition.z
        if VIP_USER then
          Packet("S_CAST", {spellId = Spell, fromX = xPos, fromY = zPos, toX = xPos, toY = zPos}):send()
        else
          CastSpell(Spell, xPos, zPos)
        end
        Cast(Spell)
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