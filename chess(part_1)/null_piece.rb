require_relative 'piece'

class Null_Piece < Piece
    include Singleton  

    def initialize
        @value = "Null Piece"
    end
end






