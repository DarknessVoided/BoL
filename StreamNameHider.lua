local doDraw = false
UpdateWindow()
function OnDraw()
  if doDraw then
    DrawRectangle(WINDOW_W/3, WINDOW_H/4, WINDOW_W/8, 2*WINDOW_H/3, RGB(0, 0, 0))
  end
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