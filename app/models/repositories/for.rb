# frozen_string_literal: true

module SeoAssistant
    module Repository
      # Finds the right repository for an entity object or class
      class For
        ENTITY_REPOSITORY = {
          Entity::Script => Scripts,
          Entity::Keyword => Keywords
        }.freeze
  
        def self.klass(entity_klass)
          ENTITY_REPOSITORY[entity_klass]
        end
  
        def self.entity(entity_object)
          ENTITY_REPOSITORY[entity_object.class]
        end
      end
    end
  end