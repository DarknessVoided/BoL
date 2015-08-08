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
    self.Config:addParam("ssr", "Enemy Skillshots", SCRIPT_PARAM_ONOFF, true)
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
    self.activeSpells = {}
    self.str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    self:Load()
    self:LoadSSR()
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

  function SAwareness:LoadSSR()
    if FileExist(LIB_PATH .. "SpellData.lua") then
      self.data = loadfile(LIB_PATH .. "SpellData.lua")()
      self.loadedSSR = true
    else
      DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/Common/SpellData.lua".."?rand="..math.random(1,10000), LIB_PATH.."SpellData.lua", function () end)
      DelayAction(function() self:LoadSSR() end, 0.5)
      return
    end
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
    self:DrawSSR()
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
        DrawRectangle(WINDOW_W-s.width*self.Config.sizee, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee, s.width*self.Config.sizee*(k.health/k.maxHealth), 10*self.Config.sizee, ARGB(255, 0x62, 0x98, 0x00))
        for j = -1*self.Config.sizee, 1*self.Config.sizee do
            for l = -1*self.Config.sizee, 1*self.Config.sizee do
                DrawText(""..math.ceil(k.health), 12*self.Config.sizee, math.floor(WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4+j), math.floor(WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee-1+l), ARGB(255, 0, 0, 0))
            end
        end
        DrawText(""..math.ceil(k.health), 12*self.Config.sizee, WINDOW_W-s.width*self.Config.sizee+s.width*self.Config.sizee/4, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizee-1, ARGB(255,255,255,255))
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
          local si = self.Sprites[k:GetSpellData(j).name]
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
        DrawRectangle(0, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea*(k.health/k.maxHealth), 10*self.Config.sizea, ARGB(255, 0x62, 0x98, 0x00))
        DrawRectangle(0+s.width*self.Config.sizea*(k.health/k.maxHealth), WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea, s.width*self.Config.sizea*(k.shield/k.maxHealth), 10*self.Config.sizea, ARGB(255, 255, 255, 255))
        for j = -1*self.Config.sizea, 1*self.Config.sizea do
            for l = -1*self.Config.sizea, 1*self.Config.sizea do
                DrawText(""..math.ceil(k.health), 12*self.Config.sizea, math.floor(s.width*self.Config.sizea/4+j), math.floor(WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea-1+l), ARGB(255, 0, 0, 0))
            end
        end
        DrawText(""..math.ceil(k.health), 12*self.Config.sizea, s.width*self.Config.sizea/4, WINDOW_H/4+s.height*scale*i+15*i*self.Config.sizea-1, ARGB(255,255,255,255))
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
          local si = self.Sprites[k:GetSpellData(j).name]
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

  function SAwareness:DrawSSR()
    if self.Config.ssr then
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