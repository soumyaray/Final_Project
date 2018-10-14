require_relative 'MOTC_api.rb'

module TripOrganization
    class PULL_API_TO_YML
        #include TripOrganization

        def initialize(city,topnum,path)
            motc = MOTC_API.new(city,topnum)
            motc_data = motc.get_data()
            File.open(path, 'w') { |file| file.puts motc_data.to_yaml }
        end
    end
end
