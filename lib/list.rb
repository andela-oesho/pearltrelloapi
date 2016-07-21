class List < Trello::BasicData

  def self.create(options)
    client.create(:list,
      'name'    => options[:name],
      'idBoard' => options[:board_id]
    )
  end

  def self.create_card_on_list(options)
    client.create(:card,
      'name' => options[:name],
      'idList' => options[:list_id]
    )
  end

  def self.find(id, params = {})
    client.find(:list, id, params)
  end

  def update
    client.put("/lists/#{id}", {
      :name   => name,
    })
  end

  def self.delete(id)
    client.delete("/lists/#{id}")
  end
end