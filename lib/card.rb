class Card < Trello::BasicData

 #You need to specify the real attribute while creating a list
    def self.create(options)
      client.create(:card,
        'name' => options[:name],
        'idList' => options[:list_id],
        'desc'   => options[:desc]
      )
    end

    def self.find(id, params = {})
      client.find(:card, id, params)
    end

    def create_new_checklist(name)
      client.post("/cards/#{id}/checklists", { name: name})
    end

    def self.delete(id)
      client.delete("/cards/#{id}")
    end

    def move_to_board(new_board, new_list = nil)
      unless board_id == new_board.id
        payload = { :value => new_board.id }
        payload[:list_id] = new_list.id if new_list
        client.put("/cards/#{id}/idBoard", payload)
      end
    end

    def remove_member(member)
      client.delete("/cards/#{id}/members/#{member.id}")
    end
end