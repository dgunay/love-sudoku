local grid    = require 'grid'
local display = require 'display'

function love.load()
  grid.initialize()
  -- TODO: https://love2d.org/wiki/Tutorial:Fonts_and_Text to make the text bigger
end

function love.draw()
  display.draw(grid)
end