def edit_user_card(card_id, name)
 @get_user_card = @get_user_list.cards[0].find(card_id)
 name = @get_user_card.name
 @get_user_card.save
end