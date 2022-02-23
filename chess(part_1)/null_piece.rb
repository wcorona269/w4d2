require_relative 'piece'
require 'singleton'

class Null_Piece < Piece
   include Singleton  

    def initialize
        @value = "Null Piece"

    end

    def inspect
        self.pos.inspect
    end


end






