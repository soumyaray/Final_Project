#not yet finished
require 'roda'
require 'slim'

module SeoAssistant
  # Web App
  class App < Roda
    plugin :render, engine: 'slim', views: 'app/views'
    plugin :assets, css: 'style.css', path: 'app/views/assets'
    plugin :halt

    route do |routing|
      routing.assets # load CSS

      # GET /
      routing.root do
        view 'home'
      end

      routing.on 'analyze_text' do
        routing.is do
          # GET /project/
          routing.post do
            text = routing.params['text']
            routing.halt 400 if (text.empty?)
            puts UNSPLASH_ACCESS_KEY
            routing.redirect "answer/#{text}"
          end
        end

        routing.on String, String do |text|
          # GET /answer/text
          routing.get do
            puts UNSPLASH_ACCESS_KEY
            answer = SeoAssistant::OutAPI::AnswerMapper.new(GOOGLE_CONFIG, UNSPLASH_ACCESS_KEY).process(text)
            view 'answer', locals: { answer: answer }
          end
        end
      end
    end
  end
end