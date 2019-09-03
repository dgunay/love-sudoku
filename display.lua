local display = {}

-- Called from the love.draw loop
-- Uses the data in the grid to draw the Sudoku board state on the screen.
function display.draw(grid)
  local CELL_SIZE        = 55
  local GRID_LENGTH      = CELL_SIZE * 9
  local OFFSET_FROM_LEFT = 150
  local OFFSET_FROM_TOP  = 50

  love.graphics.setLineWidth(1)

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
      local value = grid.cellAt(i, j)
      if value then
        local text_offset = (CELL_SIZE / 2)
        local x_origin_offset, y_origin_offset = value:getOriginOffsets()
        love.graphics.draw(value.Text, x_offset + text_offset, y_offset + text_offset, 
                           0, 1, 1, x_origin_offset, y_origin_offset)
      end
    end
  end

  -- Draw thicker lines for the 3x3 boxes
  love.graphics.setLineWidth(5)

  -- Left to right
  top_third_horiz    = OFFSET_FROM_TOP + GRID_LENGTH * (1/3)
  bottom_third_horiz = OFFSET_FROM_TOP + GRID_LENGTH * (2/3)
  love.graphics.line(
    OFFSET_FROM_LEFT, 
    top_third_horiz,
    OFFSET_FROM_LEFT + GRID_LENGTH,
    top_third_horiz
  )
  love.graphics.line(
    OFFSET_FROM_LEFT, 
    bottom_third_horiz,
    OFFSET_FROM_LEFT + GRID_LENGTH,
    bottom_third_horiz
  )

  -- Top to bottom
  left_third_vert  = OFFSET_FROM_LEFT + GRID_LENGTH * (1/3)
  right_third_vert = OFFSET_FROM_LEFT + GRID_LENGTH * (2/3)
  love.graphics.line(
    left_third_vert, 
    OFFSET_FROM_TOP,
    left_third_vert,
    OFFSET_FROM_TOP + GRID_LENGTH
  )
  love.graphics.line(
    right_third_vert, 
    OFFSET_FROM_TOP,
    right_third_vert,
    OFFSET_FROM_TOP + GRID_LENGTH
  )
end

return display