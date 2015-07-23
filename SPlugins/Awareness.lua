class "SAwareness"

  function SAwareness:__init()
    ScriptologyConfig:addSubMenu("SAwareness", "SAwareness")
    self.Config = Cfg.SAwareness
    self.Config:addParam("i", "Cooldowns", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("cde", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("cda", "Allies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("i", "", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("i", "Waypoints", SCRIPT_PARAM_INFO, "")
    self.Config:addParam("wpe", "Enemies:", SCRIPT_PARAM_ONOFF, true)
    self.Config:addParam("wpa", "Allies:", SCRIPT_PARAM_ONOFF, false)
    AddDrawCallback(function() self:Draw() end)
    return self
  end

  function SAwareness:Draw()
    local offset = 18
    if self.Config.cde then
      for _,k in pairs(GetEnemyHeroes()) do
        local nextOffset = 0
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", offset, drawPos[1]+nextOffset+i*offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + offset/2 end
              if cd > 99 then nextOffset = nextOffset + offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", offset, drawPos[1]+nextOffset+4*offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
    if self.Config.cda then
      for _,k in pairs(GetAllyHeroes()) do
        local nextOffset = 0
        local barPos = GetUnitHPBarPos(k)
        local barOffset = GetUnitHPBarOffset(k)
        drawPos = {barPos.x - 68 + barOffset.x * 150, barPos.y + barOffset.y * 50 + 12}
        if k.visible and not k.dead then
          for i=0,3 do
            local cd = k:GetSpellData(i).currentCd
            DrawText("|", offset, drawPos[1]+nextOffset+i*offset, drawPos[2], ARGB(105,250,250,250))
            if cd > 0 and k:GetSpellData(i).level >= 1 then
              DrawText(""..math.ceil(cd), offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,250,250,250))
              if cd > 9 then nextOffset = nextOffset + offset/2 end
              if cd > 99 then nextOffset = nextOffset + offset/2 end
            elseif k:GetSpellData(i).level >= 1 then
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(255,0,250,0))
            else
              DrawText("-", offset, drawPos[1]+nextOffset+offset/2+i*offset, drawPos[2], ARGB(105,250,250,250))
            end
          end
          DrawText("|", offset, drawPos[1]+nextOffset+4*offset, drawPos[2], ARGB(105,250,250,250))
        end
      end
    end
    if self.Config.wpe then
      for i, k in pairs(GetEnemyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
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
    if self.Config.wpa then
      for i, k in pairs(GetAllyHeroes()) do
        if k and k.hasMovePath and k.pathCount >= 2 then
          local IndexPath = k:GetPath(k.pathIndex)
          if IndexPath then
            DrawCircle3D(IndexPath.x, IndexPath.y, IndexPath.z, 18, 1, ARGB(105,255,255,255), 32)
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