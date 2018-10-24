# frozen_string_literal: false

module SeoAssistant
  # Model of Picture
  class Picture
    def initialize(pictures_data)
      @pictures_data = pictures_data['results']
    end

    def first_url
      picture = @pictures_data[0]
      url = picture['urls']
      url['raw']
    end

    def all_url(num = 0)
      pictures = @pictures_data[0..num - 1]
      pic_urls = pictures.map { |picture| picture['urls'] }
      pic_urls.map { |url| url['raw'] }
    end
  end
end
