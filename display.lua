local display = {}

function display.draw(grid)
  local CELL_SIZE        = 55
  local GRID_LENGTH      = CELL_SIZE * 9
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
        local x_origin_offset, y_origin_offset = value:getOriginOffsets()
        love.graphics.draw(value.Text, x_offset + text_offset, y_offset + text_offset, 
                           0, 1, 1, x_origin_offset, y_origin_offset)
      end
    end
  end

end

return display