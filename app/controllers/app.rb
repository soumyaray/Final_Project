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
          # GET /project/
          routing.post do
            text = routing.params['text'].to_s
            routing.halt 400 if (text.empty?)
            routing.redirect "answer/#{text}"
          end
        end

        routing.on String do |text| 
          # GET /answer/text
          routing.get do
            content = text.encode('UTF-8', invalid: :replace, undef: :replace)
            new_content = URI.unescape(content).to_s
            answer = SeoAssistant::OutAPI::AnswerMapper.new(UNSPLASH_ACCESS_KEY).process(new_content)
            puts answer.each_keyword #array 
            view 'answer', locals: { answer: answer }
          end
        end
      end
    end
  end
end