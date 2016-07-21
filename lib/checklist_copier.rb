require_relative "card.rb"

class ChecklistCopier

  def start_process
    puts "Enter any board_id"
    input = gets.chomp!
    board_id = input
    @board = Trello::Board.find(board_id)
    process_checklist
  end

  def process_checklist
    list_index
    puts "copying all checklists to other list in the board #{@board.name}"
    @list = @board.lists[@index]
    @checklists = get_all_checklists
    copy_checklists_to_lists
  end

   def get_all_checklists
    checklists = []
    @list.cards.each do |card|
       card.checklists.each do |checklist|
          checklists << checklist
       end
    end
    checklists
  end

  def copy_checklists_to_lists
    lists = @board.lists.reject { |list| list.id == @list.id }
    lists.each do |list|
      new_card = Card.create(name: "tested", list_id: list.id)
      @checklists.each do |checklist|
        new_card.create_new_checklist(checklist.name)
      end
    end
    puts "congrats checklist successfully copied"
  end

  private

  def list_index
    puts "Enter any list index"
    @index = gets.chomp!.to_i
  end

end