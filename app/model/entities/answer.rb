module SeoAssistant
  module Entity
    class Answers < Dry::Struct
      include Dry::Types.module
      
      attribute :keywords, Strict::Array.of(Keyword)
    end
  end
end
