require_relative 'keywords.rb'

module SeoAssistant
  module Entity
    class Answers < Dry::Struct
      include Dry::Types.module
      
      attribute :keywords, Strict::Array.of(Keyword)
      attribute :each_keyword, Strict::Array
      attribute :num_keyword, Strict::Integer
    end
  end
end
