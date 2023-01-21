# frozen_string_literal: true

require 'httparty'

def handler(event:, context:) # rubocop:disable Lint/UnusedMethodArgument
  body = HTTParty.get('https://github.com').body

  { statusCode: 200, body: body }
end
