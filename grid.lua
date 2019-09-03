-- Maintains the internal state of a Sudoku game
local grid = {}
_grid = {}

local FONT_SIZE = 22
local font = love.graphics.newFont(FONT_SIZE)

local function valueError(value)
  error(value .. " is not a valid Sudoku cell value")
end

local function isValidValue(value)
  return value >= 1 and value <= 9
end

local function newCell(value, text)
  text = text or love.graphics.newText(font)
  value = value or false

  if value and not isValidValue(value) then
    valueError(value)
  end

  return {
    value = value,
    Text = text,
    getOriginOffsets = function(self) -- origin offsets to center the text
      return self.Text:getWidth() / 2, self.Text:getHeight() / 2
    end
    setValue = function(self, value)
      if isValidValue(value) then
        self.value = value
      else
        valueError(value)
      end
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

function grid.cellAt(x, y)
  return _grid[x][y]
end

function grid.attemptFill(x, y, value)
  -- TODO: attempt to write value at cell [x][y], 
  -- true if successful, false if not
end

return grid