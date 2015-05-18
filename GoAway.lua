function OnLoad()
  Config = scriptConfig("Go Away", "GoAway")
  Config:addParam("r", "DANCE!", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
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
    if GetDistance(closestUnit,myHero) <= myHero.range-closestUnit.boundingRadius-myHero.boundingRadius then
      vector = myHero-(Vector(closestUnit)-myHero):normalized()*myHero.ms/4
      myHero:MoveTo(vector.x, vector.z)
    elseif GetDistance(closestUnit,myHero) >= myHero.range+(closestUnit.boundingRadius+myHero.boundingRadius)*2 then
      myHero:Attack(unit)
    end
  end
end

function OnDraw()
  for _,unit in pairs(GetEnemyHeroes()) do
    if not unit.dead and unit.visible and GetDistance(unit,myHero) < 3500 then
      DrawCircle(unit.x, unit.y, unit.z, unit.range+(unit.boundingRadius+myHero.boundingRadius)*2, ARGB(255,168,168,168))
    end
  end
end