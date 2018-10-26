# frozen_string_literal: false

require 'google/cloud/language'

module SeoAssistant
  module OutAPI
    #Library for Google Cloud Natural Language API
    class Analyze
      def initialize(text_str)
        @text_content = text_str
      end

      def process
        language = Google::Cloud::Language.new
        response = language.analyze_entities content: @text_content, type: :PLAIN_TEXT
        entities = response.entities
        #Entities.new(entities)
      end
    end
  end
end
