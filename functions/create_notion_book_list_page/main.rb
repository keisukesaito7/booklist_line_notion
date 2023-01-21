require 'notion-ruby-client'
require_relative './const'
require_relative './generate_parameter'
require_relative './get_secret_parameters'

def handler(*)
  # secret params
  database_id, notion_integration_token = get_secret_parameters

  # Notion client
  client = Notion::Client.new(token: notion_integration_token)

  # param1: parent
  parent = parent(database_id: database_id)

  # TODO: line から受け取った値にする
  # param2: properties
  author_name = "keisuke"
  author_url = "https://twitter.com/sa20220304"
  book_title = "my book"
  book_url = 'https://developers.notion.com/reference/property-value-object'
  properties = properties(
    author_name: author_name,
    author_url: author_url,
    book_title: book_title,
    book_url: book_url
  )

  client.create_page(parent: parent, properties: properties)
end
