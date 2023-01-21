# frozen_string_literal: true

def parent(database_id:)
  {
    database_id: database_id
  }
end

def properties(author_name:, author_url:, book_title:, book_url:) # rubocop:disable Metrics/MethodLength
  {
    'Name': {
      'title': [
        {
          'text': {
            'content': book_title
          }
        }
      ]
    },
    "#{AUTHOR_LABEL}": {
      'rich_text': [
        {
          'type': 'text',
          'text': {
            'content': author_name,
            'link': {
              'url': author_url
            }
          },
          'plain_text': author_name,
          'href': author_url
        }
      ]
    },
    "#{STATUS_LABEL}": {
      'type': 'status',
      'status': {
        'name': 'Not started'
      }
    },
    "#{URL_LABEL}": {
      "type": 'url',
      "url": book_url
    }
  }
end
