class Elevator
  def initialize(floor) 
    @floor = floor 
    @floors = [0, 1, 2, 3]
  end

  def goto(target_floor)
    if @floors.include?(target_floor)
      return target_floor - @floor
    else
      return 0
    end
  end
end
