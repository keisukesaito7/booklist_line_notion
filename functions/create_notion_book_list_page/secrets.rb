# frozen_string_literal: true

require 'aws-sdk-ssm'
# https://github.com/aws/aws-sdk-ruby/tree/version-3/gems/aws-sdk-ssm:w
# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/SSM/Client.html

def secrets
  key_names = %w[line_notion_database_id line_notion_integration_token]
  parameters ||= parameters(key_names)

  line_notion_database_id, line_notion_integration_token = dig_ids(parameters)

  [line_notion_database_id, line_notion_integration_token]
end

private

def parameters(names)
  client = Aws::SSM::Client.new(
    region: ENV['AWS_REGION']
  )

  client.get_parameters(
    names: names,
    with_decryption: true
  )
end

def dig_ids(parameters)
  # sort が英数字昇順なので 0 は database_id となる
  # FIXME: parameters.dig(0, 0, :name) の中身で分岐させる
  line_notion_database_id = parameters.dig(0, 0, :value)
  line_notion_integration_token = parameters.dig(0, 1, :value)

  [line_notion_database_id, line_notion_integration_token]
end
