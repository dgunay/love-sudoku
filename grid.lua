-- Maintains the internal state of a Sudoku game
local grid = {}
_grid = {}

local FONT_SIZE = 22
local font = love.graphics.newFont(FONT_SIZE)

local function newCell(text)
  text = text or love.graphics.newText(font)
  return {
    Text = text,
    getOriginOffsets = function (self) -- origin offsets to center the text
      return self.Text:getWidth() / 2, self.Text:getHeight() / 2
    end
  }
end

-- Create the 9x9 grid with all cells initialized to a drawable Text
function grid.initialize()
  _grid = {}
  for i = 1, 9 do
    _grid[i] = {}
    for j = 1, 9 do
      _grid[i][j] = newCell()
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