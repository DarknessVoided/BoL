local doDraw = false
UpdateWindow()
local lines = {}
Config = scriptConfig("StreamNameHider", "StreamNameHider")
Config:addParam("width", "Width", SCRIPT_PARAM_SLICE, 150, 0, 1000, 0)
Config:addParam("height", "Heigth", SCRIPT_PARAM_SLICE, 50, 0, 1000, 0)
Config:addSubMenu("Lines", "Lines")

for i=1, 10 do
  local num = #lines
  Config.Lines:addParam("X"..num, "Line "..num.." XPos", SCRIPT_PARAM_SLICE, WINDOW_W/2, WINDOW_W/3, 2*WINDOW_W/3, 0)
  Config.Lines:addParam("Y"..num, "Line "..num.." YPos", SCRIPT_PARAM_SLICE, WINDOW_H/2, WINDOW_W/8, 7*WINDOW_H/8, 0)
  table.insert(lines, {x = function() return Config.Lines["X"..num] end, y = function() return Config.Lines["Y"..num] end})
end

function OnDraw()
  if doDraw then
    for _,line in pairs(lines) do
      DrawRectangle(line.x(), line.y(), Config.width, Config.height, RGB(0, 0, 0))
    end
  end
end

function DrawRectangle(x, y, width, height, color)
  DrawLine(x, y, x+width, y, height*0.5, color)
end

function OnWndMsg(msg,key)
  if key == 9 then
    if msg == KEY_DOWN then
      doDraw = true
    elseif msg == KEY_UP then
      doDraw = false
    end
  end
end
