require_relative 'spec_helper.rb'

describe 'Tests API library' do
  VCR.configure do |c|
    c.cassette_library_dir =  CASSETTES_FOLDER
    c.hook_into :webmock

    c.filter_sensitive_data('<UNSPLASH_ACCESS_KEY>') { ACCESS_KEY }
    c.filter_sensitive_data('<UNSPLASH_SECRET_KEY>') { SECRET_KEY }
  end

  before do
    VCR.insert_cassette CASSETTE_FILE_UNSPLASH, record: :new_episodes ,match_requests_on: %i[method  uri headers]
  end

  after do
    VCR.eject_cassette
  end

  describe 'Picture URL' do 
    it 'HAPPY : should provide correct link' do 
      picture = SeoAssistant::Unsplash_API.new(ACCESS_KEY, KEYWORD_E).get_picture
      _(picture.url).must_equal CORRECT
    end
  end
end