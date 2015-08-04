_G.SAwarenessVersion = 0.4
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("REHGLKDMKFG") 

function OnLoad()
  DelayAction(function()
    if not _G.SAwarenessLoaded then
      sa = SAwareness()
    end
  end, 0.5)
end

class "SAwareness"

  function SAwareness:__init()
    self.Config = scriptConfig("SAwareness", "SAwareness")
    self.Config:addParam("i", "Cooldowns", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("cde", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("scd", "Enemies: (summoners)", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("cda", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("i", "Waypoints", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("wpe", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("wpa", "Allies:", SCRIPT_PARAM_ONOFF, false)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("war", "Enemy Wards", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("ssr", "Enemy Skillshots", SCRIPT_PARAM_ONOFF, true)
    AddDrawCallback(function() self:Draw() end)
    AddUnloadCallback(function() self:Unload() end)
    AddCreateObjCallback(function(obj) self:CreateObj(obj) end)
    AddDeleteObjCallback(function(obj) self:DeleteObj(obj) end)
    AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
    UpdateWindow()
    self:Update()
    self.offset = 18
    self.enemyWards = {}
    self.activeSpells = {}
    self.str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
    self:Load()
    self:LoadSSR()
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
    print("<font color=\"#6699ff\"><b>[Scriptology Awareness]: </b></font> <font color=\"#FFFFFF\">loaded.</font>") 
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

  function SAwareness:Update()
    local SAwarenessServerData = GetWebResult("raw.github.com", "/nebelwolfi/BoL/master/SAwareness.version?no-cache="..math.random(1, 25000))
    if SAwarenessServerData then
      local SAwarenessServerVersion = type(tonumber(SAwarenessServerData)) == "number" and tonumber(SAwarenessServerData) or nil
      if SAwarenessServerVersion then
        if tonumber(SAwarenessVersion) < SAwarenessServerVersion then
          if FileExist(SCRIPT_PATH..GetCurrentEnv().FILE_NAME) then
            DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SAwareness.lua?no-cache="..math.random(1, 25000), SCRIPT_PATH..GetCurrentEnv().FILE_NAME, function() end)
          end
          if FileExist(LIB_PATH..GetCurrentEnv().FILE_NAME) then
            DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SAwareness.lua?no-cache="..math.random(1, 25000), LIB_PATH..GetCurrentEnv().FILE_NAME, function() end)
          end
          print("<font color=\"#6699ff\"><b>[Scriptology Awareness]: </b></font> <font color=\"#FFFFFF\">Updated. (v"..SAwarenessVersion.." -> v"..SAwarenessServerVersion..")</font>")
          return true
        end
      end
    else
      print("<font color=\"#6699ff\"><b>[Scriptology Awareness]: </b></font> <font color=\"#FFFFFF\">Error downloading version info</font>")
    end
    return false
  end

  function SAwareness:Draw()
    self:DrawCDE()
    self:DrawCDA()
    self:DrawWPE()
    self:DrawWPA()
    self:DrawSCD()
    self:DrawWAR()
    self:DrawSSR()
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

  function SAwareness:DrawSCD()
    if self.Config.scd and self.loadedSprites then
      local i = 0
      for _, k in pairs(GetEnemyHeroes()) do
        local scale = 0.85
        local s = self.Sprites[k.charName]
        s:Draw(WINDOW_W-s.width,WINDOW_H/4+s.height*scale*i+15*i,255)
        DrawRectangle(WINDOW_W-s.width, WINDOW_H/4+s.height*scale*i+15*i, s.width, 10, ARGB(255, 255, 0, 0))
        DrawRectangle(WINDOW_W-s.width, WINDOW_H/4+s.height*scale*i+15*i, s.width*(k.health/k.maxHealth), 10, ARGB(255, 0, 255, 0))
        DrawText(""..math.ceil(k.health), 12, WINDOW_W-s.width+s.width/4, WINDOW_H/4+s.height*scale*i+15*i-1, ARGB(255,255,255,255))
        DrawRectangle(WINDOW_W-s.width, WINDOW_H/4+s.height-10+s.height*scale*i+15*i, s.width, 10, ARGB(105, 105, 105, 105))
        DrawRectangle(WINDOW_W-s.width, WINDOW_H/4+s.height-10+s.height*scale*i+15*i, s.width*(k.mana/k.maxMana), 10, ARGB(255, 0, 0, 255))
        DrawText(""..math.ceil(k.mana), 12, WINDOW_W-s.width+s.width/4, WINDOW_H/4+s.height-10+s.height*scale*i+15*i-1, ARGB(255,255,255,255))
        for j = 4, 5 do
          local si = self.Sprites[k:GetSpellData(j).name]
          local cd = k:GetSpellData(j).currentCd
          si:SetScale(scale,scale)
          si:Draw(WINDOW_W-s.width-si.width*scale,WINDOW_H/4+s.height*scale*i+15*i+(j-4)*si.height*scale,255)
          if cd > 0 then
            local x = WINDOW_W-s.width-si.width*scale+2
            local y = WINDOW_H/4+s.height*scale*i+6+15*i+(j-4)*si.height*scale
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