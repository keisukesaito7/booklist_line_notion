# frozen_string_literal: true

require 'json'

def handler(event:, context:) # rubocop:disable Lint/UnusedMethodArgument
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end
