def edit_user_board(board_id, name)
 @get_user_board = Trello::Board.find(board_id)
 name = @get_user_board.name
 @get_user_board.save
end

def edit_user_list(list_id, name)
  @get_user_list =  @get_user_board.lists[0].find(list_id)
  name = @get_user_list.name
  @get_user_list.save
end

def edit_user_card(card_id, name)
 @get_user_card = @get_user_list.cards[0].find(card_id)
 name = @get_user_card.name
 @get_user_card.save
end