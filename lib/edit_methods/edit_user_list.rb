def edit_user_board(list_id, name)
  @get_user_list =  @get_user_board.lists[0].find(list_id)
  name = @get_user_list.name
  @get_user_list.save
end