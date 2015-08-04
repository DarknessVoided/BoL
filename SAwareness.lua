_G.SAwarenessVersion = 0.2
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQIKAAAABgBAAEFAAAAdQAABBkBAAGUAAAAKQACBBkBAAGVAAAAKQICBHwCAAAQAAAAEBgAAAGNsYXNzAAQNAAAAU2NyaXB0U3RhdHVzAAQHAAAAX19pbml0AAQLAAAAU2VuZFVwZGF0ZQACAAAAAgAAAAgAAAACAAotAAAAhkBAAMaAQAAGwUAABwFBAkFBAQAdgQABRsFAAEcBwQKBgQEAXYEAAYbBQACHAUEDwcEBAJ2BAAHGwUAAxwHBAwECAgDdgQABBsJAAAcCQQRBQgIAHYIAARYBAgLdAAABnYAAAAqAAIAKQACFhgBDAMHAAgCdgAABCoCAhQqAw4aGAEQAx8BCAMfAwwHdAIAAnYAAAAqAgIeMQEQAAYEEAJ1AgAGGwEQA5QAAAJ1AAAEfAIAAFAAAAAQFAAAAaHdpZAAEDQAAAEJhc2U2NEVuY29kZQAECQAAAHRvc3RyaW5nAAQDAAAAb3MABAcAAABnZXRlbnYABBUAAABQUk9DRVNTT1JfSURFTlRJRklFUgAECQAAAFVTRVJOQU1FAAQNAAAAQ09NUFVURVJOQU1FAAQQAAAAUFJPQ0VTU09SX0xFVkVMAAQTAAAAUFJPQ0VTU09SX1JFVklTSU9OAAQEAAAAS2V5AAQHAAAAc29ja2V0AAQIAAAAcmVxdWlyZQAECgAAAGdhbWVTdGF0ZQAABAQAAAB0Y3AABAcAAABhc3NlcnQABAsAAABTZW5kVXBkYXRlAAMAAAAAAADwPwQUAAAAQWRkQnVnc3BsYXRDYWxsYmFjawABAAAACAAAAAgAAAAAAAMFAAAABQAAAAwAQACBQAAAHUCAAR8AgAACAAAABAsAAABTZW5kVXBkYXRlAAMAAAAAAAAAQAAAAAABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAUAAAAIAAAACAAAAAgAAAAIAAAACAAAAAAAAAABAAAABQAAAHNlbGYAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAtAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABgAAAAYAAAAGAAAABgAAAAUAAAADAAAAAwAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAIAAAACAAAAAgAAAAIAAAAAgAAAAUAAABzZWxmAAAAAAAtAAAAAgAAAGEAAAAAAC0AAAABAAAABQAAAF9FTlYACQAAAA4AAAACAA0XAAAAhwBAAIxAQAEBgQAAQcEAAJ1AAAKHAEAAjABBAQFBAQBHgUEAgcEBAMcBQgABwgEAQAKAAIHCAQDGQkIAx4LCBQHDAgAWAQMCnUCAAYcAQACMAEMBnUAAAR8AgAANAAAABAQAAAB0Y3AABAgAAABjb25uZWN0AAQRAAAAc2NyaXB0c3RhdHVzLm5ldAADAAAAAAAAVEAEBQAAAHNlbmQABAsAAABHRVQgL3N5bmMtAAQEAAAAS2V5AAQCAAAALQAEBQAAAGh3aWQABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEJgAAACBIVFRQLzEuMA0KSG9zdDogc2NyaXB0c3RhdHVzLm5ldA0KDQoABAYAAABjbG9zZQAAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAXAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAADAAAAAwAAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAACwAAAA4AAAAOAAAADgAAAA4AAAACAAAABQAAAHNlbGYAAAAAABcAAAACAAAAYQAAAAAAFwAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhAAoAAAABAAAAAQAAAAEAAAACAAAACAAAAAIAAAAJAAAADgAAAAkAAAAOAAAAAAAAAAEAAAAFAAAAX0VOVgA="), nil, "bt", _ENV))() ScriptStatus("REHGLKDMKFG") 

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
    AddDrawCallback(function() self:Draw() end)
    AddUnloadCallback(function() self:Unload() end)
    UpdateWindow()
    self:Load()
    self:Update()
    self.offset = 18
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
        DelayAction(function() self:Load() end, 0.2)
        return
      end
      for i = 0, 1 do 
        local v = k:GetSpellData(4+i).name
        if FileExist(SPRITE_PATH.."SAwareness//summoners//"..v..".png") then
          self.Sprites[v] = createSprite(SPRITE_PATH.."SAwareness//summoners//"..v..".png")
        else
          DownloadFile("https://raw.github.com/nebelwolfi/BoL/master/SAwareness/summoners/"..v..".png?no-cache="..math.random(1, 25000), SPRITE_PATH.."SAwareness//summoners//"..v..".png", function() end)
          DelayAction(function() self:Load() end, 0.2)
          return
        end
      end
    end
    self.loadedSprites = true
    print("<font color=\"#6699ff\"><b>[Scriptology Awareness]: </b></font> <font color=\"#FFFFFF\">loaded.</font>") 
  end

  function SAwareness:Unload()
    for _,k in pairs(self.Sprites) do
        k:Release()
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