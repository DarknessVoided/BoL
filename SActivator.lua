_G.SActivatorVersion = 0.1
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("REHGLKDMKFG") 
local min, max, cos, sin, pi, huge, ceil, floor, round, random, abs, deg, asin, acos = math.min, math.max, math.cos, math.sin, math.pi, math.huge, math.ceil, math.floor, math.round, math.random, math.abs, math.deg, math.asin, math.acos
-- Vars
if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then Ignite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then Ignite = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonersmite") then Smite = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonersmite") then Smite = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerheal") then Heal = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerheal") then Heal = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerbarrier") then Barrier = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerbarrier") then Barrier = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerflash") then Flash = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerflash") then Flash = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonerboost") then Cleanse = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerboost") then Cleanse = SUMMONER_2 end
if myHero:GetSpellData(SUMMONER_1).name:find("summonermana") then Clarity = SUMMONER_1 elseif myHero:GetSpellData(SUMMONER_2).name:find("summonermana") then Clarity = SUMMONER_2 end
-- Vars
function OnLoad()
  DelayAction(function()
    if not _G.SActivatorLoaded then
      SActivator()
    end
  end, 0.25)
end

-- { SActivator
  class "SActivator"
  function SActivator:__init(Cfg)
    self.toCleanse = {
      [5] = true, [8] = true, [10] = true, [11] = true, [21] = true, [22] = true, [24] = true,
    }
    self.tick = 0
    self.tick2 = 0
    self:Update()
    self:LoadSpellData()
    self:Load(Cfg)
    self:AddCallbacks()
    _G.SActivatorLoaded = true
    return self
  end

  function SActivator:Update()
    CScriptUpdate(_G.SActivatorVersion, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/SActivator.version", "/nebelwolfi/BoL/master/SActivator.lua?rand="..random(1,10000), SCRIPT_PATH.."SActivator.lua", function(NewVersion,OldVersion) Msg("Updated from v"..OldVersion.." to "..NewVersion..". Please press F9 twice to reload.") end, function() end, function() end, function() end)
    CScriptUpdate(_G.SActivatorVersion, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/SActivator.version", "/nebelwolfi/BoL/master/SActivator.lua?rand="..random(1,10000), LIB_PATH.."SActivator.lua", function() end, function() end, function() end, function() end)
  end

  function SActivator:LoadSpellData()
    if FileExist(LIB_PATH .. "SpellData.lua") then
      if pcall(function() _G.spellData = loadfile(LIB_PATH .. "SpellData.lua")() end) then
        _G.myHeroSpellData = spellData[myHero.charName]
        DelayAction(function()
        CScriptUpdate(_G.SActivatorVersion, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", function() end, function() end, function() end, LoadSpellData)
        end, 5)
      else
        CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", LoadSpellData, function() end, function() end, LoadSpellData)
      end
    else
      CScriptUpdate(0, true, "raw.githubusercontent.com", "/nebelwolfi/BoL/master/Scriptology.version", "/nebelwolfi/BoL/master/Common/SpellData.lua?rand="..random(1,10000), LIB_PATH.."SpellData.lua", LoadSpellData, function() end, function() end, LoadSpellData)
    end
  end

  function SActivator:Load(Cfg)
    self.Config = Cfg or scriptConfig("SActivator", "SActivator")
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
      self.Config.s:addParam("Cleansed", "^ Delay ^", SCRIPT_PARAM_SLICE, 0, 0, 0.25, 2)
    end
    if Clarity then
      self.Config.s:addParam("Clarity", "Clarity", SCRIPT_PARAM_ONOFF, true)
    end
    self.Config:addSubMenu("Items", "i")
    self.Config.i:addParam("Cleansedb", "Cleanse (Self, Dervish Blade)", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Cleansems", "Cleanse (Self, Mercurial Scimitar)", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Cleanseqss", "Cleanse (Self, Quicksilver Sash)", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Cleansea", "Cleanse (Ally, Mikaels)", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Cleansed", "^ Cleanse Delay ^", SCRIPT_PARAM_SLICE, 0, 0, 0.25, 2)
    self.Config.i:addParam("Zhonyas", "Auto Zhonyas", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Heals", "Auto Heal (Self)", SCRIPT_PARAM_ONOFF, true)
    self.Config.i:addParam("Heala", "Auto Heal (Ally)", SCRIPT_PARAM_ONOFF, true)
    if myHero.charName == "Alistar" then
      self.Config:addSubMenu("Other", "o")
      self.Config.o:addParam("CleanseR", "Cleanse (Self, Unbreakable Will)", SCRIPT_PARAM_ONOFF, true)
      self.Config.o:addParam("Cleansed", "^ Cleanse Delay ^", SCRIPT_PARAM_SLICE, 0, 0, 0.25, 2)
    elseif myHero.charName == "Gangplank" then
      self.Config:addSubMenu("Other", "o")
      self.Config.o:addParam("CleanseW", "Cleanse (Self, Remove Scurvy)", SCRIPT_PARAM_ONOFF, true)
      self.Config.o:addParam("Cleansed", "^ Cleanse Delay ^", SCRIPT_PARAM_SLICE, 0, 0, 0.25, 2)
    elseif myHero.charName == "Olaf" then
      self.Config:addSubMenu("Other", "o")
      self.Config.o:addParam("CleanseR", "Cleanse (Self, Ragnarok)", SCRIPT_PARAM_ONOFF, true)
      self.Config.o:addParam("Cleansed", "^ Cleanse Delay ^", SCRIPT_PARAM_SLICE, 0, 0, 0.25, 2)
    end
  end

  function SActivator:AddCallbacks()
    AddTickCallback(function() self:Tick() end)
    AddProcessAttackCallback(function(unit, spell) self:ProcessAttack(unit, spell) end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    AddApplyBuffCallback(function(x,y,z) self:ApplyBuff(x,y,z) end)
  end

  function SActivator:Tick()
    if self.tick > os.clock() then return end
    if self.Config.s.Clarity then
      self.tick = os.clock() + 0.125
      for _=0,3 do
        if myHero:CanUseSpell(_) == 6 then
          CastSpell(Clarity)
        end
      end
    end
  end

  function SActivator:ApplyBuff(source, unit, buff)
    if unit and unit.team == myHero.team and (self.Config.s.Cleanse or self.Config.i.Cleanse) then
      if buff and buff.name ~= nil and (buff.name:lower():find("summonerexhaust") or self.toCleanse[buff.type]) then
        if unit.isMe then
          if self.Config.o.CleanseW then
            DelayAction(function() CastSpell(_W) end, self.Config.o.Cleansed)
            return;
          end
          if self.Config.o.CleanseR then
            DelayAction(function() CastSpell(_R) end, self.Config.o.Cleansed)
            return;
          end
          for _ = ITEM_1, ITEM_7 do
            if myHero:CanUseSpell(_) == READY and ((myHero:GetSpellData(_).name == "ItemDervishBlade" and self.Config.i.Cleansedb) or (myHero:GetSpellData(_).name == "QuicksilverSash" and self.Config.i.Cleanseqss) or (myHero:GetSpellData(_).name == "itemmercurial" and self.Config.i.Cleansems)) then
              DelayAction(function() CastSpell(_) end, self.Config.i.Cleansed)
              return;
            end
          end
          if self.Config.s.Cleanse and myHero:CanUseSpell(Cleanse) == READY then
            DelayAction(function() CastSpell(Cleanse) end, self.Config.s.Cleansed)
            return;
          end
        elseif self.Config.s.Cleansea then
          for _ = ITEM_1, ITEM_7 do
            if myHero:CanUseSpell(_) == READY and myHero:GetSpellData(_).name == "ItemMorellosBane" then
              DelayAction(function() CastSpell(_, unit) end, self.Config.i.Cleansed)
              return;
            end
          end
        end
      end
    end
  end

  function SActivator:ProcessAttack(unit, spell)
    if unit and spell and unit.valid and unit.team ~= myHero.team and spell.name and unit.type == myHero.type and spell.name:lower():find("attack") then
    local sName = spell.name
      local target = spell.target
      if target then
        if target.valid and not target.dead and not unit.dead and target.visible and unit.visible then
          local dmg = GetDmg("AD", unit, target)*1.25
          local thp = GetRealHealth(target)
          if dmg >= thp then
            if target.isMe then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == 0 then
                  CastSpell(Heal)
                  return;
                end
              end
              if Barrier and self.Config.s.Barrier and target.isMe then
                if myHero:CanUseSpell(Barrier) == 0 then
                  CastSpell(Barrier)
                  return;
                end
              end
              if self.Config.i.Zhonyas then
                for _ = ITEM_1, ITEM_7 do
                  if myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" then
                    CastSpell(_)
                    return;
                  end
                end
              end
              if self.Config.i.Heals then
                for _ = ITEM_1, ITEM_7 do
                  local sdname = myHero:GetSpellData(_).name
                  if myHero:CanUseSpell(_) == 0 and (sdname == "HealthBomb" or sdname == "IronStylus" or sdname == "ItemMorellosBane") then
                    CastSpell(_, myHero)
                    return;
                  end
                end
              end
            elseif (self.Config.s.SaveAlly or self.Config.i.Heala) and target.team == myHero.team and target.type == myHero.type then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == 0 and GetDistance(target) < 600 then
                  CastSpell(Heal)
                  return;
                end
              end
              if self.Config.i.Heala and GetDistance(target) < 600 then
                for _ = ITEM_1, ITEM_7 do
                  local sdname = myHero:GetSpellData(_).name
                  if myHero:CanUseSpell(_) == 0 and (sdname == "HealthBomb" or sdname == "IronStylus" or sdname == "ItemMorellosBane") then
                    CastSpell(_, target)
                    return;
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  function SActivator:ProcessSpell(unit, spell)
    if unit and spell and unit.valid and unit.team ~= myHero.team and spell.name and unit.type == myHero.type and spellData[unit.charName] then
      local sName = spell.name
      local target = spell.target
      if target then
        if target.valid and not target.dead and not unit.dead and target.visible and unit.visible and target.bTargetable then
          local dmg = 0
          for _, s in pairs(spellData[unit.charName]) do
            if s.name and s.name ~= "" and (s.name:lower():find(sName:lower()) or sName:lower():find(s.name:lower())) then
              local d = GetDmg(_, unit, target)
              dmg = d > 0 and d or 150
            end
          end
          local thp = GetRealHealth(target)
          if dmg >= thp then
            if target.isMe then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == 0 then
                  CastSpell(Heal)
                  return;
                end
              end
              if Barrier and self.Config.s.Barrier and target.isMe then
                if myHero:CanUseSpell(Barrier) == 0 then
                  CastSpell(Barrier)
                  return;
                end
              end
              if self.Config.i.Zhonyas then
                for _ = ITEM_1, ITEM_7 do
                  if myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" then
                    CastSpell(_)
                    return;
                  end
                end
              end
              if self.Config.i.Heals then
                for _ = ITEM_1, ITEM_7 do
                  local sdname = myHero:GetSpellData(_).name
                  if myHero:CanUseSpell(_) == 0 and (sdname == "HealthBomb" or sdname == "IronStylus" or sdname == "ItemMorellosBane") then
                    CastSpell(_, myHero)
                    return;
                  end
                end
              end
            elseif (self.Config.s.SaveAlly or self.Config.i.Heala) and target.team == myHero.team and target.type == myHero.type then
              if Heal and self.Config.s.Heal then
                if myHero:CanUseSpell(Heal) == 0 and GetDistance(target) < 600 then
                  CastSpell(Heal)
                  return;
                end
              end
              if self.Config.i.Heala and GetDistance(target) < 600 then
                for _ = ITEM_1, ITEM_7 do
                  local sdname = myHero:GetSpellData(_).name
                  if myHero:CanUseSpell(_) == 0 and (sdname == "HealthBomb" or sdname == "IronStylus" or sdname == "ItemMorellosBane") then
                    CastSpell(_, target)
                    return;
                  end
                end
              end
            end
          end
        end
      elseif not target and spell.endPos and spellData[unit.charName] then
        local dmg = 0
        local sp = nil
        local p, _, b = nil, nil, nil --
        for x, s in pairs(spellData[unit.charName]) do
          if s.name and s.name ~= "" and (s.name:lower():find(sName:lower()) or sName:lower():find(s.name:lower())) then
            local d = GetDmg(x, unit, myHero) * 1.1
            if s.type then
              if s.type == "linear" then
                local pos = unit + (Vector(spell.endPos) - unit):normalized()*s.range
                p, _, b = VectorPointProjectionOnLineSegment(unit, pos, myHero)
              elseif s.type == "circular" then
                p, _, b = Vector(spell.endPos), _, true
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
          if self.Config.i.Zhonyas then
            for _ = ITEM_1, ITEM_7 do
              if myHero:CanUseSpell(_) == READY and myHero:GetSpellData(_).name == "ZhonyasHourglass" then
                CastSpell(_)
                return;
              end
            end
          end
        end
      end
    end
  end

-- }

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
      APDmg = APDmg + spellData["Teemo"][_E].dmgAP(source, target)
    elseif source.charName == "Orianna" then
      APDmg = APDmg + 2 + 8 * ceil(Level/3) + 0.15*AP
    elseif crit then
      ADDmg = ADDmg * (1 + crit)
    end
    if myHero.charName == "Vayne" and source.isMe and GetStacks(target) == 2 then
      TRUEDmg = TRUEDmg + spellData["Vayne"][_W].dmgTRUE(source, target)
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

function GetRealHealth(unit)
  return unit.health--+unit.shield <- TODO: Spam bilbao
end

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