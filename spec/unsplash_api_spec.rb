require_relative 'spec_helper.rb'

describe 'Tests API library' do
    VCR.configure do |c|
        c.cassette_library_dir =  CASSETTES_FOLDER
        c.hook_into :webmock

        c.filter_sensitive_data('<UNSPLASH_ASSCESS_KEY>') { ASSCESS_KEY }
        c.filter_sensitive_data('<UNSPLASH_SECRET_KEY>') { SECRET_KEY }
    end

    before do
        VCR.insert_cassette CASSETTE_FILE_UNSPLASH, record: :new_episodes #,match_requests_on:%i[method  uriheaders]
    end

    after do
        VCR.eject_cassette
    end

    describe 'Picture URL' do 
        it 'HAPPY : should provide correct link' do 
            picture = SeoAssistant::Unsplash_API.new(KEYWORD_E).get_picture
            puts picture
            _(picture.url).must_equal CORRECT
        end
    end
end