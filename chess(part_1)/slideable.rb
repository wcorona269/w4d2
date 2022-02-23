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
        move_dirs.each do |move|
            grow_unblocked_moves_in_dir(move)
        end
    end

    :private
    def move_dirs
        raise "You forgot to implement move_dirs in your sub_class : ( "
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        cur_pos = self.pos
        all_pos = []
        
        until !cur_pos.valid?
            cur_pos[0] += dx
            cur_pos[1] += dy
            all_pos << cur_pos
        end

        all_pos
    end
end


self -> rook, king, .............



[2,3]

[3,3]

[4,3]

[5,3] 






