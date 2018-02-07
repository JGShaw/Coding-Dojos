class Rover

  attr_reader :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def move(action)
    case action
    when 'f'
      @position = @position.get_linked_position(direction)
    when 'b'
      reverse = case direction
                when 'N'
                  'S'
                when 'E'
                  'W'
                when 'S'
                  'N'
                when 'W'
                  'E'
                end
      @position = @position.get_linked_position(reverse)
    when 'l'
      @direction = case direction
                   when 'N'
                     'W'
                   when 'E'
                     'N'
                   when 'S'
                     'E'
                   when 'W'
                     'S'
                   end
    when 'r'
      @direction = case direction
                   when 'N'
                     'E'
                   when 'E'
                     'S'
                   when 'S'
                     'W'
                   when 'W'
                     'N'
                   end
    end
  end

end
