class Knight
  # All possible moves a knight can make
  MOVES = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ]

  def initialize
    @board_size = 8
  end

  

  # Method to calculate the minimum moves and path from start to destination
  def minimum_moves_with_path(start, destination)
    return { moves: 0, path: [start] } if start == destination

    queue = [[start, 0]]
    visited = Array.new(@board_size) { Array.new(@board_size, false) }
    visited[start[0]][start[1]] = true

    # To store the predecessor of each position to reconstruct the path
    predecessor = {}

    until queue.empty?
      current, distance = queue.shift
      x, y = current
      

      MOVES.each do |dx, dy|
        new_x, new_y = x + dx, y + dy
        new_coords = [new_x, new_y]

        # Check if the move is within the board and not visited
        if valid_position?(new_x, new_y) && !visited[new_x][new_y]
          # Record the predecessor for path reconstruction
          predecessor[new_coords] = current
          return { moves: distance + 1, path: path(predecessor, start, destination) } if new_coords == destination

          queue << [new_coords, distance + 1]
          visited[new_x][new_y] = true
        end
      end
    end
  end

  private

  # Method to check if a position is within the chessboard
  def valid_position?(x, y)
    x.between?(0, @board_size - 1) && y.between?(0, @board_size - 1)
  end

  # Method to reconstruct the path from the start to the destination using the predecessor hash
  def path(predecessor, start, destination)
    path = []
    current = destination

    while current != start
      path.unshift(current)
      current = predecessor[current]
    end

    path.unshift(start)
    path
  end
end

