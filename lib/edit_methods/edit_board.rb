def edit_user_board(board_id, name)
 @get_user_board = Trello::Board.find(board_id)
 name = @get_user_board.name
 @get_user_board.save
end


