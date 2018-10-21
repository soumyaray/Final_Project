module SeoAssistant
    class Entities
        def initialize(entities)
            @entities = entities
        end

        def keyword()            
            keyword = @entities.map { |entity| entity.name }
        end

        def type()
            type = @entities.map { |entity| entity.type }
        end

        def importance()
            importance = @entities.map { |entity| entity.salience }
        end
    end
end
