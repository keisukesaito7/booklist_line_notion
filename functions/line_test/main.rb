# frozen_string_literal: true

def handler(**kwargs)
  puts 'event'
  puts kwargs[:event]
  puts 'context'
  puts kwargs[:context]
  puts 'hoge'
  puts kwargs[:hoge]

  # MEMO: body は string じゃないと怒られた
  # internal server error が返された
  { statusCode: 200, body: kwargs[:event] }
end
