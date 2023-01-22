# frozen_string_literal: true

require 'notion-ruby-client'
require_relative './const'
require_relative './properties'
require_relative './secrets'
require_relative './input_parameters'

def handler(**kwargs)
  # secret params
  database_id, notion_integration_token = secrets

  # Notion client
  client = Notion::Client.new(token: notion_integration_token)

  # param1: parent
  parent = { database_id: database_id }

  # param2: parameters from LINE
  book_title, book_url = input_parameters(kwargs[:event])
  properties = properties(**wip_properties(
    book_title: book_title,
    book_url: book_url
  ))

  client.create_page(parent: parent, properties: properties)

  { statusCode: 200, body: JSON.generate('New Page is created !!') }
end
