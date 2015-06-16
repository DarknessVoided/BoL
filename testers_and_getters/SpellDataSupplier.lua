local delay, speed, speedt, last, range, lastWindup = 0, 0, 0, 0, 0, 0
local donec, doned = false, false
local string = ""

function OnLoad() 
  	Config = scriptConfig("SpellDelaySupplier", "SDSsdsdsd")
    Config:addParam("CRange", "Hero width", SCRIPT_PARAM_SLICE, 100, 0, 500, 0)
    Config:addParam("QRange", "Q Range", SCRIPT_PARAM_SLICE, 1500, 0, 2500, -1)
    Config:addParam("WRange", "W Range", SCRIPT_PARAM_SLICE, 1250, 0, 2500, -1)
    Config:addParam("ERange", "E Range", SCRIPT_PARAM_SLICE, 1100, 0, 2500, -1)
    Config:addParam("RRange", "R Range", SCRIPT_PARAM_SLICE, 3600, 0, 4000, -1)
		print("Loaded")
end

function OnTick()
  if donec and doned then 
    string = string.." Range: "..range
    print(string)
  	delay, speed, speedt, last, range, lastWindup = 0, 0, 0, 0, 0, 0
  	doned, donec = false, false
    string = ""
  end
end

function OnCreateObj(object)
  if object ~= nil and not donec and (string.find(string.lower(object.name), string.lower(myHero.charName)) or string.find(string.lower(object.name), "linemissile")) then
  	speed  = os.clock()
  	delay  = lastWindup or .25001
  	last   = speed
    --string = string.." Delay: "..delay
    donec  = true
  end 
end

function OnDeleteObj(object)
  if object ~= nil and not doned and string.find(string.lower(object.name), string.lower(myHero.charName)) then
  	speed  = os.clock() - last
    speedt = range / speed
    string = string.." Speed: "..speedt
    doned  = true
  end 
end

function OnProcessSpell(unit, spell)  
  if unit == myHero and not doned and not donec then
    if not string.find(spell.name, "summoner") then
      lastWindup = GetInGameTimer()+spell.windUpTime
      print(spell.name.." "..spell.windUpTime)
    end
  end
end

function OnWndMsg(msg, key)
   if msg == KEY_DOWN and not doned and not donec then
      if key == GetKey("Q") then
        range = Config.QRange+Config.CRange*.5
      elseif key == GetKey("W") then
        range = Config.WRange+Config.CRange*.5
      elseif key == GetKey("E") then
        range = Config.ERange+Config.CRange*.5
      elseif key == GetKey("R") then
        range = Config.RRange+Config.CRange*.5
      else
        return
      end
			--range = GetDistance(myHero, mousePos)
      last = os.clock()
      string = "Skill: "..string.char(key)
   end
end

function OnDraw()
		local barPos = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
		local posX = barPos.x - 35
		local posY = barPos.y - 50
    DrawLine3D(myHero.x, myHero.y, myHero.z, mousePos.x, mousePos.y, mousePos.z, 1, ARGB(255, 255, 255, 255))
    DrawText("Distance to cursor: "..(math.floor(GetDistance(mousePos, myHero))),  15, posX - 25, posY + 100, ARGB(255, 255, 255, 255))
    DrawCircle(myHero.x, myHero.y, myHero.z, Config.CRange, 0x111111)
    DrawCircle(myHero.x, myHero.y, myHero.z, Config.QRange+Config.CRange, 0x111111)
    DrawCircle(myHero.x, myHero.y, myHero.z, Config.WRange+Config.CRange, 0x111111)
    DrawCircle(myHero.x, myHero.y, myHero.z, Config.ERange+Config.CRange, 0x111111)
    DrawCircle(myHero.x, myHero.y, myHero.z, Config.RRange+Config.CRange, 0x111111)
end