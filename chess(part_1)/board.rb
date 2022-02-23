require_relative "piece"
require_relative "rook"
require_relative "null_piece"
require 'byebug'

class Board
    attr_reader :rows

    def initialize
        # @null_piece = Null_Piece.new
        @rows = Array.new(8) {Array.new(8, Null_Piece.instance)}
    end
    
    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, piece)
        x, y = pos
        @rows[x][y] = piece
    end


    def move_piece(start_pos, end_pos)
        x, y = end_pos 
        this_piece = self[start_pos]
    
        all_moves = this_piece.moves
        p "Test puts"
        if all_moves.include?(end_pos)
            p "All_moves is this - #{all_moves}" 
            self[end_pos] = this_piece
            self[start_pos] = Null_Piece.instance
        else
            raise "That's not a valid position you DI.... ok I should calm down."
        end
    end

    def valid_pos?(pos)
         x, y = pos
         if x < 8 && y < 8 && x >= 0 && y >= 0
            return true
         else
            return false
         end
    end
end

my_board = Board.new
# p my_board[[0,0]].value

my_board[[2,2]] = Rook.new("black", my_board, [2,2])
# my_board[[1,1]] = Null_Piece.new

# p my_board[[2,2]].value 
# p my_board[[1,1]].value 

# p "2,2 is  #{my_board[[2,2]].value}"
# p "3,3 is  #{my_board[[3,3]].value}"

p my_board.move_piece([2,2], [3,3])

# p "2,2 is now #{my_board[[2,2]].value}"
# p "3,3 is now #{my_board[[3,3]].value}"

# my_board.move_piece([5,5],[6,6])
# my_board.move_piece([2,2], [20,20])

# my_piece = Piece.new("red", my_board, [0,0])
# p my_piece.color
# p my_piece.pos
# p my_board[[0,0]]