require 'roda'
require 'slim'

module CodePraise
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
            text = routing.params['text'].downcase
            routing.halt 400 if (text.empty?)

            routing.redirect "answer"
          end
        end

        routing.on String, String do |text|
          # GET /project/owner/project
          routing.get do
            result = OutAPI::AnswerMapper
            .new(UNSPLASH_ACCESS_KEY)
            .process(text)

            view 'answer', locals: { answer: result }
          end
        end
      end
    end
  end
end