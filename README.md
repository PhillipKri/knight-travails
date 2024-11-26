Here’s a sample `README.md` file for your program:

```markdown
# Knight's Shortest Path

This Ruby program calculates the shortest distance a knight can travel from one square to another on a chessboard, using its unique "L"-shaped movement. It also provides the exact path taken in terms of `(x, y)` coordinates.

## Features
- Computes the **minimum number of moves** required for a knight to travel from a starting position to a target position.
- Outputs the **path** taken by the knight as a series of `(x, y)` coordinates.

## How It Works
The program uses the **Breadth-First Search (BFS)** algorithm:
1. It starts from the given starting position.
2. Explores all valid knight moves from the current position.
3. Tracks the path using a predecessor mapping.
4. Stops once it reaches the target position, reconstructing the path.

## Requirements
- Ruby 2.5 or later.

## Usage
1. Copy the code into a Ruby file, e.g., `knight_path.rb`.
2. Run the file using the `ruby` command.
3. Call the method `minimum_moves_with_path(start, destination)` with your desired start and destination coordinates.

### Example Input/Output
```ruby
knight = Knight.new
result = knight.minimum_moves_with_path([0, 0], [7, 7])
puts "Minimum moves: #{result[:moves]}"
puts "Path: #{result[:path].map { |coord| "(#{coord[0]}, #{coord[1]})" }.join(' -> ')}"
```

#### Example Output:
```
Minimum moves: 6
Path: (0, 0) -> (2, 1) -> (4, 2) -> (6, 3) -> (7, 5) -> (5, 6) -> (7, 7)
```

## Functions
### `minimum_moves_with_path(start, destination)`
- **Parameters**:
  - `start`: Starting position as `[x, y]` coordinates.
  - `destination`: Target position as `[x, y]` coordinates.
- **Returns**: 
  - `:moves`: Minimum number of moves.
  - `:path`: Array of `(x, y)` coordinates representing the knight's path.

### Example:
```ruby
knight.minimum_moves_with_path([0, 0], [3, 3])
# Output: { moves: 2, path: [[0, 0], [2, 1], [3, 3]] }
```

## Limitations
- The program assumes an 8x8 chessboard.
- Both the starting and destination positions must lie within the board's bounds (`[0, 0]` to `[7, 7]`).
