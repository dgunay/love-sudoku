local grid    = require 'grid'
local display = require 'display'

local firsttime = true
local updated = false

function love.load()
  grid.initialize()
end

function love.draw()
  display.draw(grid)
end

function love.mousepressed(x, y, button, istouch, presses)
  -- Select a cell
  
end