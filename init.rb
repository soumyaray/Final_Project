%w[config app]
.each do |folder|
    require_relative "#{folder}/init.rb"
end

puts SeoAssistant::App.config.GOOGLE_CREDS


script = SeoAssistant::OutAPI::ScriptMapper
    .new(SeoAssistant::App.config.GOOGLE_CREDS, SeoAssistant::App.config.UNSPLASH_ACCESS_KEY)
    .process("狗是最好的朋友")