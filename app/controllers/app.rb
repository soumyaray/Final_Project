#not yet finished
require 'roda'
require 'slim'
require 'uri'

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

      routing.on 'answer' do
        routing.is do
          # GET /answer/
          routing.post do
            text = routing.params['text'].to_s
            routing.halt 400 if (text.empty?)
            routing.redirect "answer/#{text}"
          end
        end

        routing.on String do |text|
          # GET /answer/text
          routing.get do
            text_encoded = text.encode('UTF-8', invalid: :replace, undef: :replace)
            text_unescaped = URI.unescape(text_encoded).to_s
            answer = SeoAssistant::OutAPI::ScriptMapper.new(App.config.GOOGLE_CREDS, App.config.UNSPLASH_ACCESS_KEY).process(text_unescaped)
            view 'answer', locals: { answer: answer }
          end
        end
      end
    end
  end
end