require_relative '02_keyword.rb'

module SeoAssistant
  module Entity
    class Script < Dry::Struct
      include Dry::Types.module

      attribute :text, Strict::String
      attribute :keywords, Strict::Array.of(Keyword)
      attribute :each_keyword, Strict::Array
      attribute :num_keyword, Strict::Integer
    end
  end
end
