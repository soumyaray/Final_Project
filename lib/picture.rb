module SeoAssistant
    class Picture
        def initialize(pictures_data)
            @pictures  =  pictures_data['results']
            @picture = pictures_data['results'][0]
        end

        def url()
            urls = @picture['urls']
            urls['raw']
        end
    end
end