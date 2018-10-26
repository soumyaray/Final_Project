require_relative 'keyword_mapper.rb'
require_relative 'url_mapper.rb'

module SeoAssistant
  module OutAPI
    class AnswerMapper
      def initialize(unsplash_access_key)
        @access_key = unsplash_access_key
        @analyze_class = SeoAssistant::OutAPI::Analyze
      end

      def process(text)
        results = @analyze_class.new(text).process
        build_entity(results)
        
      end

      def build_entity(results)
        DataMapper.new(@access_key, results).build_entity
      end

      class DataMapper
        def initialize(access_key, results)
          @access_key = access_key
          @results = results
        end

        def build_entity
          SeoAssistant::Entity::Answers.new(
            keywords: keywords
          )
        end

        def keywords()
          KeywordMapper.new(@access_key).load_several(@results)
        end
      end
    end
  end
end
