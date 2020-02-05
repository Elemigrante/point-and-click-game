require 'ruby2d'

set background: 'navy'

msg = Text.new('Click to begin')

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y
  msg.remove
  
  Square.new(
    x:     100, y: 200,
    size:  125,
    color: 'lime'
  )
end

show