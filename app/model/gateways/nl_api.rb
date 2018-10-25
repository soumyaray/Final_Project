# frozen_string_literal: false

require 'google/cloud/language'
require_relative 'entities.rb'

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


include SeoAssistant::OutAPI
article = "Google, headquartered in Mountain View, unveiled the new Android phone at the Consumer Electronic Show./
            Sundar Pichai said in his keynote that users love their new Android phones."
analyze_article = Analyze.new(article)
puts analyze_article.process.first

