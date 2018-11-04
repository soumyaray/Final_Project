require_relative '03_url.rb'

module SeoAssistant
  module Entity
    class Keyword < Dry::Struct
      include Dry::Types.module

      attribute :keyword, Strict::String
      attribute :eng_keyword, Strict::String
      attribute :type, Strict::Symbol
      attribute :importance, Strict::Float
      attribute :urls, Url
    end
  end
end
