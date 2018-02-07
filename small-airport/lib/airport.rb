require 'time_queue'

class Airport
  def run(num_air, num_ground, arrival_time, ground_time, time_until)
    planes_air = TimeQueue.new(num_air)
    planes_ground = TimeQueue.new(num_ground)

    (time_until + 1).times do |time|
      planes_air.add(0) if plane_arriving?(time, arrival_time)
      planes_air.pop ? planes_ground.add(ground_time + 1) : planes_ground.pop
      planes_air.tick
      planes_ground.tick
    end
    [planes_air.total_popped, planes_ground.total_popped, planes_air.length, planes_ground.length]
  end

  private

  def plane_arriving?(current_time, arrival_time)
    current_time % arrival_time == 0 && current_time != 0
  end
end
