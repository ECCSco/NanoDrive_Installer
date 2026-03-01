-- main.lua
-- Простая кнопка: при нажатии меняет цвет между красным и зелёным.
local btn = { x = 60, y = 100, w = 120, h = 40, color = 0xF800 } -- 0xF800 = красный
local textColor = 0xFFFF

local function drawButton()
  fillRect(btn.x, btn.y, btn.w, btn.h, btn.color)
  drawText(btn.x + 10, btn.y + 12, "Toggle", textColor)
end

local function inside(x, y)
  return x >= btn.x and x <= (btn.x + btn.w) and y >= btn.y and y <= (btn.y + btn.h)
end

-- начальный рендер
drawButton()

local pressed = false
while true do
  local tx, ty = readTouch()   -- возвращает x,y при касании или nil,nil если нет касания
  if tx then
    if inside(tx, ty) and not pressed then
      pressed = true
      -- переключаем цвет
      if btn.color == 0xF800 then
        btn.color = 0x07E0  -- зелёный
      else
        btn.color = 0xF800  -- красный
      end
      drawButton()
    end
  else
    pressed = false
  end
  delay(50)  -- небольшая пауза, чтобы не загружать CPU
end
