# frozen_string_literal: false

require 'google/cloud/language'
require_relative 'entities.rb'

module SeoAssistant
  # Library for Google Cloud Natural Language API
  class Analyze
    def initialize(text)
      @text_content = text
    end

    def process
      language = Google::Cloud::Language.new
      response = language.analyze_entities content: @text_content, type: :PLAIN_TEXT
      entities = response.entities
      Entities.new(entities)
    end
  end
end
