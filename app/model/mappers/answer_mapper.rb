require_relative 'keyword_mapper.rb'
require_relative 'url_mapper.rb'

module SeoAssistant
  module OutAPI
    class AnswerMapper
      def initialize(google_config, unsplash_access_key)
        @google_config = google_config
        @unsplash_key = unsplash_access_key
        @analyze_class = SeoAssistant::OutAPI::Analyze
      end

      def process(text)
        results = @analyze_class.new(@google_config, text).process
        build_entity(results)

      end

      def build_entity(results)
        DataMapper.new(@google_config, @unsplash_key, results).build_entity
      end

      class DataMapper
        def initialize(google_config, unsplash_access_key, results)
          @google_config = google_config
          @unsplash_key = unsplash_access_key
          @results = results
        end

        def build_entity
          SeoAssistant::Entity::Answers.new(
            keywords: keywords,
            each_keyword: each_keyword,
            num_keyword: num_keyword
          )
        end

        def keywords()
          KeywordMapper.new(@google_config, @unsplash_key).load_several(@results)
        end

        def each_keyword()
          @results.map(&:name)
        end

        def num_keyword()
          @results.map(&:name).length
        end
      end
    end
  end
end
