function OnLoad()
  Config = scriptConfig("Go Away", "GoAway")
  Config:addParam("r", "Run!", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
  Config:permaShow("r")
  print("Go Away loaded!")
end

function OnTick()
  if Config.r then
    local closestUnit = nil
    for _,unit in pairs(GetEnemyHeroes()) do
      if unit.dead or not unit.visible or GetDistance(unit,myHero) > 3500 then return end
      if closestUnit == nil or GetDistance(closestUnit,myHero)>GetDistance(unit,myHero) then closestUnit = unit end
    end
    if GetDistance(unit,myHero) <= unit.range+unit.boundingRadius+myHero.boundingRadius then
      vector = myHero-(Vector(unit)-myHero):normalized()*myHero.ms/4
      myHero:MoveTo(vector.x, vector.z)
    elseif GetDistance(unit,myHero) >= unit.range+(unit.boundingRadius+myHero.boundingRadius)*2 then
      vector = myHero+(Vector(unit)-myHero):normalized()*myHero.ms/4
      myHero:MoveTo(vector.x, vector.z)
    end
  end
end

function OnDraw()
  if Config.r then
    for _,unit in pairs(GetEnemyHeroes()) do
      if not unit.dead and unit.visible and GetDistance(unit,myHero) < 3500 then
        DrawCircle(unit.x, unit.y, unit.z, unit.range+(unit.boundingRadius+myHero.boundingRadius)*2, ARGB(255,168,168,168))
      end
    end
  end
end

function LagFree(x, y, z, radius, width, color, quality)
  local radius = radius or 300
  local screenMin = WorldToScreen(D3DXVECTOR3(x - radius, y, z + radius))
  if OnScreen({x = screenMin.x + 200, y = screenMin.y + 200}, {x = screenMin.x + 200, y = screenMin.y + 200}) then
    radius = radius*.92
    local quality = quality and 2 * math.pi / quality or 2 * math.pi / math.floor(radius / 10)
    local width = width and width or 1
    local a = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(0), y, z - radius * math.sin(0)))
    for theta = quality, 2 * math.pi + quality * 0.5, quality do
      local b = WorldToScreen(D3DXVECTOR3(x + radius * math.cos(theta), y, z - radius * math.sin(theta)))
      DrawLine(a.x, a.y, b.x, b.y, width, color)
      a = b
    end
  end
end