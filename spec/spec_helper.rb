# frozen_string_literal: false

require 'simplecov'
SimpleCov.start

require 'yaml'
require 'minitest/autorun'
require 'minitest/rg'
require 'vcr'
require 'webmock'

require_relative '../lib/unsplash_api.rb'
require_relative '../lib/translate_api.rb'

KEYWORD_C = '狗'.freeze
KEYWORD_E = 'dog'.freeze

CONFIG = YAML.safe_load(File.read('config/secrets.yml'))
ACCESS_KEY = CONFIG['UNSPLASH_ACCESS_KEY']
SECRET_KEY = CONFIG['UNSPLASH_SECRET_KEY']

CORRECT = YAML.safe_load(File.read('spec/fixtures/api_result.yml'))

CASSETTES_FOLDER = 'spec/fixtures/cassettes'.freeze
CASSETTE_FILE_UNSPLASH = 'unsplash_api'.freeze
CASSETTE_FILE_TRANSLATE = 'translate_api'.freeze
CASSETTE_FILE_NL = 'nl_api'.freeze
