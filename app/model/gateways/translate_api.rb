# frozen_string_literal: false

require 'google/cloud/translate'

module SeoAssistant
  module OutAPI
    # Library of Google Translate API
    class Translate
      def initialize(chinese_str)
        @project_id = 'My Project'
        @text = chinese_str
        @target = 'eng'
      end

      def process
        translate = Google::Cloud::Translate.new project: @project_id
        translation = translate.translate @text, to: @target
        translation.to_s
      end
    end
  end
end

