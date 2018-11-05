%w[config app]
.each do |folder|
    require_relative "#{folder}/init.rb"
end

script = SeoAssistant::OutAPI::ScriptMapper.new(GOOGLE_CONFIG, UNSPLASH_ACCESS_KEY).process("狗是最好的朋友")
puts script.each_keyword #array
puts script.num_keyword
puts script.keywords[0].urls.random_1_pic #string