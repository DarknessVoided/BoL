local doDraw = false
UpdateWindow()
local lines = {}
Config = scriptConfig("StreamNameHider", "StreamNameHider")
Config:addParam("add", "Add new line", SCRIPT_PARAM_ONOFF, false)
Config:addParam("drag", "Make dragable", SCRIPT_PARAM_ONOFF, false)
Config:addParam("width", "Width", SCRIPT_PARAM_SLICE, 150, 0, 1000, 0)
Config:addParam("height", "Heigth", SCRIPT_PARAM_SLICE, 50, 0, 1000, 0)
Config.add = false

function OnTick()
  if Config.add then
    table.insert(lines, {x = 250, y = 250})
    Config.add = false
  end
  if toDrag and Config.drag then
    lines[toDrag] = GetCursorPos()
  end
end

function OnDraw()
  if doDraw or toDrag or Config.drag then
    for _,line in pairs(lines) do
      DrawRectangle(line.x, line.y, Config.width, Config.height, RGB(0, 0, 0))
    end
  end
end

function DrawRectangle(x, y, width, height, color)
  DrawLine(x, y+height*0.5, x+width, y+height*0.5, height*0.5, color)
end

function OnWndMsg(msg,key)
  if key == 9 then
    if msg == KEY_DOWN then
      doDraw = true
    elseif msg == KEY_UP then
      doDraw = false
    end
  end
  if msg == WM_LBUTTONDOWN and Config.drag then
    local cursor = GetCursorPos()
    for _,line in pairs(lines) do
      if cursor.x >= line.x and cursor.x <= line.x+Config.width and cursor.y >= line.y and cursor.y <= line.y+Config.height then
        toDrag = _
        break;
      end
    end
  end
  if msg == WM_LBUTTONUP and Config.drag and toDrag then
    lines[toDrag] = GetCursorPos()
    toDrag = nil
  end
end
