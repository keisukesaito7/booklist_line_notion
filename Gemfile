# frozen_string_literal: true

source 'https://rubygems.org'

gem 'notion-ruby-client'
gem 'aws-sdk-ssm'
# aws-sdk-ssm 使用時に必要と言われた
# MEMO: Unable to find a compatible xml library. Ensure that you have installed or added to your Gemfile one of ox, oga, libxml, nokogiri or rexml (RuntimeError)
gem 'rexml'

# development, test は ruby_layer には入らない
# https://navarasu.github.io/serverless-ruby-layer/#/exclude_dev_test_gems
group :development do
  gem 'rubocop'
end
