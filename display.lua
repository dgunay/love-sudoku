local display = {}

function display.draw(grid)
  local CELL_SIZE        = 55
  local GRID_LENGTH      = 495
  local OFFSET_FROM_LEFT = 150
  local OFFSET_FROM_TOP  = 50

  love.graphics.rectangle(
    "line", OFFSET_FROM_LEFT, OFFSET_FROM_TOP, GRID_LENGTH, GRID_LENGTH
  )
  
  -- Draw a 9x9 grid
  for i = 1, 9 do -- 9 from left to right
    local x_offset = OFFSET_FROM_LEFT + ( (i - 1) * CELL_SIZE )

    for j = 1, 9 do -- 9 from top to bottom
      local y_offset = OFFSET_FROM_TOP + ((j - 1) * CELL_SIZE)
      love.graphics.rectangle("line", x_offset, y_offset, CELL_SIZE,
                              CELL_SIZE)

      -- Write the square's current value in
      local value = grid.valueAt(i, j)
      if value then
        local text_offset = (CELL_SIZE / 2)
        love.graphics.print(value, x_offset + text_offset , y_offset + text_offset)
      end
    end
  end
end

return display