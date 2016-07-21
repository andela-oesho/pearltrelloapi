require 'trello'
require_relative "checklist_copier"

# will open authorization_url in a new browser and give u access to copy

Trello.open_authorization_url key: 'your_developer_key'
TRELLO_DEVELOPER_PUBLIC_KEY="your_developer_key"

puts "paste your member token"

TRELLO_MEMBER_TOKEN = gets.chomp!

Trello.configure do |trello|
  trello.developer_public_key = TRELLO_DEVELOPER_PUBLIC_KEY
  trello.member_token = TRELLO_MEMBER_TOKEN
end

user_board = Trello::Board.all.each do |board|
                puts "* #{board.name}"
                puts board_id = board.id
              end

clipper = ChecklistCopier.new
clipper.start_process