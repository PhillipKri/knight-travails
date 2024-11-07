require_relative 'lib/knight'



knight = Knight.new
result = knight.minimum_moves_with_path([3,3],[4,3])
puts "Path: #{result[:path].map { |coord| "[#{coord[0]}, #{coord[1]}]" }.join(' -> ')}"
