require_relative 'solver'

solver = Solver.new(ARGV[0])
bag = solver.solve_using_ratio(ARGV[1].to_i)
puts "Items:"
bag.items.each do |item|
  puts item
end
puts "Price: " + bag.price.to_s
