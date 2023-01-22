# frozen_string_literal: true

require 'notion-ruby-client'
require_relative './const'
require_relative './convert_parameter'
require_relative './secrets'

def handler(**kwargs)
  # secret params
  database_id, notion_integration_token = secrets

  # Notion client
  client = Notion::Client.new(token: notion_integration_token)

  # param1: parent
  parent = parent(database_id: database_id)

  # param2: parameters from LINE
  book_title, book_url = input_properties(kwargs[:event])
  properties = properties(**wip_properties(
    book_title: book_title,
    book_url: book_url
  ))

  client.create_page(parent: parent, properties: properties)

  { statusCode: 200, body: JSON.generate('New Page is created !!') }
end

def wip_properties(book_title:, book_url:)
  {
    author_name: '未入力',
    author_url: 'https://example.com', # URL 形式じゃないとエラー出るので注意
    book_title: book_title,
    book_url: book_url
  }
end

def input_properties(event)
  body = extract_body(event)
  text = extract_text(body)
  book_title, book_url = book_parameters(text)

  [book_title, book_url]
end

def extract_body(event)
  return { statusCode: 500, body: 'request does not have body in json' } unless event['body']

  JSON.parse(event['body'], symbolize_names: true)
end

def extract_text(body)
  return { statusCode: 500, body: 'text does not exist' } unless body.dig(:events, 0, :message, :text)

  body.dig(:events, 0, :message, :text)
end

def book_parameters(text)
  return { statusCode: 500, body: 'text is not String' } unless text.is_a?(String)

  title, url = text.split('https://')
  [title, "https://#{url}"]
end
