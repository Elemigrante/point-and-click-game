require 'ruby2d'

set title:      'Point & Click - Reaction game',
    background: 'navy'

msg          = Text.new('Click to begin',
                        x:    20, y: 20,
                        size: 20,
                        font: 'fonts/pixel_times_reg.ttf')
game_started = false
square       = nil
start_time   = nil
duration     = nil

on :mouse_down do |event|
  puts event.x, event.y
  
  if game_started
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 100).round
      msg      = Text.new("Well done! You took: #{duration} ms. Click to begin",
                          x:    20, y: 20,
                          size: 20,
                          font: 'fonts/pixel_times_reg.ttf')
      square.remove
      game_started = false
    end
  else
    msg.remove
    
    square = Square.new(
      x:     rand(get(:width) - 25), y: rand(get(:height) - 25),
      size:  25,
      color: 'lime'
    )
    
    start_time   = Time.now
    game_started = true
  end
end

show