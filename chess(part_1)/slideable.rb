require 'byebug'

module Slideable

    HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
    DIAGONAL_DIRS = [[1,-1], [1,1], [-1,-1], [-1,1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []

        move_dirs.each do |move| # [[1,0], [-1,0], [0,1], [0,-1]] for rook
            x, y = move # x = 1, y = 0
            p move
            
            all_moves += grow_unblocked_moves_in_dir(x, y) # (1, 0)
        end
        
        all_moves
    end

    :private
    def move_dirs
        raise "You forgot to implement move_dirs in your sub_class : ( "
    end


  # create an array to collect moves
  def grow_unblocked_moves_in_dir(dx, dy) #(1, 0)
      cur_pos = self.pos.dup #store a dup of the piece's  pos
      cur_pos[0] += dx # add 1 to x and y to change initial position 
      cur_pos[1] += dy
      all_pos = [] #initialize array for storing possible positions
    
      until !self.board.valid_pos?(cur_pos) #need to check valid position on each iteration
          all_pos << cur_pos.dup #store dup of current position and store poss. positions for given direction
          cur_pos[0] += dx 
          cur_pos[1] += dy
      end

      all_pos
  end


    # in a loop:
      # continually increment the piece's current row and current column to generate a new position
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping



end









