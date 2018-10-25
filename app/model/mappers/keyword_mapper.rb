module SeoAssistant
  module OutAPI
    class KeywordMapper
      def initialize(unsplash_access_key)
        @access_key = unsplash_access_key
      end

      def load_several(result)
        results.map do |each_result|
          KeywordMapper.build_entity(each_result)
        end
      end

      def self.build_entity()
        DataMapper.new(@access_key, each_result).build_entity
      end

      class DataMapper
        def initialize(access_key, each_result)
          @access_key = access_key
          @keyword = each_result.name
          @eng_keyword = eng_keyword(@keyword)
          @type = each_result.type
          @importance = each_result.salience
          @translate_class = SeoAssistant::OutAPI::Translate
        end

        def build_entity()
          SeoAssistant::Entity::Keyword.new(
            keyword: @keyword,
            eng_keyword: @eng_keyword,
            type: @type,
            importance: @importance,
            url: url
          )
        end

        def eng_keyword()
          @translate_class.new(@keyword).process
        end

        def url()
          UrlMapper.new(@access_key).process(@eng_keyword)
        end
      end
    end
  end
end