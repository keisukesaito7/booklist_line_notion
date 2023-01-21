# frozen_string_literal: true

require 'notion-ruby-client'
require_relative './const'
require_relative './convert_parameter'
require_relative './secrets'

def handler(*)
  # secret params
  database_id, notion_integration_token = secrets

  # Notion client
  client = Notion::Client.new(token: notion_integration_token)

  # param1: parent
  parent = parent(database_id: database_id)

  # TODO: line から受け取った値にする
  # param2: properties
  properties = properties(**dummy_properties)

  client.create_page(parent: parent, properties: properties)
end

private

def dummy_properties
  {
    author_name: 'keisuke',
    author_url: 'https://twitter.com/sa20220304',
    book_title: 'my book',
    book_url: 'https://developers.notion.com/reference/property-value-object'
  }
end
