# frozen_string_literal: false

module SeoAssistant
  # Model of Entities
  class Entities
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
  end
end
