# frozen_string_literal: false

module SeoAssistant
  # Model of NL_Entities
  class NL_Entities
    def initialize(entities)
      @entities = entities
    end

    def keyword
      @entities.map(&:name)
    end

    def type
      @entities.map(&:type)
    end

    def importance
      @entities.map(&:salience)
    end

    def first
      @entities[0]
    end
  end
end
