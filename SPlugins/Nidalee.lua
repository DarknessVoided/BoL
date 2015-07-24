
class "Nidalee"

  function Nidalee:__init()
    targetSel = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1500, DAMAGE_MAGICAL, false, true)
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
    data = {
          [_Q] = { speed = 1337, delay = 0.125, range = 1500, width = 42.5, collision = true, aoe = false, type = "linear"},
          [_W] = { speed = math.huge, delay = 0.25, range = 900, width = 120, collision = true, aoe = false, type = "circular"},
          [_E] = { range = 0},
          [_R] = { range = 0}
        }
    self.ludenStacks = 0
    self.spearCooldownUntil = 0
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
    if not IsRecalling(myHero) and self:IsHuman() and Config.Misc.Eas and Config.Misc.manaEs <= myHero.mana/myHero.maxMana*100 and myHero.maxHealth-myHero.health > 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and myHero.health/myHero.maxHealth <= Config.Misc.healthEs/100 then
      Cast(_E, myHero, true)
    end
    if not IsRecalling(myHero) and self:IsHuman() and Config.Misc.Eaa and Config.Misc.manaEa <= myHero.mana/myHero.maxMana*100 then
      for _,k in pairs(GetAllyHeroes()) do
        if GetDistance(k) < self.data.Human[2].range and k.maxHealth-k.health < 5+40*myHero:GetSpellData(_E).level+0.5*myHero.ap and k.health/k.maxHealth <= Config.Misc.healthEa/100 then
          Cast(_E, k, true)
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
    if myHero:CanUseSpell(_Q) == READY and self:IsHuman() and Config.Combo.Q and ValidTarget(Target, data[0].range) then
      Cast(_Q, Target, false, true, 1.5)
    end
    if myHero:CanUseSpell(_W) == READY and UnitHaveBuff(Target, "nidaleepassivehunted") and self:IsHuman() and Config.Combo.W and ValidTarget(Target, data[0].range) then
      Cast(_W, Target, false, true, 1.5)
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
    if unit and myHero:CanUseSpell(_R) == READY and UnitHaveBuff(unit, "nidaleepassivehunted") and self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.R then
      Cast(_R)
    end
    if unit and myHero:CanUseSpell(_W) == READY and UnitHaveBuff(unit, "nidaleepassivehunted") and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[1].range*2 < 0 and Config.Combo.W then
      Cast(_W, unit)
    end
    if unit and not self:IsHuman() and GetDistance(unit)-self.data.Cougar[2].range <= 0 then
      if self:GetDmg(_Q,unit) >= unit.health and myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q)
      elseif self:GetRWEQComboDmg(unit,-self:GetDmg(_W,unit)) >= unit.health then
        if myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit)
        end
        if myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_E) ~= READY and Config.Combo.Q and Config.Combo.E then
          CastSpell(_Q)
        end
        if myHero:CanUseSpell(_Q) == READY and Config.Combo.Q and not Config.Combo.E then
          CastSpell(_Q)
        end
      else
        if myHero:CanUseSpell(_E) == READY and Config.Combo.E then
          Cast(_E, unit)
        elseif myHero:CanUseSpell(_Q) == READY and Config.Combo.Q then
          CastSpell(_Q)
        end
      end
      if unit and myHero:CanUseSpell(_W) == READY and Config.Combo.W then
        if unit and GetDistance(unit) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(unit) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
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
    if self:IsHuman() and Config.Harrass.manaQ < myHero.mana/myHero.maxMana*100 then
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, self.data.Human[0].range) then
        Cast(_Q, Target, false, true, 2)
      end
    else
      if myHero:CanUseSpell(_Q) == READY and Config.Harrass.Q and ValidTarget(Target, self:GetAARange()) then
        CastSpell(_Q, myHero:Attack(Target))
      end
      if myHero:CanUseSpell(_E) == READY and Config.Harrass.E and ValidTarget(Target, self.data.Cougar[2].range) then
        Cast(_E, Target)
      end
    end
  end

  function Nidalee:LastHit()
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LastHit.Q and ValidTarget(Target, data[0].range) then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
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
          Cast(_Q, minion, false, true, 1)
        end
        if minionTarget then
          Cast(_Q, minionTarget, false, true, 1)
        end
      elseif Config.LaneClear.R then
        Cast(_R)
      end
    end
    if not self:IsHuman() then
      if myHero:CanUseSpell(_Q) == READY and Config.LaneClear.Q then
        local minionTarget = GetLowestMinion(self:GetAARange())
        if minionTarget and minionTarget.health < self:GetDmg(_Q, minionTarget) then
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
          Cast(_Q, enemy, false, true, 1.2)
        elseif Ignite and myHero:CanUseSpell(Ignite) == READY and GetRealHealth(enemy) < (50 + 20 * myHero.level) and Config.Killsteal.I and ValidTarget(enemy, 600) then
          CastSpell(Ignite, enemy)
        end
        if myHero:CanUseSpell(_Q) == READY and not self:IsHuman() and GetRealHealth(enemy) < self:GetDmg(_Q, enemy, true) and Config.Killsteal.Q and ValidTarget(enemy, self.data.Human[0].range) then
          local pos, chance, ppos = UPL:Predict(_Q, myHero, enemy)
          if chance >= 2 then
            Cast(_R)
            DelayAction(function() Cast(_Q, enemy, false, true, 1.5) end, 0.125)
          end
        end
        if not self:IsHuman() and EnemiesAround(enemy, 500) < 3 then
          if myHero:CanUseSpell(_Q) == READY and GetRealHealth(enemy) < self:GetDmg(_Q, enemy) and Config.Killsteal.Q and ValidTarget(enemy, self:GetAARange()) then
            Cast(_Q, myHero:Attack(enemy))
          end
          if myHero:CanUseSpell(_W) == READY and GetRealHealth(enemy) < self:GetDmg(_W, enemy) and Config.Killsteal.W then
            if GetDistance(enemy) >= self.data.Cougar[1].range-self.data.Cougar[1].width and GetDistance(enemy) <= self.data.Cougar[1].range+self.data.Cougar[1].width then
              Cast(_W, enemy)
            end
          end
          if myHero:CanUseSpell(_E) == READY and GetRealHealth(enemy) < self:GetDmg(_E, enemy) and Config.Killsteal.E and ValidTarget(enemy, self.data.Cougar[2].range) then
            Cast(_E, enemy)
          end
        end
        if myHero:CanUseSpell(_Q) == READY and EnemiesAround(enemy, 500) < 3 and self:IsHuman() and GetRealHealth(enemy) < self:GetRWEQComboDmg(enemy,self:GetDmg(_Q, enemy, true)+self:GetDmg("Ludens", enemy)) and Config.Killsteal.Q and Config.Killsteal.W and Config.Killsteal.E and Config.Killsteal.R and ValidTarget(enemy, self.data.Cougar[1].range/2) then
          Cast(_Q, enemy, false, true, 1.2)
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
        APDmg = (25+25*QLevel+0.4*AP)*math.max(1,math.min(3,GetDistance(target.pos)/1250*3))--kanker
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
