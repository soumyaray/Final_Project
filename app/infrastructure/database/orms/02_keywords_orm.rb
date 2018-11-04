# frozen_string_literal: true

require 'sequel'

module SeoAssistant
  module Database
    # Object Relational Mapper for Project Entities
    class KeywordOrm < Sequel::Model(:keywords)
      many_to_one :script,
                  class: :'SeoAssistant::Database::ScriptOrm'

      plugin :timestamps, update_on_create: true
    end
  end
end