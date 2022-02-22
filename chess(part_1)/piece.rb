
# require_relative "null_piece"
# require_relative "rook"

class Piece

    attr_reader :value, :color, :pos, :board

    def initialize(color, board, pos)
        # @value = "Piece"
        @color = color
        @board = board
        @pos = pos
    end

    #check if piece is a NullPiece
    def empty?
        self.is_a?(Null_Piece)
    end

    def pos=(pos)
        board[pos] = self
    end

    

end
