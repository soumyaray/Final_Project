module SeoAssistant
  module Entity
    class Keyword < Dry::Struct
      include Dry::Types.module
      
      attribute :keyword, Strict::String
      attribute :eng_keyword, Strict::String
      attribute :type, Strict::String
      attribute :importance, Strict::Float
      attribute :urls, Strict::Array.of(Url)
    end
  end
end
  