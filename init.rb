%w[app config]
.each do |folder|
    require_relative "#{folder}/init.rb"
end

CONFIG = YAML.safe_load(File.read('config/secrets.yml'))
UNSPLASH_ACCESS_KEY = CONFIG['UNSPLASH_ACCESS_KEY']
answer = SeoAssistant::OutAPI::AnswerMapper.new(UNSPLASH_ACCESS_KEY).process("狗是最好的朋友")
puts answer.each_keyword
puts answer.num_keyword
puts answer.keywords[0].urls.random_1_pic