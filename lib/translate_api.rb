require "google/cloud/translate"

module SeoAssistant
    class Translate
        def initialize(text)
            @project_id = "My Project"
            @text = text
            @target = "eng"
        end

        def process()
            translate = Google::Cloud::Translate.new project: @project_id
            translation = translate.translate @text, to: @target
            translation.to_s
        end

    end
end