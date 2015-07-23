class "SEvade"

  function SEvade:__init()
    _G.Evade = false
    Cfg:addSubMenu("SEvade", "SEvade")
    self.Config = Cfg.SEvade
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
            self:DrawRectangleOutline(spell.startPos, spell.endPos, pos, width)
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