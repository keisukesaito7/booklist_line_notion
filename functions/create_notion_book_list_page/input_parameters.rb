# frozen_string_literal: true

def input_parameters(event)
  body = extract_body(event)
  text = extract_text(body)
  book_title, book_url = book_parameters(text)

  [book_title, book_url]
end

private

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
