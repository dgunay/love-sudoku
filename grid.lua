-- Maintains the internal state of a Sudoku game
local grid = {}
_grid = {}

-- Create the 9x9 grid with all cells initialized to false
function grid.initialize()
  _grid = {}
  for i = 1, 9 do
    _grid[i] = {}
    for j = 1, 9 do
      _grid[i][j] = false
    end
  end
end

function grid.valueAt(x, y)
  return _grid[x][y]
end

function grid.attemptFill(x, y, value)
  -- TODO: attempt to write value at cell [x][y], 
  -- true if successful, false if not
end

return grid