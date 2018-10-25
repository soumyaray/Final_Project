module SeoAssistant
  module OutAPI
    class AnswerMapper
      def initialize(unsplash_access_key, article)
        @access_key = unsplash_access_key
        @text = article
        @analyze_class = OutAPI::Analyze
      end

      def process()
        results = @analyze_class.new(@text).process
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
